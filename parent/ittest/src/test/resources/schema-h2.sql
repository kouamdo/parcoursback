-- DROP DATABASE IF EXISTS parcours;
CREATE SCHEMA parcours AUTHORIZATION sa;
-- generate tables from entities
CREATE TABLE IF NOT EXISTS  attributs
(
    id               VARCHAR(255)         NOT NULL,
    titre            VARCHAR(255) NOT NULL,
    description      VARCHAR(255),
    etat             BOOLEAN DEFAULT TRUE,
    datecreation     DATE,
    datemodification DATE,
    type             VARCHAR(255) NOT NULL,
    valeurpardefaut  VARCHAR(255),
    CONSTRAINT pk_attributs PRIMARY KEY (id)
);
CREATE TABLE categories
(
    id               VARCHAR(255) NOT NULL,
    ordre            VARCHAR(255),
    libelle          VARCHAR(255),
    etat             BOOLEAN DEFAULT TRUE,
    datecreation     DATE,
    datemodification DATE,
    documents_id     VARCHAR(255),
    CONSTRAINT pk_categories PRIMARY KEY (id)
);
CREATE TABLE associer
(
    obligatoire   BOOLEAN,
    ordre         INTEGER,
    attributs_id  VARCHAR(255) NOT NULL,
    categories_id VARCHAR(255) NOT NULL,
    CONSTRAINT pk_associer PRIMARY KEY (attributs_id, categories_id)
);
CREATE TABLE concerner
(
    distributeurs_id       VARCHAR(255) NOT NULL,
    precomouvementsqtes_id VARCHAR(255) NOT NULL
);

CREATE TABLE distributeurs
(
    distributeurs_id VARCHAR(255) NOT NULL,
    datemodification DATE,
    code             VARCHAR(255),
    raisonsociale    VARCHAR(255),
    CONSTRAINT pk_distributeurs PRIMARY KEY (distributeurs_id)
);

CREATE TABLE constituer
(
    attributs_id VARCHAR(255) NOT NULL,
    documents_id VARCHAR(255) NOT NULL
);

CREATE TABLE documents
(
    id                   VARCHAR(255)         NOT NULL,
    titre                VARCHAR(255) NOT NULL,
    description          VARCHAR(255),
    etat                 BOOLEAN,
    datecreation         DATE,
    datemodification     DATE,
    typemouvement        VARCHAR(255),
    afficherprix         VARCHAR(255),
    afficherunite        BOOLEAN,
    afficherdistributeur BOOLEAN,
    prixeditable         BOOLEAN,
    contientressources   BOOLEAN,
    CONSTRAINT pk_documents PRIMARY KEY (id)
);
CREATE TABLE suivre
(
    documents_id       VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255) NOT NULL
);
CREATE TABLE etats
(
    id               VARCHAR(255) NOT NULL,
    libelle          VARCHAR(255),
    description      VARCHAR(255),
    datecreation     DATE,
    datemodification DATE,
    CONSTRAINT pk_etats PRIMARY KEY (id)
);
CREATE TABLE etapes
(
    id               VARCHAR(255) NOT NULL,
    libelle          VARCHAR(255),
    etat             VARCHAR(255),
    datemodification DATE,
    parcours_id      VARCHAR(255),
    CONSTRAINT pk_etapes PRIMARY KEY (id)
);
CREATE TABLE familles
(
    id               VARCHAR(255) NOT NULL,
    libelle          VARCHAR(255),
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     DATE,
    datemodification DATE,
    CONSTRAINT pk_familles PRIMARY KEY (id)
);

