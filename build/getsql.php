<?php
//config
$save_dir = dirname(__FILE__)."/sql/single/";
$ids = array(
  "oxadminorderemail",
  "oxadminordernpemail",
  "oxnewsletteremail",
  "oxordersendemail",
  "oxpricealarmemail",
  "oxregisteremail",
  "oxuserordernpemail",
  "oxuserorderemail",
  "oxuserorderemailend",
  "oxupdatepassinfoemail",
  );
// end config

require(dirname(__FILE__)."/../../../bootstrap.php");
$oDb = oxRegistry::get("oxDb");
$db = $oDb->getDb();

/*
* by using the HEX() values of the OXCONTENT here, we avoid
* 1. problems with escaping \r and \n
*/

foreach($ids as $id) {
  $result = $db->getRow("SELECT HEX(OXCONTENT), HEX(OXCONTENT_1) FROM oxcontents WHERE OXLOADID='$id' AND OXSHOPID='oxbaseshop'");

  $content['de'] = $result[0];
  $content['en'] = $result[1];

  $query = "UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('".$oDb->escapeString($content['de'])."'),
    `OXCONTENT_1`=UNHEX('".$oDb->escapeString($content['en'])."')
     WHERE `OXLOADID`='$id' AND `OXSHOPID`='oxbaseshop';\n\n";

  $filename_sql = "{$id}.sql";
  $filename_txt = "{$id}.txt";
  echo "Writing file: **".$save_dir.$filename_sql."**\n";
  file_put_contents($save_dir.$filename_sql, $query);
}
