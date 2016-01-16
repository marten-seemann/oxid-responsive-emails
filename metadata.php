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
        'oxemail' => 'responsive_email/core/oxemail_ext',
        'oxconfig' => 'responsive_email/core/oxconfig_ext',
        'oxviewconfig' => 'responsive_email/core/oxviewconfig_ext'
        ),
    'settings'     => array(
        array('group' => 'responsive_email_config', 'name' => 'showRatingLinks', 'type' => 'bool',  'value' => false, 'position' => 1),
        array('group' => 'responsive_email_config', 'name' => 'disablePlainEmails', 'type' => 'bool',  'value' => false, 'position' => 2),
        ),
    'templates' => array(
        ),
);
