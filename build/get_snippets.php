<?php
$snippets = array(
  // email_order_cust
  array(
    'id' => 'email_order_cust_orderemail',
    'title' => 'Ihre Bestellung: nach der Begrüßung',
    'title_1' => 'your order: after the salutation',
  ),
  array(
    'id' => 'email_order_cust_basket',
    'title' => 'Ihre Bestellung: nach dem Warenkorb',
    'title_1' => 'your order: after the basket',
  ),
  array(
    'id' => 'email_order_cust_payment',
    'title' => 'Ihre Bestellung: nach den Bezahlinformationen',
    'title_1' => 'your order: after the payment info',
  ),
  array(
    'id' => 'email_order_cust_username',
    'title' => 'Ihre Bestellung: nach der Email-Adresse',
    'title_1' => 'your order: after the email address',
  ),
  array(
    'id' => 'email_order_cust_shipping',
    'title' => 'Ihre Bestellung: nach den Versandinformationen',
    'title_1' => 'your order: after the shipping info',
  ),
  array(
    'id' => 'email_order_cust_address',
    'title' => 'Ihre Bestellung: nach der Adresse',
    'title_1' => 'your order: after der address',
  ),
  // email_order_shipped
  array(
    'id' => 'email_order_shipped_header',
    'title' => 'Ihre Bestellung: nach der Begrüßung',
    'title_1' => 'your order: after the salutation',
  ),
  array(
    'id' => 'email_order_shipped_address',
    'title' => 'Ihre Bestellung: nach der Adresse',
    'title_1' => 'your order: after the address',
  ),
  array(
    'id' => 'email_order_shipped_basket',
    'title' => 'Ihre Bestellung: nach dem Warenkorb',
    'title_1' => 'your order: after the basket',
  ),
);

foreach($snippets as $snippet) {
  $sql = "INSERT IGNORE INTO `oxcontents`
    (OXID, OXLOADID, OXSHOPID, OXSNIPPET, OXACTIVE, OXACTIVE_1, OXTITLE, OXTITLE_1, OXFOLDER, OXTIMESTAMP)
    VALUES('".$snippet['id']."', '".$snippet['id']."', 'oxbaseshop', 1, 0, 0, UNHEX('".bin2hex($snippet['title'])."'), UNHEX('".bin2hex($snippet['title_1'])."'), 'CMSFOLDER_EMAILS', CURRENT_TIMESTAMP());";
  echo $sql."\n";
}
