INSERT INTO documents(
	id, titre, description, etat,typemouvement,afficherunite,afficherdistributeur,prixeditable,contientressources,afficherprix, datecreation, datemodification)
	VALUES 
('1234','Fiche de soin avec poids avec teint','fiche de soin',True,'Neutre',true,true,true,true,true,NULL,NULL),
('2345','Fiche de traite','traite',True,'Neutre',true,true,true,true,true,'2023-03-31','2023-03-31'),
('2345png','Fiche de traite Test','traite test',True,'Ajout',true,true,true,true,true,NULL,NULL),
('2345png01','Fiche de Test','traite test',True,'Neutre',true,true,true,true,true,NULL,NULL),
('2345png02','Fiche de Test 2345-png-02','traite test 2345-png-02',True,'Neutre',true,true,true,true,true,NULL,NULL),
('2345png03','Fiche de Test 2345-png-03','traite test 2345-png-03',True,'Neutre',true,true,true,true,true,NULL,NULL),
('nom01','Fiche de Test','traite test',True,'Reduire',true,true,true,true,true,NULL,NULL),
('png04','Fiche de Test 4','traite test',True,'Neutre',true,true,true,true,true,NULL,NULL);

--insertion du jdd

-- Insertion dans la table service
INSERT INTO services (id, libelle, description, codeunique, etat, datecreation, datemodification)
VALUES
('3', 'Consultation', 'bien', '3', true, '1972-06-12', '1990-03-07'),
('2', 'Laboratoire', 'bien', '2', true, '1990-08-06', '1990-03-07'),
('1', 'Pharmacie', 'bien', 'code_unique', true, '2000-03-07', '1990-03-07');

-- Insertion dans la table mission
INSERT INTO missions (id, libelle, description, etat, datecreation, datemodification, services_id)
VALUES
('4', 'Encaissement', 'recu de paiement lié à une mission', true, '2000-03-07', '1990-03-07', '1'),
('5', 'Resultat Labo', 'Communiquer les résultats du labo aux patients', true, '2000-03-07', '1990-03-07', '3'),
('6', 'Hospitalisation', 'bon d''entrée et de sortie est une mission', true, '2000-03-07', '1990-03-07', '1'),
('3', 'Prelevement Labo', 'Prélévement fait par laboratoire', true, '2000-03-07', '1990-03-07', '3'),
('2', 'Consultation Spécialiste', 'Consultation faite par un médecin', true, '2000-03-07', '1990-03-07', '2'),
('1', 'Consultation', 'Consultation faite par une infirmière', true, '2000-03-07', '1990-03-07', '1');

-- Insertion dans la table documents
INSERT INTO documents (id, titre, description, etat, datecreation, datemodification)
VALUES ('1', 'Note intervention', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, '2000-03-07', '1990-03-07');


---- Insertion dans la table 'attributs'
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type) VALUES
('1', 'taille', 'taille de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.String'),
('4', 'age', 'age de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.Double'),
('5', 'allergies', 'allergies de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.String'),
('6', 'teint', 'teint de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.String'),
('7', 'Groupe sangin', 'Groupe sangin de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.Boolean'),
('8', 'cicatrice', 'cicatrice de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.Boolean');
--
-- Insertion dans la table 'category'
INSERT INTO categories (id, ordre, libelle, documents_id) VALUES
('100', '1', 'informations personelles', '1'),
('200', '2', 'informations de sante', '1');


------attribut jdd

INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut) VALUES
('1000', 'taille', 'taille de l''individu', true, '2000-03-07', '1990-03-07', 'String', '');


--Insertion dans la table 'associer'
INSERT INTO associer (attributs_id, categories_id, obligatoire, ordre) VALUES
('1000', '100', false, 11),
('1000', '200', false, 1);


-- Insertion dans la table 'precomouvements'
INSERT INTO precomouvements (id, libelle, etat, typemouvement) VALUES
('1', 'rachat', true, 'neutre'),
('2', 'vente', true, 'reduire'),
('3', 'vente', true, 'reduire');

---- Insertion dans la table 'familles'
INSERT INTO familles (id, libelle, description, etat) VALUES
('1', 'trans', 'sang', true),
('2', 'néonat', 'nouveau-né', false),
('3', 'pediatrie', 'enfant', true),
('4', 'néonat', 'nouveau-né', false);

