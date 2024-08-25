--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-25 15:05:28

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
-- TOC entry 5129 (class 1262 OID 21454)
-- Name: parcoursback; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE parcoursback WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';


ALTER DATABASE parcoursback OWNER TO postgres;

\connect parcoursback

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
-- TOC entry 6 (class 2615 OID 22307)
-- Name: parcours; Type: SCHEMA; Schema: -; Owner: sa
--

CREATE SCHEMA parcours;


ALTER SCHEMA parcours OWNER TO sa;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 22324)
-- Name: associer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associer (
    obligatoire boolean,
    ordre integer,
    attributs_id character varying(255) NOT NULL,
    categories_id character varying(255) NOT NULL
);


ALTER TABLE public.associer OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 22308)
-- Name: attributs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attributs (
    id character varying(255) NOT NULL,
    titre character varying(255) NOT NULL,
    description character varying(255),
    etat boolean DEFAULT true,
    datecreation date,
    datemodification date,
    type character varying(255) NOT NULL,
    valeurpardefaut character varying(255)
);


ALTER TABLE public.attributs OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 27723)
-- Name: caisses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caisses (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    solde double precision,
    type character varying(255),
    detailjson character varying(255)
);


ALTER TABLE public.caisses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 22316)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id character varying(255) NOT NULL,
    ordre character varying(255),
    libelle character varying(255),
    etat boolean DEFAULT true,
    datecreation date,
    datemodification date,
    documents_id character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 27716)
-- Name: comptes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comptes (
    id character varying(255) NOT NULL,
    solde character varying(255),
    datecreation date,
    etat character varying(255),
    montantdecouvertmax double precision,
    libelle character varying(255),
    personnes_id character varying(255)
);


ALTER TABLE public.comptes OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 27824)
-- Name: concerner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concerner (
    distributeurs_id character varying(255) NOT NULL,
    precomouvementsqtes_id character varying(255) NOT NULL
);


ALTER TABLE public.concerner OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 22343)
-- Name: constituer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constituer (
    attributs_id character varying(255) NOT NULL,
    documents_id character varying(255) NOT NULL
);


ALTER TABLE public.constituer OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 27709)
-- Name: deltasoldes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deltasoldes (
    id character varying(255) NOT NULL,
    montantavant double precision,
    montantapres double precision,
    datecreation date,
    typemouvement character varying(255) NOT NULL,
    comptes_id character varying(255) NOT NULL,
    exemplaires_id character varying(255) NOT NULL
);


ALTER TABLE public.deltasoldes OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 22561)
-- Name: docetats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docetats (
    id character varying(255) NOT NULL,
    ordre integer,
    datecreation date,
    datemodification date,
    validations_id character varying(255),
    etats_id character varying(255),
    documents_id character varying(255),
    etapes_id character varying(255)
);


ALTER TABLE public.docetats OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 22568)
-- Name: docetats_predecesseurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docetats_predecesseurs (
    docetats_id character varying(255) NOT NULL,
    predecesseur_id character varying(255) NOT NULL
);


ALTER TABLE public.docetats_predecesseurs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 22348)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id character varying(255) NOT NULL,
    titre character varying(255) NOT NULL,
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    typemouvement character varying(255),
    afficherprix character varying(255),
    afficherunite boolean,
    afficherdistributeur boolean,
    prixeditable boolean,
    contientressources boolean,
    estencaissable boolean
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 22490)
-- Name: documentspromotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentspromotions (
    documents_id character varying(255) NOT NULL,
    promotions_id character varying(255) NOT NULL
);


ALTER TABLE public.documentspromotions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 22367)
-- Name: etapes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etapes (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    etat character varying(255),
    datemodification date,
    parcours_id character varying(255)
);


ALTER TABLE public.etapes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 22360)
-- Name: etats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etats (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    description character varying(255),
    datecreation date,
    datemodification date
);


ALTER TABLE public.etats OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 27730)
-- Name: exemplaires; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exemplaires (
    id character varying(255) NOT NULL,
    personnes_id character varying(255) NOT NULL
);


ALTER TABLE public.exemplaires OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 22374)
-- Name: familles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.familles (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date
);


ALTER TABLE public.familles OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 22495)
-- Name: famillespromotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.famillespromotions (
    familles_id character varying(255) NOT NULL,
    promotions_id character varying(255) NOT NULL
);


ALTER TABLE public.famillespromotions OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 22386)
-- Name: filesattentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filesattentes (
    id character varying(255) NOT NULL,
    datecreation date,
    datemodification date,
    etat boolean,
    services_id character varying(255)
);


ALTER TABLE public.filesattentes OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 22393)
-- Name: jouerroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jouerroles (
    id character varying(255) NOT NULL,
    etat boolean,
    datecreation date,
    datemodification date,
    datefin date,
    datedebut date,
    personnels_id character varying(255),
    roles_id character varying(255)
);


ALTER TABLE public.jouerroles OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 22400)
-- Name: missions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.missions (
    id character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    description character varying(255),
    etat boolean,
    datecreation date NOT NULL,
    datemodification date,
    services_id character varying(255)
);


ALTER TABLE public.missions OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 27782)
-- Name: mouvementcaisses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mouvementcaisses (
    id character varying(255) NOT NULL,
    montant double precision,
    moyenpaiement character varying(255),
    referencepaiement character varying(255),
    detailjson character varying(255),
    etat character varying(255),
    typemvt character varying(255),
    libelle character varying(255),
    caisses_id character varying(255),
    comptes_id character varying(255),
    personnels_id character varying(255),
    exemplaires_id character varying(255),
    datecreation date
);


ALTER TABLE public.mouvementcaisses OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 22412)
-- Name: mouvements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mouvements (
    id character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    quantite integer,
    prix double precision,
    datecreation date NOT NULL,
    dateperemption date,
    datemodification date,
    ressources_id character varying(255),
    distributeurs_id character varying(255)
);


ALTER TABLE public.mouvements OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 22429)
-- Name: ordreetats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordreetats (
    id character varying(255) NOT NULL,
    datecreation date,
    datemodification date,
    datefinvote date,
    ordre integer,
    etats_id character varying(255)
);


ALTER TABLE public.ordreetats OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 22436)
-- Name: parcours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcours (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    datecreation date,
    datemodification date
);


ALTER TABLE public.parcours OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 22443)
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
    sexe character varying(255),
    datemodification date
);


ALTER TABLE public.personnels OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 27701)
-- Name: personnes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnes (
    id character varying(255) NOT NULL,
    adresse character varying(255),
    mail character varying(255),
    telephone character varying(255),
    qrcodevalue character varying(255),
    code character varying(255),
    raisonsociale character varying(255),
    nom character varying(255),
    prenom character varying(255),
    sexe character varying(255),
    datenaissance date,
    datecreation date,
    datemodification date,
    person_type character varying(255) NOT NULL,
    comptes_id character varying(255),
    CONSTRAINT personnes_person_type_check CHECK (((person_type)::text = ANY ((ARRAY['personnesmorales'::character varying, 'personnesphysique'::character varying, 'distributeurs'::character varying])::text[])))
);


ALTER TABLE public.personnes OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 27679)
-- Name: personnes_s; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnes_s (
    id character varying(255) NOT NULL,
    adresse character varying(255),
    mail character varying(255),
    telephone character varying(255),
    qrcodevalue character varying(255),
    code character varying(255),
    raisonsociale character varying(255),
    nom character varying(255) NOT NULL,
    prenom character varying(255),
    sexe character varying(255),
    datenaissance date NOT NULL,
    datecreation date NOT NULL,
    datemodification date,
    person_type character varying(255) NOT NULL
);


ALTER TABLE public.personnes_s OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 22476)
-- Name: precomouvements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precomouvements (
    id character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    etat boolean,
    datecreation date NOT NULL,
    datemodification date,
    typemouvement character varying(255)
);


ALTER TABLE public.precomouvements OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 22483)
-- Name: precomouvementsqtes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precomouvementsqtes (
    id character varying(255) NOT NULL,
    qtemin integer,
    qtemax integer,
    montantmin double precision,
    montantmax double precision,
    datecreation date,
    datemodification date,
    precomouvements_id character varying(255) NOT NULL,
    ressources_id character varying(255)
);


ALTER TABLE public.precomouvementsqtes OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 22500)
-- Name: promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotions (
    id character varying(255) NOT NULL,
    datedebut date,
    datefin date,
    codeunique character varying(255),
    typeremise character varying(255),
    valeurremise double precision,
    datecreation date,
    datemodification date,
    distributeurs_id character varying(255)
);


ALTER TABLE public.promotions OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 22457)
-- Name: rattacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rattacher (
    personnes_id character varying(255) NOT NULL,
    rattacher_id character varying(255) NOT NULL
);


ALTER TABLE public.rattacher OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 22507)
-- Name: remplir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remplir (
    datefin date,
    datecreation date,
    datedebut date,
    etat boolean,
    droitajouter boolean,
    droitmodifier boolean,
    droitconsulter boolean,
    droitvalider boolean,
    roles_id character varying(255) NOT NULL,
    missions_id character varying(255) NOT NULL
);


ALTER TABLE public.remplir OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 22419)
-- Name: respecter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respecter (
    mouvements_id character varying(255) NOT NULL,
    precomouvements_id character varying(255) NOT NULL
);


