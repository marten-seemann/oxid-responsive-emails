[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="userInfo"      value=$oEmailView->getUser() }]

[{include file="email/html/header.tpl" title=$shop->oxshops__oxname->value}]

    <h3>
        [{ oxmultilang ident="GIFT_REGISTRY_OF_2" }]
    </h3>

    <p>
          [{$userInfo->send_message|oxescape}]

    <p>
          [{ oxmultilang ident="TO_MY_WISHLIST" }] <a href="[{ $oViewConf->getBaseDir() }]index.php?cl=wishlist&wishid=[{$userInfo->send_id}]"><b>[{ oxmultilang ident="CLICK_HERE" }]</b></a>
    </p>

    <p>
          [{ oxmultilang ident="WITH_LOVE" }]
    </p>

    <p>
          [{$userInfo->send_name|oxescape}]
    </p>

[{include file="email/html/footer.tpl"}]
