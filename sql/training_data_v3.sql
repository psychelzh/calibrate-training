-- !preview conn=DBI::dbConnect(odbc::odbc(), "iquizoo-v3", database = "iquizoo_datacenter_db")

SELECT DISTINCTROW
	content_score_detail.UserId user_id,
	`user`.Gender user_sex,
	`user`.Birthday user_dob,
	content.Id game_id,
	content.`Name` game_name,
	content_score_detail.CreateTime game_time,
	content_score_detail.Stage game_stage,
	content_score_detail.Star game_star
FROM
	iquizoo_datacenter_db.content_score_detail
	INNER JOIN iquizoo_content_db.content ON content.Id = content_score_detail.ContentId
	INNER JOIN iquizoo_user_db.user_organization ON user_organization.Id = content_score_detail.UserId
	INNER JOIN iquizoo_user_db.`user` ON user_organization.UserId = `user`.Id
WHERE
	content.ContentType = 2;
