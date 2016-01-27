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
        'oxarticle' => 'responsive_email/core/oxarticle_respemail_ext',
        'oxemail' => 'responsive_email/core/oxemail_respemail_ext',
        'oxconfig' => 'responsive_email/core/oxconfig_respemail_ext',
        'oxutilsview' => 'responsive_email/core/oxutilsview_respemail_ext',
        'oxviewconfig' => 'responsive_email/core/oxviewconfig_respemail_ext',
        ),
    'settings'     => array(
        array('group' => 'responsive_email_config', 'name' => 'showEmailRatingLinks', 'type' => 'bool',  'value' => true, 'position' => 1),
        array('group' => 'responsive_email_config', 'name' => 'disablePlainEmails', 'type' => 'bool',  'value' => false, 'position' => 2),
        ),
    'templates' => array(
        ),
);
