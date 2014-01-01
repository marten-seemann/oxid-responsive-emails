<?php
$base = realpath(dirname(__FILE__)."/email");

$paths = array(
  "_sForgotPwdTemplate"           => $base."/html/forgotpwd.tpl",
  "_sNewsletterOptInTemplate"     => $base."/html/newsletteroptin.tpl",
  "_sSuggestTemplate"             => $base."/html/suggest.tpl",
  "_sInviteTemplate"              => $base."/html/invite.tpl",
  "_sSenedNowTemplate"            => $base."/html/ordershipped.tpl",
  "_sSendDownloadsTemplate"       => $base."/html/senddownloadlinks.tpl",
  "_sWishListTemplate"            => $base."/html/wishlist.tpl",
  "_sRegisterTemplate"            => $base."/html/register.tpl",
  "_sReminderMailTemplate"        => $base."/html/owner_reminder.tpl",
  "_sOrderUserTemplate"           => $base."/html/order_cust.tpl",
  "_sOrderOwnerTemplate"          => $base."/html/order_owner.tpl",
  "_sOrderUserSubjectTemplate"    => $base."/html/order_cust_subj.tpl",
  "_sOrderOwnerSubjectTemplate"   => $base."/html/order_owner_subj.tpl",
  "_sOwnerPricealarmTemplate"     => $base."/html/pricealarm_owner.tpl",
  "_sPricealamrCustomerTemplate"  => $base."/html/pricealarm_cust.tpl",
  );