--
---- Insertion dans la table 'ressources'
INSERT INTO ressources (id, libelle, etat, quantite, unite, prixentree, familles_id) VALUES
('1', 'transfusion', true, 10, 'UnitesLitre', 1000, '1'),
('2', 'néonat', true, 20, 'UnitesLitre', 2000, '2'),
('3', 'pediatrie', true, 30, 'UnitesLitre', 3000, '3'),
('5', 'eau distillée', true, 20, 'UnitesLitre', 500,'3');
--
---- Insertion dans la table 'precomouvementsqte'
INSERT INTO precomouvementsqtes (id, qteMin, qteMax, montantMin, montantMax, precomouvements_id, ressources_id) VALUES
('1', 10, 20, 1000, 7000, '1', '1'),
('2', 30, 40, 100, 7000, '1', '2'),
('3', 30, 40, 100, 7000, '1', '3');



-- Insérer les données dans la table personnephysique
--INSERT INTO personnes (id, nom, prenom, sexe, datenaissance)
--VALUES
--    ('1', 'Tagne', 'Willy', 'M', '2000-04-10'),
--    ('2', 'Peter', 'Alan',  'M', '2004-08-10'),
--    ('3', 'Dombo', 'Gilles',   'M', '2002-10-10');
INSERT INTO personnes (id,  adresse, telephone, mail)
VALUES
    ('1', 'Total Energie', '655554488', 'ngong@yad.fr'),
    ('2', 'Brasserie', '655554481', 'ngong@yad.fr'),
    ('3', 'Eneo', '655554486', 'ngong@yad.fr');

INSERT INTO distributeurs (distributeurs_id, raisonsociale,code)
VALUES
    ('1', 'Brasserie', 'Dla'),
    ('2', 'ENEO',  'Ydé'),
    ('3', 'Total Distribution',  'Buéa');


INSERT INTO mouvements (id, description, qte, prix, datecreation, dateperemption, ressources_id, distributeurs_id)
VALUES
    ('1', 'Ici la description de ce mouvement', 20, 10000, NOW(), NOW(), '1', '1'),
    ('2', 'Ici la description de ce mouvement', 50, 300, NOW(), NOW(), '5', '2'),
    ('3', 'Ici la description de ce mouvement', 10, 5000, NOW(), NOW(), '3', '3'),
    ('4', 'Ici la description de ce mouvement', 20, 2000, NOW(), NOW(), '2', '2');

INSERT INTO etats (id, libelle, datecreation)
VALUES ('1', 'etat 1', '2024-07-21'),
       ('2', 'etat 2', '2024-07-21'),
       ('3', 'etat 3', '2024-07-21'),
       ('4', 'etat 4', '2024-07-21');

INSERT INTO ordreetats (id, datecreation, ordre, etats_id)
VALUES ('1', '2024-07-21', 1, '1'),
       ('2', '2024-07-21', 2, '2'),
       ('3', '2024-07-21', 3, '3'),
       ('4', '2024-07-21', 4, '4');

INSERT INTO validations (id, code, etat, datecreation, roles_id)
VALUES ('1', NULL, NULL, '2024-07-21', NULL),
       ('2', NULL, NULL, '2024-07-21', NULL),
       ('3', NULL, NULL, '2024-07-21', NULL),
       ('4', NULL, NULL, '2024-07-21', NULL);

INSERT INTO docetats (id, ordre, datecreation, validations_id, predecesseurDocEtat_id, etats_id)
VALUES ('1', 1, '2024-07-21', NULL, NULL, '1'),
       ('2', 2, '2024-07-21', NULL, NULL, '2'),
       ('3', 3, '2024-07-21', NULL, NULL, '3'),
       ('4', 4, '2024-07-21', NULL, NULL, '4');


INSERT INTO precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, precomouvements_id, ressources_id, datecreation, datemodification)
VALUES
    ('11', 10, 100, 500, 5000, '1', '1', '2024-06-04', '2024-06-04'),
    ('22', 20, 200, 1000, 10000, '2', '2', '2024-06-04', '2024-06-04'),
    ('33', 5, 50, 200, 2000, '3', '3', '2024-06-04', '2024-06-04');



