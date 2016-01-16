[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="userinfo"  value=$oEmailView->getUser() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/inc/header.tpl" title=$shop->oxshops__oxname->value}]

<h3>
    [{ oxmultilang ident="SELECTED_SHIPPING_CARRIER" suffix="COLON" }]
</h3>

<table>
    <tr>
        <td>
            <p>
                <b>[{ oxmultilang ident="FROM" suffix="COLON" }]</b>
            </p>
        </td>
        <td>
            <p>
                [{$userinfo->send_name|oxescape}]
            </p>
        </td>
    </tr>
    <tr>
        <td width="10%">
            <p>
                <b>[{ oxmultilang ident="EMAIL" suffix="COLON"}]</b>
            </p>
        </td>
        <td>
            <p>
                [{$userinfo->send_email|oxescape}]
            </p>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <p>
                [{$userinfo->send_message|oxescape|nl2br}]
            </p>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <p>
                [{include file="$path/inc/button.tpl" url=$sHomeUrl text=$shop->oxshops__oxname->value}]
            </p>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <p>
                [{ oxmultilang ident="MANY_GREETINGS" }]<br>[{$userinfo->send_name|oxescape}]
            </p>
        </td>
    </tr>
</table>

[{include file="$path/inc/footer.tpl"}]
