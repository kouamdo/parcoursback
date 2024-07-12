--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-12 16:41:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5092 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 5092
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 18989)
-- Name: associer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associer (
    attributs_id character varying NOT NULL,
    categories_id character varying NOT NULL,
    obligatoire boolean,
    ordre integer
);


ALTER TABLE public.associer OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18938)
-- Name: attributs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attributs (
    id character varying(255) NOT NULL,
    titre character varying(255) NOT NULL,
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    type character varying DEFAULT 'double, float, date, int, boolean,  String, '::character varying NOT NULL,
    valeurpardefaut character varying(255)
);


ALTER TABLE public.attributs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18977)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id character varying NOT NULL,
    ordre character varying(255),
    libelle character varying(255),
    documents_id character varying(255) NOT NULL,
    datecreation date,
    datemodification date
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18960)
-- Name: constituer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constituer (
    documents_id character varying(255) NOT NULL,
    attributs_id character varying(255) NOT NULL
);


ALTER TABLE public.constituer OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 19167)
-- Name: distributeurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distributeurs (
    distributeurs_id character varying(255) NOT NULL,
    code character varying(255),
    raisonsociale character varying(255),
    promotions_id character varying(255)
);


ALTER TABLE public.distributeurs OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 19287)
-- Name: docetats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docetats (
    id character varying(255) NOT NULL,
    ordre integer,
    datecreation date,
    validations_id character varying(255),
    documents_id character varying(255),
    predecesseurdocetat_id character varying(255),
    etats_id character varying(255),
    etapes_id character varying(255)
);


ALTER TABLE public.docetats OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 19411)
-- Name: documentpromotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentpromotion (
    promotions_id character varying(255) NOT NULL,
    documents_id character varying(255) NOT NULL
);


ALTER TABLE public.documentpromotion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18946)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id character varying(255) NOT NULL,
    titre character varying(255) NOT NULL,
    description character varying(255),
    typemouvement character varying(255),
    etat boolean,
    afficherunite boolean,
    afficherdistributeur boolean,
    prixeditable boolean,
    contientressources boolean,
    afficherprix character varying(25),
    datecreation date,
    datemodification date
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 19275)
-- Name: etapes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etapes (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    etat character varying(255),
    parcours_id character varying(255) NOT NULL
);


ALTER TABLE public.etapes OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 19237)
-- Name: etats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etats (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    datecreation date,
    description text
);


ALTER TABLE public.etats OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 19027)
-- Name: familles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.familles (
    id character varying NOT NULL,
    libelle character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    promotions_id character varying(255)
);


ALTER TABLE public.familles OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 19353)
-- Name: filesattentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filesattentes (
    id character varying(255) NOT NULL,
    datecreation date,
    etat boolean,
    services_id character varying(255)
);


ALTER TABLE public.filesattentes OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 19220)
-- Name: jouerroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jouerroles (
    id character varying(255) NOT NULL,
    etat boolean,
    datecreation date,
    datefin date,
    datedebut date,
    personnels_id character varying(255),
    roles_id character varying(255)
);


ALTER TABLE public.jouerroles OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 19336)
-- Name: livrer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livrer (
    precomouvementsqtes_id character varying(255) NOT NULL,
    distributeurs_id character varying(255) NOT NULL
);


ALTER TABLE public.livrer OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19015)
-- Name: missions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.missions (
    id character varying NOT NULL,
    libelle character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    services_id character varying
);


ALTER TABLE public.missions OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 19189)
-- Name: mouvements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mouvements (
    id character varying NOT NULL,
    description character varying(255),
    quantite integer,
    prix double precision,
    datecreation date,
    dateperemption date,
    ressources_id character varying(255) NOT NULL,
    distributeurs_id character varying(255) NOT NULL
);


ALTER TABLE public.mouvements OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 19319)
-- Name: mouvpreco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mouvpreco (
    id_precomouvements character varying(255) NOT NULL,
    id_mouvements character varying(255) NOT NULL
);


ALTER TABLE public.mouvpreco OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 19244)
-- Name: ordreetats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordreetats (
    id character varying(255) NOT NULL,
    datecreation date,
    ordre integer,
    etats_id character varying(255)
);


ALTER TABLE public.ordreetats OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 19268)
-- Name: parcours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcours (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    datecreation date
);


ALTER TABLE public.parcours OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 19213)
-- Name: personnels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnels (
    id character varying(255) NOT NULL,
    dateentree date,
    nom character varying(255),
    datenaissance date,
    telephone character varying(255),
    datesortie date,
    email character varying(255),
    prenom character varying(255),
    sexe character varying(255)
);


ALTER TABLE public.personnels OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 19448)
-- Name: personneratache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personneratache (
    personne_id character varying(255) NOT NULL,
    personneratache_id character varying(255) NOT NULL
);


ALTER TABLE public.personneratache OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 19136)
-- Name: personnes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnes (
    id character varying(255) NOT NULL,
    adresse character varying(255),
    mail character varying(255),
    telephone character varying(255),
    qrcodevalue character varying(255),
    promotions_id character varying(255)
);


ALTER TABLE public.personnes OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 19143)
-- Name: personnes_morale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnes_morale (
    personnesmorale_id character varying(255) NOT NULL,
    raisonsociale character varying(255),
    code character varying(255)
);


ALTER TABLE public.personnes_morale OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 19155)
-- Name: personnes_physique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnes_physique (
    personnesphysique_id character varying(255) NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255),
    sexe character varying(255),
    datenaissance date NOT NULL
);


ALTER TABLE public.personnes_physique OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19056)
-- Name: precomouvements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precomouvements (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    typemouvement character varying(255)
);


ALTER TABLE public.precomouvements OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19063)
-- Name: precomouvementsqtes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precomouvementsqtes (
    id character varying NOT NULL,
    qtemin integer,
    qtemax integer,
    montantmin integer,
    montantmax integer,
    precomouvements_id character varying NOT NULL,
    ressources_id character varying,
    datecreation date,
    datemodification date
);


