-- !preview conn=DBI::dbConnect(odbc::odbc(), "iquizoo-old", database = "azy2")

SELECT DISTINCTROW
	usersubject.userId user_id,
	`user`.gender user_sex,
	`user`.birthday user_dob,
	game.id game_id,
	game.`name` game_name,
	usersubject.finishTime game_time,
	usersubject.stageId game_stage,
	usersubject.star game_star
FROM
	game
	INNER JOIN basicsubject ON basicsubject.gameId = game.id
	INNER JOIN usersubject ON usersubject.subjectId = basicsubject.id
	INNER JOIN `user` ON `user`.id = usersubject.userId
WHERE
	usersubject.finishTime IS NOT NULL;
