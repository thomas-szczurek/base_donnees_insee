WITH d AS (
	SELECT "CODGEO",
		   regexp_replace('nb_menages_c,' || "MEN_C" || ',
						menages_pers_seule_c,' || "MENPSEUL_C" || ',
						menages_hommes_seuls_c,' || "MENHSEUL_C" || ',
						menages_femme_seules_c,' || "MENFSEUL_C" || ',
						menages_autres_sans_familles_c,' || "MENSFAM_C" || ',
						menages_avec_famille_c,' || "MENFAM_C" || ',
						menages_couples_sans_enfants,' || "MENCOUPSENF_C" || ',
						menages_couples_avec_enfants,' || "MENCOUPAENF_C" || ',
						menages_monoparentaux_c,' || "MENFAMMONO_C" || ',
						population_menages_c,' || "PMEN_C" || ',
						pop_menages_pers_seules_c,' || "PMEN_MENPSEUL_C" || ',
						pop_menages_hommes_seuls_c,' || "PMEN_MENHSEUL_C" || ',
						pop_menages_femmes_seules_c,' || "PMEN_MENFSEUL_C" || ',
						pop_menages_autres_sans_famille_c,' || "PMEN_MENSFAM_C" || ',
						pop_menages_avec_famille_c,' || "PMEN_MENFAM_C" || ',
						pop_menages_couples_sans_enfants_c,' || "PMEN_MENCOUPSENF_C" || ',
						pop_menages_couples_avec_enfants_c,' || "PMEN_MENCOUPAENF_C" || ',
						pop_menages_monoparentaux_c,' || "PMEN_MENFAMMONO_C" || ',
						pop_15_ans_plus_p,' || "POP15P_P" || ',
						pop_15_19_ans_p,' || "POP1519_P" || ',
						pop_20_24_ans_p,' || "POP2024_P" || ',
						pop_25_39_ans_p,' || "POP2539_P" || ',
						pop_40_54_ans_p,' || "POP4054_P" || ',
						pop_55_64_ans_p,' || "POP5564_P" || ',
						pop_65_79_ans_p,' || "POP6579_P" || ',
						pop_80_ans_plus_p,' || "POP80P_P" || ',
						pop_menages_15_19_ans_p,' || "POPMEN1519_P" || ',
						pop_menages_20_24_ans_p,' || "POPMEN2024_P" || ',						
						pop_menages_25_39_ans_p,' || "POPMEN2539_P" || ',
						pop_menages_40_54_ans_p,' || "POPMEN4054_P" || ',
						pop_menages_55_64_ans_p,' || "POPMEN5564_P" || ',
						pop_menages_65_79_ans_p,' || "POPMEN6579_P" || ',
						pop_menages_80_ans_plus_p,' || "POPMEN80P_P" || ',
						pop_15_19_ans_seule_p,' || "POP1519_PSEUL_P" || ',
						pop_20_24_ans_seule_p,' || "POP2024_PSEUL_P" || ',
						pop_25_39_ans_seule_p,' || "POP2539_PSEUL_P" || ',
						pop_40_54_ans_seule_p,' || "POP4054_PSEUL_P" || ',
						pop_55_64_ans_seule_p,' || "POP5564_PSEUL_P" || ',
						pop_65_79_ans_seule_p,' || "POP6579_PSEUL_P" || ',
						pop_80_ans_plus_seule_p,' || "POP80P_PSEUL_P" || ',
						pop_15_19_ans_couple_p,' || "POP1519_COUPLE_P" || ',
						pop_20_24_ans_couple_p,' || "POP2024_COUPLE_P" || ',
						pop_25_39_ans_couple_p,' || "POP2539_COUPLE_P" || ',
						pop_40_54_ans_couple_p,' || "POP4054_COUPLE_P" || ',
						pop_55_64_ans_couple_p,' || "POP5564_COUPLE_P" || ',
						pop_65_79_ans_couple_p,' || "POP6579_COUPLE_P" || ',
						pop_80_ans_plus_couple_p,' || "POP80P_COUPLE_P" || ',
						pop_15_ans_plus_mariee_p,' || "POP15P_MARIEE_P" || ',
						pop_15_ans_plus_pacsee_p,' || "POP15P_PACSEE_P" || ',
						pop_15_ans_plus_concubinage_union_libre_p,' || "POP15P_CONCUB_UNION_LIBRE_P" || ',
						pop_15_ans_plus_veufs_veuves_p,' || "POP15P_VEUFS_P" || ',
						pop_15_ans_divorces_p,' || "POP15P_DIVORCEE_P" || ',
						pop_15_ans_celibataires_p,' || "POP15P_CELIBATAIRE_P" || ',
						menages_pers_ref_agriculteur_c,' || "MEN_CS1_C" || ',
						menages_pers_ref_artisant_commercant_chef_entreprise_c,' || "MEN_CS2_C" || ',
						menages_pers_ref_cadres_prof_int_sup_c,' || "MEN_CS3_C" || ',
						menages_pers_ref_profession_intermediaire_c,' || "MEN_CS4_C" || ',
						menages_pers_ref_employes_c,' || "MEN_CS5_C" || ',
						menages_pers_ref_ouvriers_c,' || "MEN_CS6_C" || ',
						menages_pers_ref_retraites_c,' || "MEN_CS7_C" || ',
						menages_pers_ref_autres_c,' || "MEN_CS8_C" || ',
						pop_menages_pers_ref_agriculteur_c,' || "PMEN_CS1_C" || ',
						pop_menages_pers_ref_artisant_commercant_chef_entreprise_c,' || "PMEN_CS2_C" || ',
						pop_menages_pers_ref_cadres_prof_int_sup_c,' || "PMEN_CS3_C" || ',
						pop_menages_pers_ref_profession_intermediaire_c,' || "PMEN_CS4_C" || ',
						pop_menages_pers_ref_employes_c,' || "PMEN_CS5_C" || ',
						pop_menages_pers_ref_ouvriers_c,' || "PMEN_CS6_C" || ',
						pop_menages_pers_ref_retraites_c,' || "PMEN_CS7_C" || ',
						pop_menages_pers_ref_autres_c,' || "PMEN_CS8_C" || ',
						nb_familles_c,' || "FAM_C" || ',
						familles_couples_avec_enfants_c,' || "COUPAENF_C" || ',
						familles_monoparentales_c,' || "FAMMONO_C" || ',
						familles_monoparentales_hommes_c,' || "HMONO_C" || ',
						familles_monoparentales_femmes_c,' || "FMONO_C" || ',
						familles_couples_sans_enfants_c,' || "COUPSENF_C" || ',
						familles_0_enfants_moins_25ans_c,' || "NE24F0_C" || ',
						familles_1_enfants_moins_25ans_c,' || "NE24F1_C" || ',
						familles_2_enfants_moins_25ans_c,' || "NE24F2_C" || ',
						familles_3_enfants_moins_25ans_c,' || "NE24F3_C" || ',
						familles_4_ou_plus_enfants__moins_25ans_c,' || "NE24F4P_C",
					E'[\t\n\r]','','g') AS data
	FROM insee.rp_menage_import
)
INSERT INTO insee.donnees_communes("annee","fk_base","donnees", "code_commune")
SELECT
	   2020,
	   2,
	   jsonb_object(string_to_array(data::text,',')),
	   "CODGEO"
FROM d
ORDER BY "CODGEO"