ALTER TABLE public.precomouvementsqtes OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18953)
-- Name: promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotions (
    id character varying(255) NOT NULL,
    datedebut date,
    datefin date,
    codeunique character varying(255),
    montantremise double precision,
    pourcentageremise double precision,
    datecreation date,
    distributeurs_id character varying(255) NOT NULL
);


ALTER TABLE public.promotions OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 19394)
-- Name: remplir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remplir (
    roles_id character varying(255) NOT NULL,
    missions_id character varying NOT NULL,
    datefin date,
    datecreation date,
    datedebut date,
    etat boolean,
    droitajouter boolean,
    droitmodifier boolean,
    droitconsulter boolean,
    droitvalider boolean
);


ALTER TABLE public.remplir OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19039)
-- Name: ressources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ressources (
    id character varying NOT NULL,
    libelle character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    quantite integer,
    seuilalerte integer,
    prixentree double precision,
    prixsortie double precision,
    unite character varying(15),
    familles_id character varying,
    promotions_id character varying(255)
);


ALTER TABLE public.ressources OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 19206)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id character varying(255) NOT NULL,
    titre character varying(255),
    description text,
    etat boolean,
    datecreation date
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 19085)
-- Name: sapplique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sapplique (
    familles_id character varying(255) NOT NULL,
    precomouvementsqtes_id character varying NOT NULL
);


ALTER TABLE public.sapplique OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19006)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id character varying NOT NULL,
    libelle character varying(255),
    description character varying(255),
    codeunique character varying NOT NULL,
    localisation character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    filesattentes_id character varying(255)
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 19102)
-- Name: suivre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suivre (
    documents_id character varying(255) NOT NULL,
    precomouvements_id character varying NOT NULL
);


ALTER TABLE public.suivre OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 19365)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id character varying(255) NOT NULL,
    codecourt character varying(255)
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 19372)
-- Name: ticketsfilesattentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticketsfilesattentes (
    id character varying(255) NOT NULL,
    etat boolean,
    dateaffectation date,
    tickets_id character varying(255) NOT NULL,
    filesattentes_id character varying(255) NOT NULL
);


ALTER TABLE public.ticketsfilesattentes OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 19119)
-- Name: traiter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.traiter (
    id_document character varying(255) NOT NULL,
    id_mission character varying(255) NOT NULL
);


ALTER TABLE public.traiter OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 19256)
-- Name: validations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validations (
    id character varying(255) NOT NULL,
    code character varying(255),
    etat character varying(255),
    datecreation date,
    roles_id character varying(255)
);


ALTER TABLE public.validations OWNER TO postgres;

--
-- TOC entry 5055 (class 0 OID 18989)
-- Dependencies: 221
-- Data for Name: associer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.associer VALUES ('1000', '100', false, 11);
INSERT INTO public.associer VALUES ('1000', '200', false, 1);
INSERT INTO public.associer VALUES ('1234', '1', true, 0);
INSERT INTO public.associer VALUES ('2345', '2', false, 0);
INSERT INTO public.associer VALUES ('3456', '3', false, 0);
INSERT INTO public.associer VALUES ('3456', '4', false, 0);
INSERT INTO public.associer VALUES ('3456', '5', true, 0);
INSERT INTO public.associer VALUES ('3456', '6', false, 0);
INSERT INTO public.associer VALUES ('1234png', '7', false, 0);
INSERT INTO public.associer VALUES ('1234png', '8', false, 0);
INSERT INTO public.associer VALUES ('2345', '9', false, 0);
INSERT INTO public.associer VALUES ('3456', '10', false, 0);
INSERT INTO public.associer VALUES ('1234png08', '19', false, 0);
INSERT INTO public.associer VALUES ('1234png', '19', true, 1);
INSERT INTO public.associer VALUES ('3456', '19', false, 2);


--
-- TOC entry 5050 (class 0 OID 18938)
-- Dependencies: 216
-- Data for Name: attributs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.attributs VALUES ('1', 'taille', 'taille de l''individu', true, '2000-03-07', '1990-03-07', 'String', NULL);
INSERT INTO public.attributs VALUES ('4', 'age', 'age de l''individu', true, '2000-03-07', '1990-03-07', 'Double', NULL);
INSERT INTO public.attributs VALUES ('5', 'allergies', 'allergies de l''individu', true, '2000-03-07', '1990-03-07', 'String', NULL);
INSERT INTO public.attributs VALUES ('6', 'teint', 'teint de l''individu', true, '2000-03-07', '1990-03-07', 'String', NULL);
INSERT INTO public.attributs VALUES ('7', 'Groupe sangin', 'Groupe sangin de l''individu', true, '2000-03-07', '1990-03-07', 'Boolean', NULL);
INSERT INTO public.attributs VALUES ('8', 'cicatrice', 'cicatrice de l''individu', true, '2000-03-07', '1990-03-07', 'Boolean', NULL);
INSERT INTO public.attributs VALUES ('1000', 'taille', 'taille de l''individu', true, '2000-03-07', '1990-03-07', 'String', '');
INSERT INTO public.attributs VALUES ('1234', 'TAILLES', 'tailles', true, NULL, NULL, 'Double', NULL);
INSERT INTO public.attributs VALUES ('1234de', 'TAILLE revisée', 'taille revisée', true, NULL, NULL, 'Double', NULL);
INSERT INTO public.attributs VALUES ('1234png', 'Colle', 'colle', true, NULL, NULL, 'Double', NULL);
INSERT INTO public.attributs VALUES ('1234png08', 'png-08-colle', 'png-08-colle', true, NULL, NULL, 'Double', NULL);
INSERT INTO public.attributs VALUES ('2345', 'teint', 'teint du nouveau', false, NULL, NULL, 'Int', NULL);
INSERT INTO public.attributs VALUES ('3456', 'SEXES', 'SEXE', true, NULL, NULL, 'String', NULL);


