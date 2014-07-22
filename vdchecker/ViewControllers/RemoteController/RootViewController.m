//
//  RootViewController.m
//  vdchecker
//
//  Created by younghwan moon on 7/18/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "RootViewController.h"
#import "ConnectionViewController.h"
#import "APIURL.h"
#import "DetailViewController.h"
#import "EditViewController.h"

// プロパティ「itemArray」の配列に入れる、辞書のキー
static NSString *kTitleKey = @"title";
static NSString *kIDKey = @"ID";

@interface RootViewController()
{
    NSString *recordID;
}
@end

@implementation RootViewController

// プロパティとメンバー変数の設定
@synthesize itemArray = _itemArray;
@synthesize connectionViewController = _connectionViewController;

// イニシャライザ
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _itemArray = nil;
        _connectionViewController = nil;
    }
    return self;
}


// ビューの初期化処理
- (void)viewDidLoad
{
    [super viewDidLoad];
}

// ビューが表示される直前に呼ばれるメソッド
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_List.png"];
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
        // これにより、他のビューコントローラを表示して
        // 再表示されるときには、通信が行われる
        [self setConnectionViewController:nil];
    }
    else
    {
        // 通信前なので、サーバと通信する
        // 接続先のURLを作成する
        // ここでの接続先は、情報の一覧を取得するAPIへのURL
        NSURL *url = [NSURL URLToDoList];   //1
        
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

// デバイスを回転させるか判定する処理
- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)interfaceOrientation
{
    // どの方向でも回転させる
    return YES;
}

// セクション数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // ここで表示するテーブルビューは常にセクション数は1つ
    return 1;
}

// 項目数を返す
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.itemArray count];
}

// セルを返す
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // セルを再利用するときの識別子
    static NSString *CellIdentifier = @"Cell";
    
    // 再利用可能なセルがあれば再利用する
    UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        // 再利用できないので作成する
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // セルに表示する項目を取得する
    NSDictionary *dict;
    dict = [self.itemArray objectAtIndex:indexPath.row];
    
    // セルの内容を設定する
    // タイトルをラベルに設定する
    cell.textLabel.text = [dict objectForKey:kTitleKey];
    
    // 詳細画面を表示できることを示すため、「>」記号を表示する
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

// 受信したデータを解析して表示項目を設定するメソッド
- (void)reloadFromReceivedData
{
    NSMutableArray *newItems = [NSMutableArray arrayWithCapacity:0];
    
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
        
        // 行に分割する
        NSArray *lines = [text componentsSeparatedByString:@"\n"];
        
        // 行の内容を解析して、辞書の配列を作成する
        for (NSString *l in lines)
        {
            // 「,」で文字列を分割する
            NSArray *tokens = [l componentsSeparatedByString:@","];
            
            // ID、タイトルの順に格納されている
            if ([tokens count] > 1)
            {
                NSMutableDictionary *dict = nil;
				
                dict = [NSMutableDictionary dictionaryWithCapacity:0];
                [dict setObject:[tokens objectAtIndex:0]
                         forKey:kIDKey];
                [dict setObject:[tokens objectAtIndex:1]
                         forKey:kTitleKey];
				
                // 配列に追加する
                [newItems addObject:dict];
            }
        }
    }
    
    // 辞書の配列をメンバー変数にセットして、テーブルビューを再読み込みする
    [self setItemArray:newItems];
    [self.tableView reloadData];
}


// ビューが表示される直前に呼ばれるメソッド
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
    
//    // 「+」ボタンを作成する
//    // ボタンが押されたら「add:」メソッドを呼び出すようにする
//    UIBarButtonItem *button;
//    button = [[UIBarButtonItem alloc]
//              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//              target:self
//              action:@selector(add:)];
//    
//    // ナビゲーションバーの右側にボタンを追加する
//    [self.navigationItem setRightBarButtonItem:button];
    
//    [button release];
//}

// ビューが非表示になる直前に呼ばれるメソッド
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 「viewWillAppear:」メソッドで追加したボタンを削除する
//    [self.navigationItem setRightBarButtonItem:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDictionary *dict;
//    dict = [self.itemArray objectAtIndex:indexPath.row];
    dict = [self.itemArray objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    recordID = [dict objectForKey:kIDKey];

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showDetailView"]) {
        DetailViewController *detailVC = [segue destinationViewController];
        detailVC.recordID = recordID;
    } else if ([[segue identifier] isEqualToString:@"addSegue"]){
        DetailViewController *detailVC = [segue destinationViewController];
        detailVC.recordID = nil;
    }
}


@end
