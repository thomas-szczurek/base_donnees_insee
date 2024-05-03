CREATE TABLE insee.appartenance_zonages (
	pk_id int4 GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fk_zonage_parent int4 NOT NULL,
	fk_zonage_enfant int4 NOT NULL,
	annee_debut_validite int2 NOT NULL,
	annee_fin_validite int2,
	CONSTRAINT fk_zonage_parent FOREIGN KEY (fk_zonage_parent) REFERENCES insee.zonages_administratifs (pk_id) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_zonage_enfant FOREIGN KEY (fk_zonage_enfant) REFERENCES insee.zonages_administratifs (pk_id) ON DELETE NO ACTION ON UPDATE CASCADE
);
