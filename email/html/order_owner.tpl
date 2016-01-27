[{assign var="shop"      value=$oEmailView->getShop() }]
[{assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{assign var="currency"  value=$oEmailView->getCurrency() }]
[{assign var="user"      value=$oEmailView->getUser() }]
[{assign var="basket"    value=$order->getBasket() }]
[{assign var="oDelSet"   value=$order->getDelSet() }]
[{assign var="payment"   value=$order->getPayment() }]

[{include file=$oViewConf->getTemplatePath("inc/header.tpl") title=$shop->oxshops__oxname->value}]

<h1>[{oxmultilang ident="ORDER_OWNER_NEWORDER"}]</h1>

[{block name="email_html_order_owner_orderemail"}]
    <p>
        [{if $payment->oxuserpayments__oxpaymentsid->value == "oxempty"}]
            [{oxcontent ident="oxadminordernpemail"}]
        [{else}]
            [{oxcontent ident="oxadminorderemail"}]
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
        [{block name="email_html_order_owner_basketitem"}]
            [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
            <tr>
                <td class="picture-col">
                    <img src="[{$basketproduct->getThumbnailUrl(false)}]" alt="[{$basketitem->getTitle()|strip_tags}]" width="[{$basketproduct->getResponsiveEmailThumbnailSize()}]">
                </td>
                <td class="product-col">
                    [{assign var="amount" value=$basketitem->getAmount()}]
                    [{if $amount > 1}]<b>[{$amount}]x</b>&nbsp;[{/if}]

                    <div class="product-title">[{$basketitem->getTitle()}]</div>

                    [{include file=$oViewConf->getTemplatePath("inc/order_product_details.tpl") basketitem=$basketitem basketproduct=$basketproduct showReview=false}]
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
            [{block name="email_html_order_owner_voucherdiscount_top"}]
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
                    [{block name="email_html_order_owner_nodiscounttotalnet"}]
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
                    [{block name="email_html_order_owner_nodiscountproductvats"}]
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

                    [{block name="email_html_order_owner_nodiscounttotalgross"}]
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

                    [{block name="email_html_order_owner_discounts"}]
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

                    [{block name="email_html_order_owner_productvats"}]
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

                [{block name="email_html_order_owner_voucherdiscount"}]
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

                [{block name="email_html_order_owner_delcosts"}]
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

                [{block name="email_html_order_owner_paymentcosts"}]
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

                [{block name="email_html_order_owner_ts"}]
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
                    [{block name="email_html_order_owner_wrappingcosts"}]
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

                    [{block name="email_html_order_owner_giftwrapping"}]
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

                [{block name="email_html_order_owner_grandtotal"}]
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

[{block name="email_html_order_owner_userremark"}]
    [{if $order->oxorder__oxremark->value }]
        <h3>[{oxmultilang ident="MESSAGE" suffix="COLON" }]</h3>
        <p>[{ $order->oxorder__oxremark->value|oxescape }]</p>
    [{/if}]
[{/block}]

[{block name="email_html_order_owner_paymentinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3>
            [{oxmultilang ident="PAYMENT_INFORMATION" suffix="COLON" }]
        </h3>
        <p>
            <b>[{oxmultilang ident="PAYMENT_METHOD" suffix="COLON" }]</b> [{ $payment->oxpayments__oxdesc->value }]
            [{assign var="oPaymentCostPrice" value=$basket->getPaymentCost()}]
            [{if $oPaymentCostPrice }]([{oxprice price=$oPaymentCostPrice->getBruttoPrice() currency=$currency}])[{/if}]

            <br><br>
            [{oxmultilang ident="PAYMENT_INFO_OFF" }]
        </p>
    [{/if}]
[{/block}]

[{block name="email_html_order_owner_username"}]
    [{include file=$oViewConf->getTemplatePath("inc/order_username.tpl") order=$user}]
[{/block}]

[{block name="email_html_order_owner_address"}]
    [{include file=$oViewConf->getTemplatePath("inc/order_addresses.tpl") order=$order}]
[{/block}]

[{block name="email_html_order_owner_deliveryinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3>
            [{oxmultilang ident="SELECTED_SHIPPING_CARRIER" suffix="COLON" }]
        </h3>
        <p>
            [{ $oDelSet->oxdeliveryset__oxtitle->value }]
        </p>
    [{/if}]
[{/block}]

[{include file=$oViewConf->getTemplatePath("inc/footer.tpl")}]
