<?php
//config
$save_dir = dirname(__FILE__)."/sql";
$ids = [
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
];
// end config

require(dirname(__FILE__)."/../../../../bootstrap.php");
$db = \OxidEsales\Eshop\Core\DatabaseProvider::getDb();

/*
* by using the HEX() values of the OXCONTENT here, we avoid
* problems with escaping \r and \n
*/

$file = fopen("sql/install.sql", "w");

foreach($ids as $id) {
  $resultSet = $db->select("SELECT HEX(OXCONTENT), HEX(OXCONTENT_1) FROM oxcontents WHERE OXLOADID='$id' AND OXSHOPID=1");
  $result = $resultSet->getFields();

  $content['de'] = $result[0];
  $content['en'] = $result[1];

  $query = "UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('".$content['de']."'),
    `OXCONTENT_1`=UNHEX('".$content['en']."')
     WHERE `OXLOADID`='$id' AND `OXSHOPID`='1';\n\n";

  echo "Writing ".$id." to file: install.sql\n";
  fwrite($file, $query);
}

fclose($file);
