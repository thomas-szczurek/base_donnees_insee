CREATE TABLE insee.zonages_administratifs (
    	pk_id int4 PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code_admin text NOT NULL,
   	nom text NOT NULL,
	fk_type int2 NOT NULL,
	annee_debut_validite int2 NOT NULL,
	annee_fin_validite int2 NOT NULL,
	geom geometry(POLYGON, 2154),
	CONSTRAINT fk_type_zonage FOREIGN KEY (fk_type) REFERENCES insee.types_zonage (pk_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_zonage_code FOREIGN KEY (code_admin) REFERENCES insee.codes_admin (code_admin) ON UPDATE NO ACTION ON DELETE NO ACTION
  );
