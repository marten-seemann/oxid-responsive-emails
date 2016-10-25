<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>[{$title}]</title>
    <style>
        [{* prevent iOS from highlighting addresses *}]
        .appleLinksBlack a {
            color: #000000 !important;
            text-decoration: none;
        }
        @media only screen and (max-width: 640px) {
            .container {
                width: 100% !important;
            }
        }
    </style>
</head>

<body bgcolor="#f6f6f6">
[{$oViewConf->setForceRetina(true)}]
[{$oViewConf->setForceDevice('desktop')}]
<table class="body-wrap" bgcolor="#f6f6f6" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td></td>
        <td class="container" bgcolor="#FFFFFF" width="600">
            <div class="content">
            <table>
                <tr>
                    <td>
                        <div class="logo">
                            [{assign var="logo" value=$oViewConf->getResponsiveEmailConfig("respEmailLogoFileName")}]
                            [{assign var="logoWidth" value=$oViewConf->getResponsiveEmailConfig("respEmailLogoWidth")}]
                            <img src="[{$oViewConf->getImageUrl($logo, false)}]" border="0" hspace="0" vspace="0" alt="[{ $shop->oxshops__oxname->value }]" align="texttop" width="[{$logoWidth}]" style="width: auto; max-width: [{$logoWidth}]px;">
                        </div>
