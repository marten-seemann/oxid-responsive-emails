<?php
class oxemail_respemail_ext extends oxemail_respemail_ext_parent {
  public function __construct() {
    parent::__construct();
    require(dirname(__FILE__)."/../inc/paths.php");
    $this->paths = $paths;

    $this->_sForgotPwdTemplate          = $this->getTemplatePath('_sForgotPwdTemplate');
    $this->_sNewsletterOptInTemplate    = $this->getTemplatePath('_sNewsletterOptInTemplate');
    $this->_sSuggestTemplate            = $this->getTemplatePath('_sSuggestTemplate');
    $this->_sInviteTemplate             = $this->getTemplatePath('_sInviteTemplate');
    $this->_sSenedNowTemplate           = $this->getTemplatePath('_sSenedNowTemplate');
    $this->_sSendDownloadsTemplate      = $this->getTemplatePath('_sSendDownloadsTemplate');
    $this->_sWishListTemplate           = $this->getTemplatePath('_sWishListTemplate');
    $this->_sRegisterTemplate           = $this->getTemplatePath('_sRegisterTemplate');
    $this->_sReminderMailTemplate       = $this->getTemplatePath('_sReminderMailTemplate');
    $this->_sOrderUserTemplate          = $this->getTemplatePath('_sOrderUserTemplate');
    $this->_sOrderOwnerTemplate         = $this->getTemplatePath('_sOrderOwnerTemplate');
    // $this->_sOrderUserSubjectTemplate   = $this->getTemplatePath('_sOrderUserSubjectTemplate');
    // $this->_sOrderOwnerSubjectTemplate  = $this->getTemplatePath('_sOrderOwnerSubjectTemplate');
    $this->_sOwnerPricealarmTemplate    = $this->getTemplatePath('_sOwnerPricealarmTemplate');
    $this->_sPricealamrCustomerTemplate = $this->getTemplatePath('_sPricealamrCustomerTemplate');
  }

  /**
  * get the path for a template file
  * if the file exists in the folder where users make modifications, return this file path, else return the file path to the original file
  *
  * @return string the path
  */
  private function getTemplatePath($index) {
    $base = realpath($this->getViewConfig()->getResponsiveEmailPath());
    $mod_base = realpath($this->getViewConfig()->getResponsiveEmailModifiedPath());

    $filename = $this->paths[$index];

    if(file_exists($mod_base."/".$filename)) return $mod_base."/".$filename;
    else return $base."/".$filename;
  }

  /**
  * process the body of the email
  * apply CSS styles by reading the CSS file and inlining all of the rules
  */
  protected function _makeOutputProcessing() {
    $body = $this->getBody();
    $css = file_get_contents(realpath($this->getViewConfig()->getResponsiveEmailPath()."/dest/css/styles.css"));

    // add user defined style definitions
    if(file_exists($this->getViewConfig()->getResponsiveEmailModifiedPath()."/css/styles.css")) {
      $css .= file_get_contents(realpath($this->getViewConfig()->getResponsiveEmailModifiedPath()."/css/styles.css"));
    }

    require_once(dirname(__FILE__)."/../vendor/autoload.php");
    $cssToInlineStyles = new \TijsVerkoyen\CssToInlineStyles\CssToInlineStyles();
    $cssToInlineStyles->setUseInlineStylesBlock(false);
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

    $this->setAltBody( $oOutput->process($this->getAltBody(), "oxemail") );
    $oOutput->processEmail( $this );
  }

  /**
  * send out the email
  * reads the config option if plain text emails are disabled and removes the plain version if neccessary
  */
  public function send() {
    if($this->getConfig()->getConfigParam("disablePlainEmails")) { // do not send a plain version, but only a HTML version of the email
      $this->setAltBody("");
    }
    return parent::send();
  }
}