--
-- TOC entry 5054 (class 0 OID 18977)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES ('100', '1', 'informations personelles', '1', NULL, NULL);
INSERT INTO public.categories VALUES ('2', '2', 'Lit hopital', '1234', NULL, NULL);
INSERT INTO public.categories VALUES ('3', '3', 'Don organes', '1234', NULL, NULL);
INSERT INTO public.categories VALUES ('4', '4', 'don de sang', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('5', '5', 'Économie et comptabilité', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('6', '6', 'Musique malade', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('7', '7', 'Cinéma', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('8', '8', 'Sport', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('9', '9', 'Cuisine', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('19', '19', 'Cuisine 19', '2345png02', NULL, NULL);
INSERT INTO public.categories VALUES ('10', '10', 'Voyage', '2345', NULL, NULL);
INSERT INTO public.categories VALUES ('1', '1', 'Fiche de traite Test', '1234', '2024-06-01', '2024-06-08');
INSERT INTO public.categories VALUES ('200', '2', 'informations de sante', '1', '2024-06-04', '2024-06-23');


--
-- TOC entry 5053 (class 0 OID 18960)
-- Dependencies: 219
-- Data for Name: constituer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.constituer VALUES ('1234', '1234de');
INSERT INTO public.constituer VALUES ('1234', '2345');
INSERT INTO public.constituer VALUES ('2345', '1234');
INSERT INTO public.constituer VALUES ('2345png', '1234png');
INSERT INTO public.constituer VALUES ('2345png', '1234png08');
INSERT INTO public.constituer VALUES ('2345png', '3456');
INSERT INTO public.constituer VALUES ('2345png02', '1234png');
INSERT INTO public.constituer VALUES ('2345png02', '1234png08');
INSERT INTO public.constituer VALUES ('2345png02', '3456');
INSERT INTO public.constituer VALUES ('2345png03', '1234');
INSERT INTO public.constituer VALUES ('2345png03', '1234png');
INSERT INTO public.constituer VALUES ('2345png03', '3456');
INSERT INTO public.constituer VALUES ('png04', '1234png');
INSERT INTO public.constituer VALUES ('png04', '3456');


--
-- TOC entry 5068 (class 0 OID 19167)
-- Dependencies: 234
-- Data for Name: distributeurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.distributeurs VALUES ('1', 'Dla', 'Brasserie', '1');
INSERT INTO public.distributeurs VALUES ('2', 'Ydé', 'ENEO', '2');
INSERT INTO public.distributeurs VALUES ('3', 'Buéa', 'Total Distribution', '3');


--
-- TOC entry 5078 (class 0 OID 19287)
-- Dependencies: 244
-- Data for Name: docetats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.docetats VALUES ('1', 1, '2024-07-21', '1', 'png04', '1', '1', '2');
INSERT INTO public.docetats VALUES ('2', 2, '2024-07-21', '2', '2345png03', '4', '2', '3');
INSERT INTO public.docetats VALUES ('3', 3, '2024-07-21', '3', '2345png01', '2', '3', '4');
INSERT INTO public.docetats VALUES ('4', 4, '2024-07-21', '4', '2345png', '3', '4', '1');


--
-- TOC entry 5085 (class 0 OID 19411)
-- Dependencies: 251
-- Data for Name: documentpromotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.documentpromotion VALUES ('1', '1234');
INSERT INTO public.documentpromotion VALUES ('2', '2345');
INSERT INTO public.documentpromotion VALUES ('3', '2345png');
INSERT INTO public.documentpromotion VALUES ('4', '2345png01');


--
-- TOC entry 5051 (class 0 OID 18946)
-- Dependencies: 217
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.documents VALUES ('1234', 'Fiche de soin avec poids avec teint', 'fiche de soin', 'Neutre', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('2345', 'Fiche de traite', 'traite', 'Neutre', true, true, true, true, true, 'true', '2023-03-31', '2023-03-31');
INSERT INTO public.documents VALUES ('2345png', 'Fiche de traite Test', 'traite test', 'Ajout', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('2345png01', 'Fiche de Test', 'traite test', 'Neutre', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('2345png02', 'Fiche de Test 2345-png-02', 'traite test 2345-png-02', 'Neutre', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('2345png03', 'Fiche de Test 2345-png-03', 'traite test 2345-png-03', 'Neutre', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('nom01', 'Fiche de Test', 'traite test', 'Reduire', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('png04', 'Fiche de Test 4', 'traite test', 'Neutre', true, true, true, true, true, 'true', NULL, NULL);
INSERT INTO public.documents VALUES ('1', 'Note intervention', 'Document delivre par le medecin ou un infirmier de l''etablissement', NULL, true, NULL, NULL, NULL, NULL, NULL, '2000-03-07', '1990-03-07');
INSERT INTO public.documents VALUES ('100', 'Fiche de Test', 'traite test', 'Neutre', true, true, true, true, true, 'TRUE', NULL, NULL);


--
-- TOC entry 5077 (class 0 OID 19275)
-- Dependencies: 243
-- Data for Name: etapes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etapes VALUES ('1', 'Essaie de type', 'En cours de traitement', '1');
INSERT INTO public.etapes VALUES ('2', 'Traitement de document', 'En cours de traitement', '2');
INSERT INTO public.etapes VALUES ('3', 'Mise en place de don', 'En cours de traitement', '3');
INSERT INTO public.etapes VALUES ('4', 'Prise en compte des soins', 'En cours de suppression', '4');


--
-- TOC entry 5073 (class 0 OID 19237)
-- Dependencies: 239
-- Data for Name: etats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etats VALUES ('1', 'etat 1', '2024-07-21', NULL);
INSERT INTO public.etats VALUES ('2', 'etat 2', '2024-07-21', NULL);
INSERT INTO public.etats VALUES ('3', 'etat 3', '2024-07-21', NULL);
INSERT INTO public.etats VALUES ('4', 'etat 4', '2024-07-21', NULL);
INSERT INTO public.etats VALUES ('11', 'etat 1', '2024-07-21', 'premièr état du document');
INSERT INTO public.etats VALUES ('21', 'etat 2', '2024-07-21', 'deuxième état du document');
INSERT INTO public.etats VALUES ('31', 'etat 3', '2024-07-21', 'troisième état du document');
INSERT INTO public.etats VALUES ('41', 'etat 4', '2024-07-21', 'quatrième état du document');


--
-- TOC entry 5058 (class 0 OID 19027)
-- Dependencies: 224
-- Data for Name: familles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.familles VALUES ('1', 'trans', 'sang', true, '2000-03-07', '2000-03-21', '1');
INSERT INTO public.familles VALUES ('2', 'néonat', 'nouveau-né', false, NULL, NULL, '2');
INSERT INTO public.familles VALUES ('3', 'pediatrie', 'enfant', true, '2000-03-07', '2000-03-13', '3');
INSERT INTO public.familles VALUES ('4', 'néonat', 'nouveau-né', false, NULL, NULL, '4');


--
-- TOC entry 5081 (class 0 OID 19353)
-- Dependencies: 247
-- Data for Name: filesattentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filesattentes VALUES ('1', '2024-06-01', true, '1');
INSERT INTO public.filesattentes VALUES ('2', '2000-10-07', true, '2');
INSERT INTO public.filesattentes VALUES ('3', '2000-11-07', false, '3');


--
-- TOC entry 5072 (class 0 OID 19220)
-- Dependencies: 238
-- Data for Name: jouerroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jouerroles VALUES ('1', true, '2024-03-07', '2025-03-07', '2024-10-07', '1', '1');
INSERT INTO public.jouerroles VALUES ('2', true, '2000-03-07', '2022-03-07', '2023-03-07', '2', '2');


--
-- TOC entry 5080 (class 0 OID 19336)
-- Dependencies: 246
-- Data for Name: livrer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.livrer VALUES ('1', '1');
INSERT INTO public.livrer VALUES ('1', '2');
INSERT INTO public.livrer VALUES ('3', '1');


--
-- TOC entry 5057 (class 0 OID 19015)
-- Dependencies: 223
-- Data for Name: missions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.missions VALUES ('4', 'Encaissement', 'recu de paiement lié à une mission', true, '2000-03-07', '1990-03-07', '1');
INSERT INTO public.missions VALUES ('5', 'Resultat Labo', 'Communiquer les résultats du labo aux patients', true, '2000-03-07', '1990-03-07', '3');
INSERT INTO public.missions VALUES ('6', 'Hospitalisation', 'bon d''entrée et de sortie est une mission', true, '2000-03-07', '1990-03-07', '1');
INSERT INTO public.missions VALUES ('3', 'Prelevement Labo', 'Prélévement fait par laboratoire', true, '2000-03-07', '1990-03-07', '3');
INSERT INTO public.missions VALUES ('2', 'Consultation Spécialiste', 'Consultation faite par un médecin', true, '2000-03-07', '1990-03-07', '2');
INSERT INTO public.missions VALUES ('1', 'Consultation', 'Consultation faite par une infirmière', true, '2000-03-07', '1990-03-07', '1');


--
-- TOC entry 5069 (class 0 OID 19189)
-- Dependencies: 235
-- Data for Name: mouvements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mouvements VALUES ('1', 'Ici la description de ce mouvement', 20, 10000, '2024-06-17', '2024-06-17', '1', '1');
INSERT INTO public.mouvements VALUES ('2', 'Ici la description de ce mouvement', 50, 300, '2024-06-17', '2024-06-17', '5', '2');
INSERT INTO public.mouvements VALUES ('3', 'Ici la description de ce mouvement', 10, 5000, '2024-06-17', '2024-06-17', '3', '3');
INSERT INTO public.mouvements VALUES ('4', 'Ici la description de ce mouvement', 20, 2000, '2024-06-17', '2024-06-17', '2', '2');


--
-- TOC entry 5079 (class 0 OID 19319)
-- Dependencies: 245
-- Data for Name: mouvpreco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mouvpreco VALUES ('1', '1');
INSERT INTO public.mouvpreco VALUES ('2', '1');
INSERT INTO public.mouvpreco VALUES ('2', '2');


--
-- TOC entry 5074 (class 0 OID 19244)
-- Dependencies: 240
-- Data for Name: ordreetats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ordreetats VALUES ('1', '2024-07-21', 1, '1');
INSERT INTO public.ordreetats VALUES ('2', '2024-07-21', 2, '2');
INSERT INTO public.ordreetats VALUES ('3', '2024-07-21', 3, '3');
INSERT INTO public.ordreetats VALUES ('4', '2024-07-21', 4, '4');


--
-- TOC entry 5076 (class 0 OID 19268)
-- Dependencies: 242
-- Data for Name: parcours; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parcours VALUES ('1', 'Traitement de documents', '2000-03-07');
INSERT INTO public.parcours VALUES ('4', 'Rupture de laison', '2000-04-07');
INSERT INTO public.parcours VALUES ('3', 'Livraison', '2000-07-07');
INSERT INTO public.parcours VALUES ('2', 'Annulation de commande', '2000-03-20');


--
-- TOC entry 5071 (class 0 OID 19213)
-- Dependencies: 237
-- Data for Name: personnels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnels VALUES ('1', '2024-06-17', 'Tagne', '2000-04-10', '655455487', NULL, 'tagnewillie@gmail.com', 'Willy', 'M');
INSERT INTO public.personnels VALUES ('2', '2024-06-17', 'Peter', '2004-08-10', '655455487', NULL, 'peteralan@gmail.com', 'Alan', 'M');
INSERT INTO public.personnels VALUES ('3', '2024-06-17', 'Dombo', '2002-10-10', '655455487', NULL, 'dombogilles@gmail.com', 'Gilles', 'M');


--
-- TOC entry 5086 (class 0 OID 19448)
-- Dependencies: 252
-- Data for Name: personneratache; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personneratache VALUES ('1', '2');
INSERT INTO public.personneratache VALUES ('2', '3');
INSERT INTO public.personneratache VALUES ('1', '3');
INSERT INTO public.personneratache VALUES ('2', '1');


--
-- TOC entry 5065 (class 0 OID 19136)
-- Dependencies: 231
-- Data for Name: personnes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnes VALUES ('1', 'Total Energie', 'ngong@yad.fr', '655554488', NULL, '1');
INSERT INTO public.personnes VALUES ('2', 'Brasserie', 'ngong@yad.fr', '655554481', NULL, '2');
INSERT INTO public.personnes VALUES ('3', 'Eneo', 'ngong@yad.fr', '655554486', NULL, '3');


--
-- TOC entry 5066 (class 0 OID 19143)
-- Dependencies: 232
-- Data for Name: personnes_morale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnes_morale VALUES ('1', 'Foyer de prise en charge', '1254488566');
INSERT INTO public.personnes_morale VALUES ('2', 'Prise en charge', '25154312156154');


--
-- TOC entry 5067 (class 0 OID 19155)
-- Dependencies: 233
-- Data for Name: personnes_physique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnes_physique VALUES ('3', 'Phil', 'Phil', 'masc', '2000-03-07');
INSERT INTO public.personnes_physique VALUES ('2', 'rill', 'rill', 'fem', '2000-03-07');


--
-- TOC entry 5060 (class 0 OID 19056)
-- Dependencies: 226
-- Data for Name: precomouvements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.precomouvements VALUES ('1', 'rachat', true, NULL, NULL, 'Neutre');
INSERT INTO public.precomouvements VALUES ('2', 'vente', true, NULL, NULL, 'Reduire');
INSERT INTO public.precomouvements VALUES ('3', 'vente', true, NULL, NULL, 'Reduire');


--
-- TOC entry 5061 (class 0 OID 19063)
-- Dependencies: 227
-- Data for Name: precomouvementsqtes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.precomouvementsqtes VALUES ('1', 10, 20, 1000, 7000, '1', '1', NULL, NULL);
INSERT INTO public.precomouvementsqtes VALUES ('2', 30, 40, 100, 7000, '1', '2', NULL, NULL);
INSERT INTO public.precomouvementsqtes VALUES ('3', 30, 40, 100, 7000, '1', '3', NULL, NULL);
INSERT INTO public.precomouvementsqtes VALUES ('11', 10, 100, 500, 5000, '1', '1', '2024-06-04', '2024-06-04');
INSERT INTO public.precomouvementsqtes VALUES ('22', 20, 200, 1000, 10000, '2', '2', '2024-06-04', '2024-06-04');
INSERT INTO public.precomouvementsqtes VALUES ('33', 5, 50, 200, 2000, '3', '3', '2024-06-04', '2024-06-04');


--
-- TOC entry 5052 (class 0 OID 18953)
-- Dependencies: 218
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.promotions VALUES ('1', '2024-06-01', '2024-06-30', 'CODE1', 50, 10, '2024-06-01', '1');
INSERT INTO public.promotions VALUES ('2', '2024-07-01', '2024-07-31', 'CODE2', 60, 15, '2024-07-01', '2');
INSERT INTO public.promotions VALUES ('3', '2024-08-01', '2024-08-31', 'CODE3', 70, 20, '2024-08-01', '3');
INSERT INTO public.promotions VALUES ('4', '2024-09-01', '2024-09-30', 'CODE4', 80, 25, '2024-09-01', '3');


--
-- TOC entry 5084 (class 0 OID 19394)
-- Dependencies: 250
-- Data for Name: remplir; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.remplir VALUES ('1', '2', '1990-03-07', '1990-03-07', '1990-03-07', true, true, true, true, true);
INSERT INTO public.remplir VALUES ('1', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.remplir VALUES ('2', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5059 (class 0 OID 19039)
-- Dependencies: 225
-- Data for Name: ressources; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ressources VALUES ('1', 'transfusion', true, NULL, NULL, 10, NULL, 1000, NULL, 'Litre', '1', '1');
INSERT INTO public.ressources VALUES ('2', 'néonat', true, NULL, NULL, 20, NULL, 2000, NULL, 'Litre', '2', '3');
INSERT INTO public.ressources VALUES ('3', 'pediatrie', true, NULL, NULL, 30, NULL, 3000, NULL, 'Litre', '3', '2');
INSERT INTO public.ressources VALUES ('5', 'eau distillée', true, NULL, NULL, 20, NULL, 500, NULL, 'Litre', '3', '3');


--
-- TOC entry 5070 (class 0 OID 19206)
-- Dependencies: 236
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES ('1', 'vendeur', 'personnel au contact du client', true, '2000-07-03');
INSERT INTO public.roles VALUES ('2', 'traiteur', 'Personnel administratif', true, '2000-07-03');
INSERT INTO public.roles VALUES ('3', 'marcheur', 'commercial sur le terrain', true, '2000-07-03');


--
-- TOC entry 5062 (class 0 OID 19085)
-- Dependencies: 228
-- Data for Name: sapplique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sapplique VALUES ('1', '1');
INSERT INTO public.sapplique VALUES ('2', '2');
INSERT INTO public.sapplique VALUES ('3', '3');


--
-- TOC entry 5056 (class 0 OID 19006)
-- Dependencies: 222
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.services VALUES ('1', 'Pharmacie', 'bien', 'code_unique', NULL, true, '2000-03-07', '1990-03-07', '1');
INSERT INTO public.services VALUES ('2', 'Laboratoire', 'bien', '2', NULL, true, '1990-08-06', '1990-03-07', '2');
INSERT INTO public.services VALUES ('3', 'Consultation', 'bien', '3', NULL, true, '1972-06-12', '1990-03-07', '3');


--
-- TOC entry 5063 (class 0 OID 19102)
-- Dependencies: 229
-- Data for Name: suivre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suivre VALUES ('1234', '3');
INSERT INTO public.suivre VALUES ('2345', '2');
INSERT INTO public.suivre VALUES ('2345png', '1');


--
-- TOC entry 5082 (class 0 OID 19365)
-- Dependencies: 248
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets VALUES ('1', '2024-06-01');
INSERT INTO public.tickets VALUES ('2', '2024-07-01');
INSERT INTO public.tickets VALUES ('3', '2024-08-01');
INSERT INTO public.tickets VALUES ('4', '2024-09-01');


--
-- TOC entry 5083 (class 0 OID 19372)
-- Dependencies: 249
-- Data for Name: ticketsfilesattentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ticketsfilesattentes VALUES ('1', true, '2024-06-30', '1', '1');
INSERT INTO public.ticketsfilesattentes VALUES ('2', false, NULL, '2', '2');


--
-- TOC entry 5064 (class 0 OID 19119)
-- Dependencies: 230
-- Data for Name: traiter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.traiter VALUES ('1234', '1');
INSERT INTO public.traiter VALUES ('2345', '2');
INSERT INTO public.traiter VALUES ('2345png', '3');
INSERT INTO public.traiter VALUES ('2345png01', '4');


--
-- TOC entry 5075 (class 0 OID 19256)
-- Dependencies: 241
-- Data for Name: validations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.validations VALUES ('11', 'azerty', 'false', '2023-02-10', '1');
INSERT INTO public.validations VALUES ('21', 'qwerty', 'true', '2014-04-01', '2');
INSERT INTO public.validations VALUES ('31', 'qsdfghj', 'true', '2015-10-10', '3');
INSERT INTO public.validations VALUES ('1', NULL, NULL, '2024-07-21', '3');
INSERT INTO public.validations VALUES ('2', NULL, NULL, '2024-07-21', '2');
INSERT INTO public.validations VALUES ('3', NULL, NULL, '2024-07-21', '1');
INSERT INTO public.validations VALUES ('4', NULL, NULL, '2024-07-21', '2');


--
-- TOC entry 4792 (class 2606 OID 18995)
-- Name: associer associer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associer
    ADD CONSTRAINT associer_pkey PRIMARY KEY (attributs_id, categories_id);


--
-- TOC entry 4780 (class 2606 OID 18945)
-- Name: attributs attributs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributs
    ADD CONSTRAINT attributs_pkey PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 18983)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 19430)
-- Name: promotions codeunique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT codeunique UNIQUE (codeunique);


--
-- TOC entry 4788 (class 2606 OID 18966)
-- Name: constituer constituer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT constituer_pkey PRIMARY KEY (documents_id, attributs_id);


--
-- TOC entry 4820 (class 2606 OID 19173)
-- Name: distributeurs distributeurs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributeurs
    ADD CONSTRAINT distributeurs_pkey PRIMARY KEY (distributeurs_id);


--
-- TOC entry 4840 (class 2606 OID 19293)
-- Name: docetats docetats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT docetats_pkey PRIMARY KEY (id);


--
-- TOC entry 4854 (class 2606 OID 19417)
-- Name: documentpromotion documentpromotion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentpromotion
    ADD CONSTRAINT documentpromotion_pkey PRIMARY KEY (promotions_id, documents_id);


--
-- TOC entry 4782 (class 2606 OID 18952)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- TOC entry 4838 (class 2606 OID 19281)
-- Name: etapes etapes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapes
    ADD CONSTRAINT etapes_pkey PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 19243)
-- Name: etats etats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etats
    ADD CONSTRAINT etats_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 19033)
-- Name: familles familles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familles
    ADD CONSTRAINT familles_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 19359)
-- Name: filesattentes filesattentes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT filesattentes_pk PRIMARY KEY (id);


--
-- TOC entry 4828 (class 2606 OID 19226)
-- Name: jouerroles jouerroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT jouerroles_pkey PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 19342)
-- Name: livrer livrer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livrer
    ADD CONSTRAINT livrer_pkey PRIMARY KEY (precomouvementsqtes_id, distributeurs_id);


--
-- TOC entry 4798 (class 2606 OID 19021)
-- Name: missions missions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 19195)
-- Name: mouvements mouvements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT mouvements_pkey PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 19325)
-- Name: mouvpreco mouvpreco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvpreco
    ADD CONSTRAINT mouvpreco_pkey PRIMARY KEY (id_precomouvements, id_mouvements);


--
-- TOC entry 4832 (class 2606 OID 19250)
-- Name: ordreetats ordreetats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordreetats
    ADD CONSTRAINT ordreetats_pkey PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 19274)
-- Name: parcours parcours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcours
    ADD CONSTRAINT parcours_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 19219)
-- Name: personnels personnels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnels
    ADD CONSTRAINT personnels_pkey PRIMARY KEY (id);


--
-- TOC entry 4816 (class 2606 OID 19149)
-- Name: personnes_morale personnes_morale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes_morale
    ADD CONSTRAINT personnes_morale_pkey PRIMARY KEY (personnesmorale_id);


--
-- TOC entry 4818 (class 2606 OID 19161)
-- Name: personnes_physique personnes_physique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes_physique
    ADD CONSTRAINT personnes_physique_pkey PRIMARY KEY (personnesphysique_id);


--
-- TOC entry 4814 (class 2606 OID 19142)
-- Name: personnes personnes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes
    ADD CONSTRAINT personnes_pkey PRIMARY KEY (id);


--
-- TOC entry 4856 (class 2606 OID 19454)
-- Name: personneratache personnes_ratache; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personneratache
    ADD CONSTRAINT personnes_ratache PRIMARY KEY (personne_id, personneratache_id);


--
-- TOC entry 4804 (class 2606 OID 19062)
-- Name: precomouvements precomouvements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvements
    ADD CONSTRAINT precomouvements_pkey PRIMARY KEY (id);


--
-- TOC entry 4806 (class 2606 OID 19069)
-- Name: precomouvementsqtes precomouvementsqtes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT precomouvementsqtes_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 18959)
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (id);


--
-- TOC entry 4852 (class 2606 OID 19400)
-- Name: remplir remplir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT remplir_pkey PRIMARY KEY (roles_id, missions_id);


--
-- TOC entry 4802 (class 2606 OID 19045)
-- Name: ressources ressources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT ressources_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 19212)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4808 (class 2606 OID 19091)
-- Name: sapplique sapplique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT sapplique_pkey PRIMARY KEY (familles_id, precomouvementsqtes_id);


--
-- TOC entry 4794 (class 2606 OID 19014)
-- Name: services services_codeunique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_codeunique_key UNIQUE (codeunique);


--
-- TOC entry 4796 (class 2606 OID 19012)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 19108)
-- Name: suivre suivre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT suivre_pkey PRIMARY KEY (documents_id, precomouvements_id);


--
-- TOC entry 4848 (class 2606 OID 19371)
-- Name: tickets tickets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pk PRIMARY KEY (id);


--
-- TOC entry 4850 (class 2606 OID 19378)
-- Name: ticketsfilesattentes ticketsfilesattentes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT ticketsfilesattentes_pk PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 19125)
-- Name: traiter traiter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT traiter_pkey PRIMARY KEY (id_document, id_mission);


