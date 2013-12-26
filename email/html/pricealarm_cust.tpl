[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="currency"  value=$oEmailView->getCurrency() }]
[{ assign var="user"      value=$oEmailView->getUser() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/header.tpl" title=$shop->oxshops__oxname->value}]

  <h1>[{oxmultilang ident="PRICE_ALERT"}]</h1>

  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_HY" }]<br>
  <br>
  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_HAVEPRICEALARM" }] [{ $shop->oxshops__oxname->value }]!<br>
  <br>
  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM1" }] [{ $oPriceAlarm->getTitle() }] [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM2" }] [{ $oPriceAlarm->getFProposedPrice() }] [{ $currency->sign}]
  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM3" }] [{ $oPriceAlarm->getFPrice() }] [{ $currency->sign }] [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM4" }]<br>
  <br>
  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_CLICKHERE1" }]<br>
  <a href="[{$oViewConf->getBaseDir()}]index.php?cl=details&anid=[{ $product->oxarticles__oxid->value }]" class="btn-primary">[{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_CLICKHERE2" }]</a>
  <br>
  <br>
  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_TEAM1" }] [{ $shop->oxshops__oxname->value }] [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_TEAM2" }]<br>

[{include file="$path/footer.tpl"}]


