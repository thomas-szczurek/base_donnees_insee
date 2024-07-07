-- Vue supabase permettant de récupérer les années minimum et maximum de présence de chaque clef
CREATE VIEW insee.presence_clefs_annees AS
-- On utilise les UNION pour profiter du partionnement de donnees_communes et accelérer la requête
SELECT
	clef_json,
  1 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 1 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 1 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 1
UNION
SELECT
	clef_json,
  2 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 2 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 2 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 2
UNION
SELECT
	clef_json,
  2 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 3 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 3 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 3
UNION
SELECT
	clef_json,
  3 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 3 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 3 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 3
UNION
SELECT
	clef_json,
  4 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 4 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 4 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 4
UNION
SELECT
	clef_json,
  5 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 5 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 5 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 5
UNION
SELECT
	clef_json,
  6 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 6 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 6 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 6
UNION
SELECT
	clef_json,
  7 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 7 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 7 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 7
UNION
SELECT
	clef_json,
  8 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 8 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 8 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 8
UNION
SELECT
	clef_json,
  9 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 9 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 9 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 9
UNION
SELECT
	clef_json,
  10 AS fk_base,
	(SELECT min(annee) FROM insee.donnees_communes WHERE fk_base = 10 AND donnees ? clef_json) AS premiere_annee_presence,
	(SELECT max(annee) FROM insee.donnees_communes WHERE fk_base = 10 AND donnees ? clef_json) AS derniere_annee_presence
FROM
	insee.correspondance_clefs_champs
WHERE fk_base = 9
ORDER BY fk_base, clef_json;
