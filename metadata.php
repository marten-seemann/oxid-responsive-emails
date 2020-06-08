<?php
/**
 * Metadata version
 */
$sMetadataVersion = '2.0';

$aModule = [
    'id'           => 'responsiveemail',
    'title'        => 'Responsive Emails',
    'description'  => [
      'de' => 'OXID-Emails, die auf allen Geräten gut aussehen',
      'en' => 'make OXID emails look great on all devices'
    ],
    'thumbnail'    => 'picture.png',
    'version'      => '2.1.1',
    'author'       => 'Marten Seemann',
    'url'          => 'https://shop.oxid-responsive.com',
    'extend' => [
        \OxidEsales\Eshop\Application\Model\Article::class => \SeemannIT\ResponsiveEmailsModule\Application\Model\Article::class,
        \OxidEsales\Eshop\Core\Email::class => \SeemannIT\ResponsiveEmailsModule\Core\Email::class,
        \OxidEsales\Eshop\Core\Config::class => \SeemannIT\ResponsiveEmailsModule\Core\Config::class,
        \OxidEsales\Eshop\Core\UtilsView::class => \SeemannIT\ResponsiveEmailsModule\Core\UtilsView::class,
        \OxidEsales\Eshop\Core\ViewConfig::class => \SeemannIT\ResponsiveEmailsModule\Core\ViewConfig::class,
    ],
    'settings'     => [
        [
            'group' => 'responsive_email_config',
            'name' => 'showEmailRatingLinks',
            'type' => 'bool',
            'value' => true,
            'position' => 1
        ],
        [
            'group' => 'responsive_email_config',
            'name' => 'disablePlainEmails',
            'type' => 'bool',
            'value' => false,
            'position' => 2
        ],
        [
            'group' => 'responsive_email_config',
            'name' => 'respEmailLogoFileName',
            'type' => 'str',
            'value' => 'logo_email.png',
            'position' => 3
        ],
        [
            'group' => 'responsive_email_config',
            'name' => 'respEmailLogoWidth',
            'type' => 'str',
            'value' => '250',
            'position' => 4
        ],
    ],
];
