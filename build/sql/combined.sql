UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('466F6C67656E646520417274696B656C2077757264656E20736F6562656E20756E746572205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D2062657374656C6C743A'),
    `OXCONTENT_1`=UNHEX('54686520666F6C6C6F77696E672070726F64756374732068617665206265656E206F72646572656420696E205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D207269676874206E6F773A')
     WHERE `OXLOADID`='oxadminorderemail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C7374726F6E6720636C6173733D277761726E696E67273E48696E776569733A3C2F7374726F6E673E204465727A65697420697374206B65696E65204C69656665726D6574686F64652066C3BC7220646965736573204C616E642062656B616E6E742E204269747465204C69656665726DC3B6676C6963686B656974656E2073756368656E20756E642064656E2042657374656C6C657220756E74657220416E6761626520646572203C7374726F6E673E4C69656665726B6F7374656E3C2F7374726F6E673E20696E666F726D696572656E210D0A3C62723E3C62723E0D0A0D0A466F6C67656E646520417274696B656C2077757264656E20736F6562656E20756E746572205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D2062657374656C6C743A'),
    `OXCONTENT_1`=UNHEX('3C7374726F6E6720636C6173733D277761726E696E67273E496E666F726D6174696F6E3A3C2F7374726F6E673E2043757272656E746C792C207468657265206973206E6F207368697070696E67206D6574686F6420646566696E656420666F72207468697320636F756E7472792E20506C656173652066696E6420612064656C6976657279206F7074696F6E20616E6420696E666F726D2074686520637573746F6D65722061626F757420746865203C7374726F6E673E7368697070696E6720636F7374733C2F7374726F6E673E2E0D0A3C62723E3C62723E0D0A0D0A54686520666F6C6C6F77696E672070726F64756374732068617665206265656E206F726465726564206F6E205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D3A')
     WHERE `OXLOADID`='oxadminordernpemail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E416E6D656C64756E67207A756D204E6577736C65747465723C2F68313E0D0A0D0A48616C6C6F205B7B2024757365722D3E6F78757365725F5F6F7873616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B2024757365722D3E6F78757365725F5F6F78666E616D652D3E76616C7565207D5D205B7B2024757365722D3E6F78757365725F5F6F786C6E616D652D3E76616C7565207D5D2C0D0A0D0A3C62723E3C62723E0D0A0D0A3C703E7669656C656E2044616E6B2066C3BC72204968726520416E6D656C64756E67207A7520756E736572656D204E6577736C65747465722E3C2F703E3C62723E0D0A0D0A3C703E556D2064656E204E6577736C657474657220667265697A75736368616C74656E206B6C69636B656E205369652062697474652061756620666F6C67656E64656E204C696E6B3A3C2F703E0D0A5B7B696E636C7564652066696C653D246F56696577436F6E662D3E67657454656D706C617465506174682822696E632F627574746F6E2E74706C22292075726C3D247375627363726962654C696E6B20746578743D226A65747A742066726569736368616C74656E227D5D0D0A3C62723E0D0A0D0A496872205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D205465616D'),
    `OXCONTENT_1`=UNHEX('3C68313E4E6577736C657474657220737562736372697074696F6E3C2F68313E0D0A0D0A48656C6C6F205B7B2024757365722D3E6F78757365725F5F6F7873616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B2024757365722D3E6F78757365725F5F6F78666E616D652D3E76616C7565207D5D205B7B2024757365722D3E6F78757365725F5F6F786C6E616D652D3E76616C7565207D5D2C0D0A0D0A3C62723E3C62723E0D0A0D0A3C703E7468616E6B20796F7520666F7220796F7572206E6577736C657474657220737562736372697074696F6E2E3C2F703E3C62723E0D0A0D0A3C703E466F722066696E616C20726567697374726174696F6E2C20706C6561736520636C69636B206F6E2074686973206C696E6B3A3C2F703E0D0A5B7B696E636C7564652066696C653D246F56696577436F6E662D3E67657454656D706C617465506174682822696E632F627574746F6E2E74706C22292075726C3D247375627363726962654C696E6B20746578743D227265676973746572206E6F77227D5D0D0A3C62723E0D0A0D0A596F7572205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D205465616D')
     WHERE `OXLOADID`='oxnewsletteremail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E56657273616E6462657374C3A4746967756E673C2F68313E0D0A0D0A477574656E205461672C205B7B20246F726465722D3E6F786F726465725F5F6F7862696C6C73616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B20246F726465722D3E6F786F726465725F5F6F7862696C6C666E616D652D3E76616C7565207D5D205B7B20246F726465722D3E6F786F726465725F5F6F7862696C6C6C6E616D652D3E76616C7565207D5D2C0D0A3C62723E3C62723E0D0A0D0A3C703E756E736572205665727472696562737A656E7472756D2068617420736F6562656E20666F6C67656E646520417274696B656C2076657273616E64742E3C2F703E'),
    `OXCONTENT_1`=UNHEX('3C68313E5368697070696E67206E6F74696669636174696F6E3C2F68313E0D0A0D0A48656C6C6F205B7B20246F726465722D3E6F786F726465725F5F6F7862696C6C73616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B20246F726465722D3E6F786F726465725F5F6F7862696C6C666E616D652D3E76616C7565207D5D205B7B20246F726465722D3E6F786F726465725F5F6F7862696C6C6C6E616D652D3E76616C7565207D5D2C0D0A3C62723E3C62723E0D0A0D0A3C703E6F757220646973747269627574696F6E2063656E746572206A757374207368697070656420746869732070726F647563743A3C2F703E')
     WHERE `OXLOADID`='oxordersendemail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E5072656973616C61726D3C2F68313E0D0A0D0A5072656973616C61726D20696D205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D210D0A3C62723E3C62723E0D0A0D0A3C703E5B7B2024656D61696C207D5D206269657465742066C3BC7220417274696B656C203C7374726F6E673E5B7B202470726F647563742D3E6F7861727469636C65735F5F6F787469746C652D3E76616C7565207D5D3C2F7374726F6E673E2C204172746E756D2E205B7B202470726F647563742D3E6F7861727469636C65735F5F6F786172746E756D2D3E76616C7565207D5D3C2F703E0D0A3C62723E0D0A0D0A4F726967696E616C70726569733A205B7B202470726F647563742D3E6765744650726963652829207D5D205B7B202463757272656E63792D3E6E616D657D5D3C62723E0D0A4745424F54454E3A205B7B20246269647072696365207D5D205B7B202463757272656E63792D3E6E616D657D5D3C62723E0D0A3C62723E0D0A3C62723E0D0A4968722053686F702E3C62723E'),
    `OXCONTENT_1`=UNHEX('3C68313E507269636520616C6572743C2F68313E0D0A0D0A507269636520616C657274206174205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D210D0A3C62723E3C62723E0D0A0D0A3C703E5B7B2024656D61696C207D5D206269647320666F722070726F64756374203C7374726F6E673E5B7B202470726F647563742D3E6F7861727469636C65735F5F6F787469746C652D3E76616C7565207D5D3C2F7374726F6E673E2C2070726F647563742023205B7B202470726F647563742D3E6F7861727469636C65735F5F6F786172746E756D2D3E76616C7565207D5D3C2F703E0D0A3C62723E0D0A0D0A4F726967696E616C2070726963653A205B7B202463757272656E63792D3E6E616D657D5D5B7B202470726F647563742D3E6765744650726963652829207D5D3C62723E0D0A4269643A205B7B202463757272656E63792D3E6E616D657D5D5B7B20246269647072696365207D5D3C62723E0D0A3C62723E0D0A3C62723E0D0A596F75722073746F72653C62723E')
     WHERE `OXLOADID`='oxpricealarmemail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E44616E6B652066C3BC7220496872652052656769737472696572756E673C2F68313E0D0A0D0A48616C6C6F205B7B2024757365722D3E6F78757365725F5F6F7873616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B2024757365722D3E6F78757365725F5F6F78666E616D652D3E76616C7565207D5D205B7B2024757365722D3E6F78757365725F5F6F786C6E616D652D3E76616C7565207D5D2C200D0A3C62723E3C62723E0D0A0D0A3C703E7669656C656E2044616E6B2066C3BC7220496872652052656769737472696572756E6720626569205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D213C2F703E0D0A3C703E536965206BC3B66E6E656E207369636820616220736F666F72742061756368206D6974204968726572204B756E64656E6E756D6D6572203C7374726F6E673E5B7B2024757365722D3E6F78757365725F5F6F78637573746E722D3E76616C7565207D5D3C2F7374726F6E673E2065696E6C6F6767656E2E3C2F703E0D0A0D0A3C62723E0D0A496872205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D205465616D'),
    `OXCONTENT_1`=UNHEX('3C68313E5468616E6B20796F7520666F7220796F757220726567697374726174696F6E3C2F68313E0D0A0D0A48656C6C6F205B7B2024757365722D3E6F78757365725F5F6F7873616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B2024757365722D3E6F78757365725F5F6F78666E616D652D3E76616C7565207D5D205B7B2024757365722D3E6F78757365725F5F6F786C6E616D652D3E76616C7565207D5D2C0D0A3C62723E3C62723E0D0A0D0A3C703E7468616E6B20796F7520666F7220796F757220726567697374726174696F6E206174205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D213C2F703E0D0A3C703E46726F6D206E6F77206F6E2C20796F752063616E206C6F6720696E207769746820796F757220637573746F6D6572206E756D626572203C7374726F6E673E5B7B2024757365722D3E6F78757365725F5F6F78637573746E722D3E76616C7565207D5D3C2F7374726F6E673E2E3C2F703E0D0A3C62723E0D0A596F7572205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D207465616D3C62723E')
     WHERE `OXLOADID`='oxregisteremail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E486162656E20536965204968722050617373776F72742076657267657373656E3F3C2F68313E0D0A0D0A48616C6C6F205B7B2024757365722D3E6F78757365725F5F6F7873616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B2024757365722D3E6F78757365725F5F6F78666E616D652D3E76616C7565207D5D205B7B2024757365722D3E6F78757365725F5F6F786C6E616D652D3E76616C7565207D5D2C0D0A3C62723E3C62723E0D0A0D0A3C703EC3B666666E656E205369652064656E20666F6C67656E64656E204C696E6B2C20756D2065696E206E657565732050617373776F72742066C3BC72205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D2065696E7A757269636874656E3A3C2F703E0D0A0D0A5B7B696E636C7564652066696C653D246F56696577436F6E662D3E67657454656D706C617465506174682822696E632F627574746F6E2E74706C22292075726C3D246F56696577436F6E662D3E6765744261736544697228297C6361743A27696E6465782E7068703F636C3D666F72676F74707764267569643D277C6361743A24757365722D3E676574557064617465496428297C6361743A2726616D703B6C616E673D277C6361743A246F56696577436F6E662D3E6765744163744C616E6775616765496428297C6361743A27267368703D277C6361743A2473686F702D3E6F7873686F70735F5F6F7869642D3E76616C756520746578743D276E657565732050617373776F7274277D5D0D0A0D0A3C703E44696573656E204C696E6B206BC3B66E6E656E2053696520696E6E657268616C6220646572206EC3A463687374656E205B7B2024757365722D3E6765745570646174654C696E6B5465726D28292F33363030207D5D205374756E64656E20617566727566656E2E3C2F703E0D0A0D0A3C62723E0D0A496872205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D205465616D'),
    `OXCONTENT_1`=UNHEX('3C68313E44696420796F7520666F7267657420796F75722070617373776F72643F3C2F68313E0D0A0D0A48656C6C6F205B7B2024757365722D3E6F78757365725F5F6F7873616C2D3E76616C75657C6F786D756C74696C616E6773616C207D5D205B7B2024757365722D3E6F78757365725F5F6F78666E616D652D3E76616C7565207D5D205B7B2024757365722D3E6F78757365725F5F6F786C6E616D652D3E76616C7565207D5D2C0D0A3C62723E3C62723E0D0A0D0A3C703E666F6C6C6F772074686973206C696E6B20746F2067656E65726174652061206E65772070617373776F726420666F72205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D3A3C2F703E0D0A0D0A5B7B696E636C7564652066696C653D246F56696577436F6E662D3E67657454656D706C617465506174682822696E632F627574746F6E2E74706C22292075726C3D246F56696577436F6E662D3E6765744261736544697228297C6361743A27696E6465782E7068703F636C3D666F72676F74707764267569643D277C6361743A24757365722D3E676574557064617465496428297C6361743A2726616D703B6C616E673D277C6361743A246F56696577436F6E662D3E6765744163744C616E6775616765496428297C6361743A27267368703D277C6361743A2473686F702D3E6F7873686F70735F5F6F7869642D3E76616C756520746578743D276E65772070617373776F7264277D5D0D0A0D0A3C703E596F752063616E207573652074686973206C696E6B2077697468696E20746865206E657874205B7B2024757365722D3E6765745570646174654C696E6B5465726D28292F33363030207D5D20686F7572732E3C2F703E0D0A0D0A3C62723E0D0A596F7572205B7B202473686F702D3E6F7873686F70735F5F6F786E616D652D3E76616C7565207D5D207465616D')
     WHERE `OXLOADID`='oxupdatepassinfoemail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E5669656C656E2044616E6B2066C3BC7220496872652042657374656C6C756E67213C2F68313E0D0A0D0A3C703E4E616368666F6C67656E6420686162656E20776972207A7572204B6F6E74726F6C6C6520496872652042657374656C6C756E67206E6F63682065696E6D616C2061756667656C69737465742E3C2F703E0D0A0D0A3C703E4265692046726167656E2073696E6420776972206A656465727A6569742066C3BC72205369652064613A2053636872656962656E205369652065696E6661636820616E205B7B202473686F702D3E6F7873686F70735F5F6F786F72646572656D61696C2D3E76616C7565207D5D213C2F703E'),
    `OXCONTENT_1`=UNHEX('3C68313E5468616E6B20796F7520666F7220796F7572206F72646572213C2F68313E0D0A0D0A3C703E42656C6F772C2077652068617665206C697374656420796F7572206F726465722E3C2F703E0D0A0D0A3C703E496620796F75206861766520616E79207175657374696F6E732C20646F6E277420686573697461746520746F2064726F7020757320616E20652D6D61696C205B7B202473686F702D3E6F7873686F70735F5F6F786F72646572656D61696C2D3E76616C7565207D5D213C2F703E')
     WHERE `OXLOADID`='oxuserorderemail' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C703E46C3BC67656E20536965206869657220496872652057696465727275667362656C656872756E672065696E2E3C2F703E'),
    `OXCONTENT_1`=UNHEX('3C703E526967687420746F205769746864726177616C2063616E20626520696E73657274656420686572652E3C2F703E')
     WHERE `OXLOADID`='oxuserorderemailend' AND `OXSHOPID`='oxbaseshop';

