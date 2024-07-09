WITH d AS (
  SELECT 
	"CODGEO",
	regexp_replace('nb_menages_fiscaux,' || "NBMENFISC" || ',
			nb_personnes_menages_fiscaux,' || "NBPERSMENFISC" || ',
			revenu_median,' || "MED" || ',
			part_menages_fiscaux_imposes,' || "PIMP" || ',
			taux_de_pauvrete,' || "TP60" || ',
			taux_de_pauvrete_moins_30_ans,' || "TP60AGE1" || ',
			taux_de_pauvrete_30_39_ans,' || "TP60AGE2" || ',
			taux_de_pauvrete_40_49_ans,' || "TP60AGE3" || ',
			taux_de_pauvrete_50_59_ans,' || "TP60AGE4" || ',
			taux_de_pauvrete_60_74_ans,' || "TP60AGE5" || ',
			taux_de_pauvrete_plus_75_ans,' || "TP60AGE6" || ',
			tx_pauvrete_proprietaires,' || "TP60TOL1" || ',
			tx_pauvrete_locataires,' || "TP60TOL2" || ',
			part_des_revenus_d_activite,' || "PACT" || ',
			dont_part_salaire_traitements,' || "PTSA" || ',	
			dont_part_indemnite_chomage,' || "PCHO" || ',
			dont_part_activites_non_salariees,' || "PBEN" || ',
			part_pensions_retraites_rentes,' || "PPEN" || ',
			part_revenus_patrimoine_et_autre,' || "PPAT" || ',
			part_ensemble_prestations_sociales,' || "PPSOC" || ',
			dont_part_prestations_familiales,' || "PPFAM" || ',
			dont_part_minimas_sociaux,' || "PPMINI" || ',
			dont_part_presations_logements,' || "PPLOGT" || ',
			part_des_impots,' || "PIMPOT" || ',
			1er_decile,' || "D1" || ',
			9eme_decile,' || "D9" || ',
			rapport_inter_decile,' || "RD",
		E'[\t\n\r]','','g') AS data
		FROM insee.filosofi_import
	)
INSERT INTO insee.donnees_communes("annee","fk_base","donnees", "code_commune")
SELECT
	   2021,
	   7,
	   jsonb_object(string_to_array(data::text,',')),
	   "CODGEO"
FROM d
ORDER BY "CODGEO"
	
