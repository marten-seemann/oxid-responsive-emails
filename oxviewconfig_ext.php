<?php
class oxviewconfig_ext extends oxviewconfig_ext_parent {
  public function getResponsiveEmailPath() {
    return $this->getModulePath('responsive_email', 'email/html/');
  }
}
