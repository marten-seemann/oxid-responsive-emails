<?php
class oxviewconfig_ext extends oxviewconfig_ext_parent {
  public function getResponsiveEmailPath() {
    return $this->getModulePath('responsive_email', 'email/html/');
  }

  public function getResponsiveEmailConfig($name) {
    return oxRegistry::getConfig()->getConfigParam($name);
  }

  /**
  * check if we're dealing with a ROXID. Then we can serve nice retina resolution imagesy
  * otherwise, don't do anything. Just serve the normal images
  */
  public function setForceRetina($val) {
    if(method_exists(parent, 'setForceRetinaDevice')) {
      parent::setForceRetinaDevice($val);
    }
  }

  /**
  * check if we're dealing with a ROXID, if so, unset the forcing of retina image output
  */
  public function unsetForceRetina() {
    if(method_exists(parent, 'unsetForceRetinaDevice')) {
      parent::unsetForceRetinaDevice();
    }
  }
}
