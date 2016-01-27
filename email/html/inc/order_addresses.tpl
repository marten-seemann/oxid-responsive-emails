<!-- Address info -->
<h3>[{oxmultilang ident="ADDRESS" suffix="COLON" }]</h3>

<table id="order-address" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="billing-address">
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
            <td class="shipping-address">
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
