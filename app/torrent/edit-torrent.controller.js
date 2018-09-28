(function(){
	'use strict';

	angular
		.module('app.shared')
		.controller('EditTorrentController', EditTorrentController);

	function EditTorrentController($state, $stateParams, $translate, DateService, ErrorDialog, user, MovieDataResource, categories, TorrentsResource, uploadService) {

		this.currentUser = user;
		this.categories = categories;

		TorrentsResource.Torrents.get({id: $stateParams.id}, (torrent) => {
			this.torrent = torrent;
			if (this.torrent.imdbid) {
				TorrentsResource.Related.query({id: this.torrent.imdbid}, (torrents) => {
					torrents = torrents.filter(torrent => torrent.id !== this.torrent.id);
					this.relatedTorrents = torrents;
				});
			}
		}, (error) => {
			this.notFoundMessage = error.data;
		});

		this.stripNfo = function () {
			this.torrent.descr = uploadService.stripAscii(this.torrent.descr);
	 	};

		this.updateTorrent = function () {
			TorrentsResource.Torrents.update({id: this.torrent.id}, this.torrent, () => {
				$state.go('torrent', {id: this.torrent.id, name: this.torrent.name});
			}, (error) => {
				ErrorDialog.display(error.data);
			});
		};

		this.deleteTorrent = function () {
			TorrentsResource.Torrents.remove({
				id: this.torrent.id,
				reason: this.deleteVars.reason,
				pmUploader: this.deleteVars.pmUploader,
				pmPeers: this.deleteVars.pmPeers,
				banRelease: this.deleteVars.banRelease,
				attachTorrentId: this.deleteVars.attachTorrentId,
				restoreRequest: this.deleteVars.restoreRequest,
			}, () => {
				this.notFoundMessage = $translate.instant('TORRENTS.DELETED_DONE');
			}, (error) => {
				ErrorDialog.display(error.data);
			});
		};

		this.fetchImdbInfo = function () {
	 		if (this.torrent.imdbUrl.length > 1) {
	 			this.submitDisabled = true;
	 			var imdbId = this.torrent.imdbUrl.match(/\/(tt[0-9]+)(\/|$)/)[1];
	 			MovieDataResource.Imdb.get({id: imdbId}, (imdb) => {
					this.torrent.imdbInfo = imdb['title'] + ' (' + imdb['year'] +')';
					this.torrent.imdbid = imdb['id'];
					this.submitDisabled = false;
				}, (error) => {
					this.torrent.imdbInfo = 'Error: ' + error;
					this.submitDisabled = false;
				});
	 		}
	 	};

		this.removeImdb = function () {
			this.torrent.imdbid = 0;
			this.torrent.imdbUrl = '';
			this.torrent.imdbInfo = '';
		};



	}

})();