--
-- TOC entry 4834 (class 2606 OID 19262)
-- Name: validations validations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validations
    ADD CONSTRAINT validations_pkey PRIMARY KEY (id);


--
-- TOC entry 4861 (class 2606 OID 18996)
-- Name: associer associer_attributs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associer
    ADD CONSTRAINT associer_attributs_id_fkey FOREIGN KEY (attributs_id) REFERENCES public.attributs(id);


--
-- TOC entry 4862 (class 2606 OID 19001)
-- Name: associer associer_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associer
    ADD CONSTRAINT associer_categories_id_fkey FOREIGN KEY (categories_id) REFERENCES public.categories(id);


--
-- TOC entry 4860 (class 2606 OID 18984)
-- Name: categories categories_documents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_documents_id_fkey FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4858 (class 2606 OID 18972)
-- Name: constituer constituer_attributs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT constituer_attributs_id_fkey FOREIGN KEY (attributs_id) REFERENCES public.attributs(id);


--
-- TOC entry 4859 (class 2606 OID 18967)
-- Name: constituer constituer_documents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT constituer_documents_id_fkey FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4880 (class 2606 OID 19179)
-- Name: distributeurs distributeur_promotion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributeurs
    ADD CONSTRAINT distributeur_promotion_fk FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4881 (class 2606 OID 19174)
