<?php
class oxconfig_ext extends oxconfig_ext_parent {
  public function getTemplatePath($sFile, $blAdmin) {
    require("paths.php");
    if($sFile == $paths['_sOrderOwnerTemplate']) return $sFile;
    else return parent::getTemplatePath($sFile, $blAdmin);
  }
}
