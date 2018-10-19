
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `search_text` text NOT NULL,
  `added` datetime DEFAULT NULL,
  `txt` text DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `added` (`added`),
  FULLTEXT KEY `search_text` (`search_text`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banned`
--

DROP TABLE IF EXISTS `banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(250) NOT NULL,
  `owner` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namn` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bevaka`
--

DROP TABLE IF EXISTS `bevaka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bevaka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `imdbid` int(11) NOT NULL,
  `typ` tinyint(4) NOT NULL,
  `format` varchar(10) NOT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`imdbid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `blockid` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userfriend` (`userid`,`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bonuslog`
--

DROP TABLE IF EXISTS `bonuslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonuslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `veckobonus` int(11) NOT NULL DEFAULT 0,
  `msg` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `userid_2` (`userid`,`veckobonus`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `torrentid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cheatlog`
--

DROP TABLE IF EXISTS `cheatlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customindex`
--

DROP TABLE IF EXISTS `customindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `typ` int(11) NOT NULL,
  `format` int(11) NOT NULL,
  `sektion` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `genre` varchar(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donated`
--

DROP TABLE IF EXISTS `donated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emaillog`
--

DROP TABLE IF EXISTS `emaillog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emaillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `datum` date NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `torrent` int(10) unsigned NOT NULL DEFAULT 0,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `torrent` (`torrent`)
) ENGINE=InnoDB AUTO_INCREMENT=821566 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forumheads`
--

DROP TABLE IF EXISTS `forumheads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumheads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `minclassread` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `friendid` int(10) unsigned NOT NULL DEFAULT 0,
  `kom` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userfriend` (`userid`,`friendid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imdbinfo`
--

DROP TABLE IF EXISTS `imdbinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3396 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imdbtop20`
--

DROP TABLE IF EXISTS `imdbtop20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imdbtop20` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imdbid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inlogg`
--

DROP TABLE IF EXISTS `inlogg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inlogg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `namn` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT 0,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_stopwords`
--

DROP TABLE IF EXISTS `innodb_stopwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_stopwords` (
  `value` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `email` varchar(50) NOT NULL DEFAULT '',
  `skapad` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `secret` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipchanges`
--

DROP TABLE IF EXISTS `ipchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(16) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iplog`
--

DROP TABLE IF EXISTS `iplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leechbonus`
--

DROP TABLE IF EXISTS `leechbonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leechbonus` (
  `userid` int(11) NOT NULL,
  `datum` int(11) NOT NULL,
  `gbseed` int(11) NOT NULL,
  KEY `userid` (`userid`),
  KEY `datum` (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nonscene`
--

DROP TABLE IF EXISTS `nonscene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonscene` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(20) NOT NULL,
  `comment` varchar(20) NOT NULL,
  `whitelist` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupp_2` (`groupname`),
  KEY `grupp` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nyregg`
--

DROP TABLE IF EXISTS `nyregg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packfiles`
--

DROP TABLE IF EXISTS `packfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torrent` int(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrent` (`torrent`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peers`
--

DROP TABLE IF EXISTS `peers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MEMORY AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pollanswers`
--

DROP TABLE IF EXISTS `pollanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `readposts`
--

DROP TABLE IF EXISTS `readposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readposts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `topicid` int(10) unsigned NOT NULL DEFAULT 0,
  `lastpostread` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_2` (`userid`,`topicid`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverlog`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `request_comments`
--

DROP TABLE IF EXISTS `request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reqvotes`
--

DROP TABLE IF EXISTS `reqvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqvotes` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `reqid` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL DEFAULT 0,
  `krydda` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reqid` (`reqid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseed_requests`
--

DROP TABLE IF EXISTS `reseed_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseed_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torrentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrentid` (`torrentid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `class` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `arg` varchar(20) NOT NULL DEFAULT '',
  `value_s` text NOT NULL,
  `value_i` int(11) NOT NULL,
  PRIMARY KEY (`arg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitelog`
--

DROP TABLE IF EXISTS `sitelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snatch`
--

DROP TABLE IF EXISTS `snatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqlerror`
--

DROP TABLE IF EXISTS `sqlerror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlerror` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` datetime NOT NULL,
  `uid` int(11) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffmessages`
--

DROP TABLE IF EXISTS `staffmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subs`
--

DROP TABLE IF EXISTS `subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `torrentid` int(11) NOT NULL,
  `filnamn` varchar(255) NOT NULL,
  `quality` enum('','custom','retail') NOT NULL,
  `datum` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torrentid` (`torrentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suggestions_votes`
--

DROP TABLE IF EXISTS `suggestions_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `suggestionId` int(11) NOT NULL,
  `voteWeight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`suggestionId`),
  KEY `suggestionId` (`suggestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torrent_list_bookmarks`
--

DROP TABLE IF EXISTS `torrent_list_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrent_list_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `torrent_list` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torrent_list_votes`
--

DROP TABLE IF EXISTS `torrent_list_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrent_list_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `torrent_list` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`torrent_list`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torrent_lists`
--

DROP TABLE IF EXISTS `torrent_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torrents`
--

DROP TABLE IF EXISTS `torrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19956 DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvdbinfo`
--

DROP TABLE IF EXISTS `tvdbinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvdbinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tvdbid` varchar(10) NOT NULL,
  `imdbid` varchar(10) NOT NULL,
  `seriesName` text NOT NULL,
  `firstAired` int(11) NOT NULL,
  `network` varchar(250) NOT NULL,
  `runtime` int(11) NOT NULL,
  `genres` varchar(250) NOT NULL,
  `photo` tinyint(4) NOT NULL,
  `tagline` tinytext NOT NULL,
  `seasoncount` int(11) NOT NULL,
  `releaseNameStart` varchar(100) NOT NULL,
  `year` int(4) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tvdbid` (`tvdbid`),
  KEY `releaseNameStart` (`releaseNameStart`),
  KEY `year` (`year`),
  FULLTEXT KEY `seriesName` (`seriesName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-19  9:50:48
