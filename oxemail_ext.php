<?php
class oxemail_ext extends oxemail_ext_parent {
  public function __construct() {
    parent::__construct();
    require("paths.php");
    $this->_sForgotPwdTemplate          = $paths['_sForgotPwdTemplate'];
    $this->_sNewsletterOptInTemplate    = $paths['_sNewsletterOptInTemplate'];
    $this->_sSuggestTemplate            = $paths['_sSuggestTemplate'];
    $this->_sInviteTemplate             = $paths['_sInviteTemplate'];
    $this->_sSenedNowTemplate           = $paths['_sSenedNowTemplate'];
    $this->_sSendDownloadsTemplate      = $paths['_sSendDownloadsTemplate'];
    $this->_sWishListTemplate           = $paths['_sWishListTemplate'];
    $this->_sRegisterTemplate           = $paths['_sRegisterTemplate'];
    $this->_sReminderMailTemplate       = $paths['_sReminderMailTemplate'];
    $this->_sOrderUserTemplate          = $paths['_sOrderUserTemplate'];
    $this->_sOrderOwnerTemplate         = $paths['_sOrderOwnerTemplate'];
    // $this->_sOrderUserSubjectTemplate   = $paths['_sOrderUserSubjectTemplate'];
    // $this->_sOrderOwnerSubjectTemplate  = $paths['_sOrderOwnerSubjectTemplate'];
    $this->_sOwnerPricealarmTemplate    = $paths['_sOwnerPricealarmTemplate'];
    $this->_sPricealamrCustomerTemplate = $paths['_sPricealamrCustomerTemplate'];
  }

  protected function _makeOutputProcessing() {
    $body = $this->getBody();
    $css = file_get_contents(realpath(dirname(__FILE__)."/email/css/styles.css"));
    require_once(dirname(__FILE__)."/vendor/autoload.php");
    $cssToInlineStyles = new \TijsVerkoyen\CssToInlineStyles\CssToInlineStyles();
    $cssToInlineStyles->setUseInlineStylesBlock(true);
    $cssToInlineStyles->setStripOriginalStyleTags(false);
    // $cssToInlineStyles->setStripOriginalStyleTags(true);
    $cssToInlineStyles->setExcludeMediaQueries(false);
    $cssToInlineStyles->setHTML($body);
    $cssToInlineStyles->setCSS($css);
    $html = $cssToInlineStyles->convert();
    // echo $html;
    // echo highlight_string($html);
    // die;

    $oOutput = oxNew( "oxOutput" );
    $this->setBody( $oOutput->process($html, "oxemail") );
    // $this->setAltBody( $oOutput->process($this->getAltBody(), "oxemail") );
    $oOutput->processEmail( $this );
  }

  public function send() {
    if($this->getConfig()->getConfigParam("disablePlainEmails")) { // do not send a plain version, but only a HTML version of the email
      $this->setAltBody("");
    }
    return parent::send();
  }
}
