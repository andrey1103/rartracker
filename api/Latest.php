<?php

class News {
	private $db;
	private $user;
	private $forum;

	public function __construct($db, $user = null, $forum = null) {
		$this->db = $db;
		$this->user = $user;
		$this->forum = $forum;
	}

	public function query($limit, $markAsRead) {

	 	$sth = $this->db->prepare('SELECT * FROM topics ORDER BY added DESC LIMIT ?');
		$sth->bindParam(1, $limit, PDO::PARAM_INT);
		$sth->execute();
		$result = $sth->fetchAll(PDO::FETCH_ASSOC);

		if (count($result) > 0 && $markAsRead === "true") {
			$this->db->query("UPDATE users SET lastreadnews = " . $result[0]["id"] . " WHERE id = " . $this->user->getId());
		}

		return $result;
	}

}
