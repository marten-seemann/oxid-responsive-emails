<?php
//config
$sql_dir = "../sql";
$ids = array(
  "oxadminorderemail",
  "oxadminordernpemail",
  "oxnewsletteremail", // checked
  "oxordersendemail",
  "oxpricealarmemail", // checked
  "oxregisteremail",
  "oxuserordernpemail", // checked
  "oxuserorderemail",
  "oxupdatepassinfoemail", // checked
  );
// end config

$dir = dirname($_SERVER['SCRIPT_FILENAME']);
$path = substr($dir, 0, strpos($dir, "modules"))."/bootstrap.php";
require($path);
$oDb = oxRegistry::get("oxDb");
$db = $oDb->getDb();

foreach($ids as $id) {
  $result = $db->getRow("SELECT OXCONTENT,OXCONTENT_1 FROM oxcontents WHERE OXLOADID='$id' AND OXSHOPID='oxbaseshop'");

  $content['de'] = $result[0];
  $content['en'] = $result[1];

  $query = "UPDATE oxcontents SET
    OXCONTENT='".$oDb->escapeString($content['de'])."',
    OXCONTENT_1='".$oDb->escapeString($content['en'])."'
    WHERE OXLOADID='$id' AND OXSHOPID='oxbaseshop'
    ;";

  $filename = "{$sql_dir}/{$id}.sql";
  echo "Writing file: **$filename**\n";
  file_put_contents($filename, $query);
}
