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

		this.saveMovTrailer = function () {
			let movId = this.getMovIdFromUrl(this.movUrl);
			if (!movId) {
				return;
			}

		MovieDataResource.Mov.update({id: this.movieData.id, trailer_id: movId}).$promise
				.then(() => {
					this.movieData.mov_id = movId;
					this.showTrailerUpload = false;
				});
		};

		this.removeTrailer = function () {
			MovieDataResource.Mov.update({id: this.movieData.id, trailer_id: ''}).$promise
				.then(() => {
					this.movieData.trailer_id = '';
					this.showTrailer = false;
				});
		};

		this.getIFrameSrc = function () {
			return $sce.trustAsResourceUrl('https://www.imdb.com/videoembed/' + this.movieData.trailer_id);
		};


		this.getMovIdFromUrl = function (url) {
			var regExp = /^.*(vi.*)/;
			var match = url.match(regExp);
			return (match && match[1].length==12) ? match[1] : false;
		};

	}

})();