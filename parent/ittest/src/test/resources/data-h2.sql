INSERT INTO documents(
	id, titre, description, etat,typemouvement,afficherunite,afficherdistributeur,prixeditable,contientressources,afficherprix, datecreation, datemodification)
	VALUES 
('0190615e-1101-7209-9932-7020bbd556f1', 'Note intervention', 'Document delivre par le medecin ou un infirmier de l''etablissement', true, 'Ajout', true, true, true, true,true,'2023-03-31','2023-03-31'),
('0190615e-1101-7209-9932-7020bbd556f2','Fiche de suivi','Document delivre par le medecin ou un infirmier de l''etablissement',True,'Neutre',true,true,true,true,true,'2023-03-31','2023-03-31'),
('0190615e-1101-7209-9932-7020bbd556f3','Fiche de soin','Document delivre par le medecin ou un infirmier de l''etablissement',True,'Ajout',true,true,true,true,true,NULL,NULL),
('0190615e-1101-7209-9932-7020bbd556f4','Formulaire de sortie','Document delivre par le medecin ou un infirmier de l''etablissement',True,'Neutre',true,true,true,true,true,NULL,NULL),
('0190615e-1101-7209-9932-7020bbd556f5','ordonnance','Document delivre par le medecin ou un infirmier de l''etablissement',True,'Neutre',true,true,true,true,true,NULL,NULL),
('0190615e-1101-7209-9932-7020bbd556f6','Bon de commande','Document delivre par le chef service',True,'Neutre',true,true,true,true,true,NULL,NULL),
('0190615e-1101-7209-9932-7020bbd556f7','Bon de livraison','Document delivre par ',True,'Reduire',true,true,true,true,true,NULL,NULL),
('0190615e-1101-7209-9932-7020bbd556f8','Fiche de selection','Document delivre par le magasinier',True,'Neutre',true,true,true,true,true,NULL,NULL);

--insertion dans la table 'filesattentes'
INSERT INTO filesattentes (id,  etat, datecreation, datemodification) VALUES
('f190615e-1101-7209-9932-7020bbd556f1', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f2',  true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f3',  true, '2022-01-01', '2022-01-02');

-- Insertion dans la table service
INSERT INTO services (id, libelle, description, codeunique, etat,localisation, datecreation, datemodification,filesattentes_id)
VALUES
('2190615e-1101-7209-9932-7020bbd556f1', 'Consultation', 'bien', 'S1', true, 'douala', '1972-06-12', '1990-03-07','f190615e-1101-7209-9932-7020bbd556f1'),
('2190615e-1101-7209-9932-7020bbd556f2', 'Laboratoire', 'bien', 'S2', true, 'douala', '1990-08-06', '1990-03-07','f190615e-1101-7209-9932-7020bbd556f2'),
('2190615e-1101-7209-9932-7020bbd556f3', 'Pharmacie', 'bien', 'S3', true, 'douala', '2000-03-07', '1990-03-07','f190615e-1101-7209-9932-7020bbd556f3');

