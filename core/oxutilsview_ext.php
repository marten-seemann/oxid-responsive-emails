<?php
class oxutilsview_ext extends oxutilsview_ext_parent {
  /**
  * make sure that module block replacements can be applied to .tpl-files defined in this module
  *
  * if the template file lies outside the theme template dir (or so), the full file system path is passed to that function
  * then the SQL query querying the `oxtplblocks` doesn't find the blocks that modules might have registered for this email
  * so we must remove the module directory path from the file name, such that, for the SQL query, it looks like we're just asking for the blocks of the original file
  * same applies for the user modified files
  */
  public function getTemplateBlocks($sFile) {
    $sModuleDir = $this->getConfig()->getModulesDir()."responsive_email/";
    $sModuleDirModified = $sModuleDir."modified/";

    $sFile = $this->removeModuleDir($sFile, $sModuleDirModified); // must go first
    $sFile = $this->removeModuleDir($sFile, $sModuleDir); // must go after that

    return parent::getTemplateBlocks($sFile);
  }

  /**
  * remove a path from a file path oxUtilsView::getTemplateBlocks
  * why this is done by a regexp, I don't know, but doing it the same way OXID does it
  *
  * @param $sFile string the file name
  * @param $sDir string the directory name
  * @param string
  */
  private function removeModuleDir($sFile, $sDir) {
    $sTplDir = trim($sDir, '/\\');
    $sFile = str_replace(array('\\', '//'), '/', $sFile);
    if (preg_match('@/' . preg_quote($sTplDir, '@') . '/(.*)$@', $sFile, $m)) {
        $sFile = $m[1];
    }
    return $sFile;
  }
}
