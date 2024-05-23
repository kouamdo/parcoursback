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

CREATE TABLE IF NOT EXISTS precomouvements(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    type VARCHAR(25)
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
    typemouvement VARCHAR(255),
    etat BOOLEAN,
    afficherunite BOOLEAN,
    afficherdistributeur BOOLEAN,
    prixeditable BOOLEAN,
    contientressources BOOLEAN,
    afficherprix VARCHAR(25),
    datecreation DATE,
    datemodification DATE,
    CONSTRAINT documents_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS category (
    id_category VARCHAR PRIMARY KEY,
    ordre VARCHAR(255),
    libelle VARCHAR(255),
    id_documents VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_documents) REFERENCES documents(id)
);

CREATE TABLE IF NOT EXISTS associer (
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

CREATE TABLE IF NOT EXISTS service(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    codeuniq VARCHAR NOT NULL UNIQUE,
    etat boolean,
    datecreation date,
    datemodification date
);

CREATE TABLE IF NOT EXISTS mission (
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    id_tache VARCHAR NOT NULL,
    FOREIGN KEY (id_tache) REFERENCES service(id)
);

CREATE TABLE IF NOT EXISTS ressources(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    quantite int,
    prix double,
    unite VARCHAR(15),
    id_familles VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS precomouvementsqte(
    id VARCHAR NOT NULL PRIMARY KEY,
    qteMin int,
    qteMax int,
    montantMin int ,
    montantMax int,
    id_precomouvements VARCHAR NOT NULL ,
    id_ressources VARCHAR NOT NULL,
    FOREIGN KEY (id_precomouvements) REFERENCES precomouvements(id),
    FOREIGN KEY (id_ressources) REFERENCES ressources(id)
);

CREATE TABLE IF NOT EXISTS familles
(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    etat boolean,
    datecreation date,
    id_precomouvementsqte VARCHAR NOT NULL ,
    FOREIGN KEY (id_precomouvementsqte) REFERENCES precomouvementsqte(id)
);

ALTER TABLE ressources
    ADD CONSTRAINT fk_familles FOREIGN KEY (id_familles) REFERENCES familles(id);

CREATE TABLE IF NOT EXISTS suivre
(
    id_document VARCHAR(255)  NOT NULL,
    id_precomouvements VARCHAR NOT NULL,
    CONSTRAINT suivre_pkey PRIMARY KEY (id_document, id_precomouvements)
);

CREATE TABLE IF NOT EXISTS traiter
(
    id_document VARCHAR(255)  NOT NULL,
    id_mission VARCHAR(255)  NOT NULL,
    CONSTRAINT traiter_pkey PRIMARY KEY (id_document, id_mission),
    CONSTRAINT documents_fk FOREIGN KEY (id_document)  REFERENCES documents(id),
    CONSTRAINT mission_fk FOREIGN KEY (id_mission) REFERENCES mission(id)
);