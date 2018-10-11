<?php

class Config {

	const NAME = "DigitalCore.nl";
	const SITE_NAME = "DigitalCore.nl";
	const SITE_URL = "https://digitalcore.nl";
	const SITE_MAIL = "no-reply@digitalcore.nl";

	const SUGGESTION_FORUM_ID = 4;
	const POLLS_FORUM_ID = 3;
	const NEWS_FORUM_ID = 1;

	const DEFAULT_LANGUAGE = "en";
	public static $languages = ["en"];

	const TRACKER_URL = "http://digitalcore.nl:80";
    	const TRACKER_URL_SSL = "https://digitalcore.nl:443";

	public static $userClasses = array(
		0 => "Extra",
		1 => "Actor",
		2 => "Movie star",
		3 => "Director",
		4 => "Producer",
		6 => "Uploader",
		7 => "VIP",
		8 => "Staff");

	public static $categories = array(
		"DVDR_PAL" => array("id" => 1, "name" => "Movies/DVDR"),
              "MOVIE_SD" => array("id" => 2, "name" => "Movies/XviD"),
		"BLURAY" => array("id" => 3, "name" => "Movies/BluRay"),
		"MOVIE_4K" => array("id" => 4, "name" => "Movies/4K"),
		"MOVIE_720P" => array("id" => 5, "name" => "Movies/720p"),
		"MOVIE_1080P" => array("id" => 6, "name" => "Movies/1080p"),
		"TV_720P" => array("id" => 8, "name" => "Tv/720p"),
		"TV_1080P" => array("id" => 9, "name" => "Tv/1080p"),
		"XVID_TV" => array("id" => 10, "name" => "Tv/XVID"),
		"DVDR_TV" => array("id" => 11, "name" => "Tv/DVDR"),
		"MUSIC" => array("id" => 12, "name" => "Music"),
		"UNKNOWN" => array("id" => 17, "name" => "Unknown"),
		"APPS_0DAY" => array("id" => 18, "name" => "Apps/0DAY"),
		"PC_GAMES" => array("id" => 19, "name" => "Games/PC"),
		"PC_APPS" => array("id" => 20, "name" => "Apps/PC")
	);

}
