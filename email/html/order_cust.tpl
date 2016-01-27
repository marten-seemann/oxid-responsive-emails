[{assign var="shop"      value=$oEmailView->getShop() }]
[{assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{assign var="oConf"     value=$oViewConf->getConfig() }]
[{assign var="currency"  value=$oEmailView->getCurrency() }]
[{assign var="user"      value=$oEmailView->getUser() }]
[{assign var="oDelSet"   value=$order->getDelSet() }]
[{assign var="basket"    value=$order->getBasket() }]
[{assign var="payment"   value=$order->getPayment() }]
[{assign var="sOrderId"   value=$order->getId() }]
[{assign var="oOrderFileList"   value=$oEmailView->getOrderFileList($sOrderId) }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

[{assign var="showReviewLink" value=$oViewConf->getResponsiveEmailConfig("showEmailRatingLinks")}]

[{block name="email_html_order_cust_orderemail"}]
    <p>
        [{if $payment->oxuserpayments__oxpaymentsid->value == "oxempty"}]
            [{oxcontent ident="oxuserordernpemail"}]
        [{else}]
            [{oxcontent ident="oxuserorderemail"}]
        [{/if}]
    </p>
    <br>
[{/block}]

<div id="order-nr">[{oxmultilang ident="ORDER_NUMBER" suffix="COLON"}] [{ $order->oxorder__oxordernr->value }]</div>
<br>

<table id="order" class="products" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="picture-col">&nbsp;</td>
        <td class="product-col">
            <b>[{oxmultilang ident="PRODUCT" }]</b>
        </td>
        <td class="price">
            <b>[{oxmultilang ident="ORDER_EMAIL_TOTAL" }]</b>
        </td>
    </tr>

    [{assign var="basketitemlist" value=$basket->getBasketArticles() }]
    [{foreach key=basketindex from=$basket->getContents() item=basketitem}]
        [{block name="email_html_order_cust_basketitem"}]
            [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
            <tr>
                <td class="picture-col">
                    <img src="[{$basketproduct->getThumbnailUrl(false)}]" alt="[{$basketitem->getTitle()|strip_tags}]" width="[{$basketproduct->getResponsiveEmailThumbnailSize()}]">
                </td>
                <td class="product-col">
                    [{assign var="amount" value=$basketitem->getAmount()}]
                    [{if $amount > 1}]<b>[{$amount}]x</b>&nbsp;[{/if}]

                    <div class="product-title">[{$basketitem->getTitle()}]</div>

                    [{if $showReviewLink && $blShowReviewLink}]
                        [{assign var="showReview" value=true}]
                    [{else}]
                        [{assign var="showReview" value=false}]
                    [{/if}]
                    [{include file=$oViewConf->getTemplatePath("inc/order_product_details.tpl") basketitem=$basketitem basketproduct=$basketproduct showReview=$showReview}]
                </td>

                <td class="price">
                    <b>[{oxprice price=$basketitem->getPrice() currency=$currency}]</b>
                </td>
            </tr>
        [{/block}]
    [{/foreach}]

    [{block name="email_html_order_cust_giftwrapping"}]
        [{include file=$oViewConf->getTemplatePath("inc/order_greeting_card.tpl") basket=$basket}]
    [{/block}]
</table>
<br>


<table id="vouchers" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            [{block name="email_html_order_cust_voucherdiscount_top"}]
                [{include file=$oViewConf->getTemplatePath("inc/order_vouchers.tpl") order=$order basket=$basket}]
            [{/block}]
        </td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="right">
            <table id="order-summary" border="0" cellpadding="0" cellspacing="0">
                [{if !$basket->getDiscounts()}]
                    [{block name="email_html_order_cust_nodiscounttotalnet"}]
                        <!-- netto price -->
                        <tr>
                            <th>
                                  [{oxmultilang ident="TOTAL_NET" suffix="COLON" }]
                            </th>
                            <td class="price">
                                  [{oxprice price=$basket->getNettoSum() currency=$currency }]
                            </td>
                        </tr>
                    [{/block}]
                    [{block name="email_html_order_cust_nodiscountproductvats"}]
                        <!-- VATs -->
                        [{foreach from=$basket->getProductVats(false) item=VATitem key=key}]
                            <tr>
                                <th>
                                    [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]
                                </th>
                                <td class="price">
                                    [{oxprice price=$VATitem currency=$currency }]
                                </td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{block name="email_html_order_cust_nodiscounttotalgross"}]
                        <!-- brutto price -->
                        <tr>
                            <th>
                                [{oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$basket->getBruttoSum() currency=$currency }]
                            </td>
                        </tr>
                    [{/block}]
                [{/if}]
                <!-- applied discounts -->
                [{if $basket->getDiscounts()}]

                    [{if $order->isNettoMode() }]
                        [{block name="email_html_order_cust_discounttotalnet"}]
                        <!-- netto price -->
                            <tr>
                                <th>
                                    [{oxmultilang ident="TOTAL_NET" suffix="COLON" }]
                                </th>
                                <td class="price">
                                    [{oxprice price=$basket->getNettoSum() currency=$currency }]
                                </td>
                            </tr>
                        [{/block}]
                    [{else}]
                        [{block name="email_html_order_cust_discounttotalgross"}]
                            <!-- brutto price -->
                            <tr>
                                <th>
                                    [{oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]
                                </th>
                                <td class="price">
                                    [{oxprice price=$basket->getBruttoSum() currency=$currency }]
                                </td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="email_html_order_cust_discounts"}]
                        <!-- discounts -->
                        [{foreach from=$basket->getDiscounts() item=oDiscount}]
                            <tr>
                                <th>
                                    [{if $oDiscount->dDiscount < 0 }][{oxmultilang ident="SURCHARGE" }][{else}][{oxmultilang ident="DISCOUNT" }][{/if}] <em>[{ $oDiscount->sDiscount }]</em> :
                                </th>
                                <td class="price">
                                    [{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]
                                </td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if !$order->isNettoMode() }]
                    [{block name="email_html_order_cust_totalnet"}]
                        <!-- netto price -->
                        <tr>
                            <th>
                                [{oxmultilang ident="TOTAL_NET" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$basket->getNettoSum() currency=$currency }]
                            </td>
                        </tr>
                    [{/block}]
                    [{/if}]

                    [{block name="email_html_order_cust_productvats"}]
                        <!-- VATs -->
                        [{foreach from=$basket->getProductVats(false) item=VATitem key=key}]
                            <tr>
                                <th>
                                    [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]
                                </th>
                                <td class="price">
                                    [{oxprice price=$VATitem currency=$currency }]
                                </td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if $order->isNettoMode() }]
                    [{block name="email_html_order_cust_totalbrut"}]
                        <!-- brutto price -->
                        <tr>
                            <th>
                                [{oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$basket->getBruttoSum() currency=$currency }]
                            </td>
                        </tr>
                    [{/block}]
                    [{/if}]
                [{/if}]

                [{block name="email_html_order_cust_voucherdiscount"}]
                    <!-- voucher discounts -->
                    [{if $oViewConf->getShowVouchers() && $basket->getVoucherDiscValue() }]
                        <tr>
                            <th>
                                [{oxmultilang ident="COUPON" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{assign var="oVoucherDiscount" value=$basket->getVoucherDiscount()}]
                                [{oxprice price=$oVoucherDiscount->getBruttoPrice()*-1 currency=$currency}]
                            </td>
                        </tr>
                    [{/if}]
                [{/block}]

                [{block name="email_html_order_cust_delcosts"}]
                    <!-- delivery costs -->
                [{assign var="oDeliveryCost" value=$basket->getDeliveryCost()}]
                [{if $oDeliveryCost && $oDeliveryCost->getPrice() > 0 }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                        <tr>
                            <th>
                                [{oxmultilang ident="SHIPPING_NET" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$oDeliveryCost->getNettoPrice() currency=$currency}]
                            </td>
                        </tr>
                        [{if $oDeliveryCost->getVatValue()}]
                            <tr>
                                [{if $basket->isProportionalCalculationOn() }]
                                    <th>
                                        [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                    </th>
                                [{else}]
                                    <th>
                                        [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oDeliveryCost->getVat() }]
                                    </th>
                                [{/if}]
                                <td class="price">
                                    [{oxprice price=$oDeliveryCost->getVatValue() currency=$currency}]
                                </td>
                            </tr>
                        [{/if}]
                    [{else}]
                        <tr>
                            <th>
                                [{oxmultilang ident="SHIPPING_COST" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$oDeliveryCost->getBruttoPrice() currency=$currency}]
                            </td>
                        </tr>
                    [{/if}]
                [{/if}]
                [{/block}]

                [{block name="email_html_order_cust_paymentcosts"}]
                    <!-- payment sum -->
                [{assign var="oPaymentCost" value=$basket->getPaymentCost()}]
                [{if $oPaymentCost && $oPaymentCost->getPrice() }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                        <tr>
                            <th>
                                [{if $oPaymentCost->getPrice() >= 0}][{oxmultilang ident="SURCHARGE" }][{else}][{oxmultilang ident="DEDUCTION" }][{/if}] [{oxmultilang ident="PAYMENT_METHOD" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$oPaymentCost->getNettoPrice() currency=$currency}]
                            </td>
                        </tr>
                        [{if $oPaymentCost->getVatValue()}]
                            <tr>
                                [{if $basket->isProportionalCalculationOn() }]
                                    <th>
                                        [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                    </th>
                                [{else}]
                                    <th>
                                        [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oPaymentCost->getVat()}]
                                    </th>
                                [{/if}]
                                <td class="price">
                                    [{oxprice price=$oPaymentCost->getVatValue() currency=$currency}]
                                </td>
                            </tr>
                        [{/if}]
                    [{else}]
                        <tr>
                            <th>
                                [{oxmultilang ident="SURCHARGE" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$oPaymentCost->getBruttoPrice() currency=$currency}]
                            </td>
                        </tr>
                    [{/if}]
                [{/if}]
                [{/block}]

                [{block name="email_html_order_cust_ts"}]
                    [{assign var="trustedShopProtectionCost" value=$basket->getTrustedShopProtectionCost()}]
                    [{if $trustedShopProtectionCost && $trustedShopProtectionCost->getPrice() > 0  }]
                        <!-- Trusted Shops -->
                        <tr>
                            <th>
                                [{oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION" suffix="COLON" }]
                            </th>
                            <td class="price">
                                [{oxprice price=$trustedShopProtectionCost->getNettoPrice() currency=$currency}]
                            </td>
                        </tr>
                        [{if $trustedShopProtectionCost->getVatValue()}]
                            <tr>
                                [{if $basket->isProportionalCalculationOn() }]
                                    <th>
                                        [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                    </th>
                                [{else}]
                                    <th>
                                        [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$trustedShopProtectionCost->getVat()}]
                                    </th>
                                [{/if}]
                                <td class="price">
                                    [{oxprice price=$trustedShopProtectionCost->getVatValue() currency=$currency}]
                                </td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/block}]

                [{if $oViewConf->getShowGiftWrapping() }]
                    [{block name="email_html_order_cust_wrappingcosts"}]
                        <!-- Gift wrapping -->
                        [{assign var="wrappingCost" value=$basket->getWrappingCost()}]
                        [{if $wrappingCost && $wrappingCost->getPrice() > 0 }]
                            [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                                <tr>
                                    <th>
                                        [{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" suffix="COLON" }]
                                    </th>
                                    <td class="price">
                                        [{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        [{oxmultilang ident="PLUS_VAT" suffix="COLON" }]
                                    </th>
                                    <td class="price">
                                        [{oxprice price=$wrappingCost->getVatValue() currency=$currency}]
                                    </td>
                                </tr>
                            [{else}]
                                <tr>
                                    <th>
                                        [{oxmultilang ident="GIFT_WRAPPING" suffix="COLON" }]
                                    </th>
                                    <td class="price">
                                        [{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency}]
                                    </td>
                                </tr>
                            [{/if}]
                        [{/if}]
                    [{/block}]

                    [{block name="email_html_order_cust_giftwrapping"}]
                        <!-- Greeting card -->
                        [{assign var="giftCardCost" value=$basket->getGiftCardCost()}]
                        [{if $giftCardCost && $giftCardCost->getPrice() > 0 }]
                            [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                                <tr>
                                    <th>
                                        [{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" suffix="COLON" }]
                                    </th>
                                    <td class="price">
                                        [{oxprice price=$giftCardCost->getNettoPrice() currency=$currency}]
                                    </td>
                                </tr>
                                <tr>
                                    [{if $basket->isProportionalCalculationOn() }]
                                        <th>
                                            [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                        </th>
                                    [{else}]
                                        <th>
                                            [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" suffix="COLON" args=$giftCardCost->getVat()}]
                                        </th>
                                    [{/if}]
                                    <td class="price">
                                        [{oxprice price=$giftCardCost->getVatValue() currency=$currency}]
                                    </td>
                                </tr>
                            [{else}]
                                <tr>
                                    <th>
                                        [{oxmultilang ident="GREETING_CARD" suffix="COLON"}]
                                    </th>
                                    <td class="price">
                                        [{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]
                                    </td>
                                </tr>
                            [{/if}]
                        [{/if}]
                    [{/block}]
                [{/if}]

                [{block name="email_html_order_cust_grandtotal"}]
                    <!-- grand total price -->
                    <tr id="grand-total">
                        <th>
                            <b>[{oxmultilang ident="GRAND_TOTAL" suffix="COLON" }]</b>
                        </th>
                        <td class="price">
                            <b>[{oxprice price=$basket->getPrice() currency=$currency}]</b>
                        </td>
                    </tr>
                [{/block}]
            </table>
        </td>
    </tr>
</table>

[{block name="email_html_order_cust_userremark"}]
    [{if $order->oxorder__oxremark->value }]
        <h3>[{oxmultilang ident="WHAT_I_WANTED_TO_SAY" }]</h3>
        <p>[{ $order->oxorder__oxremark->value|oxescape }]</p>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_download_link"}]
    [{if $oOrderFileList and $oOrderFileList|count }]
        <h3>
            [{oxmultilang ident="MY_DOWNLOADS_DESC" }]
        </h3>
        [{foreach from=$oOrderFileList item="oOrderFile"}]
            <p>
                [{if $order->oxorder__oxpaid->value || !$oOrderFile->oxorderfiles__oxpurchasedonly->value}]
                    <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" rel="nofollow">[{$oOrderFile->oxorderfiles__oxfilename->value}]</a> [{$oOrderFile->getFileSize()|oxfilesize}]
                [{else}]
                    <span>[{$oOrderFile->oxorderfiles__oxfilename->value}]</span>
                    <strong>[{oxmultilang ident="DOWNLOADS_PAYMENT_PENDING" }]</strong>
                [{/if}]
            </p>
        [{/foreach}]
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_paymentinfo_top"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3>
            [{oxmultilang ident="PAYMENT_METHOD" suffix="COLON" }]
        </h3>
        <p>
            [{ $payment->oxpayments__oxdesc->value }]
            [{assign var="oPaymentCostPrice" value=$basket->getPaymentCost()}]
            [{if $oPaymentCostPrice }]([{oxprice price=$oPaymentCostPrice->getBruttoPrice() currency=$currency}])[{/if}]
        </p>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_username"}]
    [{include file=$oViewConf->getTemplatePath("inc/order_username.tpl") order=$user}]
[{/block}]

[{block name="email_html_order_cust_address"}]
    [{include file=$oViewConf->getTemplatePath("inc/order_addresses.tpl") order=$order}]
[{/block}]

[{block name="email_html_order_cust_deliveryinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3>
            [{oxmultilang ident="SELECTED_SHIPPING_CARRIER" suffix="COLON" }]
        </h3>
        <p>
            [{ $order->oDelSet->oxdeliveryset__oxtitle->value }]
        </p>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_paymentinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value == "oxidpayadvance"}]
        <h3>
            [{oxmultilang ident="BANK_DETAILS" }]
        </h3>
        <p>
            [{oxmultilang ident="BANK" suffix="COLON" }] [{$shop->oxshops__oxbankname->value}]<br>
            [{oxmultilang ident="BANK_CODE" suffix="COLON" }] [{$shop->oxshops__oxbankcode->value}]<br>
            [{oxmultilang ident="BANK_ACCOUNT_NUMBER" suffix="COLON" }] [{$shop->oxshops__oxbanknumber->value}]<br>
            [{oxmultilang ident="BIC" suffix="COLON"}] [{$shop->oxshops__oxbiccode->value}]<br>
            [{oxmultilang ident="IBAN" suffix="COLON"}] [{$shop->oxshops__oxibannumber->value}]
        </p>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_orderemailend"}]
    <br>
    <p>
        [{oxcontent ident="oxuserorderemailend" }]
    </p>
[{/block}]

[{block name="email_html_order_cust_tsinfo"}]
    [{if $oViewConf->showTs("ORDEREMAIL") && $oViewConf->getTsId() }]
        [{assign var="sTSRatingImg" value="https://www.trustedshops.com/bewertung/widget/img/bewerten_"|cat:$oViewConf->getActLanguageAbbr()|cat:".gif"}]
        <h3>
            [{oxmultilang ident="RATE_OUR_SHOP" }]
        </h3>

        <a href="[{ $oViewConf->getTsRatingUrl() }]" target="_blank" title="[{oxmultilang ident="TRUSTED_SHOPS_RATINGS" }]">
            <img src="[{$sTSRatingImg}]" border="0" alt="[{oxmultilang ident="WRITE_REVIEW_2" }]" align="middle">
        </a>
    [{/if}]
[{/block}]

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
