<?php
// 「PageScrap.php」ファイルを読み込む
require_once "PageScrap.php";

// IDを取得する
$id = null;
if (isset($_POST['ID']))
$id = $_POST['ID'];

// URLを取得する
$url = null;
if (isset($_POST['URL']))
$url = $_POST['URL'];

// タイトルを取得する
$title = null;
if (isset($_POST['title']))
$title = $_POST['title'];

// 内容を取得する
$contents = null;
if (isset($_POST['contents']))
$contents = $_POST['contents'];

if ($id == null || $url == null || $title == null || $contents == null)
{
	// 必要なパラメータが足りない
	print "0";
	return;
}

// 更新用の関数を実行する
if (updateInfo($id, $url, $title, $contents))
print "1";  // 成功
else
print "0";  // 失敗

?>
