[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="user"      value=$oEmailView->getUser() }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

[{ oxcontent ident="oxnewsletteremail" }]

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
