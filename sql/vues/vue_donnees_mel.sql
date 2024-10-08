CREATE OR REPLACE VIEW insee.donnees_mel
 AS
 SELECT d.code_com,
    z.nom AS nom_commune,
    d.annee,
    b.nom AS source,
    d.clef_json,
    c.nom_champ_insee AS champ_insee,
    d.valeur
   FROM insee.donnees_communes_olap d
     JOIN insee.recur_appartenance_zonages r ON d.code_com = r.code_com
     JOIN insee.zonages_administratifs z ON d.code_com = z.code_admin
     JOIN insee.bases b ON d.fk_base = b.pk_id
     JOIN insee.presence_clefs_annees c ON c.clef_json = d.clef_json
  WHERE r.fk_zonage_parent = 35547
  ORDER BY d.fk_base, d.annee, c.ordre, d.code_com;
