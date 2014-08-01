//
//  VideoUploadViewController.m
//  vdchecker
//
//  Created by younghwan moon on 7/18/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "VideoUploadViewController.h"
#import "ConnectionViewController.h"
#import "APIURL.h"

@implementation VideoUploadViewController

// プロパティとメンバー変数の設定
//@synthesize urlTextField = _urlTextField;
//@synthesize titleTextField = _titleTextField;
@synthesize urlString = _urlString;
@synthesize aImageView;
@synthesize aImage;
@synthesize recordID = _recordID;
@synthesize connectionViewController = _connectionViewController;
@synthesize deleteVideoButton = _deleteVideoButton;

// イニシャライザ
- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        // メンバー変数の初期化
        _urlString = nil;
        _recordID = nil;
        _connectionViewController = nil;
    }
    return self;
}


// デバイスを回転させるか判定する処理
- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)interfaceOrientation
{
    // どの方向でも回転させる
    return YES;
}

// ビューの初期化処理
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_ImageUpload.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    naviBar.hidden = NO;
}


// ビューが表示された直後の処理
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 通信画面が閉じた後に表示されたのか、そうでないかの判定を行う
    if (self.connectionViewController)
    {
        // 通信画面が閉じた後に表示されたタイミングなので
        // エラーが発生していないかチェックする
        if ([self checkSuccessWithReceivedData])
        {
            // 成功したので、このビューを閉じる
            // 通信画面を解放する
            [self setConnectionViewController:nil];
            
            // 情報編集画面を閉じる
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            // エラーメッセージを表示する
            UIAlertView *alert;
			
            alert = [[UIAlertView alloc]
                     initWithTitle:@"Connection Error"
                     message:@"Failed to communicate to the server."
                     delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
            [alert show];
        }
    }
}

// ビューが非表示になる直前に呼ばれる
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

// 「UpLoad Image」ボタンが押されたときの処理
// POSTで渡せるように、viewに格納されたファイルから
// 「form」形式のデータを作成する
//<form enctype="multipart/form-data" action="アクション" method="post">
//<input type="file" name="movie" /><br />
//<br />
//<input type="submit" value="送信" />
//</form>
- (IBAction)uploadVideo:(id)sender
{
    NSString *samplePath = [[NSBundle mainBundle] pathForResource:@"zoo" ofType:@"mp4"];
    NSData *sampleData = [NSData dataWithContentsOfFile:samplePath];

    //送信先URL
    // ここでの接続先は、情報を取得するAPIへのURL
    NSURL *url = [NSURL URLToDoUpdateVideo];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    //multipart/form-dataのバウンダリ文字列生成
    CFUUIDRef uuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, uuid);
    CFRelease(uuid);
    NSString *boundary = [NSString stringWithFormat:@"0xKhTmLbOuNdArY-%@",uuidString];
    
    //アップロードする際のパラメーター名
    NSString *parameter = @"movie";
    
    //アップロードするファイルの名前
    NSString *fileName = [[samplePath componentsSeparatedByString:@"/"] lastObject];
    
    //アップロードするファイルの種類
    NSString *contentType = @"video/mp4";
    
    NSMutableData *postBody = [NSMutableData data];
    
    //HTTPBody
    [postBody appendData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",parameter,fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", contentType] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:sampleData];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //リクエストヘッダー
    NSString *header = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    
    [request addValue:header forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postBody];

    // 通信画面を表示して、通信を開始する
    ConnectionViewController *vc;
    vc = [[ConnectionViewController alloc] initWithNibName:nil
                                                    bundle:nil];
    [vc setUrlRequest:request];
    
    [self presentViewController:vc animated:NO completion:^{
        
        // もし、通信画面が既に非表示になっていたら、通信を開始できなかった
        // ということなので、プロパティにセットしない
        [self setConnectionViewController:vc];
    }];
}



// 受信したデータから成功したかどうかを判定する
- (BOOL)checkSuccessWithReceivedData
{
    BOOL ret = NO;
    
    // 通信に成功したのか失敗したのかチェックする
    NSURLResponse *response = self.connectionViewController.response;
    
    // HTTPのステータスコードが400未満なら成功と見なす
    if ([response isKindOfClass:[NSHTTPURLResponse class]] &&
        [(NSHTTPURLResponse *)response statusCode] < 400)
    {
        // データを取得する
        NSData *data = self.connectionViewController.downloadedData;
        
        // 文字列化する
        NSString *text;

        text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

        // 「1」が取得できていたら成功
        if ([text integerValue] == 1)
        {
            ret = YES;  //成功
        }
    }
    
    return ret;
}

// POSTで渡せるように、viewに格納されたファイルから
// 「form」形式のデータを作成する
//<form enctype="multipart/form-data" action="アクション" method="post">
//<input type="file" name="movie" /><br />
//<br />
//<input type="submit" value="送信" />
//</form>
- (NSData *)formEncodedDataFromDictionary:(NSDictionary *)dict
{
    NSMutableString *str;
    
    str = [NSMutableString stringWithCapacity:0];
    
    // 「キー=値」のペアを「&」で結合して列挙する
    // キーと値はどちらもURLエンコードを行い、スペースは「+」に置き換える
    for (NSString *key in [dict allKeys])
    {
        NSString *value = [dict objectForKey:key];
        
        // スペースを「+」に置き換える
        NSString *key1 = [key stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        
        NSString *key2 = [NSString stringWithString:key1];
        
        value = [value stringByReplacingOccurrencesOfString:@" " withString:@"+"];

        // URLエンコードを行う
        NSString *key3 = [key2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
        value = [value stringByAddingPercentEscapesUsingEncoding:
                 NSUTF8StringEncoding];
        
        // 文字列を連結する
        if ([str length] > 0)
        {
            [str appendString:@"&"];
        }
        
        [str appendFormat:@"%@=%@", key3, value];
    }
    
    // 作成した文字列をUTF-8で符号化する
    NSData *data;
    data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    return data;
}

// 「Delete」ボタンが押されたときの処理
- (IBAction)deleteRecord:(id)sender
{
    // 接続先のURLを作成する
    // ここでの接続先は、情報を削除するAPIへのURL
    NSURL *url = [NSURL URLToDoDelete];
    
    // 接続要求を作成する
    NSMutableURLRequest *req;
    req = [NSMutableURLRequest requestWithURL:url];
    
    // HTTPのメソッドをPOSTに設定する
    [req setHTTPMethod:@"POST"];
    
    // POSTで送信するデータを作成する
    NSMutableDictionary *dict;
    
    dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:self.recordID forKey:@"ID"];
    
    NSData *data;
    data = [self formEncodedDataFromDictionary:dict];
    
    // POSTのデータとして設定する
    [req setHTTPBody:data];

    // 通信画面を表示して、通信を開始する
    ConnectionViewController *vc;
    vc = [[ConnectionViewController alloc] initWithNibName:nil
                                                    bundle:nil];
    [vc setUrlRequest:req];

    [self presentViewController:vc animated:NO completion:^{ }];
}

@end
