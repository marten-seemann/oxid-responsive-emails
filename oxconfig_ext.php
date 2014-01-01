<?php
class oxconfig_ext extends oxconfig_ext_parent {
  // workaround for some emails to be sent to the shop owner, where in oxemail the path is requested in a strange way
  public function getTemplatePath($sFile, $blAdmin) {
    require("paths.php");
    if($sFile == $paths['_sOrderOwnerTemplate'] OR $sFile == $paths['_sReminderMailTemplate']) return $sFile;
    else return parent::getTemplatePath($sFile, $blAdmin);
  }
}