ALTER TABLE public.respecter OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 22514)
-- Name: ressources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ressources (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    quantite integer,
    seuilalerte integer,
    prixentree double precision,
    prixsortie double precision,
    unite character varying(255),
    familles_id character varying(255)
);


ALTER TABLE public.ressources OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 22521)
-- Name: ressourcespromotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ressourcespromotions (
    promotions_id character varying(255) NOT NULL,
    ressources_id character varying(255) NOT NULL
);


ALTER TABLE public.ressourcespromotions OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 22526)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id character varying(255) NOT NULL,
    titre character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 22381)
-- Name: sapplique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sapplique (
    familles_id character varying(255) NOT NULL,
    precomouvementsqtes_id character varying(255) NOT NULL
);


ALTER TABLE public.sapplique OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 22533)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id character varying(255) NOT NULL,
    description character varying(255),
    libelle character varying(255),
    localisation character varying(255),
    etat boolean,
    datecreation date,
    datemodification date,
    codeunique character varying(255) NOT NULL,
    filesattentes_id character varying(255)
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 22355)
-- Name: suivre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suivre (
    documents_id character varying(255) NOT NULL,
    precomouvements_id character varying(255) NOT NULL
);


ALTER TABLE public.suivre OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 22540)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id character varying(255) NOT NULL,
    codecourt character varying(255),
    datecreation date,
    datemodification date
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 22547)
-- Name: ticketsfilesattentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticketsfilesattentes (
    id character varying(255) NOT NULL,
    etat boolean,
    dateaffectation date,
    tickets_id character varying(255),
    filesattentes_id character varying(255)
);


ALTER TABLE public.ticketsfilesattentes OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 22407)
-- Name: traiter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.traiter (
    documents_id character varying(255) NOT NULL,
    missions_id character varying(255) NOT NULL
);


ALTER TABLE public.traiter OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 22554)
-- Name: validations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validations (
    id character varying(255) NOT NULL,
    code character varying(255),
    etat character varying(255),
    datecreation date,
    datemodification date,
    typevote character varying(255),
    dureevote integer,
    typevalidation character varying(255),
    roles_id character varying(255)
);


ALTER TABLE public.validations OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 22424)
-- Name: violer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.violer (
    mouvements_id character varying(255) NOT NULL,
    precomouvements_id character varying(255) NOT NULL
);


ALTER TABLE public.violer OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 22324)
-- Dependencies: 218
-- Data for Name: associer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '36b843d8-f8a7-4b76-9980-1add9edc2364') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 2, 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '36b843d8-f8a7-4b76-9980-1add9edc2364') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (false, 3, 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '36b843d8-f8a7-4b76-9980-1add9edc2364') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'be9ef47f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (false, 2, 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'be9ef47f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 3, 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'be9ef47f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'be8ef47f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'be8ef57f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'be8ef56f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'be8ef59f-d5a2-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'be8ef59f-d5a3-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'be8ef59f-d5a4-4254-ab79-af860672553e') ON CONFLICT DO NOTHING;
INSERT INTO public.associer (obligatoire, ordre, attributs_id, categories_id) VALUES (true, 1, 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'be8ef59f-d5a4-4254-ab99-af860672553e') ON CONFLICT DO NOTHING;


--
-- TOC entry 5080 (class 0 OID 22308)
-- Dependencies: 216
-- Data for Name: attributs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Taille', 'Description Taille', true, '2022-01-01', '2022-01-02', 'String', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Poids', 'Description Poids', true, '2022-01-01', '2022-01-02', 'Double', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Age', 'Description age', true, '2022-01-01', '2022-01-02', 'Int', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Sexe', 'Sexe ', true, '2022-01-01', '2022-01-02', 'String', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Teint', 'Coloration', true, '2022-01-01', '2022-01-02', 'String', 'Noir') ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Groupe sangin', 'Groupe sangin', true, '2022-01-01', '2022-01-02', 'String', 'A, A+, A-, B, B+, B-, AB, AB+, AB-, O, O+, O-') ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Allergies', 'Allergies connues ', true, '2022-01-01', '2022-01-02', 'String', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Nom', 'Nom de la personne', true, '2022-01-01', '2022-01-02', 'String', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Adresse', 'Adresse postale', true, '2022-01-01', '2022-01-02', 'String', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Date de naissance', 'Date de naissance', true, '2022-01-01', '2022-01-02', 'Date', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5120 (class 0 OID 27723)
-- Dependencies: 256
-- Data for Name: caisses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.caisses (id, libelle, solde, type, detailjson) VALUES ('a1f8e3b0-4c6d-4e5e-ab7a-2a8b9b9c8d6f', 'Caisse principale', 10000, 'Caisse', '{"description": "Caisse principale"}') ON CONFLICT DO NOTHING;
INSERT INTO public.caisses (id, libelle, solde, type, detailjson) VALUES ('d9e2f1c2-8b3a-4f6c-bd5e-1a7b8a7c6d5e', 'Caisse secondaire', 5000, 'Caisse', '{"description": "Caisse secondaire"}') ON CONFLICT DO NOTHING;
INSERT INTO public.caisses (id, libelle, solde, type, detailjson) VALUES ('b3a7c8d6-1e2f-3d4c-cb6a-9e8f0a7b6c5d', 'Caisse en ligne', 7500, 'Caisse', '{"description": "Caisse en ligne"}') ON CONFLICT DO NOTHING;
INSERT INTO public.caisses (id, libelle, solde, type, detailjson) VALUES ('f0a7b6c5-d4e3f2a1-8d9c-7d6e-5f4a3b2c1e0d', 'Caisse mobile', 3000, 'Caisse', '{"description": "Caisse mobile"}') ON CONFLICT DO NOTHING;


