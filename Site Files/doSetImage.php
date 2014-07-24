<?php
//    $img_src = "http://quiz.lancershost.com/images/IMG_7422.PNG";  // 画像ファイルの指定
    $img_src = "./images/IMG_7422.PNG";  // 画像ファイルの指定
    $imgbinary = fread(fopen($img_src, "r"), filesize($img_src)); // バイナリデータを読み込み
    $img_str = base64_encode($imgbinary); // base64エンコード
    echo '<img src="data:image/png;base64,'.$img_str.'" />'; // imgタグで出力
?>
