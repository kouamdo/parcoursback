-- DROP DATABASE IF EXISTS exemplaire;
CREATE SCHEMA exemplaire AUTHORIZATION sa;

CREATE TABLE exemplaire.ordreetats
(
    id               VARCHAR(255) NOT NULL,
    datecreation     Date,
    datemodification Date,
    datefinvote      Date,
    ordre            INTEGER,
    etats_id         VARCHAR(255),
    exemplaire_id     VARCHAR(255),
    CONSTRAINT pk_ordreetats PRIMARY KEY (id)
);

CREATE TABLE exemplaire.mouvements
(
    id               VARCHAR(255) NOT NULL,
    description      VARCHAR(255) NOT NULL,
    quantite         INTEGER,
    prix             DOUBLE PRECISION,
    datecreation     Date NOT NULL,
    dateperemption   Date,
    datemodification Date,
    ressources_id    VARCHAR(255),
    distributeurs_id VARCHAR(255),
    exemplaires_id   VARCHAR(255),
    CONSTRAINT pk_mouvements PRIMARY KEY (id)
);

CREATE TABLE exemplaire.respecterprecomouvement
(
    mouvements_id      VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255)
);

CREATE TABLE exemplaire.violerprecomouvement
(
    mouvements_id      VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255)
);

CREATE TABLE exemplaire.exemplaires
(
    id                 VARCHAR(255) NOT NULL,
    code               VARCHAR(255),
    codebarre          VARCHAR(255),
    titre              VARCHAR(255),
    datecreation       Date NOT NULL,
    datemodification   Date,
    personnerbeneficiaire VARCHAR(255),
    personnerattachee VARCHAR(255),
    CONSTRAINT pk_exemplaires PRIMARY KEY (id)
);

CREATE TABLE exemplaire.exemplairesattributs
(
    exemplaires_id   VARCHAR(255)                        NOT NULL,
    attribut_id      VARCHAR(255),
    valeur           VARCHAR(255),
    datecreation     Date NOT NULL,
    datemodification Date
);

CREATE TABLE exemplaire.exemplairesparents
(
    exemplaires_id VARCHAR(255) NOT NULL,
    id             VARCHAR(255)
);

CREATE TABLE exemplaire.personnesdestinataires
(
    exemplaires_id VARCHAR(255) NOT NULL,
    personneid     VARCHAR(255),
    dateenvoi      Date,
    methodeenvoi   VARCHAR(255)
);

ALTER TABLE exemplaire.exemplairesattributs
    ADD CONSTRAINT fk_exemplairesattributs_on_exemplaires_entity FOREIGN KEY (exemplaires_id) REFERENCES exemplaire.exemplaires (id);

ALTER TABLE exemplaire.exemplairesparents
    ADD CONSTRAINT fk_exemplairesparents_on_exemplaires_entity FOREIGN KEY (exemplaires_id) REFERENCES exemplaire.exemplaires (id);

ALTER TABLE exemplaire.personnesdestinataires
    ADD CONSTRAINT fk_personnesdestinataires_on_exemplaires_entity FOREIGN KEY (exemplaires_id) REFERENCES exemplaire.exemplaires (id);

ALTER TABLE exemplaire.mouvements
    ADD CONSTRAINT FK_MOUVEMENTS_ON_EXEMPLAIRES FOREIGN KEY (exemplaires_id) REFERENCES exemplaire.exemplaires (id);

ALTER TABLE exemplaire.respecterprecomouvement
    ADD CONSTRAINT fk_respecterprecomouvement_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES exemplaire.mouvements (id);

ALTER TABLE exemplaire.violerprecomouvement
    ADD CONSTRAINT fk_violerprecomouvement_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES exemplaire.mouvements (id);

ALTER TABLE exemplaire.ordreetats
    ADD CONSTRAINT FK_ORDREETATS_ON_EXEMPLAIREID FOREIGN KEY (exemplaireid) REFERENCES exemplaire.exemplaires (id);