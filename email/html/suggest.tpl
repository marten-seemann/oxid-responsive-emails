[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="userInfo"  value=$oEmailView->getUser() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/inc/header.tpl" title=$shop->oxshops__oxname->value}]

    <h3>
        [{ oxmultilang ident="POST_CARD_FROM" }]
    </h3>

    <table border="0" width="100%"cellspacing="10" cellpadding="0">
        <tr>
            <td style="width:130px;">
                <p>
                    <b>[{ oxmultilang ident="FROM" suffix="COLON" }]</b>
                </p>
            </td>
            <td>
                <p>
                    [{$userInfo->send_name|oxescape}]<br>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <b>[{ oxmultilang ident="EMAIL" suffix="COLON" }]</b>
                </p>
            </td>
            <td>
                <p>
                    [{$userInfo->send_email|oxescape}]
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <b>[{ oxmultilang ident="TO" suffix="COLON" }]</b>
                </p>
            </td>
            <td>
                <p>
                    [{$userInfo->rec_name|oxescape}]
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <b>[{ oxmultilang ident="EMAIL" suffix="COLON" }]</b>
                </p>
            </td>
            <td>
                <p>
                    [{$userInfo->rec_email|oxescape}]
                </p>
            </td>
        </tr>
    </table>

    <p>
        [{$userInfo->send_message|oxescape|nl2br}]
    </p>

    <p>
        [{ oxmultilang ident="MANY_GREETINGS" }] [{$userInfo->send_name|oxescape}]
    </p>

    <br>

    <p>
        <a href="[{ $sArticleUrl }]"><img src="[{$product->getPictureUrl()}]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value|strip_tags }]"></a>
    </p>

    <p>
        <a href="[{ $sArticleUrl }]"><b>[{ $product->oxarticles__oxtitle->value }]</b></a>
    </p>

    <p>
        [{ $product->oxarticles__oxshortdesc->value }]
    </p>

[{include file="$path/inc/footer.tpl"}]
