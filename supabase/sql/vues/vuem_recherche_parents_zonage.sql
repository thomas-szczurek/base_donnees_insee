WITH RECURSIVE st(fk_zonage_enfant, fk_zonage_parent) AS (
  SELECT
		a.fk_zonage_enfant, 
		a.fk_zonage_parent,
		n.code_admin,
		a.annee_debut_validite,
		a.annee_fin_validite
  FROM insee.appartenance_zonages AS a
	JOIN insee.zonages_administratifs AS n ON n.pk_id = a.fk_zonage_enfant
  WHERE fk_type = 1
  UNION ALL
  SELECT 
		a.fk_zonage_enfant, 
		a.fk_zonage_parent,
		st.code_admin,
		a.annee_debut_validite,
		a.annee_fin_validite
  FROM insee.appartenance_zonages AS a
	JOIN st ON a.fk_zonage_enfant = st.fk_zonage_parent
)
SELECT 
	st.code_admin,
	st.fk_zonage_parent,
	p.fk_type AS type_zonage,
	p.nom AS nom_parent,
	st.annee_debut_validite,
	st.annee_fin_validite
FROM st
	JOIN insee.zonages_administratifs AS p ON p.pk_id = st.fk_zonage_parent