UPDATE `oxcontents` SET
    `OXCONTENT`=UNHEX('3C68313E5669656C656E2044616E6B2066C3BC7220496872652042657374656C6C756E67213C2F68313E0D0A0D0A3C703E3C7374726F6E673E48696E776569733A3C2F7374726F6E673E204465727A6569742069737420756E73206B65696E652056657273616E646D6574686F64652066C3BC7220646965736573204C616E642062656B616E6E742E205769722077657264656E2076657273756368656E2C2056657273616E646D6574686F64656E207A752066696E64656E20756E642053696520C3BC626572206461732045726765626E697320756E74657220416E67616265206465722056657273616E646B6F7374656E20696E666F726D696572656E2E3C2F703E3C62723E0D0A0D0A3C703E4265692046726167656E2073696E6420776972206A656465727A6569742066C3BC72205369652064613A2053636872656962656E205369652065696E6661636820616E205B7B202473686F702D3E6F7873686F70735F5F6F786F72646572656D61696C2D3E76616C7565207D5D213C2F703E'),
    `OXCONTENT_1`=UNHEX('3C68313E5468616E6B20796F7520666F7220796F7572206F72646572213C2F68313E0D0A0D0A3C703E3C7374726F6E673E496E666F726D6174696F6E3A3C2F7374726F6E673E2043757272656E746C792C207468657265206973206E6F207368697070696E67206D6574686F6420646566696E656420666F7220796F757220636F756E7472792E2057652077696C6C2066696E642061206D6574686F6420746F2064656C697665722074686520676F6F647320796F752070757263686173656420616E642077696C6C20696E666F726D20796F7520617320736F6F6E20617320706F737369626C652E0D0A3C2F703E0D0A0D0A3C703E496620796F75206861766520616E792072657175657374732C20646F6E277420686573697461746520746F20636F6E7461637420757321205B7B202473686F702D3E6F7873686F70735F5F6F786F72646572656D61696C2D3E76616C7565207D5D3C2F703E')
     WHERE `OXLOADID`='oxuserordernpemail' AND `OXSHOPID`='oxbaseshop';

