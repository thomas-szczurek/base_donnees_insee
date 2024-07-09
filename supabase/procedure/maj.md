## maj plugin

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
