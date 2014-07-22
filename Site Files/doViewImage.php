<?php
    // 「PageScrap.php」ファイルを読み込む
    require_once "PageScrap.php";

    //下の2つの関数を使い、IDが1の画像を表示する。
    CallImg(1);
    
    
    //指定したid_colを持つ画像を表示する関数
    function CallImg($id_col_num){
        echo '<img src="'.ImgSearchDB($id_col_num).'">';
    }
    
    //データベースから、指定したid_colを持つimageファイルを検索する関数。
    function ImgSearchDB($id_col_num){
        
        //データベースへ接続する
        $db = connectToDB();
        
        //指定したidのimgを検索
        $serch_query = mysqli_query($db,"SELECT * FROM `ImgFileTable` WHERE `ID` ='".$id_col_num."'");
        $row = mysqli_fetch_array($serch_query);
        
        header( 'Content-Type: image/jpeg/png' );
        echo $row['img_col'];
        
//        $close_flag = mysqli_close($db);
    }
?>
