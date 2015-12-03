-- vnitrni konkurence v ZSJD - pocet konkurujicich pobocek/prodejen ve spadovce

ALTER TABLE spadovky ADD COLUMN prekryv INT;

UPDATE spadovky a
SET prekryv = b.pocet
FROM (
	SELECT kod_zsj_d
		,count(*) pocet
	FROM spadovky
	GROUP BY kod_zsj_d
	) b
WHERE a.kod_zsj_d = b.kod_zsj_d;


-- vnitrni konkurence ve spadovce- vztazeno na pobocku

ALTER TABLE pobocky ADD COLUMN vnitrni_konkurence INT;

UPDATE pobocky
SET vnitrni_konkurence = (
		SELECT count(DISTINCT (b.pobocka_id))
		FROM spadovky a
		INNER JOIN spadovky b ON a.kod_zsj_d = b.kod_zsj_d
			AND a.pobocka_id = pobocky.pobocka_id
		);
