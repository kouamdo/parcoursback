INSERT INTO documents(
	id, titre, description, etat, datecreation, datemodification)
	VALUES 
('1234','Fiche de soin avec poids avec teint','fiche de soin',True,NULL,NULL),
('2345','Fiche de traite','traite',True,'2023-03-31','2023-03-31'),
('2345png','Fiche de traite Test','traite test',True,NULL,NULL),
('2345png01','Fiche de Test','traite test',True,NULL,NULL),
('2345png02','Fiche de Test 2345-png-02','traite test 2345-png-02',True,NULL,NULL),
('2345png03','Fiche de Test 2345-png-03','traite test 2345-png-03',True,NULL,NULL),
('nom01','Fiche de Test','traite test',True,NULL,NULL),
('png04','Fiche de Test 4','traite test',True,NULL,NULL);

INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de Test', 'traite test', null, true, null, null, null, null, null, null, null);
(null, 'Fiche de Test', 'traite test', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "attributs"
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type, optionnel, valeurpardefaut)
VALUES (null, 'Colle', 'colle', true, null, null, 'Double', null, null),
       (null, 'png-08-colle', 'png-08-colle', true, null, null, 'Double', null, null),
       (null, 'SEXES', 'SEXE', true, null, null, 'String', null, null);

-- Insertion dans la table "category"
INSERT INTO category (id_category, ordre, libelle, id_documents)
VALUES (null, '19', 'Cuisine 19', null);

-- Insertion dans la table "documents"
INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de Test 2345-png-02', 'traite test 2345-png-02', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "attributs"
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type, optionnel, valeurpardefaut)
VALUES (null, 'Colle', 'colle', true, null, null, 'Double', null, null),
       (null, 'SEXES', 'SEXE', true, null, null, 'String', null, null),
       (null, 'TAILLE', 'taille', true, null, null, 'Double', null, null);

-- Insertion dans la table "documents"
INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de Test 2345-png-03', 'traite test 2345-png-03', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "attributs"
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type)
VALUES (null, 'Colle', 'colle', true, null, null, 'Double'),
       (null, 'SEXES', 'SEXE', true, null, null, 'String');

-- Insertion dans la table "documents"
INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de Test 4', 'traite test', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "attributs"
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type)
VALUES (null, 'TAILLE revisée', 'taille revisée', true, null, null, 'Double'),
       (null, 'teint', 'teint du nouveau', false, null, null, 'Int');

-- Insertion dans la table "documents"
INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de soin avec poids avec teint', 'fiche de soin', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "category"
INSERT INTO category (id_category, ordre, libelle, id_documents)
VALUES (null, '1', 'Fiche de traite Test', null),
       (null, '2', 'Lit hopital', null),
       (null, '3', 'Don organes', null);

-- Insertion dans la table "attributs"
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type)
VALUES (null, 'TAILLE', 'taille', true, null, null, 'Double'),
       (null, 'teint', 'teint du nouveau', false, null, null, 'Int');

-- Insertion dans la table "documents"
INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de traite', 'traite', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "category"
INSERT INTO category (id_category, ordre, libelle, id_documents)
VALUES (null, '4', 'don de sang', null),
       (null, '5', 'Économie et comptabilité', null),
       (null, '6', 'Musique malade', null),
       (null, '7', 'Cinéma', null),
       (null, '8', 'Sport', null),
       (null, '9', 'Cuisine', null),
       (null, '10', 'Voyage', null);

-- Insertion dans la table "attributs"
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type)
VALUES (null, 'TAILLE', 'taille', true, null, null, 'Double'),
       (null, 'teint', 'teint du nouveau', false, null, null, 'Int'),
       (null, 'Colle', 'colle', true, null, null, 'Double'),
       (null, 'png-08-colle', 'png-08-colle', true, null, null, 'Double'),
       (null, 'SEXES', 'SEXE', true, null, null, 'String');

-- Insertion dans la table "documents"
INSERT INTO documents (id, titre, description, typemouvement, etat, afficherunite, afficherdistributeur, prixeditable, contientressources, afficherprix, datecreation, datemodification)
VALUES (null, 'Fiche de traite Test', 'traite test', null, true, null, null, null, null, null, null, null);

-- Insertion dans la table "category"
INSERT INTO category (id_category, ordre, libelle, id_documents)
VALUES (null, '4', 'don de sang', null),
       (null, '5', 'Économie et comptabilité', null),
       (null, '6', 'Musique malade', null),
       (null, '7', 'Cinéma', null),
       (null, '8', 'Sport', null),
       (null, '9', 'Cuisine', null),
       (null, '10', 'Voyage', null);

INSERT INTO documents (id, titre, description, etat, datecreation, datemodification, afficherprix, afficherunite, afficherdistributeur, prixeditable, contientressources)
VALUES (NULL, 'TitreTest', 'DescriptionTest', TRUE, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type)
VALUES (NULL, 'SEXES', 'SEXE', TRUE, NULL, NULL, 'String'),
       (NULL, 'TAILLE', 'taille', TRUE, NULL, NULL, 'Double');


INSERT INTO attributs(
	id, titre, description, etat, datecreation, datemodification, type, optionnel, valeurpardefaut)
	VALUES
('1234','TAILLES','tailles',True,NULL,NULL,'Double',NULL,NULL),
('1234de','TAILLE revisée','taille revisée',True,NULL,NULL,'Double',NULL,NULL),
('1234png','Colle','colle',True,NULL,NULL,'Double',NULL,NULL),
('1234png08','png-08-colle','png-08-colle',True,NULL,NULL,'Double',NULL,NULL),
('2345','teint','teint du nouveau',False,NULL,NULL,'Int',NULL,NULL),
('3456','SEXES','SEXE',True,NULL,NULL,'String',NULL,NULL);

INSERT INTO constituer(
	id_document, id_attribut)
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
INSERT INTO category (id_category,ordre, libelle, id_documents)
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



INSERT INTO associer (id_attribut, id_category, obligatoire, ordre)
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


