ALTER TABLE `reports` CHANGE `type` `type` ENUM('torrent','post','request','pm','comment','user') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
