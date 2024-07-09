-- Cette vue n'est présente que dans la version locale et sert à générer la table donnees_com_fk_2 de supabase
CREATE MATERIALIZED VIEW local.cross_donnees_fk_2 AS
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
			clef_json,
			generate_series(premiere_annee_presence, derniere_annee_presence,1) AS annee
		FROM local.correspondance_clefs_champs
		WHERE fk_base = 2
	),
-- cross join des clefs + année unnestées et des codes communaux
	tc AS (
	SELECT
		cc.code_admin AS code_com,
		cl.annee AS annee,
		cl.clef_json AS clef_json
	FROM codes_com AS cc
	CROSS JOIN clefs AS cl
	ORDER BY clef_json, annee, code_com)
-- Selection finale avec récupération des données
SELECT
	tc.code_com,
	tc.annee,
	tc.clef_json,
	CASE
		WHEN (d.donnees ->> clef_json) = '' THEN NULL
		ELSE ((d.donnees ->> clef_json)::real)
	END AS valeur
FROM tc
JOIN
    (SELECT * FROM local.donnees_communes WHERE fk_base = 2) AS d
        ON (tc.code_com = d.code_commune AND tc.annee = d.annee);
