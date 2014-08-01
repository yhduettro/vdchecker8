<?php

// MySQLサーバへ接続する関数
// 使用する場所で毎回ユーザー名などを記述しないようにするために
// 関数化している。セキュリティ上の問題を考慮すると、通常は
// 公開ディレクトリに置くファイルには記述するべきではなく、
// 非公開ディレクトリに置き、使用するスクリプトから読み込むようにする。
// ここでは、簡略化でこのファイルに記述している。 ---
function connectToDB()
{
    //データベースに接続する変数名を宣言しておく
//	$server = "localhost";  // MySQLサーバを実行しているサーバアドレス
//	$userName = "root"; // MySQLサーバの管理者名
//	$password = "test"; // MySQLサーバの管理者パスワード

    $server = "sql106.lancershost.com";  // MySQLサーバを実行しているサーバアドレス
    $userName = "lans_15097304"; // MySQLサーバの管理者名
    $password = "8088909"; // MySQLサーバの管理者パスワード

	$db = mysql_connect($server, $userName, $password) or die("SQL 서버에 접속할 수 없습니다.");;
	
	if ($db != false)
	{
		// データベース「PageScrap」を使うように設定する
		mysql_select_db("lans_15097304_quiz");

		// テキストエンコーディングにUTF-8を使用する
		mysql_set_charset('utf-8');
        
        // 成功メッセージを表示する
//        echo "dbが繋がりました"; //(Debug Mode only)
	}
    else
    {
        // エラーメッセージを表示する
//        echo "dbが綱からないです"; //(Debug Mode only)
    }
	
	return $db;
}

// 情報を登録する関数
function insertNewInfo($url, $title, $contents)
{
	// 内容を取得する
//	$contents = file_get_contents($url); //link->HTML Page用
	if ($contents == null)
    {
        // 内容を取得できませんでした。
//        echo "DBに登録しませんでした。"; //(Debug Mode only)
        
        return false;
    }
    else
    {
        // 内容を取得しました。
//        echo "DBに登録しました。"; //(Debug Mode only)
    }
    
	// HTMLタグを削除する
	$contents = strip_tags($contents);
	
	// DBに登録するために、エスケープ処理を行う
	$contents = addslashes($contents);
	
	// DBに接続する
	$db = connectToDB();
	$ret = false;
	
	if ($db)
	{
		// DBに登録する
		$url2 = addslashes($url);
		$title2 = addslashes($title);
		$q = "INSERT INTO PageScrapInfo (URL,title,contents)" .
		" VALUES ('$url2', '$title2', '$contents')";
		$ret = mysql_query($q);
		
		// DBから切断する
		mysql_close($db);
        
        // 成功メッセージを表示する
//        echo "DBに登録しました。"; //(Debug Mode only)
    }
    else
    {
        // エラーメッセージを表示する
//        echo "DBに登録しませんでした。"; //(Debug Mode only)
    }
	
	return $ret;
}

// 情報を更新する関数
// 更新しない値は「null」を指定する
function updateInfo($id, $newURL, $newTitle, $newContents)
{
	if ($newURL == null &&
		$newTitle == null)
	{
		// 何も更新しない
		return false;
	}
	
	// DBに接続する
	$db = connectToDB();
	$ret = false;
	
	if ($db)
	{
		// DBに登録するために、エスケープ処理を行う
		$url = addslashes($newURL);
		$title = addslashes($newTitle);
        $contents = addslashes($newContents);
		
		// DBを更新する
		$isFirst = true;
		$q = "UPDATE PageScrapInfo SET ";
		if ($newURL)
		{
			$q = $q . "URL='$url'";
			$isFirst = false;
			
			// 新しいURLから内容を取得する
//			$contents = file_get_contents($newURL); //link->HTML Page用
			
			if ($contents)
			{
				// HTMLタグを削除する
				$contents = strip_tags($contents);
				// エスケープ処理を行う
				$contents = addslashes($contents);
			}
		}
		
		if ($newTitle)
		{
			if (!$isFirst)
				$q = $q . ",";
			$q = $q . "title='$title'";
			$isFirst = false;
		}
		
		if ($contents)
		{
			if (!$isFirst)
				$q = $q . ",";
			$q = $q . "contents='$contents'";
			$isFirst = false;
		}
		
		$q = $q . " WHERE ID='$id'";
		$ret = mysql_query($q);
		
		// DBから切断する
		mysql_close($db);
	}
	
	return $ret;
}

// 情報の一覧を取得する関数
// フィールド「ID」とフィールド「title」を格納した連想配列の配列を返す
function getAllInfo()
{
	$ret = null;
	
	// DBに接続する
	$db = connectToDB();
	
	if ($db)
	{
		// 情報を全て取得する
		$q = "SELECT ID,title FROM PageScrapInfo";
		$res = mysql_query($q);
		
		if ($res)
		{
			// 配列を初期化する
			$ret = array();
			
			while ($row = mysql_fetch_assoc($res))
			{
				// 返す配列に格納する情報を作成する
				$row2['ID'] = stripslashes($row['ID']);
				$row2['title'] = stripslashes($row['title']);
				
				// 配列に追加する
				array_push($ret, $row2);
			}
		}
		
		// DBから切断する
		mysql_close($db);
	}
	return $ret;
}

// 情報を削除する関数
// フィールド「ID」で削除するレコードを指定する
function deleteInfo($id)
{
	// DBに接続する
	$db = connectToDB();
	$ret = false;
	
	if ($db)
	{
		// レコードを削除する
		$q = "DELETE FROM PageScrapInfo WHERE ID='$id'";
		$ret = mysql_query($q);
		
		// DBから切断する
		mysql_close($db);
	}
	return $ret;
}

// 情報を取得する関数
// フィールド「ID」で取得するレコードを指定する
function getInfo($id)
{
	$ret = null;
	
	// DBに接続する
	$db = connectToDB();
	
	if ($db)
	{
		// レコードを取得する
		$q = "SELECT * FROM PageScrapInfo WHERE ID='$id' LIMIT 1";
		$res = mysql_query($q);
		
		if ($res)
		{
			$row = mysql_fetch_assoc($res);
			
			// エスケープ処理されているので、元に戻す
			$ret['ID'] = $row['ID'];
			$ret['URL'] = stripslashes($row['URL']);
			$ret['title'] = stripslashes($row['title']);
			$ret['contents'] = stripslashes($row['contents']);
		}
		
		// DBから切断する
		mysql_close($db);
	}
	return $ret;
}
    
function insertNewImage($img_src)
{
    
    $ret = false;

    If($img_src) {
        
        // DBに接続する
        $db = connectToDB();
        
        $PSize = filesize($img_src);
        $imgbinary = fread(fopen($img_src, "r"), $PSize); // バイナリデータを読み込み
        $img_str = base64_encode($imgbinary); // base64エンコード
        echo '<img src="data:image/png;base64,'.$img_str.'" />'; // imgタグで出力
        
        $mysqlPicture = addslashes($imgbinary);
        
        if ($db)
        {
            // DBに登録する
            $q = "INSERT INTO ImgFileTable (img_col)" . " VALUES ('$mysqlPicture')";
            $ret = mysql_query($q) or die("쿼리를 수행할 수 없습니다.");
            
            // 成功メッセージを表示する
            echo "DBに登録しました。"; //(Debug Mode only)
            // DBから切断する
            mysql_close($db);
        }
    }
    else
    {
        echo "어떤 그림도 업로드하지 않으셨습니다.";
    }
    return $ret;
}
    
    
function insertNewVideo($img_src)
{
    
    $ret = false;
    
    If($img_src) {
        
        // DBに接続する
        $db = connectToDB();
        
        $PSize = filesize($img_src);
        $imgbinary = fread(fopen($img_src, "r"), $PSize); // バイナリデータを読み込み
        $img_str = base64_encode($imgbinary); // base64エンコード
        echo '<img src="data:video/mp4;base64,'.$img_str.'" />'; // imgタグで出力
        
        $mysqlPicture = addslashes($imgbinary);
        
        if ($db)
        {
            // DBに登録する
            $q = "INSERT INTO ImgFileTable (img_col)" . " VALUES ('$mysqlPicture')";
            $ret = mysql_query($q) or die("쿼리를 수행할 수 없습니다.");
            
            // 成功メッセージを表示する
            echo "DBに登録しました。"; //(Debug Mode only)
            // DBから切断する
            mysql_close($db);
        }
    }
    else
    {
        echo "어떤 그림도 업로드하지 않으셨습니다.";
    }
    return $ret;
}
?>
