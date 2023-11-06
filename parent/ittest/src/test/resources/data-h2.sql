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
('1234','TAILLE','taille',True,NULL,NULL,'Double',NULL,NULL),
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
