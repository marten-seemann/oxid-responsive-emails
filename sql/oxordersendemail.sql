UPDATE oxcontents SET
    OXCONTENT='<h1>Versandbestätigung</h1>\r\n\r\nGuten Tag, [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }],\r\n\r\n<p>unser Vertriebszentrum hat soeben folgende Artikel versandt.</p>',
    OXCONTENT_1='<h1>Shipping notification</h1>\r\n\r\nHello [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }],\r\n\r\n<p>our distribution center just shipped this product:</p>'
    WHERE OXLOADID='oxordersendemail' AND OXSHOPID='oxbaseshop'
    ;