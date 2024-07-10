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

--insertion du jdd

-- Insertion dans la table service
INSERT INTO services (id, libelle, description, codeunique, etat,localisation, datecreation, datemodification,filesattentes_id)
VALUES
('s190615e-1101-7209-9932-7020bbd556f1', 'Consultation', 'bien', 'S1', true, 'douala', '1972-06-12', '1990-03-07','f190615e-1101-7209-9932-7020bbd556f1'),
('s190615e-1101-7209-9932-7020bbd556f2', 'Laboratoire', 'bien', 'S2', true, 'douala', '1990-08-06', '1990-03-07','f190615e-1101-7209-9932-7020bbd556f2'),
('s190615e-1101-7209-9932-7020bbd556f3', 'Pharmacie', 'bien', 'S3', true, 'douala', '2000-03-07', '1990-03-07','f190615e-1101-7209-9932-7020bbd556f3');

-- Insertion dans la table mission
INSERT INTO missions (id, libelle, description, etat, datecreation, datemodification, services_id)
VALUES
('m190615e-1101-7209-9932-7020bbd556f1', 'Encaissement', 'recu de paiement lié à une mission', true, '2000-03-07', '1990-03-07', 's190615e-1101-7209-9932-7020bbd556f1'),
('m190615e-1101-7209-9932-7020bbd556f2', 'Resultat Labo', 'Communiquer les résultats du labo aux patients', true, '2000-03-07', '1990-03-07', 's190615e-1101-7209-9932-7020bbd556f1'),
('m190615e-1101-7209-9932-7020bbd556f3', 'Hospitalisation', 'bon d''entrée et de sortie est une mission', true, '2000-03-07', '1990-03-07', 's190615e-1101-7209-9932-7020bbd556f2'),
('m190615e-1101-7209-9932-7020bbd556f4', 'Prelevement Labo', 'Prélévement fait par laboratoire', true, '2000-03-07', '1990-03-07', 's190615e-1101-7209-9932-7020bbd556f2'),
('m190615e-1101-7209-9932-7020bbd556f5', 'Consultation Spécialiste', 'Consultation faite par un médecin', true, '2000-03-07', '1990-03-07', 's190615e-1101-7209-9932-7020bbd556f3'),
('m190615e-1101-7209-9932-7020bbd556f6', 'Consultation', 'Consultation faite par une infirmière', true, '2000-03-07', '1990-03-07', 's190615e-1101-7209-9932-7020bbd556f3');

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
('pm90615e-1101-7209-9932-7020bbd556f1', 'Inventaire', true, 'Neutre', '2022-01-01', '2022-01-02'),
('pm90615e-1101-7209-9932-7020bbd556f2', 'Vente', true, 'Reduire', '2022-01-01', '2022-01-02'),
('pm90615e-1101-7209-9932-7020bbd556f3', 'Achat', true, 'Ajout', '2022-01-01', '2022-01-02')
('pm90615e-1101-7209-9932-7020bbd556f4', 'interdiction Infirmière', true, 'Neutre', '2022-01-01', '2022-01-02')
('pm90615e-1101-7209-9932-7020bbd556f5', 'Don', true, 'Neutre', '2022-01-01', '2022-01-02')
('pm90615e-1101-7209-9932-7020bbd556f6', 'Perte', true, 'Reduire', '2022-01-01', '2022-01-02')
('pm90615e-1101-7209-9932-7020bbd556f7', 'Retour', true, 'Ajout', '2022-01-01', '2022-01-02')
('pm90615e-1101-7209-9932-7020bbd556f8', 'Sortie magasin', true, 'Reduire', '2022-01-01', '2022-01-02');

---- Insertion dans la table 'familles'
INSERT INTO familles (id, libelle, description, etat, datecreation, datemodification) VALUES
('f190615e-1101-7209-9932-7020bbd556f1', 'Medicaments', 'Medicaments', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f2', 'Consommables Informatiques', 'Consommables Informatiques', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f3', 'BioMedical', 'BioMedical', true, '2022-01-01', '2022-01-02'),
('f190615e-1101-7209-9932-7020bbd556f4', 'Accessoires', 'Accessoires', true, '2022-01-01', '2022-01-02');

