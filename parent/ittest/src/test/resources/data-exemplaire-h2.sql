-- insertions des données dans la table exemplaires
INSERT INTO exemplaire.exemplaires (id, code, codebarre, titre, datecreation, datemodification, personnerattachee,personnebeneficiaire,documentid) VALUES
    ('3190615e-1101-7209-9932-7020bbd556f7', 'Code1', 'CodeBarre1', 'Note intervention personnalisée', '2022-03-07', '2022-03-07', null, '1979bd79-f71b-498b-b247-e7b9bbb3f600','0190615e-1101-7209-9932-7020bbd556f1'),
    ('239d9d41-4850-4984-9d81-189cf44d867d', 'Code2', 'CodeBarre12', 'Fiche de suivi personnalisée', '2022-04-07', '2022-03-07', null, 'd301ff83-2a62-4e6d-aa23-57c7825bcd57','0190615e-1101-7209-9932-7020bbd556f2'),
    ('14d6a6a5-e470-4a43-a33b-37c294974461', 'Code3', 'CodeBarre13', 'Fiche de soin personnalisée', '2022-03-07', '2022-03-07', null, '1979bd79-f71b-498b-b247-e7b9bbb3f600','0190615e-1101-7209-9932-7020bbd556f3'),
    ('5b777f4e-ac38-4637-a065-ef87af525e86', 'Code4', 'CodeBarre14', 'Note intervention personnalisée', '2022-05-07', '2022-03-07', null, '0618e585-f82a-4d5f-af1c-54f880d766d3','0190615e-1101-7209-9932-7020bbd556f3'),
    ('6d5a9f88-704d-4715-9336-92835cf9e824', 'Code5', 'CodeBarre15', 'Note intervention personnalisée', '2022-03-07', '2022-03-07', null, 'fdbff692-6b8d-43ab-a196-fcc3114b2daa','0190615e-1101-7209-9932-7020bbd556f3'),
    ('e9eb182f-baf3-4c27-8179-a8b083c30e09', 'Code6', 'CodeBarre16', 'Note intervention personnalisée', '2022-03-07', '2022-03-07', null, '1979bd79-f71b-498b-b247-e7b9bbb3f600','0190615e-1101-7209-9932-7020bbd556f3');

 --insertions des données dans la table ordreetats
INSERT INTO exemplaire.ordreetats (id, description, datecreation, datemodification,datefinvote, ordre, etats_id, exemplaireid) VALUES
('317efceb-7260-49fe-bf67-14078e0c74e2', 'ordre 1', '2019-01-01', '2019-01-01', '2025-01-01', 1, 'e190615e-1101-7209-9932-7020bbd556f1', '3190615e-1101-7209-9932-7020bbd556f7'),
('ffeec39a-8c61-457d-9e99-dea0b4a8ff86', 'ordre 2', '2019-01-01', '2019-01-01', '2024-01-01', 1, 'e190615e-1101-7209-9932-7020bbd556f1', '239d9d41-4850-4984-9d81-189cf44d867d'),
('0ce9d22a-1634-4561-9e4f-607cfaa7ad97', 'ordre 2 bis', '2019-01-01', '2019-01-01', '2025-01-01', 2, 'e190615e-1101-7209-9932-7020bbd556f2', '239d9d41-4850-4984-9d81-189cf44d867d'),
('6e2f8850-57e7-4af7-9881-da1880bbce49', 'ordre 3', '2019-01-01', '2019-01-01', '2023-01-01', 1, 'e190615e-1101-7209-9932-7020bbd556f1', '14d6a6a5-e470-4a43-a33b-37c294974461'),
('6b6d5246-6689-4e01-b019-896dec6b6369', 'ordre 3 bis', '2019-01-01', '2019-01-01', '2024-01-01', 2, 'e190615e-1101-7209-9932-7020bbd556f2', '14d6a6a5-e470-4a43-a33b-37c294974461'),
('6e2f8850-57e7-4af7-9881-da1880bbce49', 'ordre 3 ter', '2019-01-01', '2019-01-01', '2025-01-01', 3, 'e190615e-1101-7209-9932-7020bbd556f3', '14d6a6a5-e470-4a43-a33b-37c294974461'),
('1d9b1f4c-0570-4ea5-8659-91e2c8348673', 'ordre 4', '2019-01-01', '2019-01-01', '2025-01-01', 4, 'e190615e-1101-7209-9932-7020bbd556f4', '5b777f4e-ac38-4637-a065-ef87af525e86'),
('8332d535-d7a9-462c-9d6c-23ed891ed127', 'ordre 5', '2019-01-01', '2019-01-01', '2025-01-01', 5, 'e190615e-1101-7209-9932-7020bbd556f1', '6d5a9f88-704d-4715-9336-92835cf9e824'),
('1ef57c5d-b317-4232-9ae0-15695fb8cba0', 'ordre 6', '2019-01-01', '2019-01-01', '2025-01-01', 6, 'e190615e-1101-7209-9932-7020bbd556f1', 'e9eb182f-baf3-4c27-8179-a8b083c30e09');

-- insertions des données dans la table exemplaire.exemplairesattributs
INSERT INTO exemplaire.exemplairesattributs (exemplaires_id, attribut_id, valeur, datecreation, datemodification) VALUES
('3190615e-1101-7209-9932-7020bbd556f7', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '179', '2022-03-07', '2022-03-07'),
('3190615e-1101-7209-9932-7020bbd556f7', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '42', '2022-03-07', '2022-03-07'),
('3190615e-1101-7209-9932-7020bbd556f7', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', '82', '2022-03-07', '2022-03-07'),
('3190615e-1101-7209-9932-7020bbd556f7', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'BRUN', '2022-03-07', '2022-03-07'),
('3190615e-1101-7209-9932-7020bbd556f7', 'a9eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'YAOUNDE', '2022-03-07', '2022-03-07'),
('3190615e-1101-7209-9932-7020bbd556f7', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', '21/12/2000', '2022-03-07', '2022-03-07'),
('239d9d41-4850-4984-9d81-189cf44d867d', 'a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', '21/08/1986²²', '2022-03-07', '2022-03-07'),
('239d9d41-4850-4984-9d81-189cf44d867d', 'a4eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'MASCULIN', '2022-03-07', '2022-03-07'),
('239d9d41-4850-4984-9d81-189cf44d867d', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', '67', '2022-03-07', '2022-03-07'),
('14d6a6a5-e470-4a43-a33b-37c294974461', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Marron', '2022-03-07', '2022-03-07'),
('5b777f4e-ac38-4637-a065-ef87af525e86', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Noir', '2022-03-07', '2022-03-07'),
('6d5a9f88-704d-4715-9336-92835cf9e824', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Noir', '2022-03-07', '2022-03-07'),
('e9eb182f-baf3-4c27-8179-a8b083c30e09', 'a1eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Brun', '2022-03-07', '2022-03-07');