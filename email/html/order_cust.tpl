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
                        <p>
                            [{assign var="amount" value=$basketitem->getAmount()}]
                            [{if $amount > 1}]<b>[{$amount}]x</b>&nbsp;[{/if}]
                            [{$basketitem->getTitle()}]

                            <div class="product-details">
                                <p>[{oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{ $basketproduct->oxarticles__oxartnum->value }]</p>
                                [{if $basketitem->getChosenSelList() }]
                                    <ul>
                                        [{foreach from=$basketitem->getChosenSelList() item=oList}]
                                            <li>[{ $oList->name }] [{ $oList->value }]</li>
                                        [{/foreach}]
                                    </ul>
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
                                            [{oxmultilang ident="GIFT_WRAPPING" suffix="COLON"}]
                                            [{if !$basketitem->getWrappingId() }]
                                                [{oxmultilang ident="NONE" }]
                                            [{else}]
                                                [{$oWrapping->oxwrapping__oxname->value}]
                                            [{/if}]
                                        </p>
                                    [{/if}]
                                [{/if}]

                                [{if $showReviewLink && $blShowReviewLink}]
                                    <a href="[{ $oConf->getShopURL() }]index.php?shp=[{$shop->oxshops__oxid->value}]&amp;anid=[{$basketitem->getProductId()}]&amp;cl=review&amp;reviewuserhash=[{$user->getReviewUserHash($user->getId())}]" target="_blank" class="review-link">[{oxmultilang ident="REVIEW" }]</a>
                                [{/if}]
                            </div>
                        </p>
                    </td>

                    <td class="price">
                        <b>[{oxprice price=$basketitem->getPrice() currency=$currency}]</b>
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

    <br>

    <table id="vouchers" border="0" cellpadding="0" cellspacing="0" >
        <tr>
            <td>
                [{block name="email_html_order_cust_voucherdiscount_top"}]
                    <table border="0" cellpadding="0" cellspacing="0" >
                        [{if $oViewConf->getShowVouchers() && $basket->getVoucherDiscValue() }]
                            <tr>
                                <td>
                                    <b>[{oxmultilang ident="USED_COUPONS_2" }]</b>
                                </td>
                                <td>
                                    <b>[{oxmultilang ident="REBATE" }]</b>
                                </td>
                            </tr>
                            [{foreach from=$order->getVoucherList() item=voucher}]
                                [{assign var="voucherseries" value=$voucher->getSerie() }]
                                <tr>
                                    <td>
                                        [{$voucher->oxvouchers__oxvouchernr->value}]
                                    </td>
                                    <td>
                                        [{$voucherseries->oxvoucherseries__oxdiscount->value}] [{if $voucherseries->oxvoucherseries__oxdiscounttype->value == "absolute"}][{ $currency->sign}][{else}]%[{/if}]
                                    </td>
                                </tr>
                            [{/foreach}]
                        [{/if}]
                    </table>
                [{/block}]
            </td>
        </tr>
    </table>

    <table border="0" cellpadding="0" cellspacing="0" >
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
            <h3>
                [{oxmultilang ident="WHAT_I_WANTED_TO_SAY" }]
            </h3>
            <p>
                [{ $order->oxorder__oxremark->value|oxescape }]
            </p>
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
        <h3>
            [{oxmultilang ident="EMAIL_ADDRESS" suffix="COLON" }]
        </h3>
        <p>
             [{ $user->oxuser__oxusername->value }]
        </p>
    [{/block}]

    [{block name="email_html_order_cust_address"}]
        <!-- Address info -->
        <h3>
            [{oxmultilang ident="ADDRESS" suffix="COLON" }]
        </h3>

        <table id="order-address" border="0" cellpadding="0" cellspacing="0" >
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
