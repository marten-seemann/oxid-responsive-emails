[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="currency"  value=$oEmailView->getCurrency() }]
[{ assign var="user"      value=$oEmailView->getUser() }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

  <h1>[{oxmultilang ident="PRICE_ALERT"}]</h1>

  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_HY" }]
  <br><br>

  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_HAVEPRICEALARM" }] [{ $shop->oxshops__oxname->value }]!
  <br><br>

  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM1" }] [{ $oPriceAlarm->getTitle() }] [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM2" }] [{ $oPriceAlarm->getFProposedPrice() }] [{ $currency->sign}]
  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM3" }] [{ $oPriceAlarm->getFPrice() }] [{ $currency->sign }] [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_ITEM4" }]
  <br><br>

  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_CLICKHERE1" }]<br>
  [{ assign var=url value=$oViewConf->getBaseDir()|cat:'index.php?cl=details&anid='|cat:$product->oxarticles__oxid->value}]
  [{capture name="text" assign="text"}][{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_CLICKHERE2" }][{/capture}]
  [{include file=$oViewConf->getTemplatePath("inc/button.tpl") url=$url text=$text}]
  <br>

  [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_TEAM1" }] [{ $shop->oxshops__oxname->value }] [{ oxmultilang ident="EMAIL_PRICEALARM_CUSTOMER_TEAM2" }]<br>



[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
