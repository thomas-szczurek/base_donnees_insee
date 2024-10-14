CREATE MATERIALIZED VIEW insee.donnees_olap_final AS
SELECT 
	o.code_com AS code_com,
	z.nom AS nom_commune,
	epci.nom_parent AS epci,
	dpt.nom_parent AS departement,
	reg.nom_parent AS region,
	o.annee AS annee,
	b.nom AS source,	
	o.clef_json AS clef_json,
	o.valeur AS valeur
FROM insee.donnees_communes_olap AS o
	JOIN insee.bases AS b ON o.fk_base = b.pk_id
	JOIN insee.zonages_administratifs AS z ON o.code_com = z.code_admin,
	LATERAL (
        SELECT nom_parent 
        FROM insee.recur_appartenance_zonages 
        WHERE 
            o.code_com = code_com 
            AND type_zonage = 2 
            AND o.annee >= annee_debut_validite 
            AND (o.annee < annee_fin_validite OR annee_fin_validite IS NULL)
        ) AS epci,
    LATERAL (
        SELECT nom_parent 
        FROM insee.recur_appartenance_zonages 
        WHERE
            o.code_com = code_com 
            AND type_zonage = 3     
            AND o.annee >= annee_debut_validite 
            AND (o.annee < annee_fin_validite OR annee_fin_validite IS NULL)
        ) AS dpt,
    LATERAL (
        SELECT nom_parent 
        FROM insee.recur_appartenance_zonages 
        WHERE 
            o.code_com = code_com 
            AND type_zonage = 4 
            AND o.annee >= annee_debut_validite 
            AND (o.annee < annee_fin_validite OR annee_fin_validite IS NULL)
        ) AS reg;
