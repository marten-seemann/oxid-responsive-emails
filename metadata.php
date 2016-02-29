<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.1';

$aModule = array(
    'id'           => 'responsive_email',
    'title'        => 'Responsive Emails',
    'description'  => array(
      'de' => 'OXID-Emails, die auf allen Geräten gut aussehen',
      'en' => 'make OXID emails look great on all devices'
        ),
    'thumbnail'    => 'picture.png',
    'version'      => '1.0',
    'author'       => 'Marten Seemann',
    'url'          => 'https://shop.oxid-responsive.com',
    'blocks'       => array(
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
        array('group' => 'responsive_email_config', 'name' => 'respEmailLogoFileName', 'type' => 'str',  'value' => 'logo_email.png', 'position' => 3),
        array('group' => 'responsive_email_config', 'name' => 'respEmailLogoWidth', 'type' => 'str',  'value' => '250', 'position' => 4),
        ),
    'templates' => array(
        ),
);
