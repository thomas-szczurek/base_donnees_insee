WITH RECURSIVE st(fk_zonage_enfant, fk_zonage_parent) AS (
  SELECT
    fk_zonage_enfant, fk_zonage_parent
  FROM insee.appartenance_zonages AS a
    JOIN insee.zonages_administratifs AS n ON n.pk_id = a.fk_zonage_enfant
  WHERE n.code_admin = '59350'
  UNION ALL
  SELECT 
    a.fk_zonage_enfant, a.fk_zonage_parent
  FROM insee.appartenance_zonages AS a
	  JOIN st ON a.fk_zonage_enfant = st.fk_zonage_parent
)
SELECT 
  st.fk_zonage_enfant,
  e.nom AS nom_enfant,
  st.fk_zonage_parent,
  p.nom AS nom_parent
FROM st
  JOIN insee.zonages_administratifs AS p ON p.pk_id = st.fk_zonage_parent
  JOIN insee.zonages_administratifs AS e ON e.pk_id = st.fk_zonage_enfant