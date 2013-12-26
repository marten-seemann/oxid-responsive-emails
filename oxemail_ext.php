<?php
class oxemail_ext extends oxemail_ext_parent {
    public function __construct() {
    parent::__construct();
    $base = realpath(dirname(__FILE__)."/email");
    $this->_sForgotPwdTemplate          = $base."/html/forgotpwd.tpl";
    $this->_sNewsletterOptInTemplate    = $base."/html/newsletteroptin.tpl";
    $this->_sSuggestTemplate            = $base."/html/suggest.tpl";
    $this->_sInviteTemplate             = $base."/html/invite.tpl";
    $this->_sSenedNowTemplate           = $base."/html/ordershipped.tpl";
    $this->_sSendDownloadsTemplate      = $base."/html/senddownloadlinks.tpl";
    $this->_sWishListTemplate           = $base."/html/wishlist.tpl";
    $this->_sRegisterTemplate           = $base."/html/register.tpl";
    $this->_sReminderMailTemplate       = $base."/html/owner_reminder.tpl";
    $this->_sOrderUserTemplate          = $base."/html/order_cust.tpl";
    $this->_sOrderOwnerTemplate         = $base."/html/order_owner.tpl";
    $this->_sOrderUserSubjectTemplate   = $base."/html/order_cust_subj.tpl";
    $this->_sOrderOwnerSubjectTemplate  = $base."/html/order_owner_subj.tpl";
    $this->_sOwnerPricealarmTemplate    = $base."/html/pricealarm_owner.tpl";
    $this->_sPricealamrCustomerTemplate = $base."/html/pricealarm_cust.tpl";
  }

  protected function _makeOutputProcessing() {
    $body = $this->getBody();
    $css = file_get_contents(realpath(dirname(__FILE__)."/email/css/styles.css"));
    require_once("csstoinline/CssToInlineStyles.php");
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
    return parent::send();
  }
}
