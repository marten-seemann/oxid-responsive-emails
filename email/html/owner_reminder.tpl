[{ assign var="shop"     value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]

[{assign var="path" value=$oViewConf->getResponsiveEmailPath()}]

[{include file="$path/inc/header.tpl" title=$shop->oxshops__oxname->value}]

<h3>
    [{ oxmultilang ident="MESSAGE_STOCK_LOW" }]
</h3>

<table class="products">
    <tr>
        <td>
            <b>[{ oxmultilang ident="PRODUCT" }]</b>
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <b>[{ oxmultilang ident="TOTAL_QUANTITY" }]</b>
        </td>
    </tr>
    [{foreach from=$articles item=oProduct}]
    <tr valign="top">
        <td>
            <img src="[{$oProduct->getThumbnailUrl(false)}]" border="0" hspace="0" vspace="0" alt="[{ $oProduct->oxarticles__oxtitle->value|strip_tags }]" align="texttop">
        </td>
        <td>
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
        <td>
            <p>
                [{$oProduct->oxarticles__oxstock->value}] ([{$oProduct->oxarticles__oxremindamount->value}])
            </p>
        </td>
    </tr>
    [{/foreach}]
</table>

[{include file="$path/inc/footer.tpl"}]
