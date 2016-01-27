<table border="0" cellspacing="0" cellpadding="0">
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
