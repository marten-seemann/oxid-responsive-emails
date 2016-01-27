<?php
class oxviewconfig_respemail_ext extends oxviewconfig_respemail_ext_parent {
  public function getResponsiveEmailConfig($name) {
    return oxRegistry::getConfig()->getConfigParam($name);
  }

  /**
  * get the path to the folder containing the tpl and css files for the emails
  * @return string the path
  */
  public function getResponsiveEmailPath() {
    return $this->getModulePath('responsive_email', 'email/');
  }

  /**
  * get the path to the folder containing the tpl and css files for the emails customized by the users
  * @return string the path
  */
  public function getResponsiveEmailModifiedPath() {
    return $this->getModulePath('responsive_email').'modified/email/';
  }

  /**
  * @return path
  */
  public function getTemplatePath($filename) {
    $path = $this->getResponsiveEmailPath();
    $path_mod = $this->getResponsiveEmailModifiedPath();
    if(file_exists($path_mod."/html/".$filename)) return $path_mod."/html/".$filename;
    else return $path."/html/".$filename;
  }

  /**
  * check if we're dealing with a ROXID. Then we can serve nice retina resolution imagesy
  * otherwise, don't do anything. Just serve the normal images
  */
  public function setForceRetina($val) {
    if(method_exists($this, 'setForceRetinaDevice')) {
      $this->setForceRetinaDevice($val);
    }
  }

  /**
  * check if we're dealing with a ROXID, if so, unset the forcing of retina image output
  */
  public function unsetForceRetina() {
    if(method_exists($this, 'unsetForceRetinaDevice')) {
      $this->unsetForceRetinaDevice();
    }
  }

  /**
  * check if we're dealing with a ROXID. Then we need to make sure to send out the pictures in desktop resolution
  * otherwise, don't do anything. Just serve the normal images
  */
  public function setForceDevice($val) {
    if(method_exists($this, 'setForceDeviceType')) {
      $this->setForceDeviceType($val);
    }
  }

  /**
  * check if we're dealing with a ROXID, if so, unset the forced device type
  */
  public function unsetForceDevice() {
    if(method_exists($this, 'unsetForceDeviceType')) {
      $this->unsetForceDeviceType();
    }
  }
}