--
---- Insertion dans la table 'ressources'
INSERT INTO ressources (id, libelle, description, etat, datecreation, datemodification,quantite, prixentree,prixsortie,seuilalerte,unite, familles_id) VALUES
('r190615e-1101-7209-9932-7020bbd556f1', 'Paracetamol', 'Paracetamol', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f1'),
('r190615e-1101-7209-9932-7020bbd556f2', 'Cartouche d''encre', 'Cartouche d''encre', true, '2022-01-01', '2022-01-02',4,2000,3000,10,'Boite', 'f190615e-1101-7209-9932-7020bbd556f2'),
('r190615e-1101-7209-9932-7020bbd556f3', 'Scanner', 'Scanner', true, '2022-01-01', '2022-01-02',4,12000,20000,2,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('r190615e-1101-7209-9932-7020bbd556f4', 'Imprimante', 'Imprimante', true, '2022-01-01', '2022-01-02',4,12000,20000,2,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('r190615e-1101-7209-9932-7020bbd556f5', 'Souris', 'Souris', true, '2022-01-01', '2022-01-02',40,25,20,12,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('r190615e-1101-7209-9932-7020bbd556f6', 'Stylet', 'Stylet', true, '2022-01-01', '2022-01-02',24,20,20000,9,'Packs', 'f190615e-1101-7209-9932-7020bbd556f2'),
('r190615e-1101-7209-9932-7020bbd556f7', 'Doliprane', 'Doliprane', true, '  2022-01-01', '2022-01-02',90,1200,2000,40,'Boite', 'f190615e-1101-7209-9932-7020bbd556f1'),
('r190615e-1101-7209-9932-7020bbd556f8', 'Pommade', 'Pommade', true, '2022-01-01', '2022-01-02',20,200,210,20,'Litre', 'f190615e-1101-7209-9932-7020bbd556f1'),
('r190615e-1101-7209-9932-7020bbd556f9', 'Seringue', 'Seringue', true, '2022-01-01', '2022-01-02',42,100,200,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('r190615e-1101-7209-9932-7020bbd556f0', 'Perfuseur', 'Perfuseur', true, '2022-01-01', '2022-01-02',5,90,230,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('r190615e-1101-7209-9932-7020bbd556f11', 'Gants', 'Gants', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('r190615e-1101-7209-9932-7020bbd556f12', 'Masque', 'Masque', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('r190615e-1101-7209-9932-7020bbd556f13', 'Gel Hydroalcoolique', 'Gel Hydroalcoolique', true,54,1200,2000,200,'Litre', '2022-01-01', '2022-01-02', 'f190615e-1101-7209-9932-7020bbd556f3'),
('r190615e-1101-7209-9932-7020bbd556f14', 'Coton', 'Coton', true, '2022-01-01', '2022-01-02',44,1200,2000,230,'Boite', 'f190615e-1101-7209-9932-7020bbd556f3'),
('r190615e-1101-7209-9932-7020bbd556f15', 'Papier', 'Papier', true, '2022-01-01', '2022-01-02',24,1200,2000,20,'Packs', 'f190615e-1101-7209-9932-7020bbd556f4'),
('r190615e-1101-7209-9932-7020bbd556f16', 'Encre', 'Encre', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f4'),
('r190615e-1101-7209-9932-7020bbd556f17', 'Toner', 'Toner', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Boite', 'f190615e-1101-7209-9932-7020bbd556f4'),
('r190615e-1101-7209-9932-7020bbd556f18', 'Cahier', 'Cahier', true, '2022-01-01', '2022-01-02',4,1200,2000,20,'Packs', 'f190615e-1101-7209-9932-7020bbd556f4');

---- Insertion dans la table 'precomouvementsqtes'
INSERT INTO precomouvementsqtes (id, qtemin, qtemax, montantmin, montantmax, precomouvements_id, ressources_id, datecreation, datemodification) VALUES
('pq190615e-1101-7209-9932-7020bbd556f1', 10, 100, 500, 5000, 'pm90615e-1101-7209-9932-7020bbd556f1', 'r190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f2', 20, 200, 1000, 10000, 'pm90615e-1101-7209-9932-7020bbd556f2', 'r190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f3', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f3', 'r190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f4', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f4', 'r190615e-1101-7209-9932-7020bbd556f4', '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f5', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f5', 'r190615e-1101-7209-9932-7020bbd556f5', '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f6', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f6', null, '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f7', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f7', null, '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f8', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f8', null '2022-01-01', '2022-01-02'),
('pq190615e-1101-7209-9932-7020bbd556f9', 5, 50, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f9', null, '2022-01-01', '2022-01-02');

-- Insertion dans la table sapplique
INSERT INTO sapplique (precomouvementsqtes_id,familles_id)
VALUES
('pq190615e-1101-7209-9932-7020bbd556f6', 'f190615e-1101-7209-9932-7020bbd556f1'),
('pq190615e-1101-7209-9932-7020bbd556f7', 'f190615e-1101-7209-9932-7020bbd556f2'),
('pq190615e-1101-7209-9932-7020bbd556f8', 'f190615e-1101-7209-9932-7020bbd556f3'),
('pq190615e-1101-7209-9932-7020bbd556f9', 'f190615e-1101-7209-9932-7020bbd556f4'),
('pq190615e-1101-7209-9932-7020bbd556f7', 'f190615e-1101-7209-9932-7020bbd556f1'),
('pq190615e-1101-7209-9932-7020bbd556f6', 'f190615e-1101-7209-9932-7020bbd556f2'),
('pq190615e-1101-7209-9932-7020bbd556f7', 'f190615e-1101-7209-9932-7020bbd556f3'),
('pq190615e-1101-7209-9932-7020bbd556f8', 'f190615e-1101-7209-9932-7020bbd556f4'),
('pq190615e-1101-7209-9932-7020bbd556f9', 'f190615e-1101-7209-9932-7020bbd556f1');

--insertion dans la table suivre
INSERT INTO suivre (precomouvements_id, documents_id)
VALUES
('pm90615e-1101-7209-9932-7020bbd556f1', '0190615e-1101-7209-9932-7020bbd556f1'),
('pm90615e-1101-7209-9932-7020bbd556f2', '0190615e-1101-7209-9932-7020bbd556f2'),
('pm90615e-1101-7209-9932-7020bbd556f3', '0190615e-1101-7209-9932-7020bbd556f3'),
('pm90615e-1101-7209-9932-7020bbd556f4', '0190615e-1101-7209-9932-7020bbd556f4'),
('pm90615e-1101-7209-9932-7020bbd556f5', '0190615e-1101-7209-9932-7020bbd556f5'),
('pm90615e-1101-7209-9932-7020bbd556f6', '0190615e-1101-7209-9932-7020bbd556f6'),
('pm90615e-1101-7209-9932-7020bbd556f7', '0190615e-1101-7209-9932-7020bbd556f7'),
('pm90615e-1101-7209-9932-7020bbd556f8', '0190615e-1101-7209-9932-7020bbd556f8');

-- Insertion dans la table 'mouvemnts'
INSERT INTO mouvements (id, date, quantite, montant, precomouvementsqtes_id, precomouvements_id, ressources_id, datecreation, datemodification) VALUES
('m190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', 10, 500, 5000, 'pm90615e-1101-7209-9932-7020bbd556f1', 'r190615e-1101-7209-9932-7020bbd556f1', '2022-01-01', '2022-01-02'),
('m190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', 20, 1000, 10000, 'pm90615e-1101-7209-9932-7020bbd556f2', 'r190615e-1101-7209-9932-7020bbd556f2', '2022-01-01', '2022-01-02'),
('m190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', 5, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f3', 'r190615e-1101-7209-9932-7020bbd556f3', '2022-01-01', '2022-01-02'),
('m190615e-1101-7209-9932-7020bbd556f4', '2022-01-01', 5, 200, 2000, 'pm90615e-1101-7209-9932-7020bbd556f4', 'r190615e-1101-7209-9932-7020bbd556f4', '2022-01-01', '2022-01-02');

-- Insérer les données dans la table 'personnes' en se basant sur la classe PersonnesEntity
INSERT INTO personnes (id,adresse,mail,telephone,qrcode,etat,datecreation,datemodification) VALUES
('p190615e-1101-7209-9932-7020bbd556f1','Bastos','


INSERT INTO distributeurs (distributeurs_id, raisonsociale,code)
VALUES
    ('1', 'Brasserie', 'Dla'),
    ('2', 'ENEO',  'Ydé'),
    ('3', 'Total Distribution',  'Buéa');

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

INSERT INTO promotions (id, datedebut, datefin, codeunique, montantremise, pourcentageremise, datecreation, distributeurs_id)
VALUES
('1', '2024-06-01', '2024-06-30', 'CODE1', 50.0, 10.0, '2024-06-01', '1'),
('2', '2024-07-01', '2024-07-31', 'CODE2', 60.0, 15.0, '2024-07-01', '2'),
('3', '2024-08-01', '2024-08-31', 'CODE3', 70.0, 20.0, '2024-08-01', '3'),
('4', '2024-09-01', '2024-09-30', 'CODE4', 80.0, 25.0, '2024-09-01', '3');



