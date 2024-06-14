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
    valeurpardefaut VARCHAR(255) ,
    CONSTRAINT attributs_pkey PRIMARY KEY (id)
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

CREATE TABLE IF NOT EXISTS constituer
(
    documents_id VARCHAR(255)  NOT NULL,
    attributs_id VARCHAR(255)  NOT NULL,
    CONSTRAINT constituer_pkey PRIMARY KEY (documents_id, attributs_id),
    FOREIGN KEY (documents_id) REFERENCES documents(id),
    FOREIGN KEY (attributs_id) REFERENCES attributs(id)
);

CREATE TABLE IF NOT EXISTS categories (
    id VARCHAR PRIMARY KEY,
    ordre VARCHAR(255),
    libelle VARCHAR(255),
    documents_id VARCHAR(255) NOT NULL,
    datecreation DATE,
    datemodification DATE,
    FOREIGN KEY (documents_id) REFERENCES documents(id)
);

CREATE TABLE IF NOT EXISTS associer (
    attributs_id VARCHAR NOT NULL,
    categories_id VARCHAR NOT NULL,
    obligatoire boolean,
    ordre INT ,
    PRIMARY KEY (attributs_id, categories_id),
    FOREIGN KEY (attributs_id) REFERENCES attributs(id),
    FOREIGN KEY (categories_id) REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS services (
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    codeunique VARCHAR NOT NULL UNIQUE,
    localisation VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    filesattentes_id VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS missions (
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    services_id VARCHAR  NULL,
    FOREIGN KEY (services_id) REFERENCES services(id)
);

CREATE TABLE IF NOT EXISTS familles
(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    description VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date
    );

CREATE TABLE IF NOT EXISTS ressources(
    id VARCHAR NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    quantite int,
    seuilalerte int,
    prixentree double,
    prixsortie double,
    unite VARCHAR(15),
    familles_id VARCHAR NULL,
    FOREIGN KEY (familles_id) REFERENCES familles(id)
    );

CREATE TABLE IF NOT EXISTS precomouvements(
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    libelle VARCHAR(255) ,
    etat boolean,
    datecreation date,
    datemodification date,
    typemouvement VARCHAR(255)
    );

CREATE TABLE IF NOT EXISTS precomouvementsqtes(
      id VARCHAR NOT NULL PRIMARY KEY,
      qtemin int,
      qtemax int,
      montantmin int ,
      montantmax int,
      precomouvements_id VARCHAR NOT NULL ,
      ressources_id VARCHAR NULL,
      datecreation date,
      datemodification date,
      FOREIGN KEY (precomouvements_id) REFERENCES precomouvements(id),
      FOREIGN KEY (ressources_id) REFERENCES ressources(id)
    );

ALTER TABLE ressources ADD CONSTRAINT ressources_familles_fk FOREIGN KEY (familles_id) REFERENCES familles(id);

CREATE TABLE IF NOT EXISTS sapplique
(
    familles_id VARCHAR(255)  NOT NULL,
    precomouvementsqtes_id VARCHAR NOT NULL,
    CONSTRAINT sapplique_pkey PRIMARY KEY (familles_id, precomouvementsqtes_id),
    CONSTRAINT familles_precomouvements_fk FOREIGN KEY (familles_id)  REFERENCES familles(id),
    CONSTRAINT precomouvementsqtes_familles_fk FOREIGN KEY (precomouvementsqtes_id) REFERENCES precomouvementsqtes(id)
    );

CREATE TABLE IF NOT EXISTS suivre
(
    documents_id VARCHAR(255)  NOT NULL,
    precomouvements_id VARCHAR NOT NULL,
    CONSTRAINT suivre_pkey PRIMARY KEY (documents_id, precomouvements_id),
    CONSTRAINT documents_precomouvements_fk FOREIGN KEY (documents_id)  REFERENCES documents(id),
    CONSTRAINT precomouvements_documents_fk FOREIGN KEY (precomouvements_id) REFERENCES precomouvements(id)
);

CREATE TABLE IF NOT EXISTS traiter
(
    id_document VARCHAR(255)  NOT NULL,
    id_mission VARCHAR(255)  NOT NULL,
    CONSTRAINT traiter_pkey PRIMARY KEY (id_document, id_mission),
    CONSTRAINT documents_missions_fk FOREIGN KEY (id_document)  REFERENCES documents(id),
    CONSTRAINT missions_documents_fk FOREIGN KEY (id_mission) REFERENCES missions(id)
);

CREATE TABLE personnes (
    id VARCHAR(255) NOT NULL,
    adresse VARCHAR(255),
    mail VARCHAR(255),
    telephone VARCHAR(255),
    qrcodevalue VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE personnes_morale (
    personnesmorale_id VARCHAR(255) NOT NULL,
    raisonsociale VARCHAR(255),
    code VARCHAR(255),
    PRIMARY KEY (personnesmorale_id),
    FOREIGN KEY (personnesmorale_id) REFERENCES personnes(id)
);

CREATE TABLE personnes_physique (
    personnesphysique_id VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255),
    sexe VARCHAR(255),
    datenaissance DATE NOT NULL,
    PRIMARY KEY (personnesphysique_id),
    FOREIGN KEY (personnesphysique_id) REFERENCES personnes(id)
);

CREATE TABLE distributeurs (
    distributeurs_id VARCHAR(255) NOT NULL,
    code VARCHAR(255),
    raisonsociale VARCHAR(255),
    PRIMARY KEY (distributeurs_id),
    FOREIGN KEY (distributeurs_id) REFERENCES personnes(id)
);

CREATE TABLE IF NOT EXISTS mouvements(
    id VARCHAR NOT NULL PRIMARY KEY,
    description VARCHAR(255) ,
    qte int,
    prix double,
    datecreation date,
    dateperemption date,
    ressources_id VARCHAR(255)  NOT NULL,
    distributeurs_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (distributeurs_id) REFERENCES distributeurs(distributeurs_id),
    FOREIGN KEY (ressources_id) REFERENCES ressources(id)
);

CREATE TABLE IF NOT EXISTS roles (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    titre VARCHAR(255),
    description TEXT,
    etat BOOLEAN,
    datecreation DATE
);

CREATE TABLE IF NOT EXISTS personnels (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    dateentree DATE,
    nom VARCHAR(255),
    datenaissance DATE,
    telephone VARCHAR(255),
    datesortie DATE,
    email VARCHAR(255),
    prenom VARCHAR(255),
    sexe VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS jouerroles (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    etat BOOLEAN,
    datecreation DATE,
    datefin DATE,
    datedebut DATE,
    personnels_id VARCHAR(255),
    roles_id VARCHAR(255),
    FOREIGN KEY (personnels_id) REFERENCES personnels(id),
    FOREIGN KEY (roles_id) REFERENCES roles(id)
);

CREATE TABLE IF NOT EXISTS etats (
    id VARCHAR(255) NOT NULL,
    libelle VARCHAR(255),
    datecreation DATE,
    description TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ordreetats (
    id VARCHAR(255) NOT NULL,
    datecreation DATE,
    ordre INT,
    etats_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (etats_id) REFERENCES etats(id)
);
CREATE TABLE IF NOT EXISTS validations (
    id VARCHAR(255) NOT NULL,
    code VARCHAR(255),
    etat VARCHAR(255),
    datecreation DATE,
    roles_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (roles_id) REFERENCES roles(id)
);

CREATE TABLE IF NOT EXISTS parcours (
    id VARCHAR(255) NOT NULL,
    libelle VARCHAR(255),
    datecreation DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS etapes (
    id VARCHAR(255) NOT NULL,
    libelle VARCHAR(255),
    etat VARCHAR(255),
    PRIMARY KEY (id),
    parcours_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (parcours_id) REFERENCES parcours(id)
);

CREATE TABLE IF NOT EXISTS docetats (
    id VARCHAR(255) NOT NULL,
    ordre INT,
    datecreation DATE,
    validations_id VARCHAR(255),
    documents_id VARCHAR(255),
    predecesseurDocEtat_id VARCHAR(255),
    etats_id VARCHAR(255),
    etapes_id VARCHAR(255) ,
    PRIMARY KEY (id),
    FOREIGN KEY (documents_id) REFERENCES documents(id),
    FOREIGN KEY (validations_id) REFERENCES validations(id),
    FOREIGN KEY (predecesseurDocEtat_id) REFERENCES docetats(id),
    FOREIGN KEY (etats_id) REFERENCES etats(id),
    FOREIGN KEY (etapes_id) REFERENCES etapes(id)
);

CREATE TABLE IF NOT EXISTS mouvpreco (
    id_precomouvements VARCHAR(255)  NOT NULL,
    id_mouvements VARCHAR(255)  NOT NULL,
    CONSTRAINT mouvpreco_pkey PRIMARY KEY (id_precomouvements, id_mouvements),
    CONSTRAINT precomouvements_mouvements_fk FOREIGN KEY (id_precomouvements)  REFERENCES precomouvements(id),
    CONSTRAINT mouvements_precomouvements_fk FOREIGN KEY (id_mouvements) REFERENCES mouvements(id)
);

CREATE TABLE IF NOT EXISTS livrer (
    precomouvementsqtes_id VARCHAR(255)  NOT NULL,
    distributeurs_id VARCHAR(255)  NOT NULL,
    CONSTRAINT livrer_pkey PRIMARY KEY (precomouvementsqtes_id, distributeurs_id),
    CONSTRAINT precomouvementsqtes_distributeurs_fk FOREIGN KEY (precomouvementsqtes_id)  REFERENCES precomouvementsqtes(id),
    CONSTRAINT distributeurs_precomouvementsqtes_fk FOREIGN KEY (distributeurs_id) REFERENCES distributeurs(distributeurs_id)
);

CREATE TABLE IF NOT EXISTS filesattentes
(
    id VARCHAR(255) NOT NULL,
    datecreation DATE,
    etat boolean,
    services_id VARCHAR(255),
    CONSTRAINT filesattentes_pk PRIMARY KEY (id),
    CONSTRAINT services_fk FOREIGN KEY (services_id) REFERENCES services(id)
);

CREATE TABLE IF NOT EXISTS tickets (
    id VARCHAR(255) NOT NULL,
    codecourt VARCHAR(255),
    CONSTRAINT tickets_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ticketsfilesattentes (
    id VARCHAR(255) NOT NULL,
    etat boolean,
    dateaffectation DATE,
    tickets_id VARCHAR(255) NOT NULL ,
    filesattentes_id VARCHAR(255) NOT NULL ,
    CONSTRAINT ticket_fk FOREIGN KEY (tickets_id) REFERENCES tickets(id),
    CONSTRAINT filesattentes_fk FOREIGN KEY (filesattentes_id) REFERENCES filesattentes(id),
    CONSTRAINT ticketsfilesattentes_pk PRIMARY KEY (id)
);

ALTER TABLE services ADD CONSTRAINT filesattentes_service_fk FOREIGN KEY (filesattentes_id) REFERENCES filesattentes(id);

CREATE TABLE IF NOT EXISTS remplir (
    roles_id VARCHAR(255),
    missions_id VARCHAR,
    datefin DATE,
    datecreation DATE,
    datedebut DATE,
    etat BOOLEAN,
    droitajouter BOOLEAN,
    droitmodifier BOOLEAN,
    droitconsulter BOOLEAN,
    droitvalider BOOLEAN,
    PRIMARY KEY (roles_id, missions_id),
    FOREIGN KEY (roles_id) REFERENCES roles(id),
    FOREIGN KEY (missions_id) REFERENCES missions(id)
);
