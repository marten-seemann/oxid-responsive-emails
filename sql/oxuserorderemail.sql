UPDATE oxcontents SET
    OXCONTENT='<h1>Vielen Dank für Ihre Bestellung!</h1>\r\n\r\nNachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.<br>\r\nBei Fragen sind wir jederzeit für Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }]!<br>\r\n<br>',
    OXCONTENT_1='<h1>Thank you for your order!</h1>\r\n\r\n<p>Below, we have listed your order.<br>\r\nIf you have any questions, don\'t hesitate to drop us an e-mail [{ $shop->oxshops__oxorderemail->value }]!</p>'
    WHERE OXLOADID='oxuserorderemail' AND OXSHOPID='oxbaseshop'
    ;