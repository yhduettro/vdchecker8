#import "APIURL.h"

// サーバのURLのキー
static NSString *kServerURL = @"serverURL";

// APIのパス定義
static NSString *kDoInsert = @"doInsert.php";
static NSString *kDoUpdate = @"doUpdate.php";
static NSString *kDoList = @"doList.php";
static NSString *kDoDelete = @"doDelete.php";
static NSString *kDoGetDetail = @"doGetDetail.php";
static NSString *kDoUpdateImage = @"doSetImage4.php";

@implementation NSURL (APIURL)

// 他のメソッドが使用する共通メソッド
+ (NSURL *)URLWithAPIPath:(NSString *)apiPath
{
    // Root.plistまでのパスを取得
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *settingsBundlePath = [bundlePath stringByAppendingPathComponent:@"Settings.bundle"];
    NSString *rootPlistPath = [settingsBundlePath stringByAppendingPathComponent:@"Root.plist"];

    // Root.plistの中身を辞書として読み込む
    NSDictionary *settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:rootPlistPath];
    
    // 設定値の配列を取得する
    NSArray *preferenceSpecifiers = [settingsDictionary objectForKey:@"PreferenceSpecifiers"];

    NSString *str;
//    for (NSDictionary *preferenceItem in preferenceSpecifiers) {
//        //設定値を読み込む処理
////        NSLog(@"preferenceItem = %@", preferenceItem);
//        str = (NSString *)[preferenceItem objectForKey:@"DefaultValue"];
//    }
    NSDictionary *preferenceItem = preferenceSpecifiers[1];
    str = (NSString *)[preferenceItem objectForKey:@"DefaultValue"];

    // サーバのURLを作成する
    NSURL *serverURL = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    // APIのパスを使って相対URLを作成する
    NSURL *resultURL;
    resultURL = [NSURL URLWithString:apiPath
                       relativeToURL:serverURL];
    // 絶対URLに変換する
    resultURL = [resultURL absoluteURL];
    
    return resultURL;
}

// 情報を登録するAPIへのURLを作成する
+ (NSURL *)URLToDoInsert
{
    return [self URLWithAPIPath:kDoInsert];
}

// 情報を更新するAPIへのURLを作成する
+ (NSURL *)URLToDoUpdate
{
    return [self URLWithAPIPath:kDoUpdate];
}

// 情報の一覧を取得するAPIへのURLを作成する
+ (NSURL *)URLToDoList
{
    return [self URLWithAPIPath:kDoList];
}

// 情報を削除するAPIへのURLを作成する
+ (NSURL *)URLToDoDelete
{
    return [self URLWithAPIPath:kDoDelete];
}

// 情報の詳細を取得するAPIへのURLを作成する
+ (NSURL *)URLToGetDetail:(NSString *)recordID
{
    // IDが指定されていないときは、URLを作成しない
    if (!recordID || [recordID length] == 0)
        return nil;
	
    // パスにIDを連結する
    NSString *path;
    path = [NSString stringWithFormat:@"%@?ID=%@",
            kDoGetDetail, recordID];
    
    return [self URLWithAPIPath:path];
}

+ (NSURL *)URLToDoUpdateImage
{
    return [self URLWithAPIPath:kDoUpdateImage];
}

@end
