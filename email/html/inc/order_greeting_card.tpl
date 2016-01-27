[{if $oViewConf->getShowGiftWrapping() && $basket->getCard() }]
    [{assign var="oCard" value=$basket->getCard() }]
        <tr>
            <td class="picture-col">
                <img src="[{$oCard->getPictureUrl()}]" alt="[{$oCard->oxwrapping__oxname->value}]">
            </td>
            <td colspan="2">
                <div class="product-title">[{oxmultilang ident="YOUR_GREETING_CARD" suffix="COLON"}]</div>
                <div class="product-details">
                    <div class="greeting-card">[{$basket->getCardMessage()}]</div>
                </div>
            </td>
        </tr>
[{/if}]
