UPDATE oxcontents SET
    OXCONTENT='<h1>Anmeldung zum Newsletter</h1>\r\n\r\nHallo, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }],\r\n\r\n<br><br>\r\n\r\n<p>vielen Dank für Ihre Anmeldung zu unserem Newsletter.</p><br>\r\n\r\n<p>Um den Newsletter freizuschalten klicken Sie bitte auf folgenden Link:</p>\r\n\r\n[{include file=\"$path/button.tpl\" url=$subscribeLink text=\"jetzt freischalten\"}]\r\n<br>\r\n\r\nIhr [{ $shop->oxshops__oxname->value }] Team',
    OXCONTENT_1='<h1>Newsletter subscription</h1>\r\n\r\nHello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }],<br><br>\r\n\r\n<p>thank you for your newsletter subscription.</p><br>\r\n\r\nFor final registration, please click on this link:<br>\r\n\r\n[{include file=\"$path/button.tpl\" url=$subscribeLink text=\"register now\"}]\r\n<br>\r\n\r\nYour [{ $shop->oxshops__oxname->value }] Team<br>'
    WHERE OXLOADID='oxnewsletteremail' AND OXSHOPID='oxbaseshop'
    ;