(function(){
	'use strict';

	angular
		.module('app.shared')
		.controller('StatisticsController', StatisticsController);

	function StatisticsController($translate, StatisticsResource, userClasses, categories, user) {

		this.currentUser = user;

		this.titles = {
			'activeUsers': $translate.instant('STATISTICS.ACTIVE_USERS'),
			'activeClients': $translate.instant('STATISTICS.ACTIVE_CLIENTS'),
			'sharedPerUser': $translate.instant('STATISTICS.SHARED_PER_USER'),
			'usersFullLeechbonus': $translate.instant('STATISTICS.USERS_FULL_LEECHBONUS'),
			'registredUsers': $translate.instant('STATISTICS.REGISTERED_USERS'),
			'totalShared': $translate.instant('STATISTICS.TOTAL_SHARED'),
			'numPeers': $translate.instant('STATISTICS.NUM_PEERS'),
			'newForumPosts': $translate.instant('STATISTICS.NEW_FORUM_POSTS'),
			'newTorrentComments': $translate.instant('STATISTICS.NEW_TORRENT_COMMENTS'),
		};

		StatisticsResource.query({}, (data) => {
			var firstItem = data[0];
			data.reverse();

			this.statsDateLabels = [];
			data.forEach((stats) => {
				this.statsDateLabels.push(stats['datum']);
			});

			/* Users per class */
			this.userClassesLabels = [
				userClasses.EXTRA.name,
				userClasses.ACTOR.name,
				userClasses.MOVIE_STAR.name,
				userClasses.DIRECTOR.name
			];
			this.userClassesData = [
				firstItem['numusersclass0'],
				firstItem['numusersclass1'],
				firstItem['numusersclass2'],
				firstItem['numusersclass3']
			];

			/* Users per class over time */
			this.userClassesLineData = [[], [], [], []];

			data.forEach((stats) => {
				this.userClassesLineData[0].push(stats['numusersclass0']);
				this.userClassesLineData[1].push(stats['numusersclass1']);
				this.userClassesLineData[2].push(stats['numusersclass2']);
				this.userClassesLineData[3].push(stats['numusersclass3']);
			});

			/* Active users over time */
			this.activeUsersData = [[]];
			data.forEach((stats) => {
				this.activeUsersData[0].push(stats['activeusers']);
			});

			/* Active users over time */
			this.activeClientsData = [[]];
			data.forEach((stats) => {
				this.activeClientsData[0].push(stats['activeclients']);
			});

			/* Shared GB per active user */
			this.userSharedData = [[]];
			data.forEach((stats) => {
				this.userSharedData[0].push(parseInt(stats['totalsharegb']/stats['activeclients'], 10));
			});

			/* Users with 100% Leech bonus */
			this.usersWith100LeechBonus = [[]];
			data.forEach((stats) => {
				this.usersWith100LeechBonus[0].push(stats['100leechbonus']);
			});

			/* Registred users */
			this.registeredUsersData = [[]];
			data.forEach((stats) => {
				this.registeredUsersData[0].push(stats['newusers']);
			});

			/* CSS themes used */
			this.cssThemesLabels = ['Standard', 'Standard Blå', 'SweBits'];
			this.cssThemesData = [
				firstItem['userdesign0'],
				firstItem['userdesign2'],
				firstItem['userdesign3']
			];

			/* Torrents per category */
			this.torrentsPerCategoryLabels = [
				categories.DVDR_PAL.text,
				categories.MOVIE_SD.text,
				categories.BLURAY.text,
				categories.MOVIE_4K.text,
				categories.MOVIE_720P.text,
				categories.MOVIE_1080P.text,
				categories.TV_720P.text,
				categories.TV_1080P.text,
				categories.XVID_TV.text,
				categories.DVDR_TV.text,
categories.PC_APPS.text,
categories.PC_GAMES.text,
categories.APPS_0DAY.text,
categories.UNKNOWN.text				
			];
			this.torrentsPerCategoryData = [
				firstItem['cat1torrents'],
				firstItem['cat2torrents'],
				firstItem['cat3torrents'],
				firstItem['cat4torrents'],
				firstItem['cat5torrents'],
				firstItem['cat6torrents'],
				firstItem['cat7torrents'],
				firstItem['cat8torrents'],
				firstItem['cat9torrents'],
				firstItem['cat10torrents'],
firstItem['cat11torrents'],
firstItem['cat12torrents'],
firstItem['cat13torrents'],
firstItem['cat14torrents'],
firstItem['cat15torrents'],
firstItem['cat16torrents'],
firstItem['cat17torrents'],
firstItem['cat18torrents'],
firstItem['cat19torrents'],
firstItem['cat20torrents'],
firstItem['cat21torrents'],
firstItem['cat22torrents']
			];

			/* Torrents per category over time */
			this.torrentsPerCategoryLineData = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []];

			data.forEach((stats) => {
				this.torrentsPerCategoryLineData[0].push(stats['cat1torrents']);
				this.torrentsPerCategoryLineData[1].push(stats['cat2torrents']);
				this.torrentsPerCategoryLineData[2].push(stats['cat3torrents']);
				this.torrentsPerCategoryLineData[3].push(stats['cat4torrents']);
				this.torrentsPerCategoryLineData[4].push(stats['cat5torrents']);
				this.torrentsPerCategoryLineData[5].push(stats['cat6torrents']);
				this.torrentsPerCategoryLineData[6].push(stats['cat7torrents']);
				this.torrentsPerCategoryLineData[7].push(stats['cat8torrents']);
				this.torrentsPerCategoryLineData[8].push(stats['cat9torrents']);
				this.torrentsPerCategoryLineData[9].push(stats['cat10torrents']);
this.torrentsPerCategoryLineData[10].push(stats['cat11torrents']);
this.torrentsPerCategoryLineData[11].push(stats['cat12torrents']);
this.torrentsPerCategoryLineData[12].push(stats['cat13torrents']);
this.torrentsPerCategoryLineData[13].push(stats['cat14torrents']);
this.torrentsPerCategoryLineData[14].push(stats['cat15torrents']);
this.torrentsPerCategoryLineData[15].push(stats['cat16torrents']);
this.torrentsPerCategoryLineData[16].push(stats['cat17torrents']);
this.torrentsPerCategoryLineData[17].push(stats['cat18torrents']);
this.torrentsPerCategoryLineData[18].push(stats['cat19torrents']);
this.torrentsPerCategoryLineData[19].push(stats['cat20torrents']);
this.torrentsPerCategoryLineData[20].push(stats['cat21torrents']);
this.torrentsPerCategoryLineData[21].push(stats['cat22torrents']);
			});

			/* Amount shared data */
			this.totalSharedData = [[]];
			data.forEach((stats) => {
				this.totalSharedData[0].push(parseInt(stats['totalsharegb']/1000, 10));
			});

			/* Peers amount */
			this.totalPeersData = [[]];
			data.forEach((stats) => {
				this.totalPeersData[0].push(stats['seeders']+stats['leechers']);
			});

			/* New forum posts */
			this.forumPostsData = [[]];
			data.forEach((stats) => {
				this.forumPostsData[0].push(stats['newforumposts']);
			});

			/* New torrent comments */
			this.torrentCommentsData = [[]];
			data.forEach((stats) => {
				this.torrentCommentsData[0].push(stats['newcomments']);
			});

			this.dataLoaded = true;
		});

	}

})();