INSERT INTO roles (id, titre, description, etat, datecreation)
VALUES
    ('1', 'vendeur', 'personnel au contact du client', true, '2000-07-03'),
    ('2', 'traiteur', 'Personnel administratif', true, '2000-07-03'),
    ('3', 'marcheur', 'commercial sur le terrain', true, '2000-07-03');

INSERT INTO personnels (id, dateentree, nom, datenaissance, telephone, datesortie, email, prenom, sexe)
VALUES
    ('1', CURRENT_DATE, 'Tagne', '2000-04-10', '655455487', NULL, 'tagnewillie@gmail.com', 'Willy', 'M'),
    ('2', CURRENT_DATE, 'Peter', '2004-08-10', '655455487', NULL, 'peteralan@gmail.com', 'Alan', 'M'),
    ('3', CURRENT_DATE, 'Dombo', '2002-10-10', '655455487', NULL, 'dombogilles@gmail.com', 'Gilles', 'M');

INSERT INTO etats (id, libelle, datecreation, description)
VALUES
    ('11', 'etat 1', '2024-07-21', 'premièr état du document'),
    ('21', 'etat 2', '2024-07-21', 'deuxième état du document'),
    ('31', 'etat 3', '2024-07-21', 'troisième état du document'),
    ('41', 'etat 4', '2024-07-21', 'quatrième état du document');

INSERT INTO validations (id, code, etat, datecreation, roles_id)
VALUES
    ('11', 'azerty', 'false', '2023-02-10', '1'),
    ('21', 'qwerty', 'true', '2014-04-01', '2'),
    ('31', 'qsdfghj', 'true', '2015-10-10', '3');
--fin insertion






INSERT INTO attributs(
	id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut)
	VALUES
('1234','TAILLES','tailles',True,NULL,NULL,'Double',NULL),
('1234de','TAILLE revisée','taille revisée',True,NULL,NULL,'Double',NULL),
('1234png','Colle','colle',True,NULL,NULL,'Double',NULL),
('1234png08','png-08-colle','png-08-colle',True,NULL,NULL,'Double',NULL),
('2345','teint','teint du nouveau',False,NULL,NULL,'Int',NULL),
('3456','SEXES','SEXE',True,NULL,NULL,'String',NULL);

INSERT INTO constituer(
	documents_id, attributs_id)
	VALUES 
('1234','1234de'),
('1234','2345'),
('2345','1234'),
('2345png','1234png'),
('2345png','1234png08'),
('2345png','3456'),
('2345png02','1234png'),
('2345png02','1234png08'),
('2345png02','3456'),
('2345png03','1234'),
('2345png03','1234png'),
('2345png03','3456'),
('png04','1234png'),
('png04','3456');

-- Insertions pour la table 'category'
INSERT INTO categories (id,ordre, libelle, documents_id)
    VALUES  ('1','1', 'Fiche de traite Test', '1234'),
            ('2','2', 'Lit hopital', '1234'),
            ('3','3', 'Don organes', '1234'),
            ('4','4', 'don de sang', '2345'),
            ('5','5', 'Économie et comptabilité', '2345'),
            ('6','6', 'Musique malade', '2345'),
            ('7','7', 'Cinéma', '2345'),
            ('8','8', 'Sport', '2345'),
            ('9','9', 'Cuisine', '2345'),
            ('19','19', 'Cuisine 19', '2345png02'),
            ('10','10', 'Voyage', '2345');



INSERT INTO associer (attributs_id, categories_id, obligatoire, ordre)
    VALUES ('1234', '1',true,0),
            ('2345', '2',false,0),
            ('3456', '3',false,0),
            ('3456', '4',false,0),
            ('3456', '5',true,0),
            ('3456', '6',false,0),
            ('1234png', '7',false,0),
            ('1234png', '8',false,0),
            ('2345', '9',false,0),
            ('3456', '10',false,0),
            ('1234png08', '19',false,0),
            ('1234png', '19',true,1),
            ('3456', '19',false,2);

INSERT INTO documents
    (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur,
     prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES
    (100, 'Fiche de Test', 'traite test', 'Neutre', TRUE, TRUE, TRUE, TRUE, TRUE, 'TRUE', NULL, NULL);