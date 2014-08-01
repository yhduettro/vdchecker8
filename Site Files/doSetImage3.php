<?php
    // 「PageScrap.php」ファイルを読み込む
    require_once "PageScrap.php";
    
//    $img_src = "./images/IMG_7422.PNG";  // 画像ファイルの指定
//    $img_src = "./movies/zoo-0.mp4";  // 画像ファイルの指定
//    $updir = "./images/";
//    $filename = "IMG_7422.PNG";
//    $img_src = $updir.$filename;  // 画像ファイルの指定
    $img_src = "./images/sample.m4v";  // 画像ファイルの指定
//    $updir = "./movies/";
//    $filename = "sample.m4v";
//    $img_src = $updir.$filename;  // 画像ファイルの指定
    // 内容を取得する
//    $img_src = null;
//    if (isset($_POST['img_src']))
//    $img_src = $_POST['img_src'];
//
//    if ($img_src == null)
//    {
//        // 必要なパラメータが足りない
//        print "0";
//        return;
//    }
    
    // 登録用の関数を実行する
    if (insertNewImage($img_src))
//    if (insertNewVideo($img_src))
        print "1";  // 成功
    else
        print "0";  // 失敗
    
    return;
?>

