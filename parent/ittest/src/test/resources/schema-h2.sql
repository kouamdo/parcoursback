-- DROP DATABASE IF EXISTS parcours;
CREATE SCHEMA parcours AUTHORIZATION sa;
	
CREATE TABLE IF NOT EXISTS attributs
(
    id character varying  NOT NULL,
    titre character varying  NOT NULL,
    description character varying ,
    etat boolean,
    datecreation date,
    datemodification date,
    type character varying  NOT NULL DEFAULT 'double, float, date, int, boolean,  String, ',
    optionnel boolean,
    valeurpardefaut character varying ,
    CONSTRAINT attributs_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS constituer
(
    id_document character varying  NOT NULL,
    id_attribut character varying  NOT NULL,
    CONSTRAINT constituer_pkey PRIMARY KEY (id_document, id_attribut)
);

CREATE TABLE IF NOT EXISTS documents
(
    id character varying  NOT NULL,
    titre character varying  NOT NULL,
    description character varying ,
    etat boolean,
    datecreation date,
    datemodification date,
    CONSTRAINT documents_pkey PRIMARY KEY (id)
);

CREATE TABLE category (
    id_category INT PRIMARY KEY,
    ordre VARCHAR(255),
    libelle VARCHAR(255),
    id_documents character varying  NOT NULL,
    FOREIGN KEY (id_documents) REFERENCES documents(id)
);

CREATE TABLE associer (
    id_attribut character varying  NOT NULL,
    id_category INT NOT NULL,
    PRIMARY KEY (id_attribut, id_category),
    FOREIGN KEY (id_attribut) REFERENCES attributs(id),
    FOREIGN KEY (id_category) REFERENCES category(id_category)
);

ALTER TABLE IF EXISTS constituer
    ADD CONSTRAINT document_fk FOREIGN KEY (id_document)
    REFERENCES documents (id) ;


ALTER TABLE IF EXISTS constituer
    ADD CONSTRAINT id_attribut FOREIGN KEY (id_attribut)
    REFERENCES attributs (id) ;