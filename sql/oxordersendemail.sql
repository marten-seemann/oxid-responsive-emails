UPDATE oxcontents SET
    OXCONTENT='<h1>Versandbestätigung</h1>\r\n\r\nGuten Tag, [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }],<br>\r\n<br>\r\nunser Vertriebszentrum hat soeben folgende Artikel versandt.<br>\r\n<br>',
    OXCONTENT_1='<h1>Shipping notification</h1>\r\n\r\nHello [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }],\r\n\r\n<p>our distribution center just shipped this product:</p><br />'
    WHERE OXLOADID='oxordersendemail' AND OXSHOPID='oxbaseshop'
    ;