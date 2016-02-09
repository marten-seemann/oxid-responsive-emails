[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="userInfo"  value=$oEmailView->getUser() }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

<h3>
    [{ oxmultilang ident="POST_CARD_FROM" }]
</h3>

<table class="suggest" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <b>[{ oxmultilang ident="FROM" suffix="COLON" }]</b>
        </td>
        <td>
            [{$userInfo->send_name|oxescape}]
        </td>
    </tr>
    <tr>
        <td>
            <b>[{ oxmultilang ident="EMAIL" suffix="COLON" }]</b>
        </td>
        <td>
            [{$userInfo->send_email|oxescape}]
        </td>
    </tr>
    <tr>
        <td>
            <b>[{ oxmultilang ident="TO" suffix="COLON" }]</b>
        </td>
        <td>
            [{$userInfo->rec_name|oxescape}]
        </td>
    </tr>
    <tr>
        <td>
            <b>[{ oxmultilang ident="EMAIL" suffix="COLON" }]</b>
        </td>
        <td>
            [{$userInfo->rec_email|oxescape}]
        </td>
    </tr>
</table>
<br>

<p>[{$userInfo->send_message|oxescape|nl2br}]</p>

<p>[{ oxmultilang ident="MANY_GREETINGS" }]<br>[{$userInfo->send_name|oxescape}]</p>
<br>

<div id="suggest-product">
    <a href="[{ $sArticleUrl }]">
      <img src="[{$product->getPictureUrl()}]" alt="[{ $product->oxarticles__oxtitle->value|strip_tags }]" width="[{$product->getResponsiveEmailImageSize(250)}]" border="0">
    </a>
</div>

<p>
    <a href="[{ $sArticleUrl }]"><b>[{ $product->oxarticles__oxtitle->value }]</b></a>
</p>

<p>[{ $product->oxarticles__oxshortdesc->value }]</p>

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
