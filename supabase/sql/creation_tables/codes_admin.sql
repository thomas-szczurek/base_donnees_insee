CREATE TABLE insee.codes_admin (
	pk_id int4 PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code_admin text UNIQUE NOT NULL
);
