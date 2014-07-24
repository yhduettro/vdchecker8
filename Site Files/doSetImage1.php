<?php
    
    // 「PageScrap.php」ファイルを読み込む
    require_once "PageScrap.php";
    
    $img_src = "./images/IMG_7422.PNG";  // 画像ファイルの指定
//    $img_src = "http://quiz.lancershost.com/images/IMG_7422.PNG";  // 画像ファイルの指定 ---> 何故errorになるのか?
    
    If($img_src) {
        
        $PSize = filesize($img_src);
        $imgbinary = fread(fopen($img_src, "r"), $PSize); // バイナリデータを読み込み
        $img_str = base64_encode($imgbinary); // base64エンコード
        echo '<img src="data:image/png;base64,'.$img_str.'" />'; // imgタグで出力

        $mysqlPicture = addslashes($imgbinary);
        
        // DBに接続する
        $db = connectToDB();
        $ret = false;

        if ($db)
        {
            // DBに登録する
            $q = "INSERT INTO ImgFileTable (img_col)" . " VALUES ('$mysqlPicture')";
            $ret = mysql_query($q) or die("쿼리를 수행할 수 없습니다.");
            
            // 成功メッセージを表示する
            echo "DBに登録しました。"; //(Debug Mode only)
        }

        // DBから切断する
        mysql_close($db);
    }
    else
    {
        echo "어떤 그림도 업로드하지 않으셨습니다.";
    }
    
	return $ret;
?>
