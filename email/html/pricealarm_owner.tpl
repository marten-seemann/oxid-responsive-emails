[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="currency"  value=$oEmailView->getCurrency() }]
[{ assign var="user"      value=$oEmailView->getUser() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/header.tpl" title=$shop->oxshops__oxname->value}]

    [{ oxcontent ident="oxpricealarmemail" }]

[{include file="$path/footer.tpl"}]
