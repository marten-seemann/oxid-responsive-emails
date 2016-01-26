[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="userInfo"      value=$oEmailView->getUser() }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

    <h3>
        [{ oxmultilang ident="GIFT_REGISTRY_OF_2" }] [{$shop->oxshops__oxname->value}]
    </h3>

    <p>
          [{$userInfo->send_message|oxescape}]
          <br>
          [{ oxmultilang ident="TO_MY_WISHLIST" }]

          [{assign var="wishlistLink" value=$oViewConf->getBaseDir()|cat:"index.php?cl=wishlist&wishid="|cat:$userInfo->send_id}]
          [{assign var="linkText" value="CLICK_HERE"|oxmultilangassign}]
    </p>

    [{include file=$oViewConf->getTemplatePath("inc/button.tpl") url=$wishlistLink text=$linkText}]

    <p>
        [{ oxmultilang ident="WITH_LOVE" }]<br>
        [{$userInfo->send_name|oxescape}]
    </p>

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
