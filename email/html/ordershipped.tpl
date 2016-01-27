[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]

[{assign var="showReviewLink" value=$oViewConf->getResponsiveEmailConfig("showEmailRatingLinks")}]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

[{block name="email_html_ordershipped_sendemail"}]
   [{ oxcontent ident="oxordersendemail" }]
[{/block}]

[{block name="email_html_ordershipped_infoheader"}]
    <h3>
        [{ oxmultilang ident="ORDER_SHIPPED_TO" suffix="COLON" }]
    </h3>
[{/block}]

[{block name="email_html_ordershipped_address"}]
    <p>
        [{if $order->oxorder__oxdellname->value }]
          [{ assign var="company" value=$order->oxorder__oxdelcompany->value }]
          [{ if strlen($company) > 0}][{$company}]<br>[{/if}]
          [{ $order->oxorder__oxdelfname->value }] [{ $order->oxorder__oxdellname->value }]<br>
          [{ $order->oxorder__oxdelstreet->value }] [{ $order->oxorder__oxdelstreetnr->value }]<br>
          [{ $order->oxorder__oxdelstateid->value }]
          [{ $order->oxorder__oxdelzip->value }] [{ $order->oxorder__oxdelcity->value }]
        [{else}]
          [{ assign var="company" value=$order->oxorder__oxbillcompany->value }]
          [{ if strlen($company) > 0}][{$company}]<br>[{/if}]
          [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }]<br>
          [{ $order->oxorder__oxbillstreet->value }] [{ $order->oxorder__oxbillstreetnr->value }]<br>
          [{ $order->oxorder__oxbillstateid->value }]
          [{ $order->oxorder__oxbillzip->value }] [{ $order->oxorder__oxbillcity->value }]
        [{/if}]
    </p>
    <br>
[{/block}]

[{block name="email_html_ordershipped_oxordernr"}]
    <div class="order-nr">
        [{ oxmultilang ident="ORDER_NUMBER" suffix="COLON" }] [{ $order->oxorder__oxordernr->value }]
    </div>
    <br>
[{/block}]

<table id="order" class="products" cellpadding="0" cellspacing="0">
    <tr>
        <td class="picture-col">&nbsp;</td>
        <td class="product-col">
            <b>[{ oxmultilang ident="PRODUCT" }]</b>
        </td>
    </tr>
    [{block name="email_html_ordershipped_orderarticles"}]
        [{foreach from=$order->getOrderArticles(true) item=oOrderArticle}]
            <tr valign="top">
                <td class="picture-col">
                    [{assign var="basketproduct" value=$oOrderArticle->getArticle()}]
                    <img src="[{$basketproduct->getThumbnailUrl(false) }]" border="0" hspace="0" vspace="0" alt="[{$oOrderArticle->oxorderarticles__oxtitle->value|strip_tags}]" align="texttop">
                </td>
                <td class="product-col">
                    [{assign var="amount" value=$oOrderArticle->oxorderarticles__oxamount->value }]
                    [{if $amount > 1}]<b>[{$amount}]x</b>&nbsp;[{/if}]

                    <div class="product-title">[{ $oOrderArticle->oxorderarticles__oxtitle->value }] [{ $oOrderArticle->oxorderarticles__oxselvariant->value }]</div>

                    <div class="product-details">
                        <div class="product-artnum">[{ oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $oOrderArticle->oxorderarticles__oxartnum->value }]</div>

                        <a href="[{ $oViewConf->getBaseDir() }]index.php?shp=[{$shop->oxshops__oxid->value}]&amp;anid=[{ $oOrderArticle->oxorderarticles__oxartid->value }]&amp;cl=review&amp;reviewuserhash=[{$reviewuserhash}]" target="_blank">[{ oxmultilang ident="REVIEW" }]</a>
                    </div>
                </td>
            </tr>
        [{/foreach}]
    [{/block}]
</table>
<br><br>

[{block name="email_html_ordershipped_infofooter"}]
    <p>[{ oxmultilang ident="YOUR_TEAM" args=$shop->oxshops__oxname->value}]</p>
[{/block}]

[{block name="email_html_ordershipped_shipmenttrackingurl"}]
    [{if $order->getShipmentTrackingUrl()}]
        <br>
        <p>
            [{ oxmultilang ident="SHIPMENT_TRACKING" suffix="COLON" }] <a href="[{ $order->getShipmentTrackingUrl()}]" target="_blank" title="[{ oxmultilang ident="CLICK_HERE" }]">[{ oxmultilang ident="CLICK_HERE" }]</a>
        </p>
    [{/if}]
[{/block}]

[{block name="email_html_ordershipped_ts"}]
    [{if $oViewConf->showTs("ORDERCONFEMAIL") && $oViewConf->getTsId() }]
        [{assign var="sTSRatingImg" value="https://www.trustedshops.com/bewertung/widget/img/bewerten_"|cat:$oViewConf->getActLanguageAbbr()|cat:".gif"}]
        <h4>[{ oxmultilang ident="RATE_OUR_SHOP" }]</h4>

        <p>
            <a href="[{ $oViewConf->getTsRatingUrl() }]" target="_blank" title="[{ oxmultilang ident="TRUSTED_SHOPS_RATINGS" }]">
                <img src="[{$sTSRatingImg}]" alt="[{ oxmultilang ident="WRITE_REVIEW_2" }]" align="middle">
            </a>
        </p>
    [{/if}]
[{/block}]

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
