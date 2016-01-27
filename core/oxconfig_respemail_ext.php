<?php
class oxconfig_respemail_ext extends oxconfig_respemail_ext_parent {
  // workaround for some emails to be sent to the shop owner, where in oxemail the path is requested in a strange way
  public function getTemplatePath($sFile, $blAdmin) {
    require(dirname(__FILE__)."/../inc/paths.php");
    if(strpos($sFile, $paths['_sOrderOwnerTemplate']) !== false OR strpos($sFile, $paths['_sReminderMailTemplate']) !== false) return $sFile;
    else return parent::getTemplatePath($sFile, $blAdmin);
  }
}
