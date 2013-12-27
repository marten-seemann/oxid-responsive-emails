UPDATE oxcontents SET
    OXCONTENT='Folgende Artikel wurden soeben unter [{ $shop->oxshops__oxname->value }] bestellt:<br>\r\n<br>',
    OXCONTENT_1='The following products have been ordered in [{ $shop->oxshops__oxname->value }] right now:<br>\r\n<br>'
    WHERE OXLOADID='oxadminorderemail' AND OXSHOPID='oxbaseshop'
    ;