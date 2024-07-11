-- Cette vue n'est présente que dans la version locale et sert à générer la table public.donnees_com OLAP de supabase
CREATE MATERIALIZED VIEW local.donnees_communes_olap AS
WITH
-- Sélection des codes communes
	codes_com AS (
		SELECT
			code_admin
		FROM local.zonages_administratifs
		WHERE fk_type = 1
	),
-- Sélections des clefs et unnest par année
	clefs AS (
		SELECT
			pk_id,
			generate_series(premiere_annee_presence, derniere_annee_presence,1) AS annee
		FROM local.correspondance_clefs_champs
	),
-- cross join des clefs + année unnestées et des codes communaux
	tc AS (
	SELECT
		cc.code_admin AS code_com,
		cl.annee AS annee,
		cl.pk_id AS pk_id
	FROM codes_com AS cc
	CROSS JOIN clefs AS cl
	),
-- Selection finale avec récupération des données
	final AS (
	SELECT
		tc.code_com,
		tc.annee,
		co.fk_base,
		co.clef_json,
		CASE
			WHEN (d.donnees ->> clef_json) IN ('','null','s','nd') THEN NULL
			ELSE ((d.donnees ->> clef_json)::real)
		END AS valeur
	FROM tc
	JOIN
		local.donnees_communes AS d
			ON (tc.code_com = d.code_commune AND tc.annee = d.annee)
	LEFT JOIN
		local.correspondance_clefs_champs AS co
			ON tc.pk_id = co.pk_id
	ORDER BY tc.annee, co.fk_base, co.clef_json, tc.code_com
	)
SELECT * FROM final WHERE valeur IS NOT NULL;
