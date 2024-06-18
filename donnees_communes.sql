BEGIN;
CREATE TABLE insee.donnees_communes (
	pk_id int4 GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	code_commune text NOT NULL,
	annee int2 NOT NULL,
	fk_base int2 NOT NULL,
	donnees jsonb NOT NULL,
	CONSTRAINT fk_donnees_communes FOREIGN KEY (code_commune) REFERENCES insee.codes_admin (code_admin) ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT fk_donnees_bases FOREIGN KEY (fk_base) REFERENCES insee.bases (pk_id) ON UPDATE CASCADE ON DELETE CASCADE
	CONSTRAINT unique_annee_fk_base_com UNIQUE (annee, fk_base, code_commune)
) PARTITION BY LIST (fk_base);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (1);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (2);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (3);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (4);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (5);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (6);
CREATE TABLE insee.donnees_communes_fk_1 PARTITION OF insee.donnees_communes FOR VALUES IN (7);
END;
