<?php
    $updir = "./images/";
    $filename = $_FILES['movie']['name'];
    
    //is_uploaded_file でファイルがアップロードされたかどうか調べる
    if (is_uploaded_file($_FILES["movie"]["tmp_name"])) {
        
        //move_uploaded_file を使って一時的な保存先から指定のフォルダに移動させる
        if (move_uploaded_file($_FILES["movie"]["tmp_name"], $updir.$filename)) {
            var_dump("成功");
            
            // 登録用の関数を実行する
            if (insertNewImage($updir.$filename))
                print "1";  // 成功
            else
                print "0";  // 失敗
            
        } else {
            var_dump("失敗");
        }
    } else {
        var_dump("ファイルが選択されていません");
    }
?>
//<?php
//    // 「PageScrap.php」ファイルを読み込む
//    require_once "PageScrap.php";
//    
////    $img_src = "./images/IMG_7422.PNG";  // 画像ファイルの指定
//    // 内容を取得する
//    $img_src = null;
//    if (isset($_POST['img_src'])) {
//        $img_src = $_POST['img_src'];
//        print "post 1";  // 成功
//    } else {
//        print "post 0";  // 失敗
//    }
//
//    if ($img_src == null)
//    {
//        // 必要なパラメータが足りない
//        print "image null";
//        return;
//    }
//    
//    // 登録用の関数を実行する
//    if (insertNewImage($img_src))
//        print "1";  // 成功
//    else
//        print "0";  // 失敗
//    
//    return;
//?>
//<?php
//    var_dump($_FILES);
//    if(isset($_POST["upload"]))
//    {
//        if(isset($_FILES["soundFile"]))
//        {
//            if(is_uploaded_file($_FILES["soundFile"]["tmp_name"]))
//            {
//                move_uploaded_file($_FILES["soundFile"]["tmp_name"], $_POST["upload"].".caf");
//                echo "soundfile copy success:";
//            }
//        }
//        else
//        {
//            echo "soundFile is not exist.";
//        }
//    }
//    else
//    {
//        var_dump($_POST);
//    }
//?>

