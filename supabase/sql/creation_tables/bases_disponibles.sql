CREATE TABLE insee.bases_disponibles (
	pk_id int4 GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fk_base int2 NOT NULL,
	annee int2 NOT NULL,
	lien_http text NOT NULL,
	metadonnees text NOT NULL
	notes text,
	CONSTRAINT fk_bases_dispo FOREIGN KEY (fk_base) REFERENCES insee.bases (pk_id) ON UPDATE CASCADE ON DELETE CASCADE
);