(function(){
	'use strict';

	angular
		.module('app.shared')
		.factory('TorrentsResource', TorrentsResource)
		.factory('ReseedRequestsResource', ReseedRequestsResource)
		.factory('CommentsResource', CommentsResource);

	function TorrentsResource(resourceExtension) {
		return {
			Torrents: 			resourceExtension('torrents/:id'),
			Related: 			resourceExtension('related-torrents/:id'),
			TorrentsMulti:		resourceExtension('torrents/:id/multi'),
			Files: 			resourceExtension('torrents/:id/files'),
			Peers: 			resourceExtension('torrents/:id/peers'),
			Snatchlog:			resourceExtension('torrents/:id/snatchlog'),
			Comments:			resourceExtension('torrents/:id/comments/:commentId', { id: '@id', commentId: '@commentId' }),
			PackFiles:			resourceExtension('torrents/:id/pack-files'),
			Multi:				resourceExtension('torrents/multi'),
		};
	}

	function ReseedRequestsResource(resourceExtension) {
		return resourceExtension('reseed-requests/:id');
	}

	function CommentsResource(resourceExtension) {
		return resourceExtension('comments/:id');
	}

})();