CREATE TABLE sapplique
(
    familles_id            VARCHAR(255) NOT NULL,
    precomouvementsqtes_id VARCHAR(255) NOT NULL
);
CREATE TABLE filesattentes
(
    id               VARCHAR(255) NOT NULL,
    datecreation     DATE,
    datemodification DATE,
    etat             BOOLEAN,
    services_id      VARCHAR(255),
    CONSTRAINT pk_filesattentes PRIMARY KEY (id)
);
CREATE TABLE jouerroles
(
    id               VARCHAR(255) NOT NULL,
    etat             BOOLEAN,
    datecreation     DATE,
    datemodification DATE,
    datefin          DATE,
    datedebut        DATE,
    personnels_id    VARCHAR(255),
    roles_id         VARCHAR(255),
    CONSTRAINT pk_jouerroles PRIMARY KEY (id)
);
CREATE TABLE missions
(
    id               VARCHAR(255)                        NOT NULL,
    libelle          VARCHAR(255)                NOT NULL,
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     DATE NOT NULL,
    datemodification DATE,
    services_id      VARCHAR(255),
    CONSTRAINT pk_missions PRIMARY KEY (id)
);

CREATE TABLE traiter
(
    documents_id VARCHAR(255) NOT NULL,
    missions_id  VARCHAR(255) NOT NULL
);
CREATE TABLE mouvements
(
    id               VARCHAR(255)                        NOT NULL,
    description      VARCHAR(255)                NOT NULL,
    quantite         INTEGER,
    prix             DOUBLE PRECISION,
    datecreation     DATE NOT NULL,
    dateperemption   DATE ,
    datemodification DATE,
    ressources_id    VARCHAR(255),
    distributeurs_id VARCHAR(255),
    CONSTRAINT pk_mouvements PRIMARY KEY (id)
);

CREATE TABLE respecter
(
    mouvements_id      VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255) NOT NULL
);

CREATE TABLE violer
(
    mouvements_id      VARCHAR(255) NOT NULL,
    precomouvements_id VARCHAR(255) NOT NULL
);
CREATE TABLE ordreetats
(
    id               VARCHAR(255) NOT NULL,
    datecreation     DATE,
    datemodification DATE,
    datefinvote      DATE,
    ordre            INTEGER,
    etats_id         VARCHAR(255),
    CONSTRAINT pk_ordreetats PRIMARY KEY (id)
);
CREATE TABLE parcours
(
    id               VARCHAR(255) NOT NULL,
    libelle          VARCHAR(255),
    datecreation     DATE,
    datemodification DATE,
    CONSTRAINT pk_parcours PRIMARY KEY (id)
);
CREATE TABLE personnels
(
    id               VARCHAR(255) NOT NULL,
    dateentree       DATE,
    nom              VARCHAR(255),
    datenaissance    DATE,
    telephone        VARCHAR(255),
    datesortie       DATE,
    email            VARCHAR(255),
    prenom           VARCHAR(255),
    sexe             VARCHAR(255),
    datemodification DATE,
    CONSTRAINT pk_personnels PRIMARY KEY (id)
);
CREATE TABLE personnes
(
    id               VARCHAR(255) NOT NULL,
    adresse          VARCHAR(255),
    mail             VARCHAR(255),
    telephone        VARCHAR(255),
    qrcodevalue      VARCHAR(255),
    datecreation     DATE NOT NULL,
    datemodification DATE,
    CONSTRAINT pk_personnes PRIMARY KEY (id)
);

