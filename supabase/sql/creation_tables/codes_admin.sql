CREATE TABLE insee.codes_admin (
	pk_id int4 PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code_commune text UNIQUE NOT NULL,
	CONSTRAINT fk_zonage_code FOREIGN KEY (code_commune) REFERENCES insee.zonages_administratifs (code_admin) ON UPDATE NO ACTION ON DELETE NO ACTION
);
