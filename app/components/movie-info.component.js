(function(){
	'use strict';

	angular
		.module('app.shared')
		.component('movieInfo', {
			bindings: {
				movieData: '<',
				trailer: '@',
			},
			templateUrl: '../app/components/movie-info.component.template.html',
			controller: MovieInfoController,
			controllerAs: 'vm'
		});

	function MovieInfoController(MovieDataResource, $state, authService, $sce) {

		this.refreshMovieData = function () {
			this.updatingMovieData = true;
			MovieDataResource.Refresh.get({id: this.movieData.id}).$promise
				.then(() => {
					$state.reload();
				});
		};

		this.currentUser = authService.getUser();

		this.saveYoutubeTrailer = function () {
			let youtubeId = this.getYoutubeIdFromUrl(this.youtubeUrl);
			if (!youtubeId) {
				return;
			}

			MovieDataResource.Youtube.update({id: this.movieData.id, trailer: youtubeId}).$promise
				.then(() => {
					this.movieData.trailer = youtubeId;
					this.showTrailerUpload = false;
				});
		};

		this.removeTrailer = function () {
			MovieDataResource.Youtube.update({id: this.movieData.id, trailer: ''}).$promise
				.then(() => {
					this.movieData.trailer = '';
					this.showTrailer = false;
				});
		};

		this.getIFrameSrc = function () {
			return $sce.trustAsResourceUrl('https://www.imdb.com/videoembed/' + this.movieData.trailer);
		};



		this.getYoutubeIdFromUrl = function (url) {
			var regExp = /^.*(vi.*)/;
			var match = url.match(regExp);
			return (match && match[1].length==12) ? match[1] : false;
		};

	}

})();
