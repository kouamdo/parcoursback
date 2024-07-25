-- DROP DATABASE IF EXISTS parcours;
CREATE SCHEMA parcours AUTHORIZATION sa;
-- generate tables from entities
CREATE TABLE IF NOT EXISTS attributs
(
    id               UUID         NOT NULL,
    titre            VARCHAR(255) NOT NULL,
    description      VARCHAR(255),
    etat             BOOLEAN DEFAULT TRUE,
    datecreation     DATE,
    datemodification DATE,
    type             VARCHAR(255) NOT NULL,
    valeurpardefaut  VARCHAR(255),
    CONSTRAINT pk_attributs PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS categories
(
    id               UUID NOT NULL,
    ordre            VARCHAR(255),
    libelle          VARCHAR(255),
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    documents_id     UUID,
    CONSTRAINT pk_categories PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS associer
(
    obligatoire   BOOLEAN,
    ordre         INTEGER,
    attributs_id  UUID NOT NULL,
    categories_id UUID NOT NULL,
    CONSTRAINT pk_associer PRIMARY KEY (attributs_id, categories_id)
);
CREATE TABLE IF NOT EXISTS concerner
(
    distributeurs_id       UUID NOT NULL,
    precomouvementsqtes_id UUID NOT NULL
);

CREATE TABLE IF NOT EXISTS distributeurs
(
    distributeurs_id UUID NOT NULL,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    code             VARCHAR(255),
    raisonsociale    VARCHAR(255),
    CONSTRAINT pk_distributeurs PRIMARY KEY (distributeurs_id)
);

CREATE TABLE IF NOT EXISTS constituer
(
    attributs_id UUID NOT NULL,
    documents_id UUID NOT NULL
);

CREATE TABLE IF NOT EXISTS documents
(
    id                   UUID         NOT NULL,
    titre                VARCHAR(255) NOT NULL,
    description          VARCHAR(255),
    etat                 BOOLEAN,
    datecreation         TIMESTAMP WITHOUT TIME ZONE,
    datemodification     TIMESTAMP WITHOUT TIME ZONE,
    typemouvement        VARCHAR(255),
    afficherprix         VARCHAR(255),
    afficherunite        BOOLEAN,
    afficherdistributeur BOOLEAN,
    prixeditable         BOOLEAN,
    contientressources   BOOLEAN,
    CONSTRAINT pk_documents PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS suivre
(
    documents_id       UUID NOT NULL,
    precomouvements_id UUID NOT NULL
);
CREATE TABLE IF NOT EXISTS etats
(
    id               UUID NOT NULL,
    libelle          VARCHAR(255),
    description      VARCHAR(255),
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_etats PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS etapes
(
    id               UUID NOT NULL,
    libelle          VARCHAR(255),
    etat             VARCHAR(255),
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    parcours_id      UUID,
    CONSTRAINT pk_etapes PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS familles
(
    id               UUID NOT NULL,
    libelle          VARCHAR(255),
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_familles PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS sapplique
(
    familles_id            UUID NOT NULL,
    precomouvementsqtes_id UUID NOT NULL
);
CREATE TABLE IF NOT EXISTS filesattentes
(
    id               UUID NOT NULL,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    etat             BOOLEAN,
    services_id      UUID,
    CONSTRAINT pk_filesattentes PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS jouerroles
(
    id               UUID NOT NULL,
    etat             BOOLEAN,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    datefin          TIMESTAMP WITHOUT TIME ZONE,
    datedebut        TIMESTAMP WITHOUT TIME ZONE,
    personnels_id    UUID,
    roles_id         UUID,
    CONSTRAINT pk_jouerroles PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS missions
(
    id               UUID                        NOT NULL,
    libelle          VARCHAR(255)                NOT NULL,
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    services_id      UUID,
    CONSTRAINT pk_missions PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS traiter
(
    documents_id UUID NOT NULL,
    missions_id  UUID NOT NULL
);
CREATE TABLE IF NOT EXISTS mouvements
(
    id               UUID                        NOT NULL,
    description      VARCHAR(255)                NOT NULL,
    quantite         INTEGER,
    prix             DOUBLE PRECISION,
    datecreation     TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    dateperemption   TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    ressources_id    UUID,
    distributeurs_id UUID,
    CONSTRAINT pk_mouvements PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS respecter
(
    mouvements_id      UUID NOT NULL,
    precomouvements_id UUID NOT NULL
);

CREATE TABLE IF NOT EXISTS violer
(
    mouvements_id      UUID NOT NULL,
    precomouvements_id UUID NOT NULL
);
CREATE TABLE IF NOT EXISTS ordreetats
(
    id               UUID NOT NULL,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    datefinvote      TIMESTAMP WITHOUT TIME ZONE,
    ordre            INTEGER,
    etats_id         UUID,
    CONSTRAINT pk_ordreetats PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS parcours
(
    id               UUID NOT NULL,
    libelle          VARCHAR(255),
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_parcours PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS personnels
(
    id               UUID NOT NULL,
    dateentree       TIMESTAMP WITHOUT TIME ZONE,
    nom              VARCHAR(255),
    datenaissance    TIMESTAMP WITHOUT TIME ZONE,
    telephone        VARCHAR(255),
    datesortie       TIMESTAMP WITHOUT TIME ZONE,
    email            VARCHAR(255),
    prenom           VARCHAR(255),
    sexe             VARCHAR(255),
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_personnels PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS personnes
(
    id               UUID NOT NULL,
    adresse          VARCHAR(255),
    mail             VARCHAR(255),
    telephone        VARCHAR(255),
    qrcodevalue      VARCHAR(255),
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_personnes PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS rattacher
(
    personnes_id UUID NOT NULL
);
CREATE TABLE IF NOT EXISTS personnesmorales
(
    personnesmorales_id UUID NOT NULL,
    raisonsociale       VARCHAR(255),
    code                VARCHAR(255),
    datemodification    TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_personnesmorales PRIMARY KEY (personnesmorales_id)
);
CREATE TABLE IF NOT EXISTS personnesphysique
(
    personnesphysique_id UUID         NOT NULL,
    nom                  VARCHAR(255) NOT NULL,
    prenom               VARCHAR(255),
    sexe                 VARCHAR(255),
    datenaissance        date         NOT NULL,
    datemodification     TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_personnesphysique PRIMARY KEY (personnesphysique_id)
);
CREATE TABLE IF NOT EXISTS precomouvements
(
    id               UUID         NOT NULL,
    libelle          VARCHAR(255) NOT NULL,
    etat             BOOLEAN,
    datecreation     date         NOT NULL,
    datemodification date,
    typemouvement    VARCHAR(255),
    CONSTRAINT pk_precomouvements PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS precomouvementsqtes
(
    id                 UUID NOT NULL,
    qtemin             INTEGER,
    qtemax             INTEGER,
    montantmin         DOUBLE PRECISION,
    montantmax         DOUBLE PRECISION,
    datecreation       TIMESTAMP WITHOUT TIME ZONE,
    datemodification   TIMESTAMP WITHOUT TIME ZONE,
    precomouvements_id UUID NOT NULL,
    ressources_id      UUID,
    CONSTRAINT pk_precomouvementsqtes PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS documentspromotions
(
    documents_id  UUID NOT NULL,
    promotions_id UUID NOT NULL
);

CREATE TABLE IF NOT EXISTS famillespromotions
(
    familles_id   UUID NOT NULL,
    promotions_id UUID NOT NULL
);

CREATE TABLE IF NOT EXISTS promotions
(
    id                      UUID NOT NULL,
    datedebut               TIMESTAMP WITHOUT TIME ZONE,
    datefin                 TIMESTAMP WITHOUT TIME ZONE,
    codeunique              VARCHAR(255),
    typeremise              VARCHAR(255),
    valeurremise            DOUBLE PRECISION,
    datecreation            TIMESTAMP WITHOUT TIME ZONE,
    datemodification        TIMESTAMP WITHOUT TIME ZONE,
    distributeurs_entity_id UUID,
    CONSTRAINT pk_promotions PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS remplir
(
    datefin        TIMESTAMP WITHOUT TIME ZONE,
    datecreation   TIMESTAMP WITHOUT TIME ZONE,
    datedebut      TIMESTAMP WITHOUT TIME ZONE,
    etat           BOOLEAN,
    droitajouter   BOOLEAN,
    droitmodifier  BOOLEAN,
    droitconsulter BOOLEAN,
    droitvalider   BOOLEAN,
    roles_id       UUID NOT NULL,
    missions_id    UUID NOT NULL,
    CONSTRAINT pk_remplir PRIMARY KEY (roles_id, missions_id)
);
CREATE TABLE IF NOT EXISTS ressources
(
    id               UUID NOT NULL,
    libelle          VARCHAR(255),
    etat             BOOLEAN,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    quantite         INTEGER,
    seuilalerte      INTEGER,
    prixentree       DOUBLE PRECISION,
    prixsortie       DOUBLE PRECISION,
    unite            VARCHAR(255),
    familles_id      UUID,
    CONSTRAINT pk_ressources PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ressourcespromotions
(
    promotions_id UUID NOT NULL,
    ressources_id UUID NOT NULL
);
CREATE TABLE IF NOT EXISTS roles
(
    id               UUID NOT NULL,
    titre            VARCHAR(255),
    description      VARCHAR(255),
    etat             BOOLEAN,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_roles PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS services
(
    id               UUID         NOT NULL,
    description      VARCHAR(255),
    libelle          VARCHAR(255),
    localisation     VARCHAR(255),
    etat             BOOLEAN,
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    codeunique       VARCHAR(255) NOT NULL,
    filesattentes_id UUID,
    CONSTRAINT pk_services PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS tickets
(
    id               UUID NOT NULL,
    codecourt        VARCHAR(255),
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_tickets PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS ticketsfilesattentes
(
    id               UUID NOT NULL,
    etat             BOOLEAN,
    dateaffectation  TIMESTAMP WITHOUT TIME ZONE,
    tickets_id       UUID,
    filesattentes_id UUID,
    CONSTRAINT pk_ticketsfilesattentes PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS validations
(
    id               UUID NOT NULL,
    code             VARCHAR(255),
    etat             VARCHAR(255),
    datecreation     TIMESTAMP WITHOUT TIME ZONE,
    datemodification TIMESTAMP WITHOUT TIME ZONE,
    typevote         VARCHAR(255),
    dureevote        INTEGER,
    typevalidation   VARCHAR(255),
    roles_id         UUID,
    CONSTRAINT pk_validations PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS docetats
(
    id                          UUID NOT NULL,
    ordre                       INTEGER,
    datecreation                TIMESTAMP WITHOUT TIME ZONE,
    datemodification            TIMESTAMP WITHOUT TIME ZONE,
    validations_id              UUID,
    doc_etats_courant_entity_id UUID,
    etats_id                    UUID,
    documents_id                UUID,
    etapes_id                   UUID,
    CONSTRAINT pk_docetats PRIMARY KEY (id)
);

ALTER TABLE docetats
    ADD CONSTRAINT FK_DOCETATS_ON_DOCUMENTS FOREIGN KEY (documents_id) REFERENCES documents (id);

ALTER TABLE docetats
    ADD CONSTRAINT FK_DOCETATS_ON_DOC_ETATS_COURANT_ENTITY FOREIGN KEY (doc_etats_courant_entity_id) REFERENCES docetats (id);

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
    ADD CONSTRAINT FK_PROMOTIONS_ON_DISTRIBUTEURS_ENTITY FOREIGN KEY (distributeurs_entity_id) REFERENCES distributeurs (distributeurs_id);

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