-- Name: distributeurs distributeurs_distributeurs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributeurs
    ADD CONSTRAINT distributeurs_distributeurs_id_fkey FOREIGN KEY (distributeurs_id) REFERENCES public.personnes(id);


--
-- TOC entry 4896 (class 2606 OID 19348)
-- Name: livrer distributeurs_precomouvementsqtes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livrer
    ADD CONSTRAINT distributeurs_precomouvementsqtes_fk FOREIGN KEY (distributeurs_id) REFERENCES public.distributeurs(distributeurs_id);


--
-- TOC entry 4889 (class 2606 OID 19294)
-- Name: docetats docetats_documents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT docetats_documents_id_fkey FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4890 (class 2606 OID 19314)
-- Name: docetats docetats_etapes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT docetats_etapes_id_fkey FOREIGN KEY (etapes_id) REFERENCES public.etapes(id);


--
-- TOC entry 4891 (class 2606 OID 19309)
-- Name: docetats docetats_etats_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT docetats_etats_id_fkey FOREIGN KEY (etats_id) REFERENCES public.etats(id);


--
-- TOC entry 4892 (class 2606 OID 19304)
-- Name: docetats docetats_predecesseurdocetat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT docetats_predecesseurdocetat_id_fkey FOREIGN KEY (predecesseurdocetat_id) REFERENCES public.docetats(id);


