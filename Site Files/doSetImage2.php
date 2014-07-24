<?php
    //    define( 'DB_HOST', 'localhost' );
    //    define( 'DB_USER', '●' );
    //    define( 'DB_PASS', '■' );
    //    define( 'DB_NAME', '◆' );
    define( 'DB_HOST', 'sql106.lancershost.com' );
    define( 'DB_USER', 'lans_15097304' );
    define( 'DB_PASS', '8088909' );
    define( 'DB_NAME', 'lans_15097304_quiz' );
    
    $tb_name = 'ImgFileTable' ;
    {
        
        if( $_FILES['img_src']['error'] )       exit;
        
        //画像情報の取得
        $mime 		= $_FILES['img_src']['type'];			//mime type
        $img_path = $_FILES['img_src']['tmp_name'];	//uploaded file
        
        //マイムタイプ(mime-type)の指定
        if($mime=='image/pjpeg')        $mime='image/jpeg';
        if($mime=='image/x-png')        $mime='image/png';
        
        if(is_uploaded_file($img_path))
        {
            // データベースに接続
            $DB = mysql_connect( DB_HOST, DB_USER, DB_PASS );
            mysql_select_db( DB_NAME, $DB );
            
            //保管データの取得
//            $mime = addslashes($mime);
            $img64 = base64_encode( file_get_contents( $img_path ) );	//Base64エンコード
            
            // MySQL保管処理
//            $sql = "INSERT INTO $tb_name (a02mime,a02img64 ) VALUES ( '$mime','$img64' )" ;
//            $result = mysql_query( $sql );
            $q = "INSERT INTO ImgFileTable (img_col)" . " VALUES ('$mysqlPicture')";
            $ret = mysql_query($q) or die("쿼리를 수행할 수 없습니다.");
        }
    }
?>