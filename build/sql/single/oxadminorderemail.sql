UPDATE `oxcontents` SET `OXCONTENT`='Folgende Artikel wurden soeben unter [{ $shop->oxshops__oxname->value }] bestellt:', `OXCONTENT_1`='The following products have been ordered in [{ $shop->oxshops__oxname->value }] right now:' WHERE `OXLOADID`='oxadminorderemail' AND `OXSHOPID`='oxbaseshop';

