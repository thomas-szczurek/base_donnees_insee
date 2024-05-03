CREATE TABLE insee.appartenance_zonages (
	pk_id int4 GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	code_admin_parent text NOT NULL,
	code_admin_enfant text NOT NULL,
	annee_debut_validite int2 NOT NULL,
	annee_fin_validite int2,
	CONSTRAINT fk_zonage_parent FOREIGN KEY (code_admin_parent) REFERENCES insee.codes_admin (code_admin) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_zonage_enfant FOREIGN KEY (code_admin_enfant) REFERENCES insee.codes_admin (code_admin) ON DELETE NO ACTION ON UPDATE CASCADE
);
