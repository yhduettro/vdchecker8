//
//  ImageUploadViewController.h
//  vdchecker
//
//  Created by younghwan moon on 7/18/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

// 「ConnectionViewController」クラスが存在することを宣言
@class ConnectionViewController;

// 「EditViewController」クラスの宣言
@interface ImageUploadViewController : UIViewController
{
    // URLを入力するテキストフィールド
    UITextField *_urlTextField;
    
    // URL
    NSString    *_urlString;
    
    // レコードID
    // 新規登録のときは「nil」に設定する
    NSString    *_recordID;
    
    // 通信画面
    ConnectionViewController *_connectionViewController;
    
    // 「Delete」ボタン
    UIButton    *_deleteButton;
}

// プロパティの定義
@property (retain, nonatomic) NSString *urlString;
//@property (retain, nonatomic) NSString *recordTitle;
@property (retain, nonatomic) IBOutlet UIImageView *aImageView;
@property (retain, nonatomic) UIImage *aImage;
@property (retain, nonatomic) NSString *recordID;
@property (retain, nonatomic)
ConnectionViewController *connectionViewController;
@property (retain, nonatomic) IBOutlet UIButton *loadImageButton;
@property (retain, nonatomic) IBOutlet UIButton *deleteImageButton;

// 受信したデータから成功したかどうかを判定する
- (BOOL)checkSuccessWithReceivedData;

// POSTで渡せるように、辞書に格納された文字列から
// 「application/x-www-form-urlencoded」形式の
// データを作成する
- (NSData *)formEncodedDataFromDictionary:(NSDictionary *)dict;

// 「Delete」ボタンが押されたときの処理
- (IBAction)deleteRecord:(id)sender;

@end
