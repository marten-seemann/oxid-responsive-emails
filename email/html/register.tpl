[{ assign var="shop"     value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="user"     value=$oEmailView->getUser() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/inc/header.tpl" title=$shop->oxshops__oxname->value}]

    [{ oxcontent ident=$contentident|default:"oxregisteremail" }]

[{include file="$path/inc/footer.tpl"}]