--
-- TOC entry 5081 (class 0 OID 22316)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('36b843d8-f8a7-4b76-9980-1add9edc2364', '0', 'Informations Personnelles', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be9ef47f-d5a2-4254-ab79-af860672553e', '1', 'Informations Primaires', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef47f-d5a2-4254-ab79-af860672553e', '0', 'Conditions Générales', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef57f-d5a2-4254-ab79-af860672553e', '1', 'Conditions Particulières', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef56f-d5a2-4254-ab79-af860672553e', '1', 'Informations Personnelles', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef59f-d5a2-4254-ab79-af860672553e', '1', 'Informations Primaires', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef59f-d5a3-4254-ab79-af860672553e', '1', 'Conditions Générales', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f5') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef59f-d5a4-4254-ab79-af860672553e', '0', 'Conditions Générales', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f6') ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, ordre, libelle, etat, datecreation, datemodification, documents_id) VALUES ('be8ef59f-d5a4-4254-ab99-af860672553e', '0', 'Catégorie par Defaut', true, '2022-01-01', '2022-01-02', '0190615e-1101-7209-9932-7020bbd556f7') ON CONFLICT DO NOTHING;


--
-- TOC entry 5119 (class 0 OID 27716)
-- Dependencies: 255
-- Data for Name: comptes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('a1f8e3b0-4c6d-4e5e-7b7a-2a8b9b9c8d6f', '1000.00', '2024-08-19', 'actif', 500, 'Compte courant', '0618e585-f82a-4d5f-af2c-54f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('d9e2f1c2-8b3a-4f6c-7d5e-1a7b8a7c6d5e', '2500.00', '2024-08-19', 'actif', 1000, 'Épargne', '0618e585-f82a-4d5f-af2c-04f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('b3a7c8d6-1e2f-3d4c-7b6a-9e8f0a7b6c5d', '500.00', '2024-08-19', 'inactif', 0, 'Compte jeunesse', '1979bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('f0a7b6c5-d4e3f2a1-7b9c-7d6e-5f4a3b2c1e0d', '7500.00', '2024-08-19', 'actif', 2000, 'Compte entreprise', '0618e585-f82a-4d5f-af1c-54f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('d301ff83-1b62-4e6d-aa23-57c7825bcd57', '2500.00', '2024-08-19', 'actif', 1000, 'Épargne', 'd301ff83-2a62-4e6d-aa23-57c7825bcd57') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('1179bd79-f71b-498b-b247-e7b9bbb3f600', '500.00', '2024-08-19', 'inactif', 0, 'Compte jeunesse', '0079bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('00012f83-2a62-4e6d-aa23-57c7825bcd57', '7500.00', '2024-08-19', 'actif', 2000, 'Compte entreprise', '0001ff83-2a62-4e6d-aa23-57c7825bcd57') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('1518e585-f82a-4d5f-af1c-54f880d766d3', '7500.00', '2024-08-19', 'actif', 2000, 'Compte entreprise', '0018e585-f82a-4d5f-af1c-54f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.comptes (id, solde, datecreation, etat, montantdecouvertmax, libelle, personnes_id) VALUES ('adbff692-418d-43ab-a196-fcc3114b2daa', '1000.00', '2024-08-19', 'actif', 500, 'Compte courant', 'fdbff692-6b8d-43ab-a196-fcc3114b2daa') ON CONFLICT DO NOTHING;


--
-- TOC entry 5123 (class 0 OID 27824)
-- Dependencies: 259
-- Data for Name: concerner; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5083 (class 0 OID 22343)
-- Dependencies: 219
-- Data for Name: constituer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', '0190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '0190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', '0190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', '0190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '0190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', '0190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', '0190615e-1101-7209-9932-7020bbd556f5') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', '0190615e-1101-7209-9932-7020bbd556f6') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', '0190615e-1101-7209-9932-7020bbd556f7') ON CONFLICT DO NOTHING;
INSERT INTO public.constituer (attributs_id, documents_id) VALUES ('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', '0190615e-1101-7209-9932-7020bbd556f8') ON CONFLICT DO NOTHING;


--
-- TOC entry 5118 (class 0 OID 27709)
-- Dependencies: 254
-- Data for Name: deltasoldes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5114 (class 0 OID 22561)
-- Dependencies: 250
-- Data for Name: docetats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.docetats (id, ordre, datecreation, datemodification, validations_id, etats_id, documents_id, etapes_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672553e', 15, '2022-03-02', '2022-10-02', '1901bd80-f71b-498b-b247-e7b9bbb3f602', 'e190615e-1101-7209-9932-7020bbd556f1', '0190615e-1101-7209-9932-7020bbd556f1', '1901bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.docetats (id, ordre, datecreation, datemodification, validations_id, etats_id, documents_id, etapes_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672554e', 10, '2002-01-02', '2022-11-02', '1901bd80-f71b-498b-b247-e7b9bbb3f601', 'e190615e-1101-7209-9932-7020bbd556f2', '0190615e-1101-7209-9932-7020bbd556f2', '1901bd79-f71b-498b-b247-e7b9bbb3f601') ON CONFLICT DO NOTHING;
INSERT INTO public.docetats (id, ordre, datecreation, datemodification, validations_id, etats_id, documents_id, etapes_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672555e', 11, '2014-01-12', '2022-02-02', '1901bd80-f71b-498b-b247-e7b9bbb3f600', 'e190615e-1101-7209-9932-7020bbd556f3', '0190615e-1101-7209-9932-7020bbd556f3', '1901bd79-f71b-498b-b247-e7b9bbb3f602') ON CONFLICT DO NOTHING;
INSERT INTO public.docetats (id, ordre, datecreation, datemodification, validations_id, etats_id, documents_id, etapes_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672556e', 12, '2023-10-25', '2024-03-02', '1901bd80-f71b-498b-b247-e7b9bbb3f603', 'e190615e-1101-7209-9932-7020bbd556f4', '0190615e-1101-7209-9932-7020bbd556f4', '1901bd79-f71b-498b-b247-e7b9bbb3f602') ON CONFLICT DO NOTHING;
INSERT INTO public.docetats (id, ordre, datecreation, datemodification, validations_id, etats_id, documents_id, etapes_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672557e', 16, '2020-11-15', '2024-05-02', '1901bd80-f71b-498b-b247-e7b9bbb3f604', 'e190615e-1101-7209-9932-7020bbd556f4', '0190615e-1101-7209-9932-7020bbd556f5', '1901bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;


--
-- TOC entry 5115 (class 0 OID 22568)
-- Dependencies: 251
-- Data for Name: docetats_predecesseurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.docetats_predecesseurs (docetats_id, predecesseur_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672553e', 'be8ef4af-d5a2-4254-cd79-af860672555e') ON CONFLICT DO NOTHING;
INSERT INTO public.docetats_predecesseurs (docetats_id, predecesseur_id) VALUES ('be8ef4af-d5a2-4254-cd79-af860672554e', 'be8ef4af-d5a2-4254-cd79-af860672556e') ON CONFLICT DO NOTHING;


--
-- TOC entry 5084 (class 0 OID 22348)
-- Dependencies: 220
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f1', 'Note intervention', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, '2023-03-31', '2023-03-31', 'Ajout', 'true', true, true, true, true, true) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f2', 'Fiche de suivi', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, '2023-03-31', '2023-03-31', 'Neutre', 'true', true, true, true, true, true) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f3', 'Fiche de soin', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, NULL, NULL, 'Ajout', 'true', true, true, true, true, false) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f4', 'Formulaire de sortie', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, NULL, NULL, 'Neutre', 'true', true, true, true, true, true) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f5', 'ordonnance', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, NULL, NULL, 'Neutre', 'true', true, true, true, true, false) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f6', 'Bon de commande', 'Document delivre par le chef service', true, NULL, NULL, 'Neutre', 'true', true, true, true, true, false) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f7', 'Bon de livraison', 'Document delivre par ', true, NULL, NULL, 'Reduire', 'true', true, true, true, true, true) ON CONFLICT DO NOTHING;
INSERT INTO public.documents (id, titre, description, etat, datecreation, datemodification, typemouvement, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources, estencaissable) VALUES ('0190615e-1101-7209-9932-7020bbd556f8', 'Fiche de selection', 'Document delivre par le magasinier', true, NULL, NULL, 'Neutre', 'true', true, true, true, true, false) ON CONFLICT DO NOTHING;


--
-- TOC entry 5103 (class 0 OID 22490)
-- Dependencies: 239
-- Data for Name: documentspromotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.documentspromotions (documents_id, promotions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f1', '1979bd79-f81b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.documentspromotions (documents_id, promotions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f8', '1979bd79-f81b-498b-b247-e7b9bbb3f602') ON CONFLICT DO NOTHING;
INSERT INTO public.documentspromotions (documents_id, promotions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f5', '1979bd79-f81b-498b-b247-e7b9bbb3f601') ON CONFLICT DO NOTHING;


--
-- TOC entry 5087 (class 0 OID 22367)
-- Dependencies: 223
-- Data for Name: etapes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etapes (id, libelle, etat, datemodification, parcours_id) VALUES ('1901bd79-f71b-498b-b247-e7b9bbb3f600', 'Paracetamol', 'true', '2022-01-02', '1900bd79-f71b-498b-b247-e7b9bbb3f602') ON CONFLICT DO NOTHING;
INSERT INTO public.etapes (id, libelle, etat, datemodification, parcours_id) VALUES ('1901bd79-f71b-498b-b247-e7b9bbb3f601', 'Cartouche d''encre', 'true', '2020-01-08', '1900bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.etapes (id, libelle, etat, datemodification, parcours_id) VALUES ('1901bd79-f71b-498b-b247-e7b9bbb3f602', 'Scanner', 'true', '2014-01-04', '1900bd79-f71b-498b-b247-e7b9bbb3f601') ON CONFLICT DO NOTHING;


--
-- TOC entry 5086 (class 0 OID 22360)
-- Dependencies: 222
-- Data for Name: etats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etats (id, libelle, description, datecreation, datemodification) VALUES ('e190615e-1101-7209-9932-7020bbd556f1', 'En cours', 'En cours', '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.etats (id, libelle, description, datecreation, datemodification) VALUES ('e190615e-1101-7209-9932-7020bbd556f2', 'Valide', 'Valide', '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.etats (id, libelle, description, datecreation, datemodification) VALUES ('e190615e-1101-7209-9932-7020bbd556f3', 'Rejete', 'Rejete', '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.etats (id, libelle, description, datecreation, datemodification) VALUES ('e190615e-1101-7209-9932-7020bbd556f4', 'En attente', 'En attente', '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;


--
-- TOC entry 5121 (class 0 OID 27730)
-- Dependencies: 257
-- Data for Name: exemplaires; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5088 (class 0 OID 22374)
-- Dependencies: 224
-- Data for Name: familles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.familles (id, libelle, description, etat, datecreation, datemodification) VALUES ('f190615e-1101-7209-9932-7020bbd556f1', 'Medicaments', 'Medicaments', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.familles (id, libelle, description, etat, datecreation, datemodification) VALUES ('f190615e-1101-7209-9932-7020bbd556f2', 'Consommables Informatiques', 'Consommables Informatiques', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.familles (id, libelle, description, etat, datecreation, datemodification) VALUES ('f190615e-1101-7209-9932-7020bbd556f3', 'BioMedical', 'BioMedical', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.familles (id, libelle, description, etat, datecreation, datemodification) VALUES ('f190615e-1101-7209-9932-7020bbd556f4', 'Accessoires', 'Accessoires', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;


--
-- TOC entry 5104 (class 0 OID 22495)
-- Dependencies: 240
-- Data for Name: famillespromotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.famillespromotions (familles_id, promotions_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f1', '1979bd79-f81b-498b-b247-e7b9bbb3f602') ON CONFLICT DO NOTHING;
INSERT INTO public.famillespromotions (familles_id, promotions_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f3', '1979bd79-f81b-498b-b247-e7b9bbb3f601') ON CONFLICT DO NOTHING;
INSERT INTO public.famillespromotions (familles_id, promotions_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f4', '1979bd79-f81b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;


--
-- TOC entry 5090 (class 0 OID 22386)
-- Dependencies: 226
-- Data for Name: filesattentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filesattentes (id, datecreation, datemodification, etat, services_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', '2022-01-02', true, '2190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.filesattentes (id, datecreation, datemodification, etat, services_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', '2022-01-02', true, '2190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.filesattentes (id, datecreation, datemodification, etat, services_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', '2022-01-02', true, '2190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5091 (class 0 OID 22393)
-- Dependencies: 227
-- Data for Name: jouerroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jouerroles (id, etat, datecreation, datemodification, datefin, datedebut, personnels_id, roles_id) VALUES ('d76fd017-cceb-4926-8705-380b08ad9c6a', NULL, '2022-01-01', '2022-01-02', NULL, '2024-01-01', '4390615e-1101-7209-9932-7020bbd556f1', '5190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.jouerroles (id, etat, datecreation, datemodification, datefin, datedebut, personnels_id, roles_id) VALUES ('d39bcc09-ffe6-48d1-8582-f1173671d59f', NULL, '2022-01-01', '2022-01-02', NULL, '2024-01-01', '4390615e-1101-7209-9932-7020bbd556f2', '6130615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.jouerroles (id, etat, datecreation, datemodification, datefin, datedebut, personnels_id, roles_id) VALUES ('9183d626-0c1a-4f70-8556-1c417d5feb91', NULL, '2022-01-01', '2022-01-02', NULL, '2024-01-01', '4390615e-1101-7209-9932-7020bbd556f3', '6191615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5092 (class 0 OID 22400)
-- Dependencies: 228
-- Data for Name: missions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.missions (id, libelle, description, etat, datecreation, datemodification, services_id) VALUES ('3190615e-1101-7209-9932-7020bbd556f1', 'Encaissement', 'recu de paiement lié à une mission', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.missions (id, libelle, description, etat, datecreation, datemodification, services_id) VALUES ('3190615e-1101-7209-9932-7020bbd556f2', 'Resultat Labo', 'Communiquer les résultats du labo aux patients', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.missions (id, libelle, description, etat, datecreation, datemodification, services_id) VALUES ('3190615e-1101-7209-9932-7020bbd556f3', 'Hospitalisation', 'bon d''entrée et de sortie est une mission', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.missions (id, libelle, description, etat, datecreation, datemodification, services_id) VALUES ('3190615e-1101-7209-9932-7020bbd556f4', 'Prelevement Labo', 'Prélévement fait par laboratoire', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.missions (id, libelle, description, etat, datecreation, datemodification, services_id) VALUES ('3190615e-1101-7209-9932-7020bbd556f5', 'Consultation Spécialiste', 'Consultation faite par un médecin', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.missions (id, libelle, description, etat, datecreation, datemodification, services_id) VALUES ('3190615e-1101-7209-9932-7020bbd556f6', 'Consultation', 'Consultation faite par une infirmière', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5122 (class 0 OID 27782)
-- Dependencies: 258
-- Data for Name: mouvementcaisses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5094 (class 0 OID 22412)
-- Dependencies: 230
-- Data for Name: mouvements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mouvements (id, description, quantite, prix, datecreation, dateperemption, datemodification, ressources_id, distributeurs_id) VALUES ('97d314f5-84ad-47cd-874d-9c55f0e45790', 'sur commande', 10, 5000, '2022-01-01', NULL, '2022-01-02', '6190615e-1101-7209-9932-7020bbd556f1', '1979bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.mouvements (id, description, quantite, prix, datecreation, dateperemption, datemodification, ressources_id, distributeurs_id) VALUES ('bfee750d-9b8c-4475-9373-08eff9b3ccb7', 'vente à credit', 20, 10000, '2022-01-01', NULL, '2022-01-02', '6190615e-1101-7209-9932-7020bbd556f2', '0618e585-f82a-4d5f-af1c-54f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.mouvements (id, description, quantite, prix, datecreation, dateperemption, datemodification, ressources_id, distributeurs_id) VALUES ('0e7cea07-d09e-4f79-be6c-6dd27aecbce6', 'achat express', 5, 2000, '2022-01-01', NULL, '2022-01-02', '6190615e-1101-7209-9932-7020bbd556f3', '0618e585-f82a-4d5f-af2c-54f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.mouvements (id, description, quantite, prix, datecreation, dateperemption, datemodification, ressources_id, distributeurs_id) VALUES ('decaedc8-a908-4cad-bdd6-0403a2614f22', 'inventaire', 5, 2000, '2022-01-01', NULL, '2022-01-02', '6190615e-1101-7209-9932-7020bbd556f4', '0618e585-f82a-4d5f-af2c-04f880d766d3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5097 (class 0 OID 22429)
-- Dependencies: 233
-- Data for Name: ordreetats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ordreetats (id, datecreation, datemodification, datefinvote, ordre, etats_id) VALUES ('97d314a5-84ad-47cd-874d-9c55f0e45790', '2022-01-01', '2022-01-02', '2022-01-02', 2, 'e190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ordreetats (id, datecreation, datemodification, datefinvote, ordre, etats_id) VALUES ('97d314a5-84ad-47cd-874d-9c55f0e45791', '2022-01-01', '2022-01-02', '2022-01-02', 5, 'e190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ordreetats (id, datecreation, datemodification, datefinvote, ordre, etats_id) VALUES ('97d314a5-84ad-47cd-874d-9c55f0e45792', '2022-01-01', '2022-01-02', '2022-01-02', 8, 'e190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;


--
-- TOC entry 5098 (class 0 OID 22436)
-- Dependencies: 234
-- Data for Name: parcours; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parcours (id, libelle, datecreation, datemodification) VALUES ('1900bd79-f71b-498b-b247-e7b9bbb3f600', 'Paracetamol', '2022-01-02', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.parcours (id, libelle, datecreation, datemodification) VALUES ('1900bd79-f71b-498b-b247-e7b9bbb3f601', 'Cartouche d''encre', '2020-01-08', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.parcours (id, libelle, datecreation, datemodification) VALUES ('1900bd79-f71b-498b-b247-e7b9bbb3f602', 'Scanner', '2014-01-04', '2022-01-02') ON CONFLICT DO NOTHING;


--
-- TOC entry 5099 (class 0 OID 22443)
-- Dependencies: 235
-- Data for Name: personnels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnels (id, dateentree, nom, datenaissance, telephone, datesortie, email, prenom, sexe, datemodification) VALUES ('4390615e-1101-7209-9932-7020bbd556f1', '2024-07-27', 'Tagne', '2000-04-10', '655455487', NULL, 'tagnewillie@gmail.com', 'Willy', 'M', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.personnels (id, dateentree, nom, datenaissance, telephone, datesortie, email, prenom, sexe, datemodification) VALUES ('4390615e-1101-7209-9932-7020bbd556f2', '2024-07-27', 'Peter', '2004-08-10', '655455487', NULL, 'peteralan@gmail.com', 'Alan', 'M', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.personnels (id, dateentree, nom, datenaissance, telephone, datesortie, email, prenom, sexe, datemodification) VALUES ('4390615e-1101-7209-9932-7020bbd556f3', '2024-07-27', 'Dombo', '2002-10-10', '655455487', NULL, 'dombogilles@gmail.com', 'Gilles', 'M', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5117 (class 0 OID 27701)
-- Dependencies: 253
-- Data for Name: personnes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('1979bd79-f71b-498b-b247-e7b9bbb3f600', NULL, NULL, NULL, NULL, 'd190615', 'ENEO', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'distributeurs', 'b3a7c8d6-1e2f-3d4c-7b6a-9e8f0a7b6c5d') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('0618e585-f82a-4d5f-af1c-54f880d766d3', NULL, NULL, NULL, NULL, 'd190616', 'Brasserie', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'distributeurs', 'f0a7b6c5-d4e3f2a1-7b9c-7d6e-5f4a3b2c1e0d') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('0618e585-f82a-4d5f-af2c-54f880d766d3', NULL, NULL, NULL, NULL, 'd190619', 'UCB', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'distributeurs', 'a1f8e3b0-4c6d-4e5e-7b7a-2a8b9b9c8d6f') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('0618e585-f82a-4d5f-af2c-04f880d766d3', NULL, NULL, NULL, NULL, 'd190614', 'Pharmacam', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'distributeurs', 'd9e2f1c2-8b3a-4f6c-7d5e-1a7b8a7c6d5e') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('fdbff692-6b8d-43ab-a196-fcc3114b2daa', NULL, NULL, NULL, NULL, NULL, NULL, 'Nkoabang', 'pnjerrtt@gma.com', 'Masculin', '2022-01-01', NULL, '2022-01-02', 'personnesphysique', 'adbff692-418d-43ab-a196-fcc3114b2daa') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('d301ff83-2a62-4e6d-aa23-57c7825bcd57', NULL, NULL, NULL, NULL, NULL, NULL, 'Essos', 'nayat@gma.com', 'Masculin', '2022-01-01', NULL, '2022-01-02', 'personnesphysique', 'd301ff83-1b62-4e6d-aa23-57c7825bcd57') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('0079bd79-f71b-498b-b247-e7b9bbb3f600', NULL, NULL, NULL, NULL, '43', 'GOSPEL', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'personnesmorales', '1179bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('0001ff83-2a62-4e6d-aa23-57c7825bcd57', NULL, NULL, NULL, NULL, '47', 'Sportif', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'personnesmorales', '00012f83-2a62-4e6d-aa23-57c7825bcd57') ON CONFLICT DO NOTHING;
INSERT INTO public.personnes (id, adresse, mail, telephone, qrcodevalue, code, raisonsociale, nom, prenom, sexe, datenaissance, datecreation, datemodification, person_type, comptes_id) VALUES ('0018e585-f82a-4d5f-af1c-54f880d766d3', NULL, NULL, NULL, NULL, '45', 'armee', NULL, NULL, NULL, NULL, NULL, '2022-01-01', 'personnesmorales', '1518e585-f82a-4d5f-af1c-54f880d766d3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5116 (class 0 OID 27679)
-- Dependencies: 252
-- Data for Name: personnes_s; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5101 (class 0 OID 22476)
-- Dependencies: 237
-- Data for Name: precomouvements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('6290615e-1101-7209-9932-7020bbd556f1', 'Inventaire', true, '2022-01-01', '2022-01-02', 'Neutre') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('6290615e-1101-7209-9932-7020bbd556f2', 'Vente', true, '2022-01-01', '2022-01-02', 'Reduire') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('17ee6932-2fcd-4b93-9c4c-0a4dbf659bff', 'Achat', true, '2022-01-01', '2022-01-02', 'Ajout') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('77b8577f-6d26-4376-af30-a3c8f75a9194', 'interdiction Infirmière', true, '2022-01-01', '2022-01-02', 'Neutre') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('6290615e-1101-7209-9932-7020bbd556f5', 'Don', true, '2022-01-01', '2022-01-02', 'Neutre') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('6290615e-1101-7209-9932-7020bbd556f6', 'Perte', true, '2022-01-01', '2022-01-02', 'Reduire') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('6290615e-1101-7209-9932-7020bbd556f7', 'Retour', true, '2022-01-01', '2022-01-02', 'Ajout') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvements (id, libelle, etat, datecreation, datemodification, typemouvement) VALUES ('6290615e-1101-7209-9932-7020bbd556f8', 'Sortie magasin', true, '2022-01-01', '2022-01-02', 'Reduire') ON CONFLICT DO NOTHING;


--
-- TOC entry 5102 (class 0 OID 22483)
-- Dependencies: 238
-- Data for Name: precomouvementsqtes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a97eb081-62f6-4617-ba29-64dc8593a9ff', 10, 100, 500, 5000, '2022-01-01', '2022-01-02', '6290615e-1101-7209-9932-7020bbd556f1', '6190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a87eb081-62f6-4617-ba29-64dc8593a9ff', 20, 200, 1000, 10000, '2022-01-01', '2022-01-02', '6290615e-1101-7209-9932-7020bbd556f2', '6190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a77eb081-62f6-4617-ba29-64dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '17ee6932-2fcd-4b93-9c4c-0a4dbf659bff', '6190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a67eb081-62f6-4617-ba29-64dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '77b8577f-6d26-4376-af30-a3c8f75a9194', '6190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a97eb071-62f6-4617-ba29-64dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '77b8577f-6d26-4376-af30-a3c8f75a9194', '6190615e-1101-7209-9932-7020bbd556f5') ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a97eb081-72f6-4617-ba29-64dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '6290615e-1101-7209-9932-7020bbd556f6', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a97eb081-62f6-4617-ba49-64dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '6290615e-1101-7209-9932-7020bbd556f7', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a97eb081-62f6-4617-ba29-65dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '6290615e-1101-7209-9932-7020bbd556f8', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, datecreation, datemodification, precomouvements_id, ressources_id) VALUES ('a97eb081-62f6-4617-ba29-74dc8593a9ff', 5, 50, 200, 2000, '2022-01-01', '2022-01-02', '6290615e-1101-7209-9932-7020bbd556f8', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5105 (class 0 OID 22500)
-- Dependencies: 241
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.promotions (id, datedebut, datefin, codeunique, typeremise, valeurremise, datecreation, datemodification, distributeurs_id) VALUES ('1979bd79-f81b-498b-b247-e7b9bbb3f600', '2022-01-01', '2022-01-01', 'R5', 'garantie', 54.25, '2000-04-10', '2022-01-01', '1979bd79-f71b-498b-b247-e7b9bbb3f600') ON CONFLICT DO NOTHING;
INSERT INTO public.promotions (id, datedebut, datefin, codeunique, typeremise, valeurremise, datecreation, datemodification, distributeurs_id) VALUES ('1979bd79-f81b-498b-b247-e7b9bbb3f601', '2022-01-01', '2022-01-01', 'R54', 'virement', 74.25, '2004-08-10', '2022-01-01', '0618e585-f82a-4d5f-af1c-54f880d766d3') ON CONFLICT DO NOTHING;
INSERT INTO public.promotions (id, datedebut, datefin, codeunique, typeremise, valeurremise, datecreation, datemodification, distributeurs_id) VALUES ('1979bd79-f81b-498b-b247-e7b9bbb3f602', '2022-01-01', '2022-01-01', 'R45', 'devoir', 95.23, '2002-10-10', '2022-01-01', 'd301ff83-2a62-4e6d-aa23-57c7825bcd57') ON CONFLICT DO NOTHING;


--
-- TOC entry 5100 (class 0 OID 22457)
-- Dependencies: 236
-- Data for Name: rattacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rattacher (personnes_id, rattacher_id) VALUES ('1979bd79-f71b-498b-b247-e7b9bbb3f600', 'd301ff83-2a62-4e6d-aa23-57c7825bcd57') ON CONFLICT DO NOTHING;
INSERT INTO public.rattacher (personnes_id, rattacher_id) VALUES ('fdbff692-6b8d-43ab-a196-fcc3114b2daa', '0618e585-f82a-4d5f-af1c-54f880d766d3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5106 (class 0 OID 22507)
-- Dependencies: 242
-- Data for Name: remplir; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.remplir (datefin, datecreation, datedebut, etat, droitajouter, droitmodifier, droitconsulter, droitvalider, roles_id, missions_id) VALUES ('2022-01-02', '2022-01-02', '2022-01-02', true, true, true, true, true, '6130615e-1101-7209-9932-7020bbd556f2', '3190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.remplir (datefin, datecreation, datedebut, etat, droitajouter, droitmodifier, droitconsulter, droitvalider, roles_id, missions_id) VALUES ('2022-01-02', '2022-01-02', '2022-01-02', true, true, true, true, true, '5190615e-1101-7209-9932-7020bbd556f1', '3190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.remplir (datefin, datecreation, datedebut, etat, droitajouter, droitmodifier, droitconsulter, droitvalider, roles_id, missions_id) VALUES ('2022-01-02', '2022-01-02', '2022-01-02', true, true, true, true, true, '6191615e-1101-7209-9932-7020bbd556f3', '3190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5095 (class 0 OID 22419)
-- Dependencies: 231
-- Data for Name: respecter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.respecter (mouvements_id, precomouvements_id) VALUES ('97d314f5-84ad-47cd-874d-9c55f0e45790', '6290615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.respecter (mouvements_id, precomouvements_id) VALUES ('bfee750d-9b8c-4475-9373-08eff9b3ccb7', '6290615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.respecter (mouvements_id, precomouvements_id) VALUES ('0e7cea07-d09e-4f79-be6c-6dd27aecbce6', '17ee6932-2fcd-4b93-9c4c-0a4dbf659bff') ON CONFLICT DO NOTHING;


--
-- TOC entry 5107 (class 0 OID 22514)
-- Dependencies: 243
-- Data for Name: ressources; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f1', 'Paracetamol', 'Paracetamol', true, '2022-01-01', '2022-01-02', 4, 20, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f2', 'Cartouche d''encre', 'Cartouche d''encre', true, '2022-01-01', '2022-01-02', 4, 10, 2000, 3000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f3', 'Scanner', 'Scanner', true, '2022-01-01', '2022-01-02', 4, 2, 12000, 20000, 'Packs', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f4', 'Imprimante', 'Imprimante', true, '2022-01-01', '2022-01-02', 4, 2, 12000, 20000, 'Packs', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f5', 'Souris', 'Souris', true, '2022-01-01', '2022-01-02', 40, 12, 25, 20, 'Packs', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f6', 'Stylet', 'Stylet', true, '2022-01-01', '2022-01-02', 24, 9, 20, 20000, 'Packs', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f7', 'Doliprane', 'Doliprane', true, '2022-01-01', '2022-01-02', 90, 40, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f8', 'Pommade', 'Pommade', true, '2022-01-01', '2022-01-02', 20, 20, 200, 210, 'Litre', 'f190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f9', 'Seringue', 'Seringue', true, '2022-01-01', '2022-01-02', 42, 20, 100, 200, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('6190615e-1101-7209-9932-7020bbd556f0', 'Perfuseur', 'Perfuseur', true, '2022-01-01', '2022-01-02', 5, 20, 90, 230, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0501', 'Gants', 'Gants', true, '2022-01-01', '2022-01-02', 4, 20, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0502', 'Masque', 'Masque', true, '2022-01-01', '2022-01-02', 4, 20, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0503', 'Gel Hydroalcoolique', 'Gel Hydroalcoolique', true, '2022-01-01', '2022-01-02', 54, 200, 1200, 2000, 'Litre', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0504', 'Coton', 'Coton', true, '2022-01-01', '2022-01-02', 44, 230, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0505', 'Papier', 'Papier', true, '2022-01-01', '2022-01-02', 24, 20, 1200, 2000, 'Packs', 'f190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0506', 'Encre', 'Encre', true, '2022-01-01', '2022-01-02', 4, 20, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0507', 'Toner', 'Toner', true, '2022-01-01', '2022-01-02', 4, 20, 1200, 2000, 'Boite', 'f190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.ressources (id, libelle, description, etat, datecreation, datemodification, quantite, seuilalerte, prixentree, prixsortie, unite, familles_id) VALUES ('5f516ee3-b23d-4cf1-8d55-e301764e0508', 'Cahier', 'Cahier', true, '2022-01-01', '2022-01-02', 4, 20, 1200, 2000, 'Packs', 'f190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;


--
-- TOC entry 5108 (class 0 OID 22521)
-- Dependencies: 244
-- Data for Name: ressourcespromotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ressourcespromotions (promotions_id, ressources_id) VALUES ('1979bd79-f81b-498b-b247-e7b9bbb3f600', '6190615e-1101-7209-9932-7020bbd556f6') ON CONFLICT DO NOTHING;
INSERT INTO public.ressourcespromotions (promotions_id, ressources_id) VALUES ('1979bd79-f81b-498b-b247-e7b9bbb3f601', '6190615e-1101-7209-9932-7020bbd556f4') ON CONFLICT DO NOTHING;
INSERT INTO public.ressourcespromotions (promotions_id, ressources_id) VALUES ('1979bd79-f81b-498b-b247-e7b9bbb3f602', '6190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;


--
-- TOC entry 5109 (class 0 OID 22526)
-- Dependencies: 245
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, titre, description, etat, datecreation, datemodification) VALUES ('5190615e-1101-7209-9932-7020bbd556f1', 'vendeur', 'personnel au contact du client', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.roles (id, titre, description, etat, datecreation, datemodification) VALUES ('6130615e-1101-7209-9932-7020bbd556f2', 'traiteur', 'Personnel administratif', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;
INSERT INTO public.roles (id, titre, description, etat, datecreation, datemodification) VALUES ('6191615e-1101-7209-9932-7020bbd556f3', 'marcheur', 'commercial sur le terrain', true, '2022-01-01', '2022-01-02') ON CONFLICT DO NOTHING;


--
-- TOC entry 5089 (class 0 OID 22381)
-- Dependencies: 225
-- Data for Name: sapplique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f1', 'a97eb081-72f6-4617-ba29-64dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f2', 'a97eb081-62f6-4617-ba49-64dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f3', 'a97eb081-62f6-4617-ba29-65dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f4', 'a97eb081-62f6-4617-ba49-64dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f1', 'a97eb081-62f6-4617-ba49-64dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f2', 'a97eb081-72f6-4617-ba29-64dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f3', 'a97eb081-62f6-4617-ba49-64dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f4', 'a97eb081-62f6-4617-ba29-65dc8593a9ff') ON CONFLICT DO NOTHING;
INSERT INTO public.sapplique (familles_id, precomouvementsqtes_id) VALUES ('f190615e-1101-7209-9932-7020bbd556f1', 'a97eb081-62f6-4617-ba49-64dc8593a9ff') ON CONFLICT DO NOTHING;


--
-- TOC entry 5110 (class 0 OID 22533)
-- Dependencies: 246
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.services (id, description, libelle, localisation, etat, datecreation, datemodification, codeunique, filesattentes_id) VALUES ('2190615e-1101-7209-9932-7020bbd556f1', 'bien', 'Consultation', 'douala', true, '1972-06-12', '1990-03-07', 'S1', 'f190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.services (id, description, libelle, localisation, etat, datecreation, datemodification, codeunique, filesattentes_id) VALUES ('2190615e-1101-7209-9932-7020bbd556f2', 'bien', 'Laboratoire', 'douala', true, '1990-08-06', '1990-03-07', 'S2', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.services (id, description, libelle, localisation, etat, datecreation, datemodification, codeunique, filesattentes_id) VALUES ('2190615e-1101-7209-9932-7020bbd556f3', 'bien', 'Pharmacie', 'douala', true, '2000-03-07', '1990-03-07', 'S3', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5085 (class 0 OID 22355)
-- Dependencies: 221
-- Data for Name: suivre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f1', '6290615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f2', '6290615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f3', '17ee6932-2fcd-4b93-9c4c-0a4dbf659bff') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f4', '77b8577f-6d26-4376-af30-a3c8f75a9194') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f5', '6290615e-1101-7209-9932-7020bbd556f5') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f6', '6290615e-1101-7209-9932-7020bbd556f6') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f7', '6290615e-1101-7209-9932-7020bbd556f7') ON CONFLICT DO NOTHING;
INSERT INTO public.suivre (documents_id, precomouvements_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f8', '6290615e-1101-7209-9932-7020bbd556f8') ON CONFLICT DO NOTHING;


--
-- TOC entry 5111 (class 0 OID 22540)
-- Dependencies: 247
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets (id, codecourt, datecreation, datemodification) VALUES ('be8ef47f-d5a2-4254-cd79-af860672553e', 'rr15', '2022-03-02', '2022-10-02') ON CONFLICT DO NOTHING;
INSERT INTO public.tickets (id, codecourt, datecreation, datemodification) VALUES ('be8ef47f-d5a2-4254-cd79-af860672554e', 'rr10', '2002-01-02', '2022-11-02') ON CONFLICT DO NOTHING;
INSERT INTO public.tickets (id, codecourt, datecreation, datemodification) VALUES ('be8ef47f-d5a2-4254-cd79-af860672555e', 'rr11', '2014-01-12', '2022-02-02') ON CONFLICT DO NOTHING;
INSERT INTO public.tickets (id, codecourt, datecreation, datemodification) VALUES ('be8ef47f-d5a2-4254-cd79-af860672556e', 'rr12', '2023-10-25', '2024-03-02') ON CONFLICT DO NOTHING;
INSERT INTO public.tickets (id, codecourt, datecreation, datemodification) VALUES ('be8ef47f-d5a2-4254-cd79-af860672557e', 'rr16', '2020-11-15', '2024-05-02') ON CONFLICT DO NOTHING;
INSERT INTO public.tickets (id, codecourt, datecreation, datemodification) VALUES ('be8ef47f-d5a2-4254-cd79-af860672558e', 'rr14', '2022-01-02', '2023-03-02') ON CONFLICT DO NOTHING;


--
-- TOC entry 5112 (class 0 OID 22547)
-- Dependencies: 248
-- Data for Name: ticketsfilesattentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ticketsfilesattentes (id, etat, dateaffectation, tickets_id, filesattentes_id) VALUES ('be8ef47f-d7a2-4254-cd79-af860672553e', true, '2024-11-04', 'be8ef47f-d5a2-4254-cd79-af860672553e', 'f190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.ticketsfilesattentes (id, etat, dateaffectation, tickets_id, filesattentes_id) VALUES ('be8ef47f-d7a2-4254-cd79-af860672554e', false, '2022-12-04', 'be8ef47f-d5a2-4254-cd79-af860672554e', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ticketsfilesattentes (id, etat, dateaffectation, tickets_id, filesattentes_id) VALUES ('be8ef47f-d7a2-4254-cd79-af860672555e', false, '2020-11-04', 'be8ef47f-d5a2-4254-cd79-af860672558e', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ticketsfilesattentes (id, etat, dateaffectation, tickets_id, filesattentes_id) VALUES ('be8ef47f-d7a2-4254-cd79-af860672556e', false, '2021-04-04', 'be8ef47f-d5a2-4254-cd79-af860672556e', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.ticketsfilesattentes (id, etat, dateaffectation, tickets_id, filesattentes_id) VALUES ('be8ef47f-d7a2-4254-cd79-af860672557e', true, '2023-02-04', 'be8ef47f-d5a2-4254-cd79-af860672555e', 'f190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.ticketsfilesattentes (id, etat, dateaffectation, tickets_id, filesattentes_id) VALUES ('be8ef47f-d7a2-4254-cd79-af860672558e', false, '2022-01-04', 'be8ef47f-d5a2-4254-cd79-af860672557e', 'f190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5093 (class 0 OID 22407)
-- Dependencies: 229
-- Data for Name: traiter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.traiter (documents_id, missions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f1', '3190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.traiter (documents_id, missions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f1', '3190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.traiter (documents_id, missions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f2', '3190615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.traiter (documents_id, missions_id) VALUES ('0190615e-1101-7209-9932-7020bbd556f3', '3190615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5113 (class 0 OID 22554)
-- Dependencies: 249
-- Data for Name: validations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.validations (id, code, etat, datecreation, datemodification, typevote, dureevote, typevalidation, roles_id) VALUES ('1901bd80-f71b-498b-b247-e7b9bbb3f602', 'o78', 'attente', '2022-03-02', '2022-10-02', 'multiple', 14, 'prioritaire', '5190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.validations (id, code, etat, datecreation, datemodification, typevote, dureevote, typevalidation, roles_id) VALUES ('1901bd80-f71b-498b-b247-e7b9bbb3f601', 'o89', 'suppression', '2002-01-02', '2022-11-02', 'multiple', 2, 'prioritaire', '6130615e-1101-7209-9932-7020bbd556f2') ON CONFLICT DO NOTHING;
INSERT INTO public.validations (id, code, etat, datecreation, datemodification, typevote, dureevote, typevalidation, roles_id) VALUES ('1901bd80-f71b-498b-b247-e7b9bbb3f600', 'o85', 'traitement', '2014-01-12', '2022-02-02', 'multiple', 5, 'rechargeable', '6191615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;
INSERT INTO public.validations (id, code, etat, datecreation, datemodification, typevote, dureevote, typevalidation, roles_id) VALUES ('1901bd80-f71b-498b-b247-e7b9bbb3f603', 'o82', 'traitement', '2023-10-25', '2024-03-02', 'multiple', 22, 'prioritaire', '5190615e-1101-7209-9932-7020bbd556f1') ON CONFLICT DO NOTHING;
INSERT INTO public.validations (id, code, etat, datecreation, datemodification, typevote, dureevote, typevalidation, roles_id) VALUES ('1901bd80-f71b-498b-b247-e7b9bbb3f604', 'o84', 'traitement', '2020-11-15', '2024-05-02', 'multiple', 40, 'prioritaire', '6191615e-1101-7209-9932-7020bbd556f3') ON CONFLICT DO NOTHING;


--
-- TOC entry 5096 (class 0 OID 22424)
-- Dependencies: 232
-- Data for Name: violer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.violer (mouvements_id, precomouvements_id) VALUES ('97d314f5-84ad-47cd-874d-9c55f0e45790', '6290615e-1101-7209-9932-7020bbd556f6') ON CONFLICT DO NOTHING;
INSERT INTO public.violer (mouvements_id, precomouvements_id) VALUES ('bfee750d-9b8c-4475-9373-08eff9b3ccb7', '6290615e-1101-7209-9932-7020bbd556f7') ON CONFLICT DO NOTHING;
INSERT INTO public.violer (mouvements_id, precomouvements_id) VALUES ('0e7cea07-d09e-4f79-be6c-6dd27aecbce6', '6290615e-1101-7209-9932-7020bbd556f8') ON CONFLICT DO NOTHING;


--
-- TOC entry 4814 (class 2606 OID 22330)
-- Name: associer pk_associer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associer
    ADD CONSTRAINT pk_associer PRIMARY KEY (attributs_id, categories_id);


--
-- TOC entry 4810 (class 2606 OID 22315)
-- Name: attributs pk_attributs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributs
    ADD CONSTRAINT pk_attributs PRIMARY KEY (id);


--
-- TOC entry 4878 (class 2606 OID 27729)
-- Name: caisses pk_caisses; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caisses
    ADD CONSTRAINT pk_caisses PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 22323)
-- Name: categories pk_categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 27722)
-- Name: comptes pk_comptes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comptes
    ADD CONSTRAINT pk_comptes PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 27715)
-- Name: deltasoldes pk_deltasoldes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deltasoldes
    ADD CONSTRAINT pk_deltasoldes PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 22567)
-- Name: docetats pk_docetats; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT pk_docetats PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 22574)
-- Name: docetats_predecesseurs pk_docetats_predecesseurs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats_predecesseurs
    ADD CONSTRAINT pk_docetats_predecesseurs PRIMARY KEY (docetats_id, predecesseur_id);


--
-- TOC entry 4816 (class 2606 OID 22354)
-- Name: documents pk_documents; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT pk_documents PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 22373)
-- Name: etapes pk_etapes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapes
    ADD CONSTRAINT pk_etapes PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 22366)
-- Name: etats pk_etats; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etats
    ADD CONSTRAINT pk_etats PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 27736)
-- Name: exemplaires pk_exemplaires; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplaires
    ADD CONSTRAINT pk_exemplaires PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 22380)
-- Name: familles pk_familles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.familles
    ADD CONSTRAINT pk_familles PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 22392)
-- Name: filesattentes pk_filesattentes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT pk_filesattentes PRIMARY KEY (id);


--
-- TOC entry 4828 (class 2606 OID 22399)
-- Name: jouerroles pk_jouerroles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT pk_jouerroles PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 22406)
-- Name: missions pk_missions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT pk_missions PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 27788)
-- Name: mouvementcaisses pk_mouvementcaisses; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementcaisses
    ADD CONSTRAINT pk_mouvementcaisses PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 22418)
-- Name: mouvements pk_mouvements; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT pk_mouvements PRIMARY KEY (id);


--
-- TOC entry 4834 (class 2606 OID 22435)
-- Name: ordreetats pk_ordreetats; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordreetats
    ADD CONSTRAINT pk_ordreetats PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 22442)
-- Name: parcours pk_parcours; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcours
    ADD CONSTRAINT pk_parcours PRIMARY KEY (id);


--
-- TOC entry 4838 (class 2606 OID 22449)
-- Name: personnels pk_personnels; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnels
    ADD CONSTRAINT pk_personnels PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 27708)
-- Name: personnes pk_personnes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes
    ADD CONSTRAINT pk_personnes PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 27685)
-- Name: personnes_s pk_personnes_s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes_s
    ADD CONSTRAINT pk_personnes_s PRIMARY KEY (id);


--
-- TOC entry 4840 (class 2606 OID 22482)
-- Name: precomouvements pk_precomouvements; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvements
    ADD CONSTRAINT pk_precomouvements PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 22489)
-- Name: precomouvementsqtes pk_precomouvementsqtes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT pk_precomouvementsqtes PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 22506)
-- Name: promotions pk_promotions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT pk_promotions PRIMARY KEY (id);


--
-- TOC entry 4848 (class 2606 OID 22513)
-- Name: remplir pk_remplir; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT pk_remplir PRIMARY KEY (roles_id, missions_id);


--
-- TOC entry 4850 (class 2606 OID 22520)
-- Name: ressources pk_ressources; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT pk_ressources PRIMARY KEY (id);


--
-- TOC entry 4852 (class 2606 OID 22532)
-- Name: roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);


--
-- TOC entry 4854 (class 2606 OID 22539)
-- Name: services pk_services; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT pk_services PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 22546)
-- Name: tickets pk_tickets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT pk_tickets PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 22553)
-- Name: ticketsfilesattentes pk_ticketsfilesattentes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT pk_ticketsfilesattentes PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 22560)
-- Name: validations pk_validations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validations
    ADD CONSTRAINT pk_validations PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 22772)
-- Name: filesattentes uc_filesattentes_services; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT uc_filesattentes_services UNIQUE (services_id);


--
-- TOC entry 4846 (class 2606 OID 22655)
-- Name: promotions uc_promotions_codeunique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT uc_promotions_codeunique UNIQUE (codeunique);


--
-- TOC entry 4856 (class 2606 OID 22621)
-- Name: services uc_services_codeunique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT uc_services_codeunique UNIQUE (codeunique);


--
-- TOC entry 4858 (class 2606 OID 22623)
-- Name: services uc_services_filesattentes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT uc_services_filesattentes UNIQUE (filesattentes_id);


--
-- TOC entry 4884 (class 2606 OID 22828)
-- Name: associer fk_associer_on_attributs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associer
    ADD CONSTRAINT fk_associer_on_attributs FOREIGN KEY (attributs_id) REFERENCES public.attributs(id);


--
-- TOC entry 4885 (class 2606 OID 22833)
-- Name: associer fk_associer_on_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associer
    ADD CONSTRAINT fk_associer_on_categories FOREIGN KEY (categories_id) REFERENCES public.categories(id);


--
-- TOC entry 4883 (class 2606 OID 22838)
-- Name: categories fk_categories_on_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_categories_on_documents FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4929 (class 2606 OID 27772)
-- Name: comptes fk_comptes_personnes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comptes
    ADD CONSTRAINT fk_comptes_personnes FOREIGN KEY (personnes_id) REFERENCES public.personnes(id);


--
-- TOC entry 4886 (class 2606 OID 22793)
-- Name: constituer fk_con_on_attributs_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT fk_con_on_attributs_entity FOREIGN KEY (attributs_id) REFERENCES public.attributs(id);


--
-- TOC entry 4887 (class 2606 OID 22798)
-- Name: constituer fk_con_on_documents_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT fk_con_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4935 (class 2606 OID 27829)
-- Name: concerner fk_concerner_on_distributeurs_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concerner
    ADD CONSTRAINT fk_concerner_on_distributeurs_entity FOREIGN KEY (distributeurs_id) REFERENCES public.personnes(id);


--
-- TOC entry 4936 (class 2606 OID 27834)
-- Name: concerner fk_concerner_on_preco_mouvements_qtes_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concerner
    ADD CONSTRAINT fk_concerner_on_preco_mouvements_qtes_entity FOREIGN KEY (precomouvementsqtes_id) REFERENCES public.precomouvementsqtes(id);


--
-- TOC entry 4927 (class 2606 OID 27762)
-- Name: deltasoldes fk_deltasoldes_comptes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deltasoldes
    ADD CONSTRAINT fk_deltasoldes_comptes FOREIGN KEY (comptes_id) REFERENCES public.comptes(id);


--
-- TOC entry 4928 (class 2606 OID 27767)
-- Name: deltasoldes fk_deltasoldes_exemplaires; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deltasoldes
    ADD CONSTRAINT fk_deltasoldes_exemplaires FOREIGN KEY (exemplaires_id) REFERENCES public.exemplaires(id);


--
-- TOC entry 4907 (class 2606 OID 22661)
-- Name: documentspromotions fk_doc_on_documents_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentspromotions
    ADD CONSTRAINT fk_doc_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4908 (class 2606 OID 22666)
-- Name: documentspromotions fk_doc_on_promotions_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentspromotions
    ADD CONSTRAINT fk_doc_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4920 (class 2606 OID 22585)
-- Name: docetats fk_docetats_on_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_documents FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4921 (class 2606 OID 22590)
-- Name: docetats fk_docetats_on_etapes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_etapes FOREIGN KEY (etapes_id) REFERENCES public.etapes(id);


--
-- TOC entry 4922 (class 2606 OID 22595)
-- Name: docetats fk_docetats_on_etats; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_etats FOREIGN KEY (etats_id) REFERENCES public.etats(id);


--
-- TOC entry 4923 (class 2606 OID 22600)
-- Name: docetats fk_docetats_on_validations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_validations FOREIGN KEY (validations_id) REFERENCES public.validations(id);


--
-- TOC entry 4924 (class 2606 OID 22575)
-- Name: docetats_predecesseurs fk_docetats_predecesseurs_on_docetats; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats_predecesseurs
    ADD CONSTRAINT fk_docetats_predecesseurs_on_docetats FOREIGN KEY (docetats_id) REFERENCES public.docetats(id);


--
-- TOC entry 4925 (class 2606 OID 22580)
-- Name: docetats_predecesseurs fk_docetats_predecesseurs_suivant_on_docetats; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docetats_predecesseurs
    ADD CONSTRAINT fk_docetats_predecesseurs_suivant_on_docetats FOREIGN KEY (predecesseur_id) REFERENCES public.docetats(id);


--
-- TOC entry 4890 (class 2606 OID 22788)
-- Name: etapes fk_etapes_on_parcours; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapes
    ADD CONSTRAINT fk_etapes_on_parcours FOREIGN KEY (parcours_id) REFERENCES public.parcours(id);


--
-- TOC entry 4930 (class 2606 OID 27757)
-- Name: exemplaires fk_exemplaires_personnes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplaires
    ADD CONSTRAINT fk_exemplaires_personnes FOREIGN KEY (personnes_id) REFERENCES public.personnes(id);


--
-- TOC entry 4909 (class 2606 OID 22671)
-- Name: famillespromotions fk_fam_on_familles_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famillespromotions
    ADD CONSTRAINT fk_fam_on_familles_entity FOREIGN KEY (familles_id) REFERENCES public.familles(id);


--
-- TOC entry 4910 (class 2606 OID 22676)
-- Name: famillespromotions fk_fam_on_promotions_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famillespromotions
    ADD CONSTRAINT fk_fam_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4893 (class 2606 OID 22773)
-- Name: filesattentes fk_filesattentes_on_services; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT fk_filesattentes_on_services FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- TOC entry 4894 (class 2606 OID 22761)
-- Name: jouerroles fk_jouerroles_on_personnels; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT fk_jouerroles_on_personnels FOREIGN KEY (personnels_id) REFERENCES public.personnels(id);


--
-- TOC entry 4895 (class 2606 OID 22766)
-- Name: jouerroles fk_jouerroles_on_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT fk_jouerroles_on_roles FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- TOC entry 4896 (class 2606 OID 22746)
-- Name: missions fk_missions_on_services; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT fk_missions_on_services FOREIGN KEY (services_id) REFERENCES public.services(id);


--
-- TOC entry 4931 (class 2606 OID 27789)
-- Name: mouvementcaisses fk_mouvementcaisses_caisses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementcaisses
    ADD CONSTRAINT fk_mouvementcaisses_caisses FOREIGN KEY (caisses_id) REFERENCES public.caisses(id);


--
-- TOC entry 4932 (class 2606 OID 27794)
-- Name: mouvementcaisses fk_mouvementcaisses_comptes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementcaisses
    ADD CONSTRAINT fk_mouvementcaisses_comptes FOREIGN KEY (comptes_id) REFERENCES public.comptes(id);


--
-- TOC entry 4933 (class 2606 OID 27799)
-- Name: mouvementcaisses fk_mouvementcaisses_personnels; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementcaisses
    ADD CONSTRAINT fk_mouvementcaisses_personnels FOREIGN KEY (personnels_id) REFERENCES public.personnels(id);


--
-- TOC entry 4899 (class 2606 OID 22721)
-- Name: mouvements fk_mouvements_on_ressources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT fk_mouvements_on_ressources FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);


--
-- TOC entry 4934 (class 2606 OID 27804)
-- Name: mouvementcaisses fk_mouvementscaisses_exemplaires; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementcaisses
    ADD CONSTRAINT fk_mouvementscaisses_exemplaires FOREIGN KEY (exemplaires_id) REFERENCES public.exemplaires(id);


--
-- TOC entry 4904 (class 2606 OID 22711)
-- Name: ordreetats fk_ordreetats_on_etats; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordreetats
    ADD CONSTRAINT fk_ordreetats_on_etats FOREIGN KEY (etats_id) REFERENCES public.etats(id);


--
-- TOC entry 4926 (class 2606 OID 27777)
-- Name: personnes fk_personnes_comptes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnes
    ADD CONSTRAINT fk_personnes_comptes FOREIGN KEY (comptes_id) REFERENCES public.comptes(id);


--
-- TOC entry 4905 (class 2606 OID 22681)
-- Name: precomouvementsqtes fk_precomouvementsqtes_on_precomouvements; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT fk_precomouvementsqtes_on_precomouvements FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);


--
-- TOC entry 4906 (class 2606 OID 22686)
-- Name: precomouvementsqtes fk_precomouvementsqtes_on_ressources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT fk_precomouvementsqtes_on_ressources FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);


--
-- TOC entry 4911 (class 2606 OID 22644)
-- Name: remplir fk_remplir_on_missions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT fk_remplir_on_missions FOREIGN KEY (missions_id) REFERENCES public.missions(id);


--
-- TOC entry 4912 (class 2606 OID 22649)
-- Name: remplir fk_remplir_on_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT fk_remplir_on_roles FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- TOC entry 4914 (class 2606 OID 22634)
-- Name: ressourcespromotions fk_res_on_promotions_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressourcespromotions
    ADD CONSTRAINT fk_res_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);


--
-- TOC entry 4915 (class 2606 OID 22639)
-- Name: ressourcespromotions fk_res_on_ressources_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressourcespromotions
    ADD CONSTRAINT fk_res_on_ressources_entity FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);


--
-- TOC entry 4900 (class 2606 OID 22726)
-- Name: respecter fk_respecter_on_mouvements_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respecter
    ADD CONSTRAINT fk_respecter_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES public.mouvements(id);


--
-- TOC entry 4901 (class 2606 OID 22731)
-- Name: respecter fk_respecter_on_preco_mouvements_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respecter
    ADD CONSTRAINT fk_respecter_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);


--
-- TOC entry 4913 (class 2606 OID 22629)
-- Name: ressources fk_ressources_on_familles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT fk_ressources_on_familles FOREIGN KEY (familles_id) REFERENCES public.familles(id);


--
-- TOC entry 4891 (class 2606 OID 22778)
-- Name: sapplique fk_sapplique_on_familles_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT fk_sapplique_on_familles_entity FOREIGN KEY (familles_id) REFERENCES public.familles(id);


--
-- TOC entry 4892 (class 2606 OID 22783)
-- Name: sapplique fk_sapplique_on_preco_mouvements_qtes_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT fk_sapplique_on_preco_mouvements_qtes_entity FOREIGN KEY (precomouvementsqtes_id) REFERENCES public.precomouvementsqtes(id);


--
-- TOC entry 4916 (class 2606 OID 22624)
-- Name: services fk_services_on_filesattentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_services_on_filesattentes FOREIGN KEY (filesattentes_id) REFERENCES public.filesattentes(id);


--
-- TOC entry 4888 (class 2606 OID 22803)
-- Name: suivre fk_suivre_on_documents_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT fk_suivre_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4889 (class 2606 OID 22808)
-- Name: suivre fk_suivre_on_preco_mouvements_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT fk_suivre_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);


--
-- TOC entry 4917 (class 2606 OID 22610)
-- Name: ticketsfilesattentes fk_ticketsfilesattentes_on_filesattentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT fk_ticketsfilesattentes_on_filesattentes FOREIGN KEY (filesattentes_id) REFERENCES public.filesattentes(id);


--
-- TOC entry 4918 (class 2606 OID 22615)
-- Name: ticketsfilesattentes fk_ticketsfilesattentes_on_tickets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT fk_ticketsfilesattentes_on_tickets FOREIGN KEY (tickets_id) REFERENCES public.tickets(id);


--
-- TOC entry 4897 (class 2606 OID 22751)
-- Name: traiter fk_traiter_on_documents_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT fk_traiter_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);


--
-- TOC entry 4898 (class 2606 OID 22756)
-- Name: traiter fk_traiter_on_missions_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT fk_traiter_on_missions_entity FOREIGN KEY (missions_id) REFERENCES public.missions(id);


--
-- TOC entry 4919 (class 2606 OID 22605)
-- Name: validations fk_validations_on_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validations
    ADD CONSTRAINT fk_validations_on_roles FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- TOC entry 4902 (class 2606 OID 22736)
-- Name: violer fk_violer_on_mouvements_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violer
    ADD CONSTRAINT fk_violer_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES public.mouvements(id);


--
-- TOC entry 4903 (class 2606 OID 22741)
-- Name: violer fk_violer_on_preco_mouvements_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violer
    ADD CONSTRAINT fk_violer_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);


-- Completed on 2024-08-25 15:05:28

--
-- PostgreSQL database dump complete
--

