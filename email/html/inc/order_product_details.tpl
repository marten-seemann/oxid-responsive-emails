<div class="product-details">
    <div class="product-artnum">[{oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $basketproduct->oxarticles__oxartnum->value }]</div>

    [{if $basketitem->getChosenSelList() }]
        <div class="product-select-lists">
            [{foreach from=$basketitem->getChosenSelList() item=oList}]
                [{ $oList->name }]: [{ $oList->value }]<br>
            [{/foreach}]
        </div>
    [{/if}]

    [{if $basketitem->getPersParams() }]
        <div class="product-persparam">
            [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                    [{ oxmultilang ident="LABEL" suffix="COLON" }]
                [{else}]
                    [{ $sVar }]:
                [{/if}]
                [{$aParam}]
                <br>
            [{/foreach}]
        </div>
    [{/if}]

    <div class="product-gift-wrapping">
        [{if $oViewConf->getShowGiftWrapping() }]
            [{assign var="oWrapping" value=$basketitem->getWrapping() }]
            [{if !!$basketitem->getWrappingId() }]
                [{oxmultilang ident="GIFT_WRAPPING" suffix="COLON"}]
                [{if !$basketitem->getWrappingId() }]
                    [{oxmultilang ident="NONE" }]
                [{else}]
                    [{$oWrapping->oxwrapping__oxname->value}]
                [{/if}]
            [{/if}]
        [{/if}]
    </div>

    [{if $showReview}]
        <a href="[{ $oConf->getShopURL() }]index.php?shp=[{$shop->oxshops__oxid->value}]&amp;anid=[{$basketitem->getProductId()}]&amp;cl=review&amp;reviewuserhash=[{$user->getReviewUserHash($user->getId())}]" target="_blank" class="review-link">[{oxmultilang ident="REVIEW" }]</a>
    [{/if}]
</div>
