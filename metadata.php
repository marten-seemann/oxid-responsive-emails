<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.1';

$aModule = array(
    'id'           => 'responsive_email',
    'title'        => 'Responsive Emails',
    'description'  => array(
        ),
    'thumbnail'    => 'picture.png',
    'version'      => '0.9',
    'author'       => 'Marten Seemann',
    'url'          => 'http://shop.oxid-module.de',
    'blocks'       => array(
        // array("template" => "layout/sidebar.tpl", "block" => "sidebar_categoriestree", "file" => "sidebar.tpl"),
        ),
    'extend' => array(
        'oxemail' => 'responsive_email/oxemail_ext',
        'oxviewconfig' => 'responsive_email/oxviewconfig_ext'
        ),
    'settings'     => array(
        ),
    'templates' => array(
        ),
);
