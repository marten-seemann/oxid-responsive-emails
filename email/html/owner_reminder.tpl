[{ assign var="shop"     value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

<h1>[{ oxmultilang ident="MESSAGE_STOCK_LOW_TITLE" }]</h1>

<p>[{ oxmultilang ident="MESSAGE_STOCK_LOW" }]</p>
<br>


<table class="products" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="picture-col">
            <b>[{ oxmultilang ident="PRODUCT" }]</b>
        </td>
        <td class="product-col">
            &nbsp;
        </td>
        <td class="price">
            <b>[{ oxmultilang ident="TOTAL_QUANTITY" }]</b>
        </td>
    </tr>
    [{foreach from=$articles item=oProduct}]
    <tr valign="top">
        <td class="picture-col">
            <img src="[{$oProduct->getThumbnailUrl(false)}]" alt="[{ $oProduct->oxarticles__oxtitle->value|strip_tags }]" width="[{$oProduct->getResponsiveEmailThumbnailSize()}]">
        </td>
        <td class="product-col">
            <b>[{ $oProduct->oxarticles__oxtitle->value }][{ if $oProduct->oxarticles__oxvarselect->value}], [{ $oProduct->oxarticles__oxvarselect->value}][{/if}]</b>
            <div class="product-details">
                [{ if $chosen_selectlist }]
                    ,
                    [{foreach from=$chosen_selectlist item=oList}]
                        [{ $oList->name }] [{ $oList->value }]&nbsp;
                    [{/foreach}]
                    <br>
                [{/if}]
                [{ oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $oProduct->oxarticles__oxartnum->value }]
            </div>
        </td>
        <td class="price">
            [{$oProduct->oxarticles__oxstock->value}] ([{$oProduct->oxarticles__oxremindamount->value}])
        </td>
    </tr>
    [{/foreach}]
</table>

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
