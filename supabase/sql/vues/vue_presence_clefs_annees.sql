-- Vue supabase permettant de récupérer les années minimum et maximum de présence de chaque clef
CREATE VIEW insee.presence_clefs_annees AS
-- On utilise les UNION pour profiter du partionnement de donnees_communes et accelérer la requête
CREATE VIEW insee.presence_clefs_annees AS
SELECT
	c.clef_json AS clef_json,
	c.fk_base AS fk_base,
	p.premiere AS premiere_annee_presence,
	d.derniere AS derniere_annee_presence
FROM insee.correspondance_clefs_champs AS c,
	LATERAL (SELECT min(annee) AS premiere FROM insee.donnees_communes WHERE fk_base = c.fk_base AND donnees ? clef_json) AS p,
	LATERAL (SELECT max(annee) AS derniere FROM insee.donnees_communes WHERE fk_base = c.fk_base AND donnees ? clef_json) AS d
ORDER BY fk_base, clef_json;
