(function(){
	'use strict';

	angular
		.module('app.forums')
		.controller('TopicController', TopicController);

	function TopicController($scope, $timeout, $translate, user, ForumResource, $stateParams, ErrorDialog, DeleteDialog, $state, $uibModal, authService, $anchorScroll, $location) {

		this.smilies = {
				':-)': 'smile1.gif',
				':smile:': 'smile2.gif',
				':-D': 'grin.gif',
				':lol:': 'laugh.gif',
				':w00t:': 'w00t.gif',
				':-P': 'tongue.gif',
				';-)': 'wink.gif',
				':-|': 'noexpression.gif',
				':-/': 'confused.gif',
				':-(': 'sad.gif',
				':\'-(': 'cry.gif',
				':weep:': 'weep.gif',
				':-O': 'ohmy.gif',
				':o)': 'clown.gif',
				'8-)': 'cool1.gif',
				'|-)': 'sleeping.gif',
				':innocent:': 'innocent.gif',
				':whistle:': 'whistle.gif',
				':unsure:': 'unsure.gif',
				':closedeyes:': 'closedeyes.gif',
				':cool:': 'cool2.gif',
				':fun:': 'fun.gif',
				':thumbsup:': 'thumbsup.gif',
				':thumbsdown:': 'thumbsdown.gif',
				':blush:': 'blush.gif',
				':yes:': 'yes.gif',
				':no:': 'no.gif',
				':love:': 'love.gif',
				':?:': 'question.gif',
				':!:': 'excl.gif',
				':idea:': 'idea.gif',
				':arrow:': 'arrow.gif',
				':arrow2:': 'arrow2.gif',
				':hmm:': 'hmm.gif',
				':hmmm:': 'hmmm.gif',
				':huh:': 'huh.gif',
				':geek:': 'geek.gif',
				':look:': 'look.gif',
				':rolleyes:': 'rolleyes.gif',
				':kiss:': 'kiss.gif',
				':shifty:': 'shifty.gif',
				':blink:': 'blink.gif',
				':smartass:': 'smartass.gif',
				':sick:': 'sick.gif',
				':crazy:': 'crazy.gif',
				':wacko:': 'wacko.gif',
				':alien:': 'alien.gif',
				':wizard:': 'wizard.gif',
				':wave:': 'wave.gif',
				':wavecry:': 'wavecry.gif',
				':baby:': 'baby.gif',
				':angry:': 'angry.gif',
				':ras:': 'ras.gif',
				':sly:': 'sly.gif',
				':devil:': 'devil.gif',
				':evil:': 'evil.gif',
				':evilmad:': 'evilmad.gif',
				':sneaky:': 'sneaky.gif',
				':axe:': 'axe.gif',
				':slap:': 'slap.gif',
				':wall:': 'wall.gif',
				':rant:': 'rant.gif',
				':jump:': 'jump.gif',
				':yucky:': 'yucky.gif',
				':nugget:': 'nugget.gif',
				':smart:': 'smart.gif',
				':shutup:': 'shutup.gif',
				':shutup2:': 'shutup2.gif',
				':crockett:': 'crockett.gif',
				':zorro:': 'zorro.gif',
				':snap:': 'snap.gif',
				':beer:': 'beer.gif',
				':beer2:': 'beer2.gif',
				':drunk:': 'drunk.gif',
				':strongbench:': 'strongbench.gif',
				':weakbench:': 'weakbench.gif',
				':dumbells:': 'dumbells.gif',
				':music:': 'music.gif',
				':stupid:': 'stupid.gif',
				':dots:': 'dots.gif',
				':offtopic:': 'offtopic.gif',
				':spam:': 'spam.gif',
				':oops:': 'oops.gif',
				':lttd:': 'lttd.gif',
				':please:': 'please.gif',
				':sorry:': 'sorry.gif',
				':hi:': 'hi.gif',
				':yay:': 'yay.gif',
				':cake:': 'cake.gif',
				':hbd:': 'hbd.gif',
				':band:': 'band.gif',
				':punk:': 'punk.gif',
				':rofl:': 'rofl.gif',
				':bounce:': 'bounce.gif',
				':mbounce:': 'mbounce.gif',
				':thankyou:': 'thankyou.gif',
				':gathering:': 'gathering.gif',
				':hang:': 'hang.gif',
				':chop:': 'chop.gif',
				':rip:': 'rip.gif',
				':whip:': 'whip.gif',
				':judge:': 'judge.gif',
				':chair:': 'chair.gif',
				':tease:': 'tease.gif',
				':box:': 'box.gif',
				':boxing:': 'boxing.gif',
				':guns:': 'guns.gif',
				':shoot:': 'shoot.gif',
				':shoot2:': 'shoot2.gif',
				':flowers:': 'flowers.gif',
				':wub:': 'wub.gif',
				 ':swub:': 'swub.gif',
				':lovers:': 'lovers.gif',
				':kissing:': 'kissing.gif',
				':kissing2:': 'kissing2.gif',
				':console:': 'console.gif',
				':group:': 'group.gif',
				':hump:': 'hump.gif',
				':hooray:': 'hooray.gif',
				':happy2:': 'happy2.gif',
				':clap:': 'clap.gif',
				':clap2:': 'clap2.gif',
				':weirdo:': 'weirdo.gif',
				':yawn:': 'yawn.gif',
				':bow:': 'bow.gif',
				':dawgie:': 'dawgie.gif',
				':cylon:': 'cylon.gif',
				':book:': 'book.gif',
				':fish:': 'fish.gif',
				':mama:': 'mama.gif',
				':pepsi:': 'pepsi.gif',
				':medieval:': 'medieval.gif',
				':rambo:': 'rambo.gif',
				':ninja:': 'ninja.gif',
				':hannibal:': 'hannibal.gif',
				':party:': 'party.gif',
				':snorkle:': 'snorkle.gif',
				':evo:': 'evo.gif',
				':king:': 'king.gif',
				':chef:': 'chef.gif',
				':mario:': 'mario.gif',
				':pope:': 'pope.gif',
				':fez:': 'fez.gif',
				':cap:': 'cap.gif',
				':cowboy:': 'cowboy.gif',
				':pirate:': 'pirate.gif',
				':pirate2:': 'pirate2.gif',
				':rock:': 'rock.gif',
				':cigar:': 'cigar.gif',
				':icecream:': 'icecream.gif',
				':oldtimer:': 'oldtimer.gif',
				':trampoline:': 'trampoline.gif',
				':banana:': 'bananadance.gif',
				':smurf:': 'smurf.gif',
				':yikes:': 'yikes.gif',
				':osama:': 'osama.gif',
				':saddam:': 'saddam.gif',
				':santa:': 'santa.gif',
				':indian:': 'indian.gif',
				':pimp:': 'pimp.gif',
				':nuke:': 'nuke.gif',
				':jacko:': 'jacko.gif',
				':ike:': 'ike.gif',
				':greedy:': 'greedy.gif',
				':super:': 'super.gif',
				':wolverine:': 'wolverine.gif',
				':spidey:': 'spidey.gif',
				':spider:': 'spider.gif',
				':bandana:': 'bandana.gif',
				':construction:': 'construction.gif',
				':sheep:': 'sheep.gif',
				':police:': 'police.gif',
				':detective:': 'detective.gif',
				':bike:': 'bike.gif',
				':fishing:': 'fishing.gif',
				':clover:': 'clover.gif',
				':horse:': 'horse.gif',
				':shit:': 'shit.gif',
				':soldiers:': 'soldiers.gif',
				';)': 'wink.gif',
				':wink:': 'wink.gif',
				':D': 'grin.gif',
				':P': 'tongue.gif',
				':(': 'sad.gif',
				':\'(': 'cry.gif',
				':|': 'noexpression.gif',
				'8)': 'cool1.gif',
				':Boozer:': 'alcoholic.gif',
				':deadhorse:': 'deadhorse.gif',
				':spank:': 'spank.gif',
				':yoji:': 'yoji.gif',
				':locked:': 'locked.gif',
				':grrr:': 'angry.gif',
				'O:-': 'innocent.gif',
				':sleeping:': 'sleeping.gif',
				':clown:': 'clown.gif',
				':mml:': 'mml.gif',
				':rtf:': 'rtf.gif',
				':morepics:': 'morepics.gif',
				':rb:': 'rb.gif',
				':rblocked:': 'rblocked.gif',
				':maxlocked:': 'maxlocked.gif',
				':hslocked:': 'hslocked.gif'
			};
			
		this.bbtags = {
				'[b][/b]': $translate.instant('FORUM.BB_B'),
				'[i][/i]': $translate.instant('FORUM.BB_I'),
				'[u][/u]': $translate.instant('FORUM.BB_U'),
				'[c][/c]': $translate.instant('FORUM.BB_C'),
				'[color=][/color]': $translate.instant('FORUM.BB_CT'),
				'[url][/url]': $translate.instant('FORUM.BB_URL'),
				'[img][/img]': $translate.instant('FORUM.BB_IMG'),
				'[img=]': $translate.instant('FORUM.BB_IMGG'),
				'[imgw][/imgw]': $translate.instant('FORUM.BB_IMGW'),
				'[imgw=]': $translate.instant('FORUM.BB_IMGWW'),
				'[quote][/quote]': $translate.instant('FORUM.BB_QUOTE'),
				'[quote=][/quote]': $translate.instant('FORUM.BB_QUOTEE'),
				'[spoiler][/spoiler]': $translate.instant('FORUM.BB_SPOILER'),
				'[video][/video]': $translate.instant('FORUM.BB_VIDEO'),
				'[*]': $translate.instant('FORUM.BB_LIST')
			
		};
		
		
		var firstload = true;
		this.postStatus = 0;
		this.currentUser = user;
		this.showAvatars = user['avatars'] === 'yes';
		this.itemsPerPage = user['postsperpage'] === 0 ? 15 : user['postsperpage'];
		this.currentPage = $stateParams.page;

		var isoDate = new Date(authService.getServerTime()).toISOString();
		var currentDatetime = isoDate.replace(/T/g, ' ').replace(/Z/g, '');

		this.post = {
			id: '?',
			added: currentDatetime,
			editedat: '0000-00-00 00:00:00',
			user: user
		};

		this.editObj = {
			id: null,
			text: ''
		};

		this.fetchPosts = function (scrollToLastPost, replace) {
			$state.go('.', { page: this.currentPage }, { notify: false, location: replace ? 'replace' : true });
			this.posts = null;
			var index = this.currentPage * this.itemsPerPage - this.itemsPerPage || 0;
			ForumResource.Posts.query({
				forumid: $stateParams.forumid,
				topicid: $stateParams.id,
				limit: this.itemsPerPage,
				index: index,
			}, (posts, responseHeaders) => {
				var headers = responseHeaders();
				this.totalItems = headers['x-total-count'];
				this.numberOfPages = Math.ceil(this.totalItems/this.itemsPerPage);
				this.posts = posts;
				if ($location.hash().indexOf('post') > -1) {
					$timeout(function () {
						$anchorScroll();
					}, 100);
				}
				if (firstload) {
					firstload = false;
					this.currentPage = $stateParams.page || 1;
				}
				if (scrollToLastPost) {
					if (this.currentPage != this.numberOfPages) {
						this.currentPage = this.numberOfPages;
						this.fetchPosts(true, true);
						return;
					}
					this.gotoAnchor(posts[posts.length - 1].id);
				}
			});
		};

		this.savePost = function () {
			this.closeAlert();
			this.postStatus = 1;
			ForumResource.Posts.save({
				forumid: $stateParams.forumid,
				topicid: $stateParams.id,
				body: this.post.body,
				quote: this.post.quote
			}, () => {
				this.post.body = '';
				this.postStatus = 0;
				this.post.quote = null;
				this.fetchPosts(true);
			}, (error) => {
				this.postStatus = 0;
				if (error.data) {
					this.addAlert({ type: 'danger', msg: error.data });
				} else {
					this.addAlert({ type: 'danger', msg: $translate.instant('GENERAL.ERROR_OCCURED') });
				}
			});
		};

		this.addAlert = function (obj) {
			this.alert = obj;
		};

		this.closeAlert = function() {
			this.alert = null;
		};

		this.gotoAnchor = function(x) {
			var newHash = 'post' + x;
			if ($location.hash() !== newHash) {
				$location.hash('post' + x).replace();
			} else {
				$anchorScroll();
			}
		};

		this.quotePost = function (post) {
			this.post.body = ''.concat(this.post.body || '') + '[quote=' + post.user.username + ']' + post.body.replace(/\[quote[\S\s]+?\[\/quote\]/g, '') + '\n[/quote]\n';
			this.post.quote = post.user.id;
			this.showText = 1;
			$location.hash('newPost');
			$anchorScroll();
			$timeout(function() {
				var element = document.getElementById('postText');
				if (element) {
					element.focus();
				}
			});
		};

		this.editPost = function (post) {
			this.editObj = {
				id: post.id,
				text: post.body
			};
		};

		this.abortEdit = function () {
			this.editObj = {
				id: null,
				text: ''
			};
		};

		this.saveEdit = function (post) {
			ForumResource.Posts.update({
				forumid: $stateParams.forumid,
				topicid: $stateParams.id,
				id: post.id,
				postData: this.editObj.text
			}, () => {
				this.abortEdit();
				this.fetchPosts(false);
			});
		};

		this.deletePost = function (post){
			DeleteDialog($translate.instant('FORUM.DELETE_POST'), $translate.instant('FORUM.DELETE_POST_CONFIRM'), false)
				.then(() => {
					return ForumResource.Posts.delete({
						forumid: $stateParams.forumid,
						topicid: $stateParams.id,
						id: post.id
					}).$promise;
				})
				.then(() => {
					var index = this.posts.indexOf(post);
					this.posts.splice(index, 1);
				})
				.catch((error) => {
					ErrorDialog.display(error.data);
				});
		};
		
		this.AddText = function (smilie){
			this.post.body = ''.concat(this.post.body || '') + smilie;
		};




		this.AddBBtag = function (tag){
			var element = document.getElementById('postText');
			
			var tag1, tag2;
			var tagpos;
			if(tag.indexOf('[', 1) > 0){
				tagpos = tag.indexOf(']') + 1;
				tag1 = tag.substring(0, tagpos);
				tag2 = tag.substring(tagpos, tag.length);
			}else if (tag.indexOf('=', 1) > 0){
				tagpos = tag.indexOf('=') + 1;
				tag1 = tag.substring(0, tagpos);
				tag2 = tag.substring(tagpos, tag.length);
			}else {
				tag1 = tag;
				tag2 = '';
			}
			
			if (document.selection) {
				element.focus();
				var sel = document.selection.createRange();
				sel.text = tag1 + sel.text + tag2;
				element.focus();
			} else if (element.selectionStart || element.selectionStart === 0) {
				var startPos = element.selectionStart;
				var endPos = element.selectionEnd;
				var scrollTop = element.scrollTop;
				element.value = element.value.substring(0, startPos) + tag1 + element.value.substring(startPos, endPos) + tag2 + element.value.substring(endPos, element.value.length);
				element.focus();
				element.selectionStart = startPos + tag1.length;
				element.selectionEnd = endPos + tag1.length;
				element.scrollTop = scrollTop;
			} else {
				element.value += tag;
				element.focus();
			}

			this.post.body = element.value;
		};
		
		this.AddSmiley = function (smilie){
			var element = document.getElementById('postText');
			
			if (document.selection) {
				element.focus();
				var sel = document.selection.createRange();
				sel.text = smilie;
				element.focus();
			} else if (element.selectionStart || element.selectionStart === 0) {
				var startPos = element.selectionStart;
				var endPos = element.selectionEnd;
				var scrollTop = element.scrollTop;
				element.value = element.value.substring(0, startPos) + smilie + element.value.substring(endPos, element.value.length);
				element.focus();
				element.selectionStart = startPos + smilie.length;
				element.selectionEnd = startPos + smilie.length;
				element.scrollTop = scrollTop;
			} else {
				element.value += smilie;
				element.focus();
			}

			this.post.body = element.value;

		};



		$scope.$parent.vm.activatePostView();
		this.fetchPosts($stateParams.lastpost === 1);
	}

})();