--
-- TOC entry 4893 (class 2606 OID 19299)
-- Name: docetats docetats_validations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT docetats_validations_id_fkey FOREIGN KEY (validations_id) REFERENCES public.validations(id);


--
-- TOC entry 4875 (class 2606 OID 19126)
-- Name: traiter documents_missions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT documents_missions_fk FOREIGN KEY (id_document) REFERENCES public.documents(id);


--
-- TOC entry 4873 (class 2606 OID 19109)
-- Name: suivre documents_precomouvements_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT documents_precomouvements_fk FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4903 (class 2606 OID 19418)
-- Name: documentpromotion documents_promotions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentpromotion
    ADD CONSTRAINT documents_promotions_fk FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4888 (class 2606 OID 19282)
-- Name: etapes etapes_parcours_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapes
    ADD CONSTRAINT etapes_parcours_id_fkey FOREIGN KEY (parcours_id) REFERENCES public.parcours(id);


--
-- TOC entry 4871 (class 2606 OID 19092)
-- Name: sapplique familles_precomouvements_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT familles_precomouvements_fk FOREIGN KEY (familles_id) REFERENCES public.familles(id);


--
-- TOC entry 4865 (class 2606 OID 19034)
-- Name: familles familles_promotions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familles
    ADD CONSTRAINT familles_promotions_id_fkey FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4899 (class 2606 OID 19384)
