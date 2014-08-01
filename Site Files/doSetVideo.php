<?php
    $updir = "./movies/";
    $filename = $_FILES['movie']['name'];
    
    //is_uploaded_file でファイルがアップロードされたかどうか調べる
    if (is_uploaded_file($_FILES["movie"]["tmp_name"])) {
        
        //move_uploaded_file を使って一時的な保存先から指定のフォルダに移動させる
        if (move_uploaded_file($_FILES["movie"]["tmp_name"], $updir.$filename)) {
            var_dump("成功");
            
        } else {
            var_dump("失敗");
        }
        
        // 登録用の関数を実行する
        if (insertNewVideo($updir.$filename))
            print "1";  // 成功
        else
            print "0";  // 失敗

    } else {
        var_dump("ファイルが選択されていません");
    }    
?>