-- Insertion dans la table mission
INSERT INTO missions (id, libelle, description, etat, datecreation, datemodification, services_id)
VALUES
('3190615e-1101-7209-9932-7020bbd556f1', 'Encaissement', 'recu de paiement lié à une mission', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f1'),
('3190615e-1101-7209-9932-7020bbd556f2', 'Resultat Labo', 'Communiquer les résultats du labo aux patients', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f1'),
('3190615e-1101-7209-9932-7020bbd556f3', 'Hospitalisation', 'bon d''entrée et de sortie est une mission', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f2'),
('3190615e-1101-7209-9932-7020bbd556f4', 'Prelevement Labo', 'Prélévement fait par laboratoire', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f2'),
('3190615e-1101-7209-9932-7020bbd556f5', 'Consultation Spécialiste', 'Consultation faite par un médecin', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f3'),
('3190615e-1101-7209-9932-7020bbd556f6', 'Consultation', 'Consultation faite par une infirmière', true, '2000-03-07', '1990-03-07', '2190615e-1101-7209-9932-7020bbd556f3');

INSERT INTO attributs (id, titre, description, etat, datecreation, datemodification, type, valeurpardefaut)
VALUES
('a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Taille', 'Description Taille', TRUE, '2022-01-01', '2022-01-02', 'String', null),
('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Poids', 'Description Poids', TRUE, '2022-01-01', '2022-01-02', 'Double', null),
('a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Age', 'Description age', TRUE, '2022-01-01', '2022-01-02', 'Int', null),
('a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Sexe', 'Sexe ', TRUE, '2022-01-01', '2022-01-02', 'String', null),
('a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Teint', 'Coloration', TRUE, '2022-01-01', '2022-01-02', 'String', 'Noir'),
('a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Groupe sangin', 'Groupe sangin', TRUE, '2022-01-01', '2022-01-02', 'String', 'A, A+, A-, B, B+, B-, AB, AB+, AB-, O, O+, O-'),
('a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Allergies', 'Allergies connues ', TRUE, '2022-01-01', '2022-01-02', 'String', null),
('a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Nom', 'Nom de la personne', TRUE, '2022-01-01', '2022-01-02', 'String', null),
('a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Adresse', 'Adresse postale', TRUE, '2022-01-01', '2022-01-02', 'String', null),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Date de naissance', 'Date de naissance', TRUE, '2022-01-01', '2022-01-02', 'Date', null);

-- Insertion dans la table 'categories'
INSERT INTO categories (id, libelle, description, etat, datecreation, datemodification,documents_id)
VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a1', 'Informations Personnelles', 'Informations Personnelles', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f1'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a2', 'Informations Primaires', 'Informations Primaires', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f1'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a3', 'Conditions Générales', 'Conditions Générales', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f2'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a4', 'Conditions Particulières', 'Particulières', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f2');
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a5', 'Informations Personnelles', 'Informations Personnelles', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f3'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a6', 'Informations Primaires', 'Informations Primaires', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f4'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a7', 'Conditions Générales', 'Conditions Générales', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f5'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a8', 'Conditions Générales', 'Conditions Générales', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f6'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a9', 'Catégorie par Defaut', 'Catégorie par Defaut', true, '2022-01-01', '2022-01-02','0190615e-1101-7209-9932-7020bbd556f7');

-- Insertion dans la table 'associer'
INSERT INTO associer (categories_id, attributs_id,ordre,obligatoire)
VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a1', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a1', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',2,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a1', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',3,false),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a2', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a2', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a19',2,false),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a2', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20',3,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a3', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a4', 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a5', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a6', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a7', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a17',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a8', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a18',1,true),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a9', 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19',1,true);

-- Insertion dans la table 'constituer'
INSERT INTO constituer (documents_id, attributs_id)
VALUES
('0190615e-1101-7209-9932-7020bbd556f1', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'),
('0190615e-1101-7209-9932-7020bbd556f1', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13'),
('0190615e-1101-7209-9932-7020bbd556f1', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15'),
('0190615e-1101-7209-9932-7020bbd556f1', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12'),
('0190615e-1101-7209-9932-7020bbd556f1', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a19'),
('0190615e-1101-7209-9932-7020bbd556f1', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20'),
('0190615e-1101-7209-9932-7020bbd556f2', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13'),
('0190615e-1101-7209-9932-7020bbd556f2', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a14'),
('0190615e-1101-7209-9932-7020bbd556f2', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20'),
('0190615e-1101-7209-9932-7020bbd556f3', 'a3eebc99-9c0b-4ef8-bb6d-6bb9bd380a15'),
('0190615e-1101-7209-9932-7020bbd556f4', 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a16'),
('0190615e-1101-7209-9932-7020bbd556f5', 'a5eebc99-9c0b-4ef8-bb6d-6bb9bd380a17'),
('0190615e-1101-7209-9932-7020bbd556f6', 'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a18'),
('0190615e-1101-7209-9932-7020bbd556f7', 'a7eebc99-9c0b-4ef8-bb6d-6bb9bd380a19'),
('0190615e-1101-7209-9932-7020bbd556f8', 'a8eebc99-9c0b-4ef8-bb6d-6bb9bd380a20');

-- Insertion dans la table 'precomouvements'
INSERT INTO precomouvements (id, libelle, etat, typemouvement, datecreation, datemodification) VALUES
('61290615e-1101-7209-9932-7020bbd556f1', 'Inventaire', true, 'Neutre', '2022-01-01', '2022-01-02'),
('61290615e-1101-7209-9932-7020bbd556f2', 'Vente', true, 'Reduire', '2022-01-01', '2022-01-02'),
('61290615e-1101-7209-9932-7020bbd556f3', 'Achat', true, 'Ajout', '2022-01-01', '2022-01-02')
('61290615e-1101-7209-9932-7020bbd556f4', 'interdiction Infirmière', true, 'Neutre', '2022-01-01', '2022-01-02')
('61290615e-1101-7209-9932-7020bbd556f5', 'Don', true, 'Neutre', '2022-01-01', '2022-01-02')
('61290615e-1101-7209-9932-7020bbd556f6', 'Perte', true, 'Reduire', '2022-01-01', '2022-01-02')
('61290615e-1101-7209-9932-7020bbd556f7', 'Retour', true, 'Ajout', '2022-01-01', '2022-01-02')
('61290615e-1101-7209-9932-7020bbd556f8', 'Sortie magasin', true, 'Reduire', '2022-01-01', '2022-01-02');

---- Insertion dans la table 'familles'
INSERT INTO familles (id, libelle, description, etat, datecreation, datemodification) VALUES
('f190615e-1101-7209-9932-7020bbd556f1', 'Medicaments', 'Medicaments', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f2', 'Consommables Informatiques', 'Consommables Informatiques', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f3', 'BioMedical', 'BioMedical', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f4', 'Accessoires', 'Accessoires', true, '2022-01-01', '2022-01-02');

--
---- Insertion dans la table 'ressources'
INSERT INTO ressources (id, libelle, description, etat, datecreation, datemodification,quantite, prixentree,prixsortie,seuilalerte,unite, familles_id) VALUES
('6190615e-1101-7209-9932-7020bbd556f1', 'Paracetamol', 'Paracetamol', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f1'),
('6190615e-1101-7209-9932-7020bbd556f2', 'Cartouche d''encre', 'Cartouche d''encre', true, '2022-01-01', '2022-01-02',4,2000,3000,10,'Boite', 'f190615e-1101-7209-9932-7020bbd556f2'),
('6190615e-1101-7209-9932-7020bbd556f3', 'Scanner', 'Scanner', true, '2022-01-01', '2022-01-02',4,12000,20000,2,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('6190615e-1101-7209-9932-7020bbd556f4', 'Imprimante', 'Imprimante', true, '2022-01-01', '2022-01-02',4,12000,20000,2,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('6190615e-1101-7209-9932-7020bbd556f5', 'Souris', 'Souris', true, '2022-01-01', '2022-01-02',40,25,20,12,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('6190615e-1101-7209-9932-7020bbd556f6', 'Stylet', 'Stylet', true, '2022-01-01', '2022-01-02',24,20,20000,9,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('6190615e-1101-7209-9932-7020bbd556f7', 'Doliprane', 'Doliprane', true, '  2022-01-01', '2022-01-02',90,1200,2000,40,'Boite', 'f190615e-1101-7209-9932-7020bbd556f1'),
('6190615e-1101-7209-9932-7020bbd556f8', 'Pommade', 'Pommade', true, '2022-01-01', '2022-01-02',20,200,210,20,'Litre', 'f190615e-1101-7209-9932-7020bbd556f1'),
('6190615e-1101-7209-9932-7020bbd556f9', 'Seringue', 'Seringue', true, '2022-01-01', '2022-01-02',42,100,200,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('6190615e-1101-7209-9932-7020bbd556f0', 'Perfuseur', 'Perfuseur', true, '2022-01-01', '2022-01-02',5,90,230,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('6190615e-1101-7209-9932-7020bbd556f11', 'Gants', 'Gants', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('6190615e-1101-7209-9932-7020bbd556f12', 'Masque', 'Masque', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('6190615e-1101-7209-9932-7020bbd556f13', 'Gel Hydroalcoolique', 'Gel Hydroalcoolique', true,54,1200,2000,200,'Litre', '2022-01-01', '2022-01-02', 'f190615e-1101-7209-9932-7020bbd556f3'),
('6190615e-1101-7209-9932-7020bbd556f14', 'Coton', 'Coton', true, '2022-01-01', '2022-01-02',44,1200,2000,230,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('6190615e-1101-7209-9932-7020bbd556f15', 'Papier', 'Papier', true, '2022-01-01', '2022-01-02',24,1200,2000,20,'Packs', 'f190615e-1101-7209-9932-7020bbd556f4'),
('6190615e-1101-7209-9932-7020bbd556f16', 'Encre', 'Encre', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f4'),
('6190615e-1101-7209-9932-7020bbd556f17', 'Toner', 'Toner', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f4'),
('6190615e-1101-7209-9932-7020bbd556f18', 'Cahier', 'Cahier', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Packs', 'f190615e-1101-7209-9932-7020bbd556f4');

---- Insertion dans la table 'precomouvementsqtes'
INSERT INTO precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, precomouvements_id, ressources_id, datecreation, datemodification) VALUES
('42190615e-1101-7209-9932-7020bbd556f1', 10, 100, 500, 5000, '61290615e-1101-7209-9932-7020bbd556f1', '6190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f2', 20, 200, 1000, 10000, '61290615e-1101-7209-9932-7020bbd556f2', '6190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f3', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f3', '6190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f4', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f4', '6190615e-1101-7209-9932-7020bbd556f4', '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f5', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f5', '6190615e-1101-7209-9932-7020bbd556f5', '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f6', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f6', null, '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f7', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f7', null, '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f8', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f8', null '2022-01-01', '2022-01-02'),
('42190615e-1101-7209-9932-7020bbd556f9', 5, 50, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f8', null, '2022-01-01', '2022-01-02');

-- Insertion dans la table sapplique
INSERT INTO sapplique (precomouvementsqtes_id,familles_id)
VALUES
('42190615e-1101-7209-9932-7020bbd556f6', 'f190615e-1101-7209-9932-7020bbd556f1'),
('42190615e-1101-7209-9932-7020bbd556f7', 'f190615e-1101-7209-9932-7020bbd556f2'),
('42190615e-1101-7209-9932-7020bbd556f8', 'f190615e-1101-7209-9932-7020bbd556f3'),
('42190615e-1101-7209-9932-7020bbd556f9', 'f190615e-1101-7209-9932-7020bbd556f4'),
('42190615e-1101-7209-9932-7020bbd556f7', 'f190615e-1101-7209-9932-7020bbd556f1'),
('42190615e-1101-7209-9932-7020bbd556f6', 'f190615e-1101-7209-9932-7020bbd556f2'),
('42190615e-1101-7209-9932-7020bbd556f7', 'f190615e-1101-7209-9932-7020bbd556f3'),
('42190615e-1101-7209-9932-7020bbd556f8', 'f190615e-1101-7209-9932-7020bbd556f4'),
('42190615e-1101-7209-9932-7020bbd556f9', 'f190615e-1101-7209-9932-7020bbd556f1');

--insertion dans la table suivre
INSERT INTO suivre (precomouvements_id, documents_id)
VALUES
('61290615e-1101-7209-9932-7020bbd556f1', '0190615e-1101-7209-9932-7020bbd556f1'),
('61290615e-1101-7209-9932-7020bbd556f2', '0190615e-1101-7209-9932-7020bbd556f2'),
('61290615e-1101-7209-9932-7020bbd556f3', '0190615e-1101-7209-9932-7020bbd556f3'),
('61290615e-1101-7209-9932-7020bbd556f4', '0190615e-1101-7209-9932-7020bbd556f4'),
('61290615e-1101-7209-9932-7020bbd556f5', '0190615e-1101-7209-9932-7020bbd556f5'),
('61290615e-1101-7209-9932-7020bbd556f6', '0190615e-1101-7209-9932-7020bbd556f6'),
('61290615e-1101-7209-9932-7020bbd556f7', '0190615e-1101-7209-9932-7020bbd556f7'),
('61290615e-1101-7209-9932-7020bbd556f8', '0190615e-1101-7209-9932-7020bbd556f8');

-- Insertion dans la table 'mouvemnts'
INSERT INTO mouvements (id, date, quantite, montant, precomouvementsqtes_id, precomouvements_id, ressources_id, datecreation, datemodification) VALUES
('3190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', 10, 500, 5000, '61290615e-1101-7209-9932-7020bbd556f1', '6190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', '2022-01-02'),
('3190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', 20, 1000, 10000, '61290615e-1101-7209-9932-7020bbd556f2', '6190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', '2022-01-02'),
('3190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', 5, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f3', '6190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', '2022-01-02'),
('3190615e-1101-7209-9932-7020bbd556f4', '2022-01-01', 5, 200, 2000, '61290615e-1101-7209-9932-7020bbd556f4', '6190615e-1101-7209-9932-7020bbd556f4', '2022-01-01', '2022-01-02');

-- Insérer les données dans la table 'personnes' en se basant sur la classe PersonnesEntity
INSERT INTO personnes (id,adresse,mail,telephone,qrcode,datecreation,datemodification) VALUES
('4190615e-1101-7209-9932-7020bbd556f1','Bastos','abd@yah.fr','655454545','qrcode1','2022-01-01','2022-01-02'),
('4190615e-1101-7209-9932-7020bbd556f2','Bastos','dbc@yah.fr','655454545','qrcode2','2022-01-01','2022-01-02'),
('4190615e-1101-7209-9932-7020bbd556f3','Bastos','pnj@gma.com','655454545','qrcode3','2022-01-01','2022-01-02'),
('4190615e-1101-7209-9932-7020bbd556f4','Bastos','sg@sg.fr','655454545','qrcode4','2022-01-01','2022-01-02');

-- Insérer les données dans la table 'distributeur' en se basant sur la classe DistributeurEntity
INSERT INTO distributeurs (code, raisonsociale, datemodification) VALUES
('d190615','ENEO','2022-01-01'),
('d190616','Brasserie','2022-01-01'),
('d190619','UCB','2022-01-01'),
('d190614','Pharmacam','2022-01-01');

INSERT INTO etats (id, libelle,description, datecreation, datemodification) VALUES
('e190615e-1101-7209-9932-7020bbd556f1','En cours','En cours', '2022-01-01', '2022-01-02'),
('e190615e-1101-7209-9932-7020bbd556f2','Valide','Valide', '2022-01-01', '2022-01-02'),
('e190615e-1101-7209-9932-7020bbd556f3','Rejete','Rejete', '2022-01-01', '2022-01-02'),
('e190615e-1101-7209-9932-7020bbd556f4','En attente','En attente', '2022-01-01', '2022-01-02');

-- Insérer les données dans la table 'roles' en se basant sur la classe RolesEntity
INSERT INTO roles (id, titre, description, etat, datecreation,datemodification) VALUES
('5190615e-1101-7209-9932-7020bbd556f1','vendeur','personnel au contact du client', true, '2022-01-01','2022-01-02'),
('6190615e-1101-7209-9932-7020bbd556f2','traiteur','Personnel administratif', true, '2022-01-01','2022-01-02'),
('6190615e-1101-7209-9932-7020bbd556f3','marcheur','commercial sur le terrain', true, '2022-01-01','2022-01-02');

INSERT INTO personnels (id, dateentree, nom, datenaissance, telephone, datesortie, email, prenom, sexe)
VALUES
    ('4390615e-1101-7209-9932-7020bbd556f1', CURRENT_DATE, 'Tagne', '2000-04-10', '655455487', NULL, 'tagnewillie@gmail.com', 'Willy', 'M'),
    ('4390615e-1101-7209-9932-7020bbd556f2', CURRENT_DATE, 'Peter', '2004-08-10', '655455487', NULL, 'peteralan@gmail.com', 'Alan', 'M'),
    ('4390615e-1101-7209-9932-7020bbd556f3', CURRENT_DATE, 'Dombo', '2002-10-10', '655455487', NULL, 'dombogilles@gmail.com', 'Gilles', 'M');

-- Insérer les données dans la table 'jouerRole' en se basant sur la classe JouerRoleEntity
INSERT INTO jouerRole (personnels_id, roles_id,datedebut,datefin, datecreation, datemodification) VALUES
('4390615e-1101-7209-9932-7020bbd556f1','5190615e-1101-7209-9932-7020bbd556f1','2024-01-01',null,'2022-01-01','2022-01-02'),
('4390615e-1101-7209-9932-7020bbd556f2','5190615e-1101-7209-9932-7020bbd556f2','2024-01-01',null,'2022-01-01','2022-01-02'),
('4390615e-1101-7209-9932-7020bbd556f3','5190615e-1101-7209-9932-7020bbd556f3','2024-01-01',null,'2022-01-01','2022-01-02');







