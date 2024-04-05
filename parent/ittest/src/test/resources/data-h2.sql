INSERT INTO documents(
	id, titre, description, etat, datecreation, datemodification)
	VALUES 
('1234','Fiche de soin avec poids avec teint','fiche de soin',True,NULL,NULL),
('2345','Fiche de traite','traite',True,'2023-03-31','2023-03-31'),
('2345-png','Fiche de traite Test','traite test',True,NULL,NULL),
('2345-png-01','Fiche de Test','traite test',True,NULL,NULL),
('2345-png-02','Fiche de Test 2345-png-02','traite test 2345-png-02',True,NULL,NULL),
('2345-png-03','Fiche de Test 2345-png-03','traite test 2345-png-03',True,NULL,NULL),
('nom-01','Fiche de Test','traite test',True,NULL,NULL),
('png-04','Fiche de Test 4','traite test',True,NULL,NULL);

INSERT INTO attributs(
	id, titre, description, etat, datecreation, datemodification, type, optionnel, valeurpardefaut)
	VALUES
('1234','TAILLES','tailles',True,NULL,NULL,'Double',NULL,NULL),
('1234-de','TAILLE revisee','taille revisee',True,NULL,NULL,'Double',NULL,NULL),
('1234-png','Colle','colle',True,NULL,NULL,'Double',NULL,NULL),
('1234-png-08','png-08-colle','png-08-colle',True,NULL,NULL,'Double',NULL,NULL),
('2345','teint','teint du nouveau',False,NULL,NULL,'Int',NULL,NULL),
('3456','SEXES','SEXE',True,NULL,NULL,'String',NULL,NULL);

INSERT INTO constituer(
	id_document, id_attribut)
	VALUES 
('1234','1234-de'),
('1234','2345'),
('2345','1234'),
('2345-png-02','1234'),
('2345-png-02','1234-png'),
('2345-png-02','1234-png-08'),
('2345-png-02','3456'),
('2345-png-03','1234'),
('2345-png-03','1234-png'),
('2345-png-03','3456'),
('png-04','1234-png'),
('png-04','3456');

-- Insertions pour la table 'category'
INSERT INTO category (id_category,ordre, libelle, id_documents)
    VALUES  ('1','1', 'Fiche de traite Test', '1234'),
            ('2','2', 'Lit hopital', '1234'),
            ('3','3', 'Don organes', '1234'),
            ('4','4', 'don de sang', '2345'),
            ('5','5', 'Économie et comptabilite', '2345'),
            ('6','6', 'Musique malade', '2345'),
            ('7','7', 'Cinéma', '2345'),
            ('8','8', 'Sport', '2345'),
            ('9','9', 'Cuisine', '2345'),
            ('10','10', 'Voyage', '2345');



INSERT INTO associer (id_attribut, id_category)
    VALUES ('1234', '1'),
            ('2345', '2'),
            ('3456', '3'),
            ('3456', '4'),
            ('3456', '5'),
            ('3456', '6'),
            ('1234-png', '7'),
            ('1234-png', '8'),
            ('2345', '9'),
            ('3456', '10');


