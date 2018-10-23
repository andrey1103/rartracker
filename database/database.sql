SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_text` text NOT NULL,
  `added` datetime DEFAULT NULL,
  `txt` text DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `added` (`added`),
  FULLTEXT KEY `search_text` (`search_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `banned`;
CREATE TABLE `banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(250) NOT NULL,
  `owner` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namn` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `bevaka`;
CREATE TABLE `bevaka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `imdbid` int(11) NOT NULL,
  `typ` tinyint(4) NOT NULL,
  `format` varchar(10) NOT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`imdbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `blockid` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userfriend` (`userid`,`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `bonuslog`;
CREATE TABLE `bonuslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `veckobonus` int(11) NOT NULL DEFAULT 0,
  `msg` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `userid_2` (`userid`,`veckobonus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `torrentid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `cheatlog`;
CREATE TABLE `cheatlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `torrentid` int(10) NOT NULL DEFAULT 0,
  `torrentname` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `port` smallint(5) NOT NULL DEFAULT 0,
  `uploaded` bigint(20) NOT NULL DEFAULT 0,
  `downloaded` bigint(20) NOT NULL DEFAULT 0,
  `rate` bigint(20) NOT NULL DEFAULT 0,
  `seeder` enum('yes','no') NOT NULL DEFAULT 'yes',
  `connectable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `userid` int(10) NOT NULL DEFAULT 0,
  `username` varchar(40) NOT NULL DEFAULT '',
  `agent` varchar(60) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT 0,
  `datum` datetime NOT NULL,
  `agentdiff` int(1) NOT NULL DEFAULT 0,
  `adsl` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `uploaded` (`uploaded`),
  KEY `downloaded` (`downloaded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL DEFAULT 0,
  `torrent` int(10) unsigned NOT NULL DEFAULT 0,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text NOT NULL,
  `ori_text` text NOT NULL,
  `editedby` int(10) unsigned NOT NULL DEFAULT 0,
  `editedat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `torrent` (`torrent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customindex`;
CREATE TABLE `customindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `typ` int(11) NOT NULL,
  `format` int(11) NOT NULL,
  `sektion` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `genre` varchar(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `donated`;
CREATE TABLE `donated` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `msg` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL DEFAULT 0,
  `nostar` tinyint(4) NOT NULL DEFAULT 0,
  `sum` varchar(250) NOT NULL,
  `typ` int(11) NOT NULL,
  `kod` varchar(250) DEFAULT NULL,
  `vem` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `emaillog`;
CREATE TABLE `emaillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `datum` date NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` set('categ','item') NOT NULL DEFAULT 'item',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `categ` int(10) NOT NULL DEFAULT 0,
  `order` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrent` int(10) unsigned NOT NULL DEFAULT 0,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `torrent` (`torrent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `forumheads`;
CREATE TABLE `forumheads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `minclassread` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `sort` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forumhead` tinyint(4) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  `minclassread` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `minclasswrite` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `postcount` int(10) unsigned NOT NULL DEFAULT 0,
  `topiccount` int(10) unsigned NOT NULL DEFAULT 0,
  `minclasscreate` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `friendid` int(10) unsigned NOT NULL DEFAULT 0,
  `kom` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userfriend` (`userid`,`friendid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `imdbinfo`;
CREATE TABLE `imdbinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imdbid` varchar(10) NOT NULL,
  `title` text NOT NULL,
  `year` int(11) NOT NULL,
  `rating` double NOT NULL,
  `tagline` tinytext NOT NULL,
  `genres` varchar(250) NOT NULL,
  `photo` tinyint(4) NOT NULL,
  `director` varchar(200) NOT NULL,
  `writer` varchar(200) NOT NULL,
  `cast` tinytext NOT NULL,
  `runtime` int(11) NOT NULL,
  `seasoncount` int(11) NOT NULL,
  `mz_ingress` text NOT NULL,
  `mz_body` longtext NOT NULL,
  `releaseNameStart` varchar(100) NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `trailer_id` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imdbid` (`imdbid`),
  KEY `releaseNameStart` (`releaseNameStart`),
  KEY `year` (`year`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `imdbtop20`;
CREATE TABLE `imdbtop20` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imdbid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `inlogg`;
CREATE TABLE `inlogg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `namn` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT 0,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `invites`;
CREATE TABLE `invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `email` varchar(50) NOT NULL DEFAULT '',
  `skapad` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `secret` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ipchanges`;
CREATE TABLE `ipchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(16) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `iplog`;
CREATE TABLE `iplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `host` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL,
  `lastseen` datetime NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT 0,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `leechbonus`;
CREATE TABLE `leechbonus` (
  `userid` int(11) NOT NULL,
  `datum` int(11) NOT NULL,
  `gbseed` int(11) NOT NULL,
  KEY `userid` (`userid`),
  KEY `datum` (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned NOT NULL DEFAULT 0,
  `receiver` int(10) unsigned NOT NULL DEFAULT 0,
  `added` datetime DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `unread` enum('yes','no') NOT NULL DEFAULT 'yes',
  `saved` tinyint(1) NOT NULL DEFAULT 0,
  `subject` varchar(45) NOT NULL,
  `last` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `var` tinyint(1) NOT NULL DEFAULT 0,
  `svarad` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `receiver` (`receiver`),
  KEY `unread` (`unread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `announce` tinyint(1) NOT NULL,
  `forumthread` int(11) NOT NULL,
  `forum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `added` (`added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nonscene`;
CREATE TABLE `nonscene` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(20) NOT NULL,
  `comment` varchar(20) NOT NULL,
  `whitelist` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupp_2` (`groupname`),
  KEY `grupp` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `nyregg`;
CREATE TABLE `nyregg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(16) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `log_mail` int(11) NOT NULL DEFAULT 0,
  `log_ip` int(11) NOT NULL DEFAULT 0,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `country` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `packfiles`;
CREATE TABLE `packfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torrent` int(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrent` (`torrent`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `peers`;
CREATE TABLE `peers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrent` int(10) unsigned NOT NULL DEFAULT 0,
  `peer_id` binary(20) NOT NULL,
  `ip` varchar(64) NOT NULL DEFAULT '',
  `compact` varbinary(6) NOT NULL,
  `port` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT 0,
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT 0,
  `to_go` bigint(20) unsigned NOT NULL DEFAULT 0,
  `seeder` enum('yes','no') NOT NULL DEFAULT 'no',
  `started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `connectable` tinyint(1) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `agent` varchar(60) NOT NULL DEFAULT '',
  `finishedat` int(10) unsigned NOT NULL DEFAULT 0,
  `downloadoffset` bigint(20) unsigned NOT NULL DEFAULT 0,
  `uploadoffset` bigint(20) unsigned NOT NULL DEFAULT 0,
  `info_hash` varchar(40) NOT NULL,
  `frileech` tinyint(1) NOT NULL DEFAULT 0,
  `user` tinyint(1) NOT NULL DEFAULT 0,
  `mbitupp` double NOT NULL DEFAULT 0,
  `mbitner` double NOT NULL DEFAULT 0,
  `section` enum('new','archive') CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `leechbonus` int(11) NOT NULL DEFAULT 0,
  `torrentsize` bigint(20) unsigned NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `port` (`port`,`ip`,`info_hash`),
  KEY `torrent` (`torrent`),
  KEY `last_action` (`last_action`),
  KEY `userid` (`userid`),
  KEY `info_hash` (`info_hash`(5)),
  KEY `torrent_2` (`info_hash`,`peer_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pollanswers`;
CREATE TABLE `pollanswers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pollid` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `selection` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `alder` int(3) NOT NULL DEFAULT 0,
  `class` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`),
  KEY `selection` (`selection`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `polls`;
CREATE TABLE `polls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question` varchar(255) NOT NULL DEFAULT '',
  `option0` varchar(40) NOT NULL DEFAULT '',
  `option1` varchar(40) NOT NULL DEFAULT '',
  `option2` varchar(40) NOT NULL DEFAULT '',
  `option3` varchar(40) NOT NULL DEFAULT '',
  `option4` varchar(40) NOT NULL DEFAULT '',
  `option5` varchar(40) NOT NULL DEFAULT '',
  `option6` varchar(40) NOT NULL DEFAULT '',
  `option7` varchar(40) NOT NULL DEFAULT '',
  `option8` varchar(40) NOT NULL DEFAULT '',
  `option9` varchar(40) NOT NULL DEFAULT '',
  `option10` varchar(40) NOT NULL DEFAULT '',
  `option11` varchar(40) NOT NULL DEFAULT '',
  `option12` varchar(40) NOT NULL DEFAULT '',
  `option13` varchar(40) NOT NULL DEFAULT '',
  `option14` varchar(40) NOT NULL DEFAULT '',
  `option15` varchar(40) NOT NULL DEFAULT '',
  `option16` varchar(40) NOT NULL DEFAULT '',
  `option17` varchar(40) NOT NULL DEFAULT '',
  `option18` varchar(40) NOT NULL DEFAULT '',
  `option19` varchar(40) NOT NULL DEFAULT '',
  `topicid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `added` (`added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topicid` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `added` datetime DEFAULT NULL,
  `body` text DEFAULT NULL,
  `body_ori` text NOT NULL,
  `editedby` int(10) unsigned NOT NULL DEFAULT 0,
  `editedat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `readposts`;
CREATE TABLE `readposts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `topicid` int(10) unsigned NOT NULL DEFAULT 0,
  `lastpostread` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_2` (`userid`,`topicid`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `recoverlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `host` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL DEFAULT 0,
  `reason` text NOT NULL,
  `targetid` int(10) NOT NULL DEFAULT 0,
  `type` enum('torrent','post','request','pm','comment','subtitle','user') NOT NULL,
  `added` datetime NOT NULL,
  `handledBy` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `request_comments`;
CREATE TABLE `request_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL DEFAULT 0,
  `request` int(10) unsigned NOT NULL DEFAULT 0,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text NOT NULL,
  `ori_text` text NOT NULL,
  `editedby` int(10) unsigned NOT NULL DEFAULT 0,
  `editedat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `torrent` (`request`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `request` varchar(225) DEFAULT NULL,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filled` tinyint(1) NOT NULL DEFAULT 0,
  `p2p` int(11) NOT NULL DEFAULT 0,
  `comment` varchar(300) NOT NULL,
  `ersatt` tinyint(1) NOT NULL DEFAULT 0,
  `search_text` text NOT NULL,
  `season` int(11) NOT NULL,
  `imdbid` int(11) NOT NULL,
  `typ` int(11) NOT NULL,
  `comments` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `filled` (`filled`),
  FULLTEXT KEY `fulltext` (`search_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reqvotes`;
CREATE TABLE `reqvotes` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `reqid` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL DEFAULT 0,
  `krydda` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reqid` (`reqid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reseed_requests`;
CREATE TABLE `reseed_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torrentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrentid` (`torrentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rules`;

CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `class` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `arg` varchar(20) NOT NULL DEFAULT '',
  `value_s` text NOT NULL,
  `value_i` int(11) NOT NULL,
  PRIMARY KEY (`arg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sitelog`;
CREATE TABLE `sitelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typ` int(11) NOT NULL DEFAULT 0,
  `added` datetime DEFAULT NULL,
  `txt` text DEFAULT NULL,
  `search_text` tinytext NOT NULL,
  `userid` int(11) NOT NULL,
  `anonymous` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `search_text` (`search_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `snatch`;
CREATE TABLE `snatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `torrentid` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `port` int(11) NOT NULL,
  `uploaded` bigint(20) NOT NULL,
  `downloaded` bigint(20) NOT NULL,
  `agent` varchar(50) NOT NULL,
  `connectable` tinyint(1) NOT NULL,
  `klar` datetime NOT NULL,
  `lastaction` datetime NOT NULL,
  `timesStarted` int(11) NOT NULL,
  `timesCompleted` int(11) NOT NULL,
  `timesStopped` int(11) NOT NULL,
  `timesUpdated` int(11) NOT NULL,
  `seedtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `useridtorrent` (`userid`,`torrentid`),
  KEY `torrentid` (`torrentid`),
  KEY `userid` (`userid`),
  KEY `timesCompleted` (`timesCompleted`),
  KEY `timesStarted` (`timesStarted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sqlerror`;
CREATE TABLE `sqlerror` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` datetime NOT NULL,
  `uid` int(11) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `staffmessages`;
CREATE TABLE `staffmessages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned NOT NULL DEFAULT 0,
  `added` datetime DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `subject` varchar(100) NOT NULL DEFAULT '',
  `answeredby` int(10) unsigned NOT NULL DEFAULT 0,
  `answered` tinyint(1) NOT NULL DEFAULT 0,
  `answer` text DEFAULT NULL,
  `svaradwhen` datetime NOT NULL,
  `fromprivate` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `answered` (`answered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `seeders` int(11) NOT NULL,
  `leechers` int(11) NOT NULL,
  `activeclients` int(11) NOT NULL,
  `activeusers` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `newusers` int(11) NOT NULL,
  `100leechbonus` int(11) NOT NULL,
  `cat1torrents` int(11) NOT NULL,
  `cat2torrents` int(11) NOT NULL,
  `cat3torrents` int(11) NOT NULL,
  `cat4torrents` int(11) NOT NULL,
  `cat5torrents` int(11) NOT NULL,
  `cat6torrents` int(11) NOT NULL,
  `cat7torrents` int(11) NOT NULL,
  `cat8torrents` int(11) NOT NULL,
  `cat9torrents` int(11) NOT NULL,
  `cat10torrents` int(11) NOT NULL,
  `cat11torrents` int(11) NOT NULL,
  `cat12torrents` int(11) NOT NULL,
  `cat13torrents` int(11) NOT NULL,
  `cat14torrents` int(11) NOT NULL,
  `cat15torrents` int(11) NOT NULL,
  `cat16torrents` int(11) NOT NULL,
  `cat17torrents` int(11) NOT NULL,
  `cat18torrents` int(11) NOT NULL,
  `cat19torrents` int(11) NOT NULL,
  `cat20torrents` int(11) NOT NULL,
  `cat1newtorrents` int(11) NOT NULL,
  `cat2newtorrents` int(11) NOT NULL,
  `cat3newtorrents` int(11) NOT NULL,
  `cat4newtorrents` int(11) NOT NULL,
  `cat5newtorrents` int(11) NOT NULL,
  `cat6newtorrents` int(11) NOT NULL,
  `cat7newtorrents` int(11) NOT NULL,
  `cat8newtorrents` int(11) NOT NULL,
  `cat1newarchivetorrents` int(11) NOT NULL,
  `cat2newarchivetorrents` int(11) NOT NULL,
  `cat3newarchivetorrents` int(11) NOT NULL,
  `cat4newarchivetorrents` int(11) NOT NULL,
  `cat5newarchivetorrents` int(11) NOT NULL,
  `cat6newarchivetorrents` int(11) NOT NULL,
  `cat7newarchivetorrents` int(11) NOT NULL,
  `cat8newarchivetorrents` int(11) NOT NULL,
  `newforumposts` int(11) NOT NULL,
  `newcomments` int(11) NOT NULL,
  `numusersclass0` int(11) NOT NULL,
  `numusersclass1` int(11) NOT NULL,
  `numusersclass2` int(11) NOT NULL,
  `numusersclass3` int(11) NOT NULL,
  `numusersclass6` int(11) NOT NULL,
  `numusersclass7` int(11) NOT NULL,
  `totalsharegb` int(11) NOT NULL,
  `userdesign0` int(11) NOT NULL,
  `userdesign2` int(11) NOT NULL,
  `userdesign3` int(11) NOT NULL,
  `userdesign4` int(11) NOT NULL,
  `userdesign5` int(11) NOT NULL,
  `userdesign6` int(11) NOT NULL,
  `userdesign7` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `suggestions`;
CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` int(11) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0,
  `title` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL,
  `body` text NOT NULL,
  `added` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `topicid` int(11) NOT NULL,
  `hotpoints` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `suggestions_votes`;
CREATE TABLE `suggestions_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `suggestionId` int(11) NOT NULL,
  `voteWeight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`suggestionId`),
  KEY `suggestionId` (`suggestionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(250) DEFAULT NULL,
  `locked` enum('yes','no') NOT NULL DEFAULT 'no',
  `forumid` int(10) unsigned NOT NULL DEFAULT 0,
  `lastpost` int(10) unsigned NOT NULL DEFAULT 0,
  `sticky` enum('yes','no') NOT NULL DEFAULT 'no',
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `sub` varchar(60) NOT NULL,
  `slug` varchar(225) DEFAULT NULL,
  `suggestid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `lastpost` (`lastpost`),
  KEY `forumid` (`forumid`),
  FULLTEXT KEY `subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `torrent_list_bookmarks`;
CREATE TABLE `torrent_list_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `torrent_list` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `torrent_list_votes`;
CREATE TABLE `torrent_list_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `torrent_list` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`torrent_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `torrent_lists`;
CREATE TABLE `torrent_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `votes` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `imdbid` int(11) NOT NULL,
  `torrents` text NOT NULL,
  `type` enum('unlisted','public') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `torrents`;
CREATE TABLE `torrents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `info_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `descr` text NOT NULL,
  `category` int(10) unsigned NOT NULL DEFAULT 0,
  `search_text` text NOT NULL,
  `search_text2` text NOT NULL,
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` enum('single','multi') NOT NULL DEFAULT 'single',
  `numfiles` int(10) unsigned NOT NULL DEFAULT 0,
  `comments` int(10) unsigned NOT NULL DEFAULT 0,
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `times_completed` int(10) unsigned NOT NULL DEFAULT 0,
  `leechers` int(10) NOT NULL DEFAULT 0,
  `seeders` int(10) NOT NULL DEFAULT 0,
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banned` enum('yes','no') NOT NULL DEFAULT 'no',
  `owner` int(10) unsigned NOT NULL DEFAULT 0,
  `numratings` int(10) unsigned NOT NULL DEFAULT 0,
  `ratingsum` int(10) unsigned NOT NULL DEFAULT 0,
  `ano_owner` tinyint(1) NOT NULL DEFAULT 0,
  `nfo` text NOT NULL,
  `reqid` int(11) NOT NULL DEFAULT 0,
  `frileech` tinyint(1) NOT NULL DEFAULT 0,
  `imdbid` int(11) NOT NULL,
  `p2p` tinyint(1) NOT NULL DEFAULT 0,
  `pre` int(11) NOT NULL,
  `pack` tinyint(4) NOT NULL DEFAULT 0,
  `3d` tinyint(4) NOT NULL,
  `section` enum('new','archive') CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `predate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `info_hash` (`info_hash`(15)),
  KEY `owner` (`owner`),
  KEY `reqid` (`reqid`),
  KEY `category` (`category`),
  KEY `imdbid` (`imdbid`),
  KEY `added` (`added`),
  KEY `seeders` (`seeders`),
  KEY `frileech` (`frileech`),
  KEY `section` (`section`),
  FULLTEXT KEY `ft_search` (`search_text`),
  FULLTEXT KEY `search_text2` (`search_text2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL DEFAULT '',
  `old_password` varchar(40) NOT NULL DEFAULT '',
  `passhash` varchar(60) NOT NULL DEFAULT '',
  `secret` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `info` text DEFAULT NULL,
  `acceptpms` enum('yes','friends','no') NOT NULL DEFAULT 'yes',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `class` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `avatar` varchar(100) NOT NULL DEFAULT '',
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT 1,
  `lastweekupload` bigint(20) NOT NULL DEFAULT 0,
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT 1,
  `downloaded_real` bigint(20) unsigned NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT '',
  `country` int(10) unsigned NOT NULL DEFAULT 0,
  `notifs` varchar(100) NOT NULL DEFAULT '',
  `modcomment` text NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `avatars` enum('yes','no') NOT NULL DEFAULT 'yes',
  `donor` enum('yes','no') NOT NULL DEFAULT 'no',
  `warned` enum('yes','no') NOT NULL DEFAULT 'no',
  `warneduntil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `torrentsperpage` int(3) unsigned NOT NULL DEFAULT 0,
  `topicsperpage` int(3) unsigned NOT NULL DEFAULT 0,
  `anonym` enum('yes','no') NOT NULL DEFAULT 'no',
  `postsperpage` int(3) unsigned NOT NULL DEFAULT 0,
  `anonymratio` enum('yes','no') NOT NULL DEFAULT 'no',
  `anonymicons` enum('yes','no') NOT NULL DEFAULT 'no',
  `reqslots` tinyint(1) NOT NULL DEFAULT 1,
  `passkey` varchar(32) NOT NULL DEFAULT '',
  `last_browse` int(11) NOT NULL DEFAULT 0,
  `last_reqbrowse` int(11) NOT NULL DEFAULT 0,
  `last_tvbrowse` int(11) NOT NULL,
  `last_seriebrowse` int(11) NOT NULL,
  `last_ovrigtbrowse` int(11) NOT NULL,
  `last_allbrowse` int(11) NOT NULL,
  `last_bevakabrowse` int(11) NOT NULL,
  `invites` int(10) NOT NULL DEFAULT 2,
  `invited_by` int(11) DEFAULT NULL,
  `bonuspoang` int(11) NOT NULL DEFAULT 0,
  `leechbonus` int(11) NOT NULL,
  `leechstart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `randomcheck` int(11) NOT NULL DEFAULT 0,
  `doljuploader` tinyint(1) NOT NULL DEFAULT 0,
  `softbet` tinyint(1) NOT NULL DEFAULT 0,
  `forumban` tinyint(1) NOT NULL DEFAULT 0,
  `parkerad` tinyint(1) NOT NULL DEFAULT 0,
  `uptime` int(11) NOT NULL DEFAULT 0,
  `forum_access` datetime NOT NULL,
  `isp` varchar(25) NOT NULL,
  `mbitupp` float unsigned NOT NULL DEFAULT 0,
  `mbitner` float unsigned NOT NULL DEFAULT 0,
  `alder` int(2) unsigned NOT NULL DEFAULT 0,
  `gender` tinyint(1) NOT NULL DEFAULT 0,
  `torrentip` varchar(15) NOT NULL DEFAULT '0.0.0.0.0',
  `skull` tinyint(1) NOT NULL,
  `crown` tinyint(1) NOT NULL,
  `pokal` tinyint(1) NOT NULL DEFAULT 0,
  `coin` tinyint(1) NOT NULL,
  `hearts` int(3) NOT NULL DEFAULT 0,
  `inviteban` tinyint(1) NOT NULL DEFAULT 0,
  `muptime` int(11) NOT NULL,
  `nytt_seed` bigint(20) NOT NULL DEFAULT 0,
  `arkiv_seed` bigint(20) NOT NULL DEFAULT 0,
  `browser` varchar(200) NOT NULL,
  `operativ` varchar(200) NOT NULL,
  `indexlist` varchar(100) NOT NULL DEFAULT '1, 2',
  `uploadban` enum('yes','no') NOT NULL DEFAULT 'no',
  `css` varchar(250) NOT NULL,
  `design` tinyint(4) NOT NULL DEFAULT 0,
  `tvvy` tinyint(4) NOT NULL,
  `https` tinyint(1) NOT NULL DEFAULT 1,
  `magnet` tinyint(1) NOT NULL,
  `lastreadnews` int(11) NOT NULL DEFAULT 0,
  `uplLastReadCommentId` int(11) NOT NULL DEFAULT 0,
  `search_sort` enum('name','added') NOT NULL DEFAULT 'name',
  `section` enum('all','new','archive') NOT NULL DEFAULT 'all',
  `language` varchar(2) NOT NULL DEFAULT 'en',
  `p2p` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `passkey` (`passkey`),
  KEY `ip` (`ip`),
  KEY `warned` (`warned`),
  KEY `forum_access` (`forum_access`),
  KEY `email` (`email`(3)),
  KEY `enabled` (`enabled`),
  KEY `invited_by` (`invited_by`),
  KEY `arkiv_seed` (`arkiv_seed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

INSERT INTO `settings` (`arg`, `value_s`, `value_i`) VALUES
('peers_rekord', '', 0);

INSERT INTO `users` (`id`, `username`, `old_password`, `passhash`, `secret`, `email`, `added`, `last_login`, `last_access`, `info`, `acceptpms`, `ip`, `class`, `avatar`, `uploaded`, `lastweekupload`, `downloaded`, `downloaded_real`, `title`, `country`, `notifs`, `modcomment`, `enabled`, `avatars`, `donor`, `warned`, `warneduntil`, `torrentsperpage`, `topicsperpage`, `anonym`, `postsperpage`, `anonymratio`, `anonymicons`, `reqslots`, `passkey`, `last_browse`, `last_reqbrowse`, `last_tvbrowse`, `last_seriebrowse`, `last_ovrigtbrowse`, `last_allbrowse`, `last_bevakabrowse`, `invites`, `invited_by`, `bonuspoang`, `leechbonus`, `leechstart`, `randomcheck`, `doljuploader`, `softbet`, `forumban`, `parkerad`, `uptime`, `forum_access`, `isp`, `mbitupp`, `mbitner`, `alder`, `gender`, `torrentip`, `skull`, `crown`, `pokal`, `coin`, `hearts`, `inviteban`, `muptime`, `nytt_seed`, `arkiv_seed`, `browser`, `operativ`, `indexlist`, `uploadban`, `css`, `design`, `tvvy`, `https`, `magnet`, `lastreadnews`, `uplLastReadCommentId`, `search_sort`, `section`, `language`, `p2p`) VALUES
(1, 'System', '', '$2y$08$uxL463WTmJHaLvSVNlr9A.OoVevHeczC98U3QeKVB1fgh03V7O/ue', '', '', '2015-10-31 16:16:27', '2015-10-31 16:16:27', '2015-10-31 16:25:31', '', 'yes', '123.123.123.123', 8, '', 0, 0, 0, 0, '', 0, '', '', 'yes', 'yes', 'no', 'no', '0000-00-00 00:00:00', 0, 0, 'no', 0, 'no', 'no', 1, '', 1446304880, 0, 0, 0, 0, 0, 0, 9, NULL, 0, 0, '0000-00-00 00:00:00', 0, 8, 0, 0, 1, 0, '0000-00-00 00:00:00', '', 0, 0, 0, 0, '0.0.0.0.0', 0, 0, 0, 0, 0, 0, 240, 0, 0, '', '', '1, 141', 'no', '', 0, 0, 0, 0, 0, 0, 'name', 'all', 'en', 0);

INSERT INTO `forumheads` (`id`, `sort`, `name`, `minclassread`) VALUES
(1, 0, 'Tracker', 0);

INSERT INTO `forums` (`sort`, `id`, `forumhead`, `name`, `description`, `minclassread`, `minclasswrite`, `postcount`, `topiccount`, `minclasscreate`) VALUES
(1, 1, 1, 'General', 'Discuss everything about this tracker.', 0, 0, 0, 0, 0),
(0, 2, 1, 'Staff', 'The Staff forum.', 8, 8, 0, 0, 8),
(2, 3, 1, 'Polls', 'Discuss the front page polls.', 0, 0, 1, 1, 8),
(3, 4, 1, 'Suggestions', 'Discuss all suggestions and ideas.', 0, 0, 0, 0, 0);

INSERT INTO `customindex` (`id`, `tid`, `typ`, `format`, `sektion`, `sort`, `genre`) VALUES
(1, 1, 0, 0, 0, 2, ''),
(2, 1, 1, 0, 0, 2, ''),
(4, 1, 0, 1, 0, 2, ''),
(5, 1, 1, 1, 0, 2, ''),
(7, 1, 0, 2, 0, 2, ''),
(8, 1, 1, 2, 0, 2, ''),
(9, 1, 0, 3, 0, 2, ''),
(196, 2, 1, 2, 0, 2, '');
 

INSERT INTO `shop` (`id`, `name`, `description`, `price`) VALUES
(1, 'HEART', 'Send a heart to a friend to show appreciation. Hearts are visible on the user profile.', 25),
(2, '+1 REQUEST SLOT', 'Tired of just one active request? Buy additional slots!', 50),
(3, '-10GB', 'Bad ratio? Buy away from your download.', 75),
(4, '-10GB FROM FRIEND', 'Help a friend by buying away 10GB from that persons downloaded.', 75),
(6, '+1 INVITE', 'With invites you can invite someone you know to become member on the site.', 50),
(8, 'CUSTOM TITLE', 'The custom title are displayed after your name everywhere instead of your class.', 300),
(10, 'ICON - CROWN', 'If you want som extra status you can buy this fancy icon which will be visible everywhere after your username.', 1000);



