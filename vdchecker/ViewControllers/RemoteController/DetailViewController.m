//
//  DetailViewController.m
//  vdchecker
//
//  Created by younghwan moon on 7/18/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "DetailViewController.h"
#import "ConnectionViewController.h"
#import "APIURL.h"
#import "EditViewController.h"

@implementation DetailViewController

// プロパティとメンバー変数の設定
@synthesize urlLabel = _urlLabel;
@synthesize contentTextView = _contentTextView;
@synthesize recordID = _recordID;
@synthesize connectionViewController = _connectionViewController;

// イニシャライザ
- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
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

// ビューが表示される直前に呼ばれるメソッド
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_Detail.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}

// ビューが表示された直後の処理
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 通信画面が閉じた後に表示されたのか、そうでないかの判定を行う
    if (self.connectionViewController)
    {
        // 通信画面が閉じた後に表示されたタイミングなので
        // 受信データから表示データを用意する
        [self reloadFromReceivedData];
        
        // 通信画面は必要なくなったので解放する
        [self setConnectionViewController:nil];
    }
    else
    {
        // 通信前なので、サーバと通信する
        // 接続先のURLを作成する
        // ここでの接続先は、情報を取得するAPIへのURL
        NSURL *url = [NSURL URLToGetDetail:self.recordID];
        
        // 接続要求を作成する
        NSURLRequest *req;
        req = [NSURLRequest requestWithURL:url];
        
        // 通信画面を表示して、通信を開始する
        ConnectionViewController *vc;
        vc = [[ConnectionViewController alloc] initWithNibName:nil
                                                        bundle:nil];
        [vc setUrlRequest:req];

        [self presentViewController:vc animated:NO completion:^{
        
        // もし、通信画面が既に非表示になっていたら、通信を開始できなかった
        // ということなので、プロパティにセットしない
//        if (vc.view.window)
//        {
            [self setConnectionViewController:vc];
//        }
        }];
    }
}

// 受信したデータを解析して、表示情報を設定するメソッド
- (void)reloadFromReceivedData
{
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
//        text = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
        text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        // ID, タイトル, URL, 内容の順番に並んでいる
        // 先頭の行はIDなので、読み飛ばす
        NSScanner *scanner = [NSScanner scannerWithString:text];
        NSString *str;
        BOOL ret;
        
        ret = [scanner scanUpToString:@"\n"
                           intoString:&str];
        
        // タイトルを読み込む
        NSString *titleStr = nil;
        if (ret)
        {
            ret = [scanner scanUpToString:@"\n"
                               intoString:&titleStr];
        }
        
        // URLを読み込む
        NSString *urlStr = nil;
        if (ret)
        {
            ret = [scanner scanUpToString:@"\n"
                               intoString:&urlStr];
        }
        
        // 内容を読み込む。内容は残り全部となる
        NSString *contentStr = nil;
        if (ret && [scanner scanLocation] < [text length])
        {
            contentStr = [text substringFromIndex:
                          [scanner scanLocation]];
        }
        
        // 読み込んだ内容を表示する
        if (titleStr)
//            [self setTitle:titleStr];
            [self.titleLabel setText:titleStr];
        if (urlStr)
            [self.urlLabel setText:urlStr];
        if (contentStr)
            [self.contentTextView setText:contentStr];
    }
}

// URLをSafariで開く
- (IBAction)openURL:(id)sender
{
    // ラベルからURLを取得する
    NSString *urlStr = self.urlLabel.text;
    
    // URLを作成する
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // Safariで開く
    if (url)
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}



// ビューが非表示になる直前に呼ばれるメソッド
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 「viewWillAppear:」で追加した「Edit」ボタンを削除する
//    [self.navigationItem setRightBarButtonItem:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showEditView"]) {
        EditViewController *editVC = [segue destinationViewController];
        editVC.urlString = self.urlLabel.text;
        editVC.recordTitle = self.titleLabel.text;
        editVC.contentTextString = self.contentTextView.text;
        editVC.recordID = self.recordID;
    }
}

@end
