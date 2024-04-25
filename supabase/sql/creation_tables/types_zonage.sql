CREATE TABLE
  insee.types_zonage (
    pk_id int2 PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nom text NOT NULL
  ) tablespace pg_default;