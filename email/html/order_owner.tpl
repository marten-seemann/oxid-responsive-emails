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
        [{/block}]

        <div id="order-nr">[{oxmultilang ident="ORDER_NUMBER" suffix="COLON"}] [{ $order->oxorder__oxordernr->value }]</div>
        <br>

            <table id="order" class="products">
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
                                <img src="[{$basketproduct->getThumbnailUrl(false) }]" alt="[{$basketitem->getTitle()|strip_tags}]">
                            </td>
                            <td class="product-col">
                                <p>
                                    [{assign var="amount" value=$basketitem->getAmount()}]
                                    [{if $amount>1}]<b>[{$amount}]x</b>&nbsp;[{/if}]
                                    [{$basketitem->getTitle()}]
                                    <div class="product-details">
                                        <p>[{oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $basketproduct->oxarticles__oxartnum->value }]</p>

                                        [{if $basketitem->getChosenSelList() }],
                                        [{foreach from=$basketitem->getChosenSelList() item=oList}]
                                        [{ $oList->name }] [{ $oList->value }]&nbsp;
                                        [{/foreach}]
                                        [{/if}]
                                        [{if $basketitem->getPersParams() }]
                                            <ul>
                                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam}]
                                                    <li>[{$sVar}]: [{$aParam}]</li>
                                                [{/foreach}]
                                            </ul>
                                        [{/if}]

                                        [{if $oViewConf->getShowGiftWrapping() }]
                                            [{assign var="oWrapping" value=$basketitem->getWrapping() }]
                                            [{if !!$basketitem->getWrappingId() }]
                                                <p>
                                                    [{oxmultilang ident="GIFT_WRAPPING" suffix="COLON" }]&nbsp;[{if !$basketitem->getWrappingId() }][{oxmultilang ident="NONE" }][{else}][{$oWrapping->oxwrapping__oxname->value}][{/if}]
                                                </p>
                                            [{/if}]
                                        [{/if}]
                                    </div>
                                </p>
                            </td>
                            <td class="price">
                                <p>
                                    <b>[{oxprice price=$basketitem->getPrice() currency=$currency}]</b>
                                </p>
                            </td>
                        </tr>
                    [{/block}]
                [{/foreach}]

                [{block name="email_html_order_cust_giftwrapping"}]
                    [{if $oViewConf->getShowGiftWrapping() && $basket->getCard() }]
                        [{assign var="oCard" value=$basket->getCard() }]
                            <tr>
                                <td class="picture-col">
                                    <img src="[{$oCard->getPictureUrl()}]" alt="[{$oCard->oxwrapping__oxname->value}]">
                                </td>
                                <td colspan="2">
                                    [{oxmultilang ident="YOUR_GREETING_CARD" suffix="COLON" }]<br>
                                    <p id="greeting-card-message">[{$basket->getCardMessage()}]</p>
                                </td>
                            </tr>
                    [{/if}]
                [{/block}]
            </table>

            <br><br>
            <table id="vouchers">
                <tr>
                    <td>
                        [{block name="email_html_order_owner_voucherdiscount_top"}]
                            <table border="0" cellspacing="0" cellpadding="0">
                                [{if $oViewConf->getShowVouchers() && $basket->getVoucherDiscValue() }]
                                    <tr>
                                        <td>
                                            <p>
                                        <b>[{oxmultilang ident="USED_COUPONS_2" }]</b>
                                            </p>
                                        </td>
                                        <td>
                                            <p>
                                        <b>[{oxmultilang ident="REBATE" }]</b>
                                            </p>
                                        </td>
                                    </tr>
                                    [{foreach from=$order->getVoucherList() item=voucher}]
                                        [{assign var="voucherseries" value=$voucher->getSerie() }]
                                        <tr>
                                            <td>
                                                <p>
                                                    [{$voucher->oxvouchers__oxvouchernr->value}]
                                                </p>
                                            </td>
                                            <td>
                                                <p>
                                                    [{$voucherseries->oxvoucherseries__oxdiscount->value}] [{if $voucherseries->oxvoucherseries__oxdiscounttype->value == "absolute"}][{ $currency->sign}][{else}]%[{/if}]
                                                </p>
                                            </td>
                                        </tr>
                                    [{/foreach}]
                                [{/if}]
                            </table>
                        [{/block}]
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td align="right">
                        <table id="order-summary">
                            <tr>
                                <td>
                                    <table>
                                        [{if !$basket->getDiscounts() }]
                                            [{block name="email_html_order_owner_nodiscounttotalnet"}]
                                                <!-- netto price -->
                                                <tr>
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="TOTAL_NET" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                    <td class="price">
                                                        <p>
                                                    [{oxprice price=$basket->getNettoSum() currency=$currency }]
                                                        </p>
                                                    </td>
                                                </tr>
                                            [{/block}]
                                            [{block name="email_html_order_owner_nodiscountproductvats"}]
                                                <!-- VATs -->
                                        [{foreach from=$basket->getProductVats(false) item=VATitem key=key}]
                                                    <tr>
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]
                                                            </p>
                                                        </th>
                                                        <td class="price">
                                                            <p>
                                                        [{oxprice price=$VATitem currency=$currency }]
                                                            </p>
                                                        </td>
                                                    </tr>
                                                [{/foreach}]
                                            [{/block}]

                                            [{block name="email_html_order_owner_nodiscounttotalgross"}]
                                                <!-- brutto price -->
                                                <tr>
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                    <td class="price">
                                                        <p>
                                                    [{oxprice price=$basket->getBruttoSum() currency=$currency }]
                                                        </p>
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
                                                            <p>
                                                                [{oxmultilang ident="TOTAL_NET" suffix="COLON" }]
                                                            </p>
                                                        </th>
                                                        <td class="price">
                                                            <p>
                                                        [{oxprice price=$basket->getNettoSum() currency=$currency }]
                                                            </p>
                                                        </td>
                                                    </tr>
                                                [{/block}]
                                            [{else}]
                                                [{block name="email_html_order_cust_discounttotalgross"}]
                                                    <!-- brutto price -->
                                                    <tr>
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]
                                                            </p>
                                                        </th>
                                                        <td class="price">
                                                            <p>
                                                        [{oxprice price=$basket->getBruttoSum() currency=$currency }]
                                                            </p>
                                                        </td>
                                                    </tr>
                                                [{/block}]
                                            [{/if}]

                                            [{block name="email_html_order_owner_discounts"}]
                                                <!-- discounts -->
                                                [{foreach from=$basket->getDiscounts() item=oDiscount}]
                                                    <tr>
                                                         <th>
                                                            <p>
                                                                [{if $oDiscount->dDiscount < 0 }][{oxmultilang ident="SURCHARGE" }][{else}][{oxmultilang ident="DISCOUNT" }][{/if}] <em>[{ $oDiscount->sDiscount }]</em> :
                                                            </p>
                                                        </th>
                                                        <td class="price">
                                                            <p>
                                                                [{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]
                                                            </p>
                                                        </td>
                                                    </tr>
                                                [{/foreach}]
                                            [{/block}]

                                            [{if !$order->isNettoMode() }]
                                            [{block name="email_html_order_cust_totalnet"}]
                                                <!-- netto price -->
                                                <tr>
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="TOTAL_NET" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                    <td align="right">
                                                        <p>
                                                            [{oxprice price=$basket->getNettoSum() currency=$currency }]
                                                        </p>
                                                    </td>
                                                </tr>
                                            [{/block}]
                                            [{/if}]

                                            [{block name="email_html_order_owner_productvats"}]
                                                <!-- VATs -->
                                        [{foreach from=$basket->getProductVats(false) item=VATitem key=key}]
                                                    <tr>
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key }]
                                                            </p>
                                                        </th>
                                                        <td class="price">
                                                            <p>
                                                                [{oxprice price=$VATitem currency=$currency }]
                                                            </p>
                                                        </td>
                                                    </tr>
                                                [{/foreach}]
                                            [{/block}]

                                            [{if $order->isNettoMode() }]
                                            [{block name="email_html_order_cust_totalbrut"}]
                                                <!-- brutto price -->
                                                <tr>
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="TOTAL_GROSS" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                    <td class="price">
                                                        <p>
                                                            [{oxprice price=$basket->getBruttoSum() currency=$currency }]
                                                        </p>
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
                                                        <p>
                                                            [{oxmultilang ident="COUPON" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                    <td class="price">
                                                        <p>
                                                            [{assign var="oVoucherDiscount" value=$basket->getVoucherDiscount()}]
                                                            [{oxprice price=$oVoucherDiscount->getBruttoPrice()*-1 currency=$currency}]
                                                        </p>
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
                                                    <p>
                                                        [{oxmultilang ident="SHIPPING_NET" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                        [{oxprice price=$oDeliveryCost->getNettoPrice() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                            [{if $oDeliveryCost->getVatValue()}]
                                                <tr>
                                                    [{if $basket->isProportionalCalculationOn() }]
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                                            </p>
                                                        </th>
                                                    [{else}]
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oDeliveryCost->getVat() }]
                                                            </p>
                                                        </th>
                                                    [{/if}]
                                                    <td class="price">
                                                        <p>
                                                            [{oxprice price=$oDeliveryCost->getVatValue() currency=$currency}]
                                                        </p>
                                                    </td>
                                                </tr>
                                            [{/if}]
                                    [{else}]
                                            <tr>
                                                <th>
                                                    <p>
                                                        [{oxmultilang ident="SHIPPING_COST" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td  class="price">
                                                    <p>
                                                        [{oxprice price=$oDeliveryCost->getBruttoPrice() currency=$currency}]
                                                    </p>
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
                                                <p>
                                                    [{if $oPaymentCost->getPrice() >= 0}][{oxmultilang ident="SURCHARGE" }][{else}][{oxmultilang ident="DEDUCTION" }][{/if}] [{oxmultilang ident="PAYMENT_METHOD" suffix="COLON" }]
                                                </p>
                                            </th>
                                            <td class="price">
                                                <p>
                                                    [{oxprice price=$oPaymentCost->getNettoPrice() currency=$currency}]
                                                </p>
                                            </td>
                                        </tr>
                                        [{if $oPaymentCost->getVatValue()}]
                                            <tr>
                                                [{if $basket->isProportionalCalculationOn() }]
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                [{else}]
                                                    <th>
                                                        <p>
                                                        [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oPaymentCost->getVat()}]
                                                        </p>
                                                    </th>
                                                [{/if}]
                                                <td class="price">
                                                    <p>
                                                    [{oxprice price=$oPaymentCost->getVatValue() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                        [{/if}]
                                    [{else}]
                                        <tr>
                                            <th>
                                                <p>
                                                    [{oxmultilang ident="SURCHARGE" suffix="COLON" }]
                                                </p>
                                            </th>
                                            <td class="price">
                                                <p>
                                                    [{oxprice price=$oPaymentCost->getBruttoPrice() currency=$currency}]
                                                </p>
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
                                                    <p>
                                                        [{oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                        [{oxprice price=$trustedShopProtectionCost->getNettoPrice() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                            [{if $trustedShopProtectionCost->getVatValue()}]
                                                <tr>
                                                    [{if $basket->isProportionalCalculationOn() }]
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                                            </p>
                                                        </th>
                                                    [{else}]
                                                        <th>
                                                            <p>
                                                                [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$trustedShopProtectionCost->getVat()}]
                                                            </p>
                                                        </th>
                                                    [{/if}]
                                                    <td class="price">
                                                        <p>
                                                            [{oxprice price=$trustedShopProtectionCost->getVatValue() currency=$currency}]
                                                        </p>
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
                                                    <p>
                                                        [{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                    [{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <p>
                                                        [{oxmultilang ident="PLUS_VAT" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                        [{oxprice price=$wrappingCost->getVatValue() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                        [{else}]
                                            <tr>
                                                <th>
                                                    <p>
                                                        [{oxmultilang ident="GIFT_WRAPPING" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                        [{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency}]
                                                    </p>
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
                                                    <p>
                                                        [{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                    [{oxprice price=$giftCardCost->getNettoPrice() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                [{if $basket->isProportionalCalculationOn() }]
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]
                                                        </p>
                                                    </th>
                                                [{else}]
                                                    <th>
                                                        <p>
                                                            [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" suffix="COLON" args=$giftCardCost->getVat()}]
                                                        </p>
                                                    </th>
                                                [{/if}]
                                                <td class="price">
                                                    <p>
                                                        [{oxprice price=$giftCardCost->getVatValue() currency=$currency}]
                                                    </p>
                                                </td>
                                            </tr>
                                        [{else}]
                                            <tr>
                                                <th>
                                                    <p>
                                                        [{oxmultilang ident="GREETING_CARD" suffix="COLON" }]
                                                    </p>
                                                </th>
                                                <td class="price">
                                                    <p>
                                                        [{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]
                                                    </p>
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
                                                <p>
                                                    <b>[{oxmultilang ident="GRAND_TOTAL" suffix="COLON" }]</b>
                                                </p>
                                            </th>
                                            <td  class="price">
                                                <p>
                                                    <b>[{oxprice price=$basket->getPrice() currency=$currency}]</b>
                                                </p>
                                            </td>
                                        </tr>
                                    [{/block}]
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            [{block name="email_html_order_owner_userremark"}]
                [{if $order->oxorder__oxremark->value }]
                    <h3>
                        [{oxmultilang ident="MESSAGE" suffix="COLON" }]
                    </h3>
                    <p >
                        [{ $order->oxorder__oxremark->value|oxescape }]
                    </p>
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
                <h3>
                    [{oxmultilang ident="EMAIL_ADDRESS" suffix="COLON" }]
                </h3>
                <p >
                    [{ $user->oxuser__oxusername->value }]
                </p>
            [{/block}]

            [{block name="email_html_order_owner_address"}]
                <!-- Address info -->
                <h3>
                    [{oxmultilang ident="ADDRESS" suffix="COLON" }]
                </h3>

                <table >
                    <tr>
                        <td style="padding-right: 30px">
                            <h4>
                                [{oxmultilang ident="BILLING_ADDRESS" suffix="COLON" }]
                            </h4>
                            <p>
                                [{ assign var="company" value=$order->oxorder__oxbillcompany->value }]
                                [{ if strlen($company) > 0}][{$company}]<br>[{/if}]
                                [{ $order->oxorder__oxbillsal->value|oxmultilangsal}] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }]<br>
                                [{if $order->oxorder__oxbilladdinfo->value }][{ $order->oxorder__oxbilladdinfo->value }]<br>[{/if}]
                                [{ $order->oxorder__oxbillstreet->value }] [{ $order->oxorder__oxbillstreetnr->value }]<br>
                                [{ $order->oxorder__oxbillstateid->value }]
                                [{ $order->oxorder__oxbillzip->value }] [{ $order->oxorder__oxbillcity->value }]<br>
                                [{ $order->oxorder__oxbillcountry->value }]<br>
                                [{if $order->oxorder__oxbillustid->value}][{oxmultilang ident="VAT_ID_NUMBER" suffix="COLON" }] [{ $order->oxorder__oxbillustid->value }]<br>[{/if}]
                                [{assign var="phone" value=$order->oxorder__oxbillfon->value}]
                                [{ if strlen($phone) > 0}]
                                    [{oxmultilang ident="PHONE" suffix="COLON" }] [{ $phone }]<br>
                                [{/if}]
                            </p>
                        </td>
                        [{if $order->oxorder__oxdellname->value }]
                            <td>
                                <h4>
                                    [{oxmultilang ident="SHIPPING_ADDRESS" suffix="COLON" }]
                                </h4>
                                <p>
                                    [{ assign var="company" value=$order->oxorder__oxdelcompany->value }]
                                    [{ if strlen($company) > 0}][{$company}]<br>[{/if}]
                                    [{ $order->oxorder__oxdelsal->value|oxmultilangsal }] [{ $order->oxorder__oxdelfname->value }] [{ $order->oxorder__oxdellname->value }]<br>
                                    [{if $order->oxorder__oxdeladdinfo->value }][{ $order->oxorder__oxdeladdinfo->value }]<br>[{/if}]
                                    [{ $order->oxorder__oxdelstreet->value }] [{ $order->oxorder__oxdelstreetnr->value }]<br>
                                    [{ $order->oxorder__oxdelstateid->value }]
                                    [{ $order->oxorder__oxdelzip->value }] [{ $order->oxorder__oxdelcity->value }]<br>
                                    [{ $order->oxorder__oxdelcountry->value }]
                                </p>
                            </td>
                        [{/if}]
                    </tr>
                </table>
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
