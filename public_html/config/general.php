<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\helpers\App;

return [
	// Global settings
	'*' => [
		// Default Week Start Day (0 = Sunday, 1 = Monday...)
		'defaultWeekStartDay' => 1,

		// Whether generated URLs should omit "index.php"
		'omitScriptNameInUrls' => true,

		// Control Panel trigger word
		'cpTrigger' => 'admin',

		// The secure key Craft will use for hashing and encrypting data
		'securityKey' => App::env('SECURITY_KEY'),

		// The prefix that should be prepended to HTTP error status codes when determining the path to look for an error’s template.
		'errorTemplatePrefix' => "_errors/",

		// Adjustments to make Craft play nice with MAMP's MySQL
		'backupCommand' => getenv('BACKUP_COMMAND'),
		'restoreCommand' => getenv('RESTORE_COMMAND'),

		// Enables partial term search in admin search bar
		'defaultSearchTermOptions' => array(
			'subLeft' => true,
			'subRight' => true,
		),

		// Whether template caching via the {% cache %} tag should be enabled. If using Blitz set it to false as Craft's cache tag can cause conflicts.
		'enableTemplateCaching' => false,

		'siteName' => getenv('SYSTEM_NAME'),

		'sendPoweredByHeader' => false,

	],

	// Dev environment settings
	'dev' => [
		// Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
		'devMode' => true,
	],

	// Staging environment settings
	'staging' => [
	],

	// Production environment settings
	'production' => [
		'allowUpdates' => false,
	],
];