-- Name: ticketsfilesattentes filesattentes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT filesattentes_fk FOREIGN KEY (filesattentes_id) REFERENCES public.filesattentes(id);


--
-- TOC entry 4863 (class 2606 OID 19389)
-- Name: services filesattentes_service_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT filesattentes_service_fk FOREIGN KEY (filesattentes_id) REFERENCES public.filesattentes(id);


--
-- TOC entry 4884 (class 2606 OID 19227)
-- Name: jouerroles jouerroles_personnels_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT jouerroles_personnels_id_fkey FOREIGN KEY (personnels_id) REFERENCES public.personnels(id);


--
-- TOC entry 4885 (class 2606 OID 19232)
-- Name: jouerroles jouerroles_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT jouerroles_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- TOC entry 4876 (class 2606 OID 19131)
-- Name: traiter missions_documents_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT missions_documents_fk FOREIGN KEY (id_mission) REFERENCES public.missions(id);


--
-- TOC entry 4864 (class 2606 OID 19022)
-- Name: missions missions_services_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_services_id_fkey FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- TOC entry 4882 (class 2606 OID 19196)
-- Name: mouvements mouvements_distributeurs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT mouvements_distributeurs_id_fkey FOREIGN KEY (distributeurs_id) REFERENCES public.distributeurs(distributeurs_id);


--
-- TOC entry 4894 (class 2606 OID 19331)
-- Name: mouvpreco mouvements_precomouvements_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvpreco
    ADD CONSTRAINT mouvements_precomouvements_fk FOREIGN KEY (id_mouvements) REFERENCES public.mouvements(id);


--
-- TOC entry 4883 (class 2606 OID 19201)
-- Name: mouvements mouvements_ressources_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT mouvements_ressources_id_fkey FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);


--
-- TOC entry 4886 (class 2606 OID 19251)
-- Name: ordreetats ordreetats_etats_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordreetats
    ADD CONSTRAINT ordreetats_etats_id_fkey FOREIGN KEY (etats_id) REFERENCES public.etats(id);


--
-- TOC entry 4905 (class 2606 OID 19455)
-- Name: personneratache personneratache_personne_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personneratache
    ADD CONSTRAINT personneratache_personne_id_fkey FOREIGN KEY (personne_id) REFERENCES public.personnes(id);


--
-- TOC entry 4906 (class 2606 OID 19460)
-- Name: personneratache personneratache_personneratache_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personneratache
    ADD CONSTRAINT personneratache_personneratache_id_fkey FOREIGN KEY (personneratache_id) REFERENCES public.personnes(id);


--
-- TOC entry 4878 (class 2606 OID 19150)
-- Name: personnes_morale personnes_morale_personnesmorale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes_morale
    ADD CONSTRAINT personnes_morale_personnesmorale_id_fkey FOREIGN KEY (personnesmorale_id) REFERENCES public.personnes(id);


--
-- TOC entry 4879 (class 2606 OID 19162)
-- Name: personnes_physique personnes_physique_personnesphysique_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes_physique
    ADD CONSTRAINT personnes_physique_personnesphysique_id_fkey FOREIGN KEY (personnesphysique_id) REFERENCES public.personnes(id);


--
-- TOC entry 4877 (class 2606 OID 19431)
-- Name: personnes personnes_promotion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes
    ADD CONSTRAINT personnes_promotion_fk FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4874 (class 2606 OID 19114)
-- Name: suivre precomouvements_documents_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT precomouvements_documents_fk FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);


--
-- TOC entry 4895 (class 2606 OID 19326)
-- Name: mouvpreco precomouvements_mouvements_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvpreco
    ADD CONSTRAINT precomouvements_mouvements_fk FOREIGN KEY (id_precomouvements) REFERENCES public.precomouvements(id);


--
-- TOC entry 4897 (class 2606 OID 19343)
-- Name: livrer precomouvementsqtes_distributeurs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livrer
    ADD CONSTRAINT precomouvementsqtes_distributeurs_fk FOREIGN KEY (precomouvementsqtes_id) REFERENCES public.precomouvementsqtes(id);


--
-- TOC entry 4872 (class 2606 OID 19097)
-- Name: sapplique precomouvementsqtes_familles_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT precomouvementsqtes_familles_fk FOREIGN KEY (precomouvementsqtes_id) REFERENCES public.precomouvementsqtes(id);


--
-- TOC entry 4869 (class 2606 OID 19070)
-- Name: precomouvementsqtes precomouvementsqtes_precomouvements_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT precomouvementsqtes_precomouvements_id_fkey FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);


--
-- TOC entry 4870 (class 2606 OID 19075)
-- Name: precomouvementsqtes precomouvementsqtes_ressources_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT precomouvementsqtes_ressources_id_fkey FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);


--
-- TOC entry 4857 (class 2606 OID 19184)
-- Name: promotions promotion_distributeur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotion_distributeur_fk FOREIGN KEY (distributeurs_id) REFERENCES public.distributeurs(distributeurs_id);


--
-- TOC entry 4904 (class 2606 OID 19423)
-- Name: documentpromotion promotions_doculents_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentpromotion
    ADD CONSTRAINT promotions_doculents_fk FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4901 (class 2606 OID 19406)
-- Name: remplir remplir_missions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT remplir_missions_id_fkey FOREIGN KEY (missions_id) REFERENCES public.missions(id);


--
-- TOC entry 4902 (class 2606 OID 19401)
-- Name: remplir remplir_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT remplir_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- TOC entry 4866 (class 2606 OID 19080)
-- Name: ressources ressources_familles_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT ressources_familles_fk FOREIGN KEY (familles_id) REFERENCES public.familles(id);


--
-- TOC entry 4867 (class 2606 OID 19046)
-- Name: ressources ressources_familles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT ressources_familles_id_fkey FOREIGN KEY (familles_id) REFERENCES public.familles(id);


--
-- TOC entry 4868 (class 2606 OID 19051)
-- Name: ressources ressources_promotions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT ressources_promotions_id_fkey FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4898 (class 2606 OID 19360)
-- Name: filesattentes services_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT services_fk FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- TOC entry 4900 (class 2606 OID 19379)
-- Name: ticketsfilesattentes ticket_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT ticket_fk FOREIGN KEY (tickets_id) REFERENCES public.tickets(id);


--
-- TOC entry 4887 (class 2606 OID 19263)
-- Name: validations validations_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validations
    ADD CONSTRAINT validations_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES public.roles(id);


-- Completed on 2024-07-12 16:41:57

--
-- PostgreSQL database dump complete
--

