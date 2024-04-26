CREATE TABLE insee.donnees_communes (
	pk_id int4 GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	code_commune int4 NOT NULL,
	annee int2 NOT NULL,
	fk_base int2 NOT NULL,
	donnees jsonb NOT NULL,
	CONSTRAINT fk_donnees_communes FOREIGN KEY (code_commune) REFERENCES insee.codes_admin (code_admin) ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT fk_donnees_bases FOREIGN KEY (fk_base) REFERENCES insee.bases (pk_id) ON UPDATE CASCADE ON DELETE CASCADE
); 