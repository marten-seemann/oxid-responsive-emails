[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="user"      value=$oEmailView->getUser() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/header.tpl" title=$shop->oxshops__oxname->value}]

    <p>
        [{ oxcontent ident="oxnewsletteremail" }]
    </p>

[{include file="$path/footer.tpl"}]
