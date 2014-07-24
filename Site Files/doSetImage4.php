<?php
    // 「PageScrap.php」ファイルを読み込む
    require_once "PageScrap.php";
    
//    $img_src = "./images/IMG_7422.PNG";  // 画像ファイルの指定
    // 内容を取得する
    $img_src = null;
    if (isset($_POST['img_src'])) {
        $img_src = $_POST['img_src'];
        print "post 1";  // 成功
    } else {
        print "post 0";  // 失敗
    }

    if ($img_src == null)
    {
        // 必要なパラメータが足りない
        print "image null";
        return;
    }
    
    // 登録用の関数を実行する
    if (insertNewImage($img_src))
        print "1";  // 成功
    else
        print "0";  // 失敗
    
    return;
?>

