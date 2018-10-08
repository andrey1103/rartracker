(function(){
	'use strict';

	var configs = {
		STATUS_CHECK_TIMER_LIMIT_MINUTES: 60 * 24,
		SITE_URL: 'https://digitalcore.nl',
		API_BASE_URL: '/api/v1/',
		SUGGESTIONS_FORUM_ID: 4,
		DEFAULT_LANGUAGE: 'en',
		DONATIONS_CURRENCY: 'USD',
	};

	var languageSupport = [
		{ id: 'en', name: 'English' },
	];

	var userClasses = {
		EXTRA:				{id: 0, name: 'Extra'},
		ACTOR:				{id: 1, name: 'Actor'},
		MOVIE_STAR:			{id: 2, name: 'Movie star'},
		DIRECTOR:			{id: 3, name: 'Director'},
		PRODUCENT:			{id: 4, name: 'Producer'},
		UPLOADER:			{id: 6, name: 'Uploader'},
		VIP: 				{id: 7, name: 'VIP'},
		STAFF:				{id: 8, name: 'Staff'},
	};

	var categories = {
		DVDR_PAL:			{id: 1, text: 'Movies/DVDR'},
		MOVIE_SD: 			{id: 2, text: 'Movies/XviD'},
		BLURAY:			{id: 3, text: 'Movies/BluRay'},
		MOVIE_4K:			{id: 4, text: 'Movies/4K'},		
		MOVIE_720P:			{id: 5, text: 'Movies/720p'},
		MOVIE_1080P:			{id: 6, text: 'Movies/1080p'},
		TV_720P: 			{id: 8, text: 'Tv/720p'},
		TV_1080P:			{id: 9, text: 'Tv/1080p'},
        	XVID_TV:			{id: 10, text: 'Tv/XVID'},
		DVDR_TV:			{id: 11, text: 'Tv/DVDR'},
		MUSIC:				{id: 12, text: 'Music'},
		UNKNOWN:			{id: 17, text: 'Unknown'},
		APPS_0DAY:			{id: 18, text: 'Apps/0DAY'},
		PC_GAMES:			{id: 19, text: 'Games/PC'},
		PC_APPS:			{id: 20, text: 'Apps/PC'}


	};

	var cssDesigns = {
		STANDARD:			{ id: 0, text: 'Default'},
		BLUE:				{ id: 2, text: 'Default blue'},
		CUSTOM_EXTERNAL:	{ id: 1, text: 'Anpassad extern CSS'},
	};

	function AppConfig($stateProvider, $urlRouterProvider, $locationProvider, $compileProvider, $httpProvider, $translateProvider, configs) {
		$compileProvider.debugInfoEnabled(false);
		$urlRouterProvider.otherwise('/');
		$locationProvider.html5Mode(true);
		$httpProvider.useApplyAsync(true);
		$translateProvider
			.useStaticFilesLoader({
				prefix: '/locales/locale-',
				suffix: '.json'
			})
			.useSanitizeValueStrategy(null)
			.preferredLanguage(localStorage && localStorage.getItem('default-language') ? localStorage.getItem('default-language') : configs.DEFAULT_LANGUAGE);
	}

	function ResourceExtension($resource, configs) {
		/* Extending angular ngResource with PATCH (update) method */
		return function (url, params, methods) {
			var defaults = {
				update: { method: 'patch', isArray: false }
			};
			methods = angular.extend(defaults, methods);
			return $resource(configs.API_BASE_URL + url, params, methods);
		};
	}

	function AppRun($rootScope, $state) {
		// To get ui-sref-active to work on child states
		// https://github.com/angular-ui/ui-router/issues/948#issuecomment-75342784
		$rootScope.$on('$stateChangeStart', function(evt, to, params) {
			if (to.redirectTo) {
				evt.preventDefault();
				$state.go(to.redirectTo, params);
			}
		});
	}

	angular
		.module('app.shared')
		.constant('configs', configs)
		.constant('userClasses', userClasses)
		.constant('categories', categories)
		.constant('cssDesigns', cssDesigns)
		.constant('languageSupport', languageSupport)
		.config(AppConfig)
		.factory('resourceExtension', ResourceExtension)
		.run(AppRun);

})();
