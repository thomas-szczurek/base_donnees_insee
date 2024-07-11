## maj plugin

### imports

#### 1 : Rp Population

RAS

#### 2 : Rp Ménages

pour les esions pré 2016 retirer

pop_15_ans_plus_mariee_p,' || "POP15P_MARIEE_P" || ',
pop_15_ans_plus_pacsee_p,' || "POP15P_PACSEE_P" || ',
pop_15_ans_plus_concubinage_union_libre_p,' || "POP15P_CONCUB_UNION_LIBRE_P" || ',
pop_15_ans_plus_veufs_veuves_p,' || "POP15P_VEUFS_P" || ',
pop_15_ans_divorces_p,' || "POP15P_DIVORCEE_P" || ',
pop_15_ans_celibataires_p,' || "POP15P_CELIBATAIRE_P" || ',

Et ajouter

pop_15_ans_plus_non_mariee_p,' || "POP15P_NONMARIEE_P" || ',


#### 5 : Rp Activité des résidents

Pour les vesions pré 2016 retirer :

chomeurs_15_64_ans_p,' || "CHOM1564_P" || ',
chomeurs_15_24_ans_p,' || "CHOM1524_P" || ',
chomeurs_25_54_ans_p,' || "CHOM2554_P" || ',
chomeurs_55_64_ans_p,' || "CHOM55P_P" || ',
inactifs_15_64_ans_p,' || "INACT1564_P" || ',
chomeurs_sans_diplome_ou_cep_p,' || "CHOM_DIPLMIN_P" || ',
chomeurs_bepc_p,' || "CHOM_BEPC_P" || ',
chomeurs_cap_bep_p,' || "CHOM_CAPBEP_P" || ',
chomeurs_bac_p,' || "CHOM_BAC_P" || ',
chomeurs_bac_plus_2_p,' || "CHOM_SUP2_P" || ',
chomeurs_bac_plus_3_4_p,' || "CHOM_SUP34_P" || ',
chomeurs_bac_plus_5_ou_sup_p,' || "CHOM_SUP5_P" || ',
actifs_sans_diplome_ou_cep_p,' || "ACT_DIPLMIN_P" || ',
actifs_bepc_p,' || "ACT_BEPC_P" || ',
actifs_cap_bep_p,' || "ACT_CAPBEP_P" || ',
actifs_bac_p,' || "ACT_BAC_P" || ',
actifs_bac_plus_2_p,' || "ACT_SUP2_P" || ',
actifs_bac_plus_3_4_p,' || "ACT_SUP34_P" || ',
actifs_bac_plus_5_ou_sup_p,' || "ACT_SUP5_P" || '

### maj tables cross_donnees

1) sur subapase
    - Importer les données dans la table
    - maj la tables correspondance_clefs_champs, codes_admin et zonages_administratifs
2) En local

```sql
BEGIN;
REFRESH MATERIALIZED VIEW local.bases_disponibles;
REFRESH MATERIALIZED VIEW local.codes_admin;
REFRESH MATERIALIZED VIEW local.appartenance_zonages;
REFRESH MATERIALIZED VIEW local.zonages_administratifs;
REFRESH MATERIALIZED VIEW local.correspondance_clefs_champs;
REFRESH MATERIALIZED VIEW local.donnees_communes;
END;
```

Puis

```sql
REFRESH MATERIALIZED VIEW local.resence_clefs_annees;
```

Placer cette table dans supabase

```sql
UPDATE insee.correspondance_clefs_champs
SET premiere_annee_presence =
	(
	SELECT pr.premiere_annee_presence
	FROM insee.presence_clefs_annees AS pr
	WHERE
		correspondance_clefs_champs.fk_base = pr.fk_base AND
		correspondance_clefs_champs.clef_json = pr.clef_json
		),
    derniere_annee_presence =
	(
	SELECT pr.derniere_annee_presence
	FROM insee.presence_clefs_annees AS pr
	WHERE
		correspondance_clefs_champs.fk_base = pr.fk_base AND
		correspondance_clefs_champs.clef_json = pr.clef_json
		);
```

revenir en local

```sql
REFRESH MATERIALIZED VIEW local.correspondance_clefs_champs
```

On actualise cette table deux fois. Une première pour mettre à pour les clefs présentes après potentielle insertion des nouvelles. Puis une seconde pour mettre à jour les dates à partir de la table donnees_communes mise à jour en local.

Enfin

```sql
REFRESH MATEREIALIZED VIEW
```

Puis avec psql

> \copy (SELECT * FROM local.cross_donnees_fk_2 WHERE annee = *new_millesime*) TO 'destination/cross_donnees_fk_2.csv';

3 )

Toujours avec psql

> \copy public.cross_donnees_fk_2 FROM 'destination/cross_donnees_fk_2.csv';
