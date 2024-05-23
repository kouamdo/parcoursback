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

--insertion du jdd

-- Insertion dans la table 'documents'
INSERT INTO documents (id, titre, description) VALUES ('1', 'Note intervention', 'Document delivre par le medecin ou un infirmier de l''etablissement');

-- Insertion dans la table 'missions'
INSERT INTO mission (id, libelle, description, etat, datecreation, datemodification, id_tache) VALUES
('1', 'Consultation', 'Consultation faite par une infirmière', true, '2000-03-07', '1990-03-07', 'admin'),
('2', 'Consultation Spécialiste', 'Consultation faite par un médecin', true, '2000-03-07', '1990-03-07', 'admin'),
('3', 'Prelevement Labo', 'Prélévement fait par laboratoire', true, '2000-03-07', '1990-03-07', 'admin');

-- Insertion dans la table 'attributs'
INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type) VALUES
('1', 'taille', 'taille de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.String'),
('4', 'age', 'age de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.Double'),
('5', 'allergies', 'allergies de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.String'),
('6', 'teint', 'teint de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.String'),
('7', 'Groupe sangin', 'Groupe sangin de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.Boolean'),
('8', 'cicatrice', 'cicatrice de l''individu', true, '2000-03-07', '1990-03-07', 'TypeTicket.Boolean');

-- Insertion dans la table 'category'
INSERT INTO category (id_category, ordre, libelle, id_documents) VALUES
('1', '1', 'informations personelles', '1'),
('2', '2', 'informations de sante', '1');

-- Insertion dans la table 'associer'
INSERT INTO associer (id_attribut, id_category, obligatoire, ordre) VALUES
('1', '1', false, 11),
('4', '1', false, 12),
('6', '1', false, 13),
('5', '2', false, 1),
('7', '2', false, 2),
('8', '2', false, 3);


--fin insertion






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