CREATE TABLE rattacher
(
    personnes_id VARCHAR(255) NOT NULL,
    rattacher_id VARCHAR(255) NOT NULL
);
CREATE TABLE personnesmorales
(
    personnesmorales_id VARCHAR(255) NOT NULL,
    raisonsociale       VARCHAR(255),
    code                VARCHAR(255),
    datemodification    DATE,
    CONSTRAINT pk_personnesmorales PRIMARY KEY (personnesmorales_id)
);
CREATE TABLE personnesphysique
(
    personnesphysique_id VARCHAR(255)         NOT NULL,
    nom                  VARCHAR(255) NOT NULL,
    prenom               VARCHAR(255),
    sexe                 VARCHAR(255),
    datenaissance        date         NOT NULL,
    datemodification     DATE,
    CONSTRAINT pk_personnesphysique PRIMARY KEY (personnesphysique_id)
);
CREATE TABLE precomouvements
(
    id               VARCHAR(255)         NOT NULL,
    libelle          VARCHAR(255) NOT NULL,
    etat             BOOLEAN,
    datecreation     date         NOT NULL,
    datemodification date,
    typemouvement    VARCHAR(255),
    CONSTRAINT pk_precomouvements PRIMARY KEY (id)
);
CREATE TABLE precomouvementsqtes
(
    id                 VARCHAR(255) NOT NULL,
    qtemin             INTEGER,
    qtemax             INTEGER,
    montantmin         DOUBLE PRECISION,
    montantmax         DOUBLE PRECISION,
    datecreation       DATE,
    datemodification   DATE,
    precomouvements_id VARCHAR(255) NOT NULL,
    ressources_id      VARCHAR(255),
    CONSTRAINT pk_precomouvementsqtes PRIMARY KEY (id)
);
CREATE TABLE documentspromotions
(
    documents_id  VARCHAR(255) NOT NULL,
    promotions_id VARCHAR(255) NOT NULL
);

CREATE TABLE famillespromotions
(
    familles_id   VARCHAR(255) NOT NULL,
    promotions_id VARCHAR(255) NOT NULL
);

CREATE TABLE promotions
(
    id                      VARCHAR(255) NOT NULL,
    datedebut               DATE,
    datefin                 DATE,
    codeunique              VARCHAR(255),
    typeremise              VARCHAR(255),
    valeurremise            DOUBLE PRECISION,
    datecreation            DATE,
    datemodification        DATE,
    distributeurs_id VARCHAR(255),
    CONSTRAINT pk_promotions PRIMARY KEY (id)
);
CREATE TABLE remplir
(
    datefin        DATE,
    datecreation   DATE,
    datedebut      DATE,
    etat           BOOLEAN,
    droitajouter   BOOLEAN,
    droitmodifier  BOOLEAN,
    droitconsulter BOOLEAN,
    droitvalider   BOOLEAN,
    roles_id       VARCHAR(255) NOT NULL,
    missions_id    VARCHAR(255) NOT NULL,
    CONSTRAINT pk_remplir PRIMARY KEY (roles_id, missions_id)
);
CREATE TABLE ressources
(
    id               VARCHAR(255) NOT NULL,
    libelle          VARCHAR(255),
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     DATE,
    datemodification DATE,
    quantite         INTEGER,
    seuilalerte      INTEGER,
    prixentree       DOUBLE PRECISION,
    prixsortie       DOUBLE PRECISION,
    unite            VARCHAR(255),
    familles_id      VARCHAR(255),
    CONSTRAINT pk_ressources PRIMARY KEY (id)
);

CREATE TABLE ressourcespromotions
(
    promotions_id VARCHAR(255) NOT NULL,
    ressources_id VARCHAR(255) NOT NULL
);
CREATE TABLE roles
(
    id               VARCHAR(255) NOT NULL,
    titre            VARCHAR(255),
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     DATE,
    datemodification DATE,
    CONSTRAINT pk_roles PRIMARY KEY (id)
);
CREATE TABLE services
(
    id               VARCHAR(255)         NOT NULL,
    description      VARCHAR(255),
    libelle          VARCHAR(255),
    localisation     VARCHAR(255),
    etat             BOOLEAN,
    datecreation     DATE,
    datemodification DATE,
    codeunique       VARCHAR(255) NOT NULL,
    filesattentes_id VARCHAR(255),
    CONSTRAINT pk_services PRIMARY KEY (id)
);
CREATE TABLE tickets
(
    id               VARCHAR(255) NOT NULL,
    codecourt        VARCHAR(255),
    datecreation     DATE,
    datemodification DATE,
    CONSTRAINT pk_tickets PRIMARY KEY (id)
);
CREATE TABLE ticketsfilesattentes
(
    id               VARCHAR(255) NOT NULL,
    etat             BOOLEAN,
    dateaffectation  DATE,
    tickets_id       VARCHAR(255),
    filesattentes_id VARCHAR(255),
    CONSTRAINT pk_ticketsfilesattentes PRIMARY KEY (id)
);
CREATE TABLE validations
(
    id               VARCHAR(255) NOT NULL,
    code             VARCHAR(255),
    etat             VARCHAR(255),
    datecreation     DATE,
    datemodification DATE,
    typevote         VARCHAR(255),
    dureevote        INTEGER,
    typevalidation   VARCHAR(255),
    roles_id         VARCHAR(255),
    CONSTRAINT pk_validations PRIMARY KEY (id)
);
CREATE TABLE docetats
(
    id                          VARCHAR(255) NOT NULL,
    ordre                       INTEGER,
    datecreation                DATE,
    datemodification            DATE,
    validations_id              VARCHAR(255),
    etats_id                    VARCHAR(255),
    documents_id                VARCHAR(255),
    etapes_id                   VARCHAR(255),
    CONSTRAINT pk_docetats PRIMARY KEY (id)
);
CREATE TABLE docetats_predecesseurs
(
    docetats_id       VARCHAR(255) NOT NULL,
    predecesseur_id VARCHAR(255) NOT NULL,
    CONSTRAINT pk_docetats_predecesseurs PRIMARY KEY (docetats_id, predecesseur_id)
);

ALTER TABLE docetats_predecesseurs
    ADD CONSTRAINT FK_DOCETATS_PREDECESSEURS_ON_DOCETATS FOREIGN KEY (docetats_id) REFERENCES docetats (id);
ALTER TABLE docetats_predecesseurs
    ADD CONSTRAINT FK_DOCETATS_PREDECESSEURS_SUIVANT_ON_DOCETATS FOREIGN KEY (predecesseur_id) REFERENCES docetats (id);

ALTER TABLE docetats
    ADD CONSTRAINT FK_DOCETATS_ON_DOCUMENTS FOREIGN KEY (documents_id) REFERENCES documents (id);

ALTER TABLE docetats
    ADD CONSTRAINT FK_DOCETATS_ON_ETAPES FOREIGN KEY (etapes_id) REFERENCES etapes (id);

ALTER TABLE docetats
    ADD CONSTRAINT FK_DOCETATS_ON_ETATS FOREIGN KEY (etats_id) REFERENCES etats (id);

ALTER TABLE docetats
    ADD CONSTRAINT FK_DOCETATS_ON_VALIDATIONS FOREIGN KEY (validations_id) REFERENCES validations (id);
ALTER TABLE validations
    ADD CONSTRAINT FK_VALIDATIONS_ON_ROLES FOREIGN KEY (roles_id) REFERENCES roles (id);
ALTER TABLE ticketsfilesattentes
    ADD CONSTRAINT FK_TICKETSFILESATTENTES_ON_FILESATTENTES FOREIGN KEY (filesattentes_id) REFERENCES filesattentes (id);

ALTER TABLE ticketsfilesattentes
    ADD CONSTRAINT FK_TICKETSFILESATTENTES_ON_TICKETS FOREIGN KEY (tickets_id) REFERENCES tickets (id);
ALTER TABLE services
    ADD CONSTRAINT uc_services_codeunique UNIQUE (codeunique);

ALTER TABLE services
    ADD CONSTRAINT uc_services_filesattentes UNIQUE (filesattentes_id);

ALTER TABLE services
    ADD CONSTRAINT FK_SERVICES_ON_FILESATTENTES FOREIGN KEY (filesattentes_id) REFERENCES filesattentes (id);
ALTER TABLE ressources
    ADD CONSTRAINT FK_RESSOURCES_ON_FAMILLES FOREIGN KEY (familles_id) REFERENCES familles (id);

ALTER TABLE ressourcespromotions
    ADD CONSTRAINT fk_res_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES promotions (id);

ALTER TABLE ressourcespromotions
    ADD CONSTRAINT fk_res_on_ressources_entity FOREIGN KEY (ressources_id) REFERENCES ressources (id);
ALTER TABLE remplir
    ADD CONSTRAINT FK_REMPLIR_ON_MISSIONS FOREIGN KEY (missions_id) REFERENCES missions (id);

ALTER TABLE remplir
    ADD CONSTRAINT FK_REMPLIR_ON_ROLES FOREIGN KEY (roles_id) REFERENCES roles (id);
ALTER TABLE promotions
    ADD CONSTRAINT uc_promotions_codeunique UNIQUE (codeunique);

ALTER TABLE promotions
    ADD CONSTRAINT FK_PROMOTIONS_ON_DISTRIBUTEURS_ENTITY FOREIGN KEY (distributeurs_id) REFERENCES distributeurs (distributeurs_id);

ALTER TABLE documentspromotions
    ADD CONSTRAINT fk_doc_on_documents_entity FOREIGN KEY (documents_id) REFERENCES documents (id);

ALTER TABLE documentspromotions
    ADD CONSTRAINT fk_doc_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES promotions (id);

ALTER TABLE famillespromotions
    ADD CONSTRAINT fk_fam_on_familles_entity FOREIGN KEY (familles_id) REFERENCES familles (id);

ALTER TABLE famillespromotions
    ADD CONSTRAINT fk_fam_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES promotions (id);
ALTER TABLE precomouvementsqtes
    ADD CONSTRAINT FK_PRECOMOUVEMENTSQTES_ON_PRECOMOUVEMENTS FOREIGN KEY (precomouvements_id) REFERENCES precomouvements (id);

ALTER TABLE precomouvementsqtes
    ADD CONSTRAINT FK_PRECOMOUVEMENTSQTES_ON_RESSOURCES FOREIGN KEY (ressources_id) REFERENCES ressources (id);
ALTER TABLE personnesphysique
    ADD CONSTRAINT FK_PERSONNESPHYSIQUE_ON_PERSONNESPHYSIQUE FOREIGN KEY (personnesphysique_id) REFERENCES personnes (id);

ALTER TABLE rattacher
    ADD CONSTRAINT fk_rattacher_on_personnes FOREIGN KEY (personnes_id) REFERENCES personnes (id);

ALTER TABLE rattacher
    ADD CONSTRAINT fk_rattacher_on_personnes_bis FOREIGN KEY (rattacher_id) REFERENCES personnes (id);

ALTER TABLE personnesmorales
    ADD CONSTRAINT FK_PERSONNESMORALES_ON_PERSONNESMORALES FOREIGN KEY (personnesmorales_id) REFERENCES personnes (id);

--ALTER TABLE rattacher
--    ADD CONSTRAINT fk_rattacher_on_personnes FOREIGN KEY (personnes_id) REFERENCES personnes (id);
--ALTER TABLE rattacher
--    ADD CONSTRAINT fk_rattacher_on_personnes FOREIGN KEY (personnes_id) REFERENCES personnes (id);
ALTER TABLE ordreetats
    ADD CONSTRAINT FK_ORDREETATS_ON_ETATS FOREIGN KEY (etats_id) REFERENCES etats (id);
ALTER TABLE mouvements
    ADD CONSTRAINT FK_MOUVEMENTS_ON_DISTRIBUTEURS FOREIGN KEY (distributeurs_id) REFERENCES distributeurs (distributeurs_id);

ALTER TABLE mouvements
    ADD CONSTRAINT FK_MOUVEMENTS_ON_RESSOURCES FOREIGN KEY (ressources_id) REFERENCES ressources (id);

ALTER TABLE respecter
    ADD CONSTRAINT fk_respecter_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES mouvements (id);

ALTER TABLE respecter
    ADD CONSTRAINT fk_respecter_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES precomouvements (id);

ALTER TABLE violer
    ADD CONSTRAINT fk_violer_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES mouvements (id);

ALTER TABLE violer
    ADD CONSTRAINT fk_violer_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES precomouvements (id);
ALTER TABLE missions
    ADD CONSTRAINT FK_MISSIONS_ON_SERVICES FOREIGN KEY (services_id) REFERENCES services (id);

ALTER TABLE traiter
    ADD CONSTRAINT fk_traiter_on_documents_entity FOREIGN KEY (documents_id) REFERENCES documents (id);

ALTER TABLE traiter
    ADD CONSTRAINT fk_traiter_on_missions_entity FOREIGN KEY (missions_id) REFERENCES missions (id);
ALTER TABLE jouerroles
    ADD CONSTRAINT FK_JOUERROLES_ON_PERSONNELS FOREIGN KEY (personnels_id) REFERENCES personnels (id);

ALTER TABLE jouerroles
    ADD CONSTRAINT FK_JOUERROLES_ON_ROLES FOREIGN KEY (roles_id) REFERENCES roles (id);
ALTER TABLE filesattentes
    ADD CONSTRAINT uc_filesattentes_services UNIQUE (services_id);

ALTER TABLE filesattentes
    ADD CONSTRAINT FK_FILESATTENTES_ON_SERVICES FOREIGN KEY (services_id) REFERENCES services (id);

ALTER TABLE sapplique
    ADD CONSTRAINT fk_sapplique_on_familles_entity FOREIGN KEY (familles_id) REFERENCES familles (id);

ALTER TABLE sapplique
    ADD CONSTRAINT fk_sapplique_on_preco_mouvements_qtes_entity FOREIGN KEY (precomouvementsqtes_id) REFERENCES precomouvementsqtes (id);
ALTER TABLE etapes
    ADD CONSTRAINT FK_ETAPES_ON_PARCOURS FOREIGN KEY (parcours_id) REFERENCES parcours (id);
ALTER TABLE constituer
    ADD CONSTRAINT fk_con_on_attributs_entity FOREIGN KEY (attributs_id) REFERENCES attributs (id);

ALTER TABLE constituer
    ADD CONSTRAINT fk_con_on_documents_entity FOREIGN KEY (documents_id) REFERENCES documents (id);

ALTER TABLE suivre
    ADD CONSTRAINT fk_suivre_on_documents_entity FOREIGN KEY (documents_id) REFERENCES documents (id);

ALTER TABLE suivre
    ADD CONSTRAINT fk_suivre_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES precomouvements (id);
ALTER TABLE distributeurs
    ADD CONSTRAINT FK_DISTRIBUTEURS_ON_DISTRIBUTEURS FOREIGN KEY (distributeurs_id) REFERENCES personnes (id);

ALTER TABLE concerner
    ADD CONSTRAINT fk_concerner_on_distributeurs_entity FOREIGN KEY (precomouvementsqtes_id) REFERENCES distributeurs (distributeurs_id);

ALTER TABLE concerner
    ADD CONSTRAINT fk_concerner_on_preco_mouvements_qtes_entity FOREIGN KEY (distributeurs_id) REFERENCES precomouvementsqtes (id);

ALTER TABLE associer
    ADD CONSTRAINT FK_ASSOCIER_ON_ATTRIBUTS FOREIGN KEY (attributs_id) REFERENCES attributs (id);

ALTER TABLE associer
    ADD CONSTRAINT FK_ASSOCIER_ON_CATEGORIES FOREIGN KEY (categories_id) REFERENCES categories (id);

ALTER TABLE categories
    ADD CONSTRAINT FK_CATEGORIES_ON_DOCUMENTS FOREIGN KEY (documents_id) REFERENCES documents (id);