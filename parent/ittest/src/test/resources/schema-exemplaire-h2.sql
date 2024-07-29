-- DROP DATABASE IF EXISTS exemplaire;
CREATE SCHEMA exemplaire AUTHORIZATION sa;

CREATE TABLE ordreetats
(
    id               VARCHAR(255) NOT NULL,
    datecreation     DATE,
    datemodification DATE,
    datefinvote      DATE,
    ordre            INTEGER,
    etatsId         VARCHAR(255),
    exemplaires_id   VARCHAR(255),
    CONSTRAINT pk_ordreetats PRIMARY KEY (id)
);
CREATE TABLE mouvements
(
    id               VARCHAR(255) NOT NULL,
    description      VARCHAR(255) NOT NULL,
    quantite         INTEGER,
    prix             DOUBLE PRECISION,
    datecreation     DATE NOT NULL,
    dateperemption   DATE ,
    datemodification DATE,
    ressourcesId    VARCHAR(255),
    distributeursId VARCHAR(255),
    exemplaires_id   VARCHAR(255),
    CONSTRAINT pk_mouvements PRIMARY KEY (id)
);

CREATE TABLE respecterprecomouvement
(
    mouvements_id      VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255) NOT NULL
);

CREATE TABLE violerprecomouvement
(
    mouvements_id      VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255) NOT NULL
);

ALTER TABLE ordreetats
    ADD CONSTRAINT FK_EXEMPLAIRES_ON_ORDREETATS FOREIGN KEY (exemplaires_id) REFERENCES exemplaires (id);
ALTER TABLE mouvements
    ADD CONSTRAINT FK_EXEMPLAIRES_ON_MOUVEMENTS FOREIGN KEY (exemplaires_id) REFERENCES exemplaires (id);
