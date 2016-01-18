<?php
class oxutilsview_ext extends oxutilsview_ext_parent {
  public function getTemplateBlocks($sFile) {
    $sTplDir = trim($this->getConfig()->getModulesDir()."responsive_email/", '/\\');
    $sFile = str_replace(array('\\', '//'), '/', $sFile);
    if (preg_match('@/' . preg_quote($sTplDir, '@') . '/(.*)$@', $sFile, $m)) {
        $sFile = $m[1];
    }

    return parent::getTemplateBlocks($sFile);
  }
}
