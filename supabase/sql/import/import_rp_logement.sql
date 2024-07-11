WITH d AS (
	SELECT
		"CODGEO",
	   regexp_replace('logements_p,' || "LOG_P" || ',
					residences_principales_p,' || "RP_P" || ',
					residences_secondaires_p,' || "RSECOCC_P" || ',
					logements_vacants_p,' || "LOGVAC_P" || ',
					maisons_p,' || "MAISON_P" || ',
					appart_p,' || "APPART_P" || ',
					rp_1piece_p,' || "RP_1P_P" || ',
					rp_2piece_p,' || "RP_2P_P" || ',
					rp_3piece_p,' || "RP_3P_P" || ',
					rp_4piece_p,' || "RP_4P_P" || ',
					rp_5piece_plus_p,' || "RP_5PP_P" || ',
					nb_pieces_rp_p,' || "NBPI_RP_P" || ',
					rp_maisons_p,' || "RPMAISON_P" || ',
					nb_pieces_rp_maisons_p,' || "NBPI_RPMAISON_P" || ',
					rp_appart_p,' || "RPAPPART_P" || ',
					nb_pices_rp_appart_p,' || "NBPI_RPAPPART_P" || ',
					res_princ_hors_studio_1_pers_c,' || "RP_HSTU1P_C" || ',
					res_princ_hors_studio_1_pers_suroccupee_c,' || "RP_HSTU1P_SUROCC_C" || ',
					nb_rp_construites_avant_2016_p,' || "RP_ACHTOT_P" || ',
					nb_rp_construites_avant_1919_p,' || "RP_ACH19_P" || ',
					nb_rp_construites_entre_1919_1945_p,' || "RP_ACH45_P" || ',
					nb_rp_construites_entre_1946_1970_p,' || "RP_ACH70_P" || ',
					nb_rp_construites_entre_1971_1990_p,' || "RP_ACH90_P" || ',
					nb_rp_construites_entre_1991_2005_p,' || "RP_ACH05_P" || ',
					nb_rp_construites_entre_2006_2017_p,' || "RP_ACH17_P" || ',
					nb_rp_maisons_construites_avant_1919_p,' || "RPMAISON_ACH19_P" || ',
					nb_rp_maisons_construites_entre_1919_1945_p,' || "RPMAISON_ACH45_P" || ',
					nb_rp_maisons_construites_entre_1946_1970_p,' || "RPMAISON_ACH70_P" || ',
					nb_rp_maisons_construites_entre_1971_1990_p,' || "RPMAISON_ACH90_P" || ',
					nb_rp_maisons_construites_entre_1991_2005_p,' || "RPMAISON_ACH05_P" || ',
					nb_rp_maisons_construites_entre_2006_2017_p,' || "RPMAISON_ACH17_P" || ',
					nb_rp_appart_construites_avant_1919_p,' || "RPAPPART_ACH19_P" || ',					
					nb_rp_apparts_construites_entre_1919_1945_p,' || "RPAPPART_ACH45_P" || ',
					nb_rp_apparts_construites_entre_1946_1970_p,' || "RPAPPART_ACH70_P" || ',
					nb_rp_apparts_construites_entre_1971_1990_p,' || "RPAPPART_ACH90_P" || ',
					nb_rp_apparts_construites_entre_1991_2005_p,' || "RPAPPART_ACH05_P" || ',
					nb_rp_apparts_construites_entre_2006_2017_p,' || "RPAPPART_ACH17_P" || ',
					nombre_menages_p,' || "MEN_P" || ',
					menages_emmenages_moins_2ans_p,' || "MEN_ANEM0002_P" || ',
					menages_emmenages_entre_2_4ans_p,' || "MEN_ANEM0204_P" || ',
					menages_emmenages_entre_5_9ans_p,' || "MEN_ANEM0509_P" || ',
					menages_emmenages_10ans_plus_p,' || "MEN_ANEM10P_P" || ',
					menages_emmenages_entre_10_19ans_p,' || "MEN_ANEM1019_P" || ',
					menages_emmenages_entre_20_29ans_p,' || "MEN_ANEM2029_P" || ',
					menages_emmenages_plus_30ans_p,' || "MEN_ANEM30P_P" || ',
					population_menages_p,' || "PMEN_P" || ',
					pop_menages_emmenages_moins_2ans_p,' || "PMEN_ANEM0002_P" || ',
					pop_menages_emmenages_entre_2_4ans_p,' || "PMEN_ANEM0204_P" || ',
					pop_menages_emmenages_entre_5_9ans_p,' || "PMEN_ANEM0509_P" || ',
					pop_menages_emmenages_10ans_plus_p,' || "PMEN_ANEM10P_P" || ',
					nb_pieces_menages_emmenages_moins_2ans_p,' || "NBPI_RP_ANEM0002_P" || ',
					nb_pieces_menages_emmenages_entre_2_4ans_p,' || "NBPI_RP_ANEM0204_P" || ',
					nb_pieces_menages_emmenages_entre_5_9ans_p,' || "NBPI_RP_ANEM0509_P" || ',
					nb_pieces_menages_emmenages_10ans_plus_p,' || "NBPI_RP_ANEM10P_P" || ',
					nb_rp_occupes_proprietaires_p,' || "RP_PROP_P" || ',
					nb_rp_occupes_locataires_p,' || "RP_LOC_P" || ',
					nb_rp_hlm_p,' || "RP_LOCHLMV_P" || ',
					nb_rp_occupes_gratuitement_p,' || "RP_GRAT_P" || ',
					nb_pers_rp_p,' || "NPER_RP_P" || ',
					nb_pers_rp_occupes_proprietaires_p,' || "NPER_RP_PROP_P" || ',
					nb_pers_rp_occupes_locataires_p,' || "NPER_RP_LOC_P" || ',
					nb_pers_rp_hlm_p,' || "NPER_RP_LOCHLMV_P" || ',
					nb_pers_rp_occupes_gratuitement_p,' || "NPER_RP_GRAT_P" || ',
					anciennete_totale_emmenagement_rp_p,' || "ANEM_RP_P" || ',
					anciennete_totale_emmenagement_rp_occupees_proprietaires_p,' || "ANEM_RP_PROP_P" || ',
					anciennete_totale_emmenagement_rp_occupees_locatairess_p,' || "ANEM_RP_LOC_P" || ',
					anciennete_totale_emmenagement_rp_hlm_p,' || "ANEM_RP_LOCHLMV_P" || ',
					anciennete_totale_emmenagement_rp_ocucupees_gratuitement_p,' || "ANEM_RP_GRAT_P" || ',
					nb_rp_equipees_sddb_avec_baignoire_douche_p,' || "RP_SDB_P" || ',
					nb_rp_chauffage_central_collectif_p,' || "RP_CCCOLL_P" || ',
					nb_rp_chauffage_central_individuel_p,' || "RP_CCIND_P" || ',
					nb_rp_chauffage_individuel_electrique_p,' || "RP_CINDELEC_P" || ',
					nb_rp_avec_elctricite_p,' || "RP_ELEC_P" || ',
					nb_rp_avec_eau_chaude_p,' || "RP_EAUCH_P" || ',
					nb_rp_avec_beau_douche_wc_p,' || "RP_BDWC_P" || ',
					nb_rp_avec_chauffe_eau_solaire_p,' || "RP_CHOS_P" || ',
					nb_rp_avec_piece_climatisee_p,' || "RP_CLIM_P" || ',
					nb_rp_avec_tout_a_legout_p,' || "RP_TTEGOU_P" || ',
					nb_menages_avec_au_moins_un_parking_p,' || "RP_GARL_P" || ',
					nb_menages_avec_au_moins_1_voiture_p,' || "RP_VOIT1P_P" || ',
					nb_menages_avec_1_voiture_p,' || "RP_VOIT1_P" || ',
					nb_menages_avec_2_voiture_ou_plus_p,' || "RP_VOIT2P_P" || ',
					habitations_de_fortune_p,' || "RP_HABFOR_P" || ',
					cases_traditionnelles_p,' || "RP_CASE_P" || ',
					maisons_ou_immeubles_en_bois_p,' || "RP_MIBOIS_P" || ',
					maisons_ou_immeubles_en_dur_p,' || "RP_MIDUR_P",
				E'[\t\n\r]','','g') AS data
	FROM insee.rp_logements_import
)
INSERT INTO insee.donnees_communes("annee","fk_base","donnees", "code_commune")
SELECT
	   2020,
	   3,
	   jsonb_object(string_to_array(data::text,',')),
	   "CODGEO"
FROM d
ORDER BY "CODGEO"
