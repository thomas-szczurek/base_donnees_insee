## maj plugin

### maj tables cross_donnees

1) sur subapase
    - Importer les données dans la table
    - maj la tables correspondance_clefs_champs, codes_admin et zonages_administratifs
2) En local

```sql
BEGIN;
REFRESH MATERIALIZED VIEW local.codes_admin;
REFRESH MATERIALIZED VIEW local.zonages_administratifs;
REFRESH MATERIALIZED VIEW local.correspondance_clefs_champs;
REFRESH MATERIALIZED VIEW local.cross_donnees_fk_2;
END;
```

Puis avec psql

> \copy (SELECT * FROM local.cross_donnees_fk_2 WHERE annee = *new_millesime*) TO 'destination/cross_donnees_fk_2.csv';

3 )

Toujours avec psql

> \copy public.cross_donnees_fk_2 FROM 'destination/cross_donnees_fk_2.csv';
