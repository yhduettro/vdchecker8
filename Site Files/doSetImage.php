<?php
    // 「PageScrap.php」ファイルを読み込む
    require_once "PageScrap.php";

    //取得する画像のリンク
    $img_url = 'http://cdn-ak.f.st-hatena.com/images/fotolife/m/mekori/20130503/20130503074329.jpg';
    
    // 画像の取得
    $img_file = file_get_contents( $img_url );
    
    //画像取得が成功した場合
    if($img_file) {
        
        connectToDB()
        
        // DBに接続する
        $db = connectToDB();
        if ($db)
        {
            //画像をバイナリに変換
            $img_binary = mysqli_real_escape_string( $db, $img_file );
            
            //画像を保存するSQL文の実行
            $result = mysqli_query( $db_link, 'INSERT INTO img_table (img_col) VALUES ( "'.$img_binary.'" )');
            
            //結果の表示
            if ($result)) {
//                echo "画像をデータベースに保存しました。";
                print "1";  // 成功
            } else {
//                echo "保存できませんでした。";
                print "0";  // 失敗
            }
        }
    }
?>
