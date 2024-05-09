-- DROP DATABASE IF EXISTS parcours;
CREATE SCHEMA parcours AUTHORIZATION sa;
	
CREATE TABLE IF NOT EXISTS attributs
(
    id VARCHAR(255)  NOT NULL,
    titre VARCHAR(255)  NOT NULL,
    description VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    type character varying  NOT NULL DEFAULT 'double, float, date, int, boolean,  String, ',
    optionnel boolean,
    valeurpardefaut VARCHAR(255) ,
    CONSTRAINT attributs_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS constituer
(
    id_document VARCHAR(255)  NOT NULL,
    id_attribut VARCHAR(255)  NOT NULL,
    CONSTRAINT constituer_pkey PRIMARY KEY (id_document, id_attribut)
);

CREATE TABLE IF NOT EXISTS documents
(
    id VARCHAR(255) NOT NULL,
    titre VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    type VARCHAR(255),
    etat BOOLEAN,
    afficherUnite BOOLEAN,
    afficherDistributeur BOOLEAN,
    prixEditable BOOLEAN,
    accentRessource BOOLEAN,
    afficherPrix VARCHAR(25),
    datecreation DATE,
    datemodification DATE,
    CONSTRAINT documents_pkey PRIMARY KEY (id)
);

CREATE TABLE category (
    id_category VARCHAR PRIMARY KEY,
    ordre VARCHAR(255),
    libelle VARCHAR(255),
    id_documents VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_documents) REFERENCES documents(id)
);

CREATE TABLE associer (
    id_attribut VARCHAR NOT NULL,
    id_category VARCHAR NOT NULL,
    obligatoire boolean,
    ordre INT ,
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

CREATE TABLE taches(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    codeuniq VARCHAR NOT NULL UNIQUE,
    etat boolean,
    datecreation date,
    datemodification date
);

CREATE TABLE mission (
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    taches_fk VARCHAR NOT NULL,
    FOREIGN KEY (taches_fk) REFERENCES taches(id)
);

CREATE TABLE precomouvements(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    type VARCHAR(25)
);

CREATE TABLE precomouvementsqte(
    id VARCHAR NOT NULL PRIMARY KEY,
    qteMin int,
    qteMax int,
    montantMin int ,
    montantMax int,
    id_precomouvements VARCHAR NOT NULL ,
    FOREIGN KEY (id_precomouvements) REFERENCES precomouvements(id)
);

CREATE TABLE IF NOT EXISTS suivre
(
    id_document VARCHAR(255)  NOT NULL,
    id_precomouvements VARCHAR NOT NULL,
    CONSTRAINT suivre_pkey PRIMARY KEY (id_document, id_precomouvements)
);