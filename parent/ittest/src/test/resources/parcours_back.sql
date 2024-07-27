PGDMP  6    :                |           parcoursback    16.3    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    21454    parcoursback    DATABASE        CREATE DATABASE parcoursback WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE parcoursback;
                postgres    false                        2615    22307    parcours    SCHEMA        CREATE SCHEMA parcours;
    DROP SCHEMA parcours;
                sa    false            �            1259    22324    associer    TABLE     �   CREATE TABLE public.associer (
    obligatoire boolean,
    ordre integer,
    attributs_id character varying(255) NOT NULL,
    categories_id character varying(255) NOT NULL
);
    DROP TABLE public.associer;
       public         heap    postgres    false            �            1259    22308 	   attributs    TABLE     D  CREATE TABLE public.attributs (
    id character varying(255) NOT NULL,
    titre character varying(255) NOT NULL,
    description character varying(255),
    etat boolean DEFAULT true,
    datecreation date,
    datemodification date,
    type character varying(255) NOT NULL,
    valeurpardefaut character varying(255)
);
    DROP TABLE public.attributs;
       public         heap    postgres    false            �            1259    22316 
   categories    TABLE       CREATE TABLE public.categories (
    id character varying(255) NOT NULL,
    ordre character varying(255),
    libelle character varying(255),
    etat boolean DEFAULT true,
    datecreation date,
    datemodification date,
    documents_id character varying(255)
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    22331 	   concerner    TABLE     �   CREATE TABLE public.concerner (
    distributeurs_id character varying(255) NOT NULL,
    precomouvementsqtes_id character varying(255) NOT NULL
);
    DROP TABLE public.concerner;
       public         heap    postgres    false            �            1259    22343 
   constituer    TABLE     �   CREATE TABLE public.constituer (
    attributs_id character varying(255) NOT NULL,
    documents_id character varying(255) NOT NULL
);
    DROP TABLE public.constituer;
       public         heap    postgres    false            �            1259    22336    distributeurs    TABLE     �   CREATE TABLE public.distributeurs (
    distributeurs_id character varying(255) NOT NULL,
    datemodification date,
    code character varying(255),
    raisonsociale character varying(255)
);
 !   DROP TABLE public.distributeurs;
       public         heap    postgres    false            �            1259    22561    docetats    TABLE     -  CREATE TABLE public.docetats (
    id character varying(255) NOT NULL,
    ordre integer,
    datecreation date,
    datemodification date,
    validations_id character varying(255),
    etats_id character varying(255),
    documents_id character varying(255),
    etapes_id character varying(255)
);
    DROP TABLE public.docetats;
       public         heap    postgres    false                        1259    22568    docetats_predecesseurs    TABLE     �   CREATE TABLE public.docetats_predecesseurs (
    docetats_id character varying(255) NOT NULL,
    predecesseur_id character varying(255) NOT NULL
);
 *   DROP TABLE public.docetats_predecesseurs;
       public         heap    postgres    false            �            1259    22348 	   documents    TABLE     �  CREATE TABLE public.documents (
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
    contientressources boolean
);
    DROP TABLE public.documents;
       public         heap    postgres    false            �            1259    22490    documentspromotions    TABLE     �   CREATE TABLE public.documentspromotions (
    documents_id character varying(255) NOT NULL,
    promotions_id character varying(255) NOT NULL
);
 '   DROP TABLE public.documentspromotions;
       public         heap    postgres    false            �            1259    22367    etapes    TABLE     �   CREATE TABLE public.etapes (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    etat character varying(255),
    datemodification date,
    parcours_id character varying(255)
);
    DROP TABLE public.etapes;
       public         heap    postgres    false            �            1259    22360    etats    TABLE     �   CREATE TABLE public.etats (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    description character varying(255),
    datecreation date,
    datemodification date
);
    DROP TABLE public.etats;
       public         heap    postgres    false            �            1259    22374    familles    TABLE     �   CREATE TABLE public.familles (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date
);
    DROP TABLE public.familles;
       public         heap    postgres    false            �            1259    22495    famillespromotions    TABLE     �   CREATE TABLE public.famillespromotions (
    familles_id character varying(255) NOT NULL,
    promotions_id character varying(255) NOT NULL
);
 &   DROP TABLE public.famillespromotions;
       public         heap    postgres    false            �            1259    22386    filesattentes    TABLE     �   CREATE TABLE public.filesattentes (
    id character varying(255) NOT NULL,
    datecreation date,
    datemodification date,
    etat boolean,
    services_id character varying(255)
);
 !   DROP TABLE public.filesattentes;
       public         heap    postgres    false            �            1259    22393 
   jouerroles    TABLE       CREATE TABLE public.jouerroles (
    id character varying(255) NOT NULL,
    etat boolean,
    datecreation date,
    datemodification date,
    datefin date,
    datedebut date,
    personnels_id character varying(255),
    roles_id character varying(255)
);
    DROP TABLE public.jouerroles;
       public         heap    postgres    false            �            1259    22400    missions    TABLE       CREATE TABLE public.missions (
    id character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    description character varying(255),
    etat boolean,
    datecreation date NOT NULL,
    datemodification date,
    services_id character varying(255)
);
    DROP TABLE public.missions;
       public         heap    postgres    false            �            1259    22412 
   mouvements    TABLE     X  CREATE TABLE public.mouvements (
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
    DROP TABLE public.mouvements;
       public         heap    postgres    false                       1259    22844 	   mouvpreco    TABLE     �   CREATE TABLE public.mouvpreco (
    id_precomouvements character varying(255) NOT NULL,
    id_mouvements character varying(255) NOT NULL
);
    DROP TABLE public.mouvpreco;
       public         heap    postgres    false            �            1259    22429 
   ordreetats    TABLE     �   CREATE TABLE public.ordreetats (
    id character varying(255) NOT NULL,
    datecreation date,
    datemodification date,
    datefinvote date,
    ordre integer,
    etats_id character varying(255)
);
    DROP TABLE public.ordreetats;
       public         heap    postgres    false            �            1259    22436    parcours    TABLE     �   CREATE TABLE public.parcours (
    id character varying(255) NOT NULL,
    libelle character varying(255),
    datecreation date,
    datemodification date
);
    DROP TABLE public.parcours;
       public         heap    postgres    false            �            1259    22443 
   personnels    TABLE     T  CREATE TABLE public.personnels (
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
    DROP TABLE public.personnels;
       public         heap    postgres    false            �            1259    22450 	   personnes    TABLE       CREATE TABLE public.personnes (
    id character varying(255) NOT NULL,
    adresse character varying(255),
    mail character varying(255),
    telephone character varying(255),
    qrcodevalue character varying(255),
    datecreation date NOT NULL,
    datemodification date
);
    DROP TABLE public.personnes;
       public         heap    postgres    false            �            1259    22462    personnesmorales    TABLE     �   CREATE TABLE public.personnesmorales (
    personnesmorales_id character varying(255) NOT NULL,
    raisonsociale character varying(255),
    code character varying(255),
    datemodification date
);
 $   DROP TABLE public.personnesmorales;
       public         heap    postgres    false            �            1259    22469    personnesphysique    TABLE       CREATE TABLE public.personnesphysique (
    personnesphysique_id character varying(255) NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255),
    sexe character varying(255),
    datenaissance date NOT NULL,
    datemodification date
);
 %   DROP TABLE public.personnesphysique;
       public         heap    postgres    false            �            1259    22476    precomouvements    TABLE     �   CREATE TABLE public.precomouvements (
    id character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    etat boolean,
    datecreation date NOT NULL,
    datemodification date,
    typemouvement character varying(255)
);
 #   DROP TABLE public.precomouvements;
       public         heap    postgres    false            �            1259    22483    precomouvementsqtes    TABLE     R  CREATE TABLE public.precomouvementsqtes (
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
 '   DROP TABLE public.precomouvementsqtes;
       public         heap    postgres    false            �            1259    22500 
   promotions    TABLE     A  CREATE TABLE public.promotions (
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
    DROP TABLE public.promotions;
       public         heap    postgres    false            �            1259    22457 	   rattacher    TABLE     �   CREATE TABLE public.rattacher (
    personnes_id character varying(255) NOT NULL,
    rattacher_id character varying(255) NOT NULL
);
    DROP TABLE public.rattacher;
       public         heap    postgres    false            �            1259    22507    remplir    TABLE     9  CREATE TABLE public.remplir (
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
    DROP TABLE public.remplir;
       public         heap    postgres    false            �            1259    22419 	   respecter    TABLE     �   CREATE TABLE public.respecter (
    mouvements_id character varying(255) NOT NULL,
    precomouvements_id character varying(255) NOT NULL
);
    DROP TABLE public.respecter;
       public         heap    postgres    false            �            1259    22514 
   ressources    TABLE     �  CREATE TABLE public.ressources (
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
    DROP TABLE public.ressources;
       public         heap    postgres    false            �            1259    22521    ressourcespromotions    TABLE     �   CREATE TABLE public.ressourcespromotions (
    promotions_id character varying(255) NOT NULL,
    ressources_id character varying(255) NOT NULL
);
 (   DROP TABLE public.ressourcespromotions;
       public         heap    postgres    false            �            1259    22526    roles    TABLE     �   CREATE TABLE public.roles (
    id character varying(255) NOT NULL,
    titre character varying(255),
    description character varying(255),
    etat boolean,
    datecreation date,
    datemodification date
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    22381 	   sapplique    TABLE     �   CREATE TABLE public.sapplique (
    familles_id character varying(255) NOT NULL,
    precomouvementsqtes_id character varying(255) NOT NULL
);
    DROP TABLE public.sapplique;
       public         heap    postgres    false            �            1259    22533    services    TABLE     _  CREATE TABLE public.services (
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
    DROP TABLE public.services;
       public         heap    postgres    false            �            1259    22355    suivre    TABLE     �   CREATE TABLE public.suivre (
    documents_id character varying(255) NOT NULL,
    precomouvements_id character varying(255) NOT NULL
);
    DROP TABLE public.suivre;
       public         heap    postgres    false            �            1259    22540    tickets    TABLE     �   CREATE TABLE public.tickets (
    id character varying(255) NOT NULL,
    codecourt character varying(255),
    datecreation date,
    datemodification date
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    22547    ticketsfilesattentes    TABLE     �   CREATE TABLE public.ticketsfilesattentes (
    id character varying(255) NOT NULL,
    etat boolean,
    dateaffectation date,
    tickets_id character varying(255),
    filesattentes_id character varying(255)
);
 (   DROP TABLE public.ticketsfilesattentes;
       public         heap    postgres    false            �            1259    22407    traiter    TABLE     �   CREATE TABLE public.traiter (
    documents_id character varying(255) NOT NULL,
    missions_id character varying(255) NOT NULL
);
    DROP TABLE public.traiter;
       public         heap    postgres    false            �            1259    22554    validations    TABLE     L  CREATE TABLE public.validations (
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
    DROP TABLE public.validations;
       public         heap    postgres    false            �            1259    22424    violer    TABLE     �   CREATE TABLE public.violer (
    mouvements_id character varying(255) NOT NULL,
    precomouvements_id character varying(255) NOT NULL
);
    DROP TABLE public.violer;
       public         heap    postgres    false            �          0    22324    associer 
   TABLE DATA                 public          postgres    false    218   (�       �          0    22308 	   attributs 
   TABLE DATA                 public          postgres    false    216   d�       �          0    22316 
   categories 
   TABLE DATA                 public          postgres    false    217   �       �          0    22331 	   concerner 
   TABLE DATA                 public          postgres    false    219   ��       �          0    22343 
   constituer 
   TABLE DATA                 public          postgres    false    221   ��       �          0    22336    distributeurs 
   TABLE DATA                 public          postgres    false    220   ��       �          0    22561    docetats 
   TABLE DATA                 public          postgres    false    255   ��       �          0    22568    docetats_predecesseurs 
   TABLE DATA                 public          postgres    false    256   ��       �          0    22348 	   documents 
   TABLE DATA                 public          postgres    false    222   ��       �          0    22490    documentspromotions 
   TABLE DATA                 public          postgres    false    244   ��       �          0    22367    etapes 
   TABLE DATA                 public          postgres    false    225   ��       �          0    22360    etats 
   TABLE DATA                 public          postgres    false    224   ��       �          0    22374    familles 
   TABLE DATA                 public          postgres    false    226   ��       �          0    22495    famillespromotions 
   TABLE DATA                 public          postgres    false    245   ��       �          0    22386    filesattentes 
   TABLE DATA                 public          postgres    false    228   ��       �          0    22393 
   jouerroles 
   TABLE DATA                 public          postgres    false    229   z�       �          0    22400    missions 
   TABLE DATA                 public          postgres    false    230   ��       �          0    22412 
   mouvements 
   TABLE DATA                 public          postgres    false    232   9�       �          0    22844 	   mouvpreco 
   TABLE DATA                 public          postgres    false    257   �       �          0    22429 
   ordreetats 
   TABLE DATA                 public          postgres    false    235   #�       �          0    22436    parcours 
   TABLE DATA                 public          postgres    false    236   =�       �          0    22443 
   personnels 
   TABLE DATA                 public          postgres    false    237   W�       �          0    22450 	   personnes 
   TABLE DATA                 public          postgres    false    238   ��       �          0    22462    personnesmorales 
   TABLE DATA                 public          postgres    false    240   ��       �          0    22469    personnesphysique 
   TABLE DATA                 public          postgres    false    241   ��       �          0    22476    precomouvements 
   TABLE DATA                 public          postgres    false    242   ��       �          0    22483    precomouvementsqtes 
   TABLE DATA                 public          postgres    false    243   P�       �          0    22500 
   promotions 
   TABLE DATA                 public          postgres    false    246   ��       �          0    22457 	   rattacher 
   TABLE DATA                 public          postgres    false    239   ��       �          0    22507    remplir 
   TABLE DATA                 public          postgres    false    247    �       �          0    22419 	   respecter 
   TABLE DATA                 public          postgres    false    233   �       �          0    22514 
   ressources 
   TABLE DATA                 public          postgres    false    248   4�       �          0    22521    ressourcespromotions 
   TABLE DATA                 public          postgres    false    249   ��       �          0    22526    roles 
   TABLE DATA                 public          postgres    false    250   ��       �          0    22381 	   sapplique 
   TABLE DATA                 public          postgres    false    227   ��       �          0    22533    services 
   TABLE DATA                 public          postgres    false    251   ��       �          0    22355    suivre 
   TABLE DATA                 public          postgres    false    223   ��       �          0    22540    tickets 
   TABLE DATA                 public          postgres    false    252   �       �          0    22547    ticketsfilesattentes 
   TABLE DATA                 public          postgres    false    253   �       �          0    22407    traiter 
   TABLE DATA                 public          postgres    false    231   �       �          0    22554    validations 
   TABLE DATA                 public          postgres    false    254   x      �          0    22424    violer 
   TABLE DATA                 public          postgres    false    234   �      �           2606    22330    associer pk_associer 
   CONSTRAINT     k   ALTER TABLE ONLY public.associer
    ADD CONSTRAINT pk_associer PRIMARY KEY (attributs_id, categories_id);
 >   ALTER TABLE ONLY public.associer DROP CONSTRAINT pk_associer;
       public            postgres    false    218    218            �           2606    22315    attributs pk_attributs 
   CONSTRAINT     T   ALTER TABLE ONLY public.attributs
    ADD CONSTRAINT pk_attributs PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.attributs DROP CONSTRAINT pk_attributs;
       public            postgres    false    216            �           2606    22323    categories pk_categories 
   CONSTRAINT     V   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT pk_categories;
       public            postgres    false    217            �           2606    22342    distributeurs pk_distributeurs 
   CONSTRAINT     j   ALTER TABLE ONLY public.distributeurs
    ADD CONSTRAINT pk_distributeurs PRIMARY KEY (distributeurs_id);
 H   ALTER TABLE ONLY public.distributeurs DROP CONSTRAINT pk_distributeurs;
       public            postgres    false    220                       2606    22567    docetats pk_docetats 
   CONSTRAINT     R   ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT pk_docetats PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.docetats DROP CONSTRAINT pk_docetats;
       public            postgres    false    255                       2606    22574 0   docetats_predecesseurs pk_docetats_predecesseurs 
   CONSTRAINT     �   ALTER TABLE ONLY public.docetats_predecesseurs
    ADD CONSTRAINT pk_docetats_predecesseurs PRIMARY KEY (docetats_id, predecesseur_id);
 Z   ALTER TABLE ONLY public.docetats_predecesseurs DROP CONSTRAINT pk_docetats_predecesseurs;
       public            postgres    false    256    256            �           2606    22354    documents pk_documents 
   CONSTRAINT     T   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT pk_documents PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.documents DROP CONSTRAINT pk_documents;
       public            postgres    false    222            �           2606    22373    etapes pk_etapes 
   CONSTRAINT     N   ALTER TABLE ONLY public.etapes
    ADD CONSTRAINT pk_etapes PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.etapes DROP CONSTRAINT pk_etapes;
       public            postgres    false    225            �           2606    22366    etats pk_etats 
   CONSTRAINT     L   ALTER TABLE ONLY public.etats
    ADD CONSTRAINT pk_etats PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.etats DROP CONSTRAINT pk_etats;
       public            postgres    false    224            �           2606    22380    familles pk_familles 
   CONSTRAINT     R   ALTER TABLE ONLY public.familles
    ADD CONSTRAINT pk_familles PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.familles DROP CONSTRAINT pk_familles;
       public            postgres    false    226            �           2606    22392    filesattentes pk_filesattentes 
   CONSTRAINT     \   ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT pk_filesattentes PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.filesattentes DROP CONSTRAINT pk_filesattentes;
       public            postgres    false    228            �           2606    22399    jouerroles pk_jouerroles 
   CONSTRAINT     V   ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT pk_jouerroles PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.jouerroles DROP CONSTRAINT pk_jouerroles;
       public            postgres    false    229            �           2606    22406    missions pk_missions 
   CONSTRAINT     R   ALTER TABLE ONLY public.missions
    ADD CONSTRAINT pk_missions PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.missions DROP CONSTRAINT pk_missions;
       public            postgres    false    230            �           2606    22418    mouvements pk_mouvements 
   CONSTRAINT     V   ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT pk_mouvements PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.mouvements DROP CONSTRAINT pk_mouvements;
       public            postgres    false    232                       2606    22850    mouvpreco pk_mouvpreco 
   CONSTRAINT     s   ALTER TABLE ONLY public.mouvpreco
    ADD CONSTRAINT pk_mouvpreco PRIMARY KEY (id_precomouvements, id_mouvements);
 @   ALTER TABLE ONLY public.mouvpreco DROP CONSTRAINT pk_mouvpreco;
       public            postgres    false    257    257            �           2606    22435    ordreetats pk_ordreetats 
   CONSTRAINT     V   ALTER TABLE ONLY public.ordreetats
    ADD CONSTRAINT pk_ordreetats PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ordreetats DROP CONSTRAINT pk_ordreetats;
       public            postgres    false    235            �           2606    22442    parcours pk_parcours 
   CONSTRAINT     R   ALTER TABLE ONLY public.parcours
    ADD CONSTRAINT pk_parcours PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.parcours DROP CONSTRAINT pk_parcours;
       public            postgres    false    236            �           2606    22449    personnels pk_personnels 
   CONSTRAINT     V   ALTER TABLE ONLY public.personnels
    ADD CONSTRAINT pk_personnels PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.personnels DROP CONSTRAINT pk_personnels;
       public            postgres    false    237            �           2606    22456    personnes pk_personnes 
   CONSTRAINT     T   ALTER TABLE ONLY public.personnes
    ADD CONSTRAINT pk_personnes PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.personnes DROP CONSTRAINT pk_personnes;
       public            postgres    false    238            �           2606    22468 $   personnesmorales pk_personnesmorales 
   CONSTRAINT     s   ALTER TABLE ONLY public.personnesmorales
    ADD CONSTRAINT pk_personnesmorales PRIMARY KEY (personnesmorales_id);
 N   ALTER TABLE ONLY public.personnesmorales DROP CONSTRAINT pk_personnesmorales;
       public            postgres    false    240            �           2606    22475 &   personnesphysique pk_personnesphysique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personnesphysique
    ADD CONSTRAINT pk_personnesphysique PRIMARY KEY (personnesphysique_id);
 P   ALTER TABLE ONLY public.personnesphysique DROP CONSTRAINT pk_personnesphysique;
       public            postgres    false    241            �           2606    22482 "   precomouvements pk_precomouvements 
   CONSTRAINT     `   ALTER TABLE ONLY public.precomouvements
    ADD CONSTRAINT pk_precomouvements PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.precomouvements DROP CONSTRAINT pk_precomouvements;
       public            postgres    false    242            �           2606    22489 *   precomouvementsqtes pk_precomouvementsqtes 
   CONSTRAINT     h   ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT pk_precomouvementsqtes PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.precomouvementsqtes DROP CONSTRAINT pk_precomouvementsqtes;
       public            postgres    false    243            �           2606    22506    promotions pk_promotions 
   CONSTRAINT     V   ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT pk_promotions PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.promotions DROP CONSTRAINT pk_promotions;
       public            postgres    false    246            �           2606    22513    remplir pk_remplir 
   CONSTRAINT     c   ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT pk_remplir PRIMARY KEY (roles_id, missions_id);
 <   ALTER TABLE ONLY public.remplir DROP CONSTRAINT pk_remplir;
       public            postgres    false    247    247            �           2606    22520    ressources pk_ressources 
   CONSTRAINT     V   ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT pk_ressources PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ressources DROP CONSTRAINT pk_ressources;
       public            postgres    false    248            �           2606    22532    roles pk_roles 
   CONSTRAINT     L   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT pk_roles;
       public            postgres    false    250            �           2606    22539    services pk_services 
   CONSTRAINT     R   ALTER TABLE ONLY public.services
    ADD CONSTRAINT pk_services PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.services DROP CONSTRAINT pk_services;
       public            postgres    false    251            �           2606    22546    tickets pk_tickets 
   CONSTRAINT     P   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT pk_tickets PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tickets DROP CONSTRAINT pk_tickets;
       public            postgres    false    252            �           2606    22553 ,   ticketsfilesattentes pk_ticketsfilesattentes 
   CONSTRAINT     j   ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT pk_ticketsfilesattentes PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.ticketsfilesattentes DROP CONSTRAINT pk_ticketsfilesattentes;
       public            postgres    false    253            �           2606    22560    validations pk_validations 
   CONSTRAINT     X   ALTER TABLE ONLY public.validations
    ADD CONSTRAINT pk_validations PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.validations DROP CONSTRAINT pk_validations;
       public            postgres    false    254            �           2606    22772 '   filesattentes uc_filesattentes_services 
   CONSTRAINT     i   ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT uc_filesattentes_services UNIQUE (services_id);
 Q   ALTER TABLE ONLY public.filesattentes DROP CONSTRAINT uc_filesattentes_services;
       public            postgres    false    228            �           2606    22655 #   promotions uc_promotions_codeunique 
   CONSTRAINT     d   ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT uc_promotions_codeunique UNIQUE (codeunique);
 M   ALTER TABLE ONLY public.promotions DROP CONSTRAINT uc_promotions_codeunique;
       public            postgres    false    246            �           2606    22621    services uc_services_codeunique 
   CONSTRAINT     `   ALTER TABLE ONLY public.services
    ADD CONSTRAINT uc_services_codeunique UNIQUE (codeunique);
 I   ALTER TABLE ONLY public.services DROP CONSTRAINT uc_services_codeunique;
       public            postgres    false    251            �           2606    22623 "   services uc_services_filesattentes 
   CONSTRAINT     i   ALTER TABLE ONLY public.services
    ADD CONSTRAINT uc_services_filesattentes UNIQUE (filesattentes_id);
 L   ALTER TABLE ONLY public.services DROP CONSTRAINT uc_services_filesattentes;
       public            postgres    false    251                       2606    22828 !   associer fk_associer_on_attributs    FK CONSTRAINT     �   ALTER TABLE ONLY public.associer
    ADD CONSTRAINT fk_associer_on_attributs FOREIGN KEY (attributs_id) REFERENCES public.attributs(id);
 K   ALTER TABLE ONLY public.associer DROP CONSTRAINT fk_associer_on_attributs;
       public          postgres    false    4801    218    216                       2606    22833 "   associer fk_associer_on_categories    FK CONSTRAINT     �   ALTER TABLE ONLY public.associer
    ADD CONSTRAINT fk_associer_on_categories FOREIGN KEY (categories_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.associer DROP CONSTRAINT fk_associer_on_categories;
       public          postgres    false    218    217    4803                       2606    22838 %   categories fk_categories_on_documents    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_categories_on_documents FOREIGN KEY (documents_id) REFERENCES public.documents(id);
 O   ALTER TABLE ONLY public.categories DROP CONSTRAINT fk_categories_on_documents;
       public          postgres    false    4809    217    222                       2606    22793 %   constituer fk_con_on_attributs_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT fk_con_on_attributs_entity FOREIGN KEY (attributs_id) REFERENCES public.attributs(id);
 O   ALTER TABLE ONLY public.constituer DROP CONSTRAINT fk_con_on_attributs_entity;
       public          postgres    false    216    4801    221                       2606    22798 %   constituer fk_con_on_documents_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.constituer
    ADD CONSTRAINT fk_con_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);
 O   ALTER TABLE ONLY public.constituer DROP CONSTRAINT fk_con_on_documents_entity;
       public          postgres    false    222    221    4809            	           2606    22818 .   concerner fk_concerner_on_distributeurs_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.concerner
    ADD CONSTRAINT fk_concerner_on_distributeurs_entity FOREIGN KEY (precomouvementsqtes_id) REFERENCES public.distributeurs(distributeurs_id);
 X   ALTER TABLE ONLY public.concerner DROP CONSTRAINT fk_concerner_on_distributeurs_entity;
       public          postgres    false    219    4807    220            
           2606    22823 6   concerner fk_concerner_on_preco_mouvements_qtes_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.concerner
    ADD CONSTRAINT fk_concerner_on_preco_mouvements_qtes_entity FOREIGN KEY (distributeurs_id) REFERENCES public.precomouvementsqtes(id);
 `   ALTER TABLE ONLY public.concerner DROP CONSTRAINT fk_concerner_on_preco_mouvements_qtes_entity;
       public          postgres    false    219    4841    243                       2606    22813 /   distributeurs fk_distributeurs_on_distributeurs    FK CONSTRAINT     �   ALTER TABLE ONLY public.distributeurs
    ADD CONSTRAINT fk_distributeurs_on_distributeurs FOREIGN KEY (distributeurs_id) REFERENCES public.personnes(id);
 Y   ALTER TABLE ONLY public.distributeurs DROP CONSTRAINT fk_distributeurs_on_distributeurs;
       public          postgres    false    220    238    4833            &           2606    22661 .   documentspromotions fk_doc_on_documents_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentspromotions
    ADD CONSTRAINT fk_doc_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);
 X   ALTER TABLE ONLY public.documentspromotions DROP CONSTRAINT fk_doc_on_documents_entity;
       public          postgres    false    244    4809    222            '           2606    22666 /   documentspromotions fk_doc_on_promotions_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.documentspromotions
    ADD CONSTRAINT fk_doc_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);
 Y   ALTER TABLE ONLY public.documentspromotions DROP CONSTRAINT fk_doc_on_promotions_entity;
       public          postgres    false    246    4843    244            4           2606    22585 !   docetats fk_docetats_on_documents    FK CONSTRAINT     �   ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_documents FOREIGN KEY (documents_id) REFERENCES public.documents(id);
 K   ALTER TABLE ONLY public.docetats DROP CONSTRAINT fk_docetats_on_documents;
       public          postgres    false    255    222    4809            5           2606    22590    docetats fk_docetats_on_etapes    FK CONSTRAINT     �   ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_etapes FOREIGN KEY (etapes_id) REFERENCES public.etapes(id);
 H   ALTER TABLE ONLY public.docetats DROP CONSTRAINT fk_docetats_on_etapes;
       public          postgres    false    225    4813    255            6           2606    22595    docetats fk_docetats_on_etats    FK CONSTRAINT     }   ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_etats FOREIGN KEY (etats_id) REFERENCES public.etats(id);
 G   ALTER TABLE ONLY public.docetats DROP CONSTRAINT fk_docetats_on_etats;
       public          postgres    false    4811    224    255            7           2606    22600 #   docetats fk_docetats_on_validations    FK CONSTRAINT     �   ALTER TABLE ONLY public.docetats
    ADD CONSTRAINT fk_docetats_on_validations FOREIGN KEY (validations_id) REFERENCES public.validations(id);
 M   ALTER TABLE ONLY public.docetats DROP CONSTRAINT fk_docetats_on_validations;
       public          postgres    false    4863    255    254            8           2606    22575 <   docetats_predecesseurs fk_docetats_predecesseurs_on_docetats    FK CONSTRAINT     �   ALTER TABLE ONLY public.docetats_predecesseurs
    ADD CONSTRAINT fk_docetats_predecesseurs_on_docetats FOREIGN KEY (docetats_id) REFERENCES public.docetats(id);
 f   ALTER TABLE ONLY public.docetats_predecesseurs DROP CONSTRAINT fk_docetats_predecesseurs_on_docetats;
       public          postgres    false    4865    255    256            9           2606    22580 D   docetats_predecesseurs fk_docetats_predecesseurs_suivant_on_docetats    FK CONSTRAINT     �   ALTER TABLE ONLY public.docetats_predecesseurs
    ADD CONSTRAINT fk_docetats_predecesseurs_suivant_on_docetats FOREIGN KEY (predecesseur_id) REFERENCES public.docetats(id);
 n   ALTER TABLE ONLY public.docetats_predecesseurs DROP CONSTRAINT fk_docetats_predecesseurs_suivant_on_docetats;
       public          postgres    false    255    4865    256                       2606    22788    etapes fk_etapes_on_parcours    FK CONSTRAINT     �   ALTER TABLE ONLY public.etapes
    ADD CONSTRAINT fk_etapes_on_parcours FOREIGN KEY (parcours_id) REFERENCES public.parcours(id);
 F   ALTER TABLE ONLY public.etapes DROP CONSTRAINT fk_etapes_on_parcours;
       public          postgres    false    236    4829    225            (           2606    22671 ,   famillespromotions fk_fam_on_familles_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.famillespromotions
    ADD CONSTRAINT fk_fam_on_familles_entity FOREIGN KEY (familles_id) REFERENCES public.familles(id);
 V   ALTER TABLE ONLY public.famillespromotions DROP CONSTRAINT fk_fam_on_familles_entity;
       public          postgres    false    226    4815    245            )           2606    22676 .   famillespromotions fk_fam_on_promotions_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.famillespromotions
    ADD CONSTRAINT fk_fam_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);
 X   ALTER TABLE ONLY public.famillespromotions DROP CONSTRAINT fk_fam_on_promotions_entity;
       public          postgres    false    245    246    4843                       2606    22773 *   filesattentes fk_filesattentes_on_services    FK CONSTRAINT     �   ALTER TABLE ONLY public.filesattentes
    ADD CONSTRAINT fk_filesattentes_on_services FOREIGN KEY (services_id) REFERENCES public.services(id);
 T   ALTER TABLE ONLY public.filesattentes DROP CONSTRAINT fk_filesattentes_on_services;
       public          postgres    false    251    228    4853                       2606    22761 &   jouerroles fk_jouerroles_on_personnels    FK CONSTRAINT     �   ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT fk_jouerroles_on_personnels FOREIGN KEY (personnels_id) REFERENCES public.personnels(id);
 P   ALTER TABLE ONLY public.jouerroles DROP CONSTRAINT fk_jouerroles_on_personnels;
       public          postgres    false    4831    229    237                       2606    22766 !   jouerroles fk_jouerroles_on_roles    FK CONSTRAINT     �   ALTER TABLE ONLY public.jouerroles
    ADD CONSTRAINT fk_jouerroles_on_roles FOREIGN KEY (roles_id) REFERENCES public.roles(id);
 K   ALTER TABLE ONLY public.jouerroles DROP CONSTRAINT fk_jouerroles_on_roles;
       public          postgres    false    4851    250    229                       2606    22746     missions fk_missions_on_services    FK CONSTRAINT     �   ALTER TABLE ONLY public.missions
    ADD CONSTRAINT fk_missions_on_services FOREIGN KEY (services_id) REFERENCES public.services(id);
 J   ALTER TABLE ONLY public.missions DROP CONSTRAINT fk_missions_on_services;
       public          postgres    false    230    4853    251                       2606    22716 )   mouvements fk_mouvements_on_distributeurs    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT fk_mouvements_on_distributeurs FOREIGN KEY (distributeurs_id) REFERENCES public.distributeurs(distributeurs_id);
 S   ALTER TABLE ONLY public.mouvements DROP CONSTRAINT fk_mouvements_on_distributeurs;
       public          postgres    false    4807    232    220                       2606    22721 &   mouvements fk_mouvements_on_ressources    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvements
    ADD CONSTRAINT fk_mouvements_on_ressources FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);
 P   ALTER TABLE ONLY public.mouvements DROP CONSTRAINT fk_mouvements_on_ressources;
       public          postgres    false    4849    248    232            :           2606    22856 !   mouvpreco fk_mouvpreco_mouvements    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvpreco
    ADD CONSTRAINT fk_mouvpreco_mouvements FOREIGN KEY (id_mouvements) REFERENCES public.mouvements(id);
 K   ALTER TABLE ONLY public.mouvpreco DROP CONSTRAINT fk_mouvpreco_mouvements;
       public          postgres    false    232    257    4825            ;           2606    22851 &   mouvpreco fk_mouvpreco_precomouvements    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvpreco
    ADD CONSTRAINT fk_mouvpreco_precomouvements FOREIGN KEY (id_precomouvements) REFERENCES public.precomouvements(id);
 P   ALTER TABLE ONLY public.mouvpreco DROP CONSTRAINT fk_mouvpreco_precomouvements;
       public          postgres    false    257    242    4839                       2606    22711 !   ordreetats fk_ordreetats_on_etats    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordreetats
    ADD CONSTRAINT fk_ordreetats_on_etats FOREIGN KEY (etats_id) REFERENCES public.etats(id);
 K   ALTER TABLE ONLY public.ordreetats DROP CONSTRAINT fk_ordreetats_on_etats;
       public          postgres    false    224    4811    235            "           2606    22706 8   personnesmorales fk_personnesmorales_on_personnesmorales    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnesmorales
    ADD CONSTRAINT fk_personnesmorales_on_personnesmorales FOREIGN KEY (personnesmorales_id) REFERENCES public.personnes(id);
 b   ALTER TABLE ONLY public.personnesmorales DROP CONSTRAINT fk_personnesmorales_on_personnesmorales;
       public          postgres    false    4833    240    238            #           2606    22691 ;   personnesphysique fk_personnesphysique_on_personnesphysique    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnesphysique
    ADD CONSTRAINT fk_personnesphysique_on_personnesphysique FOREIGN KEY (personnesphysique_id) REFERENCES public.personnes(id);
 e   ALTER TABLE ONLY public.personnesphysique DROP CONSTRAINT fk_personnesphysique_on_personnesphysique;
       public          postgres    false    4833    238    241            $           2606    22681 =   precomouvementsqtes fk_precomouvementsqtes_on_precomouvements    FK CONSTRAINT     �   ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT fk_precomouvementsqtes_on_precomouvements FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);
 g   ALTER TABLE ONLY public.precomouvementsqtes DROP CONSTRAINT fk_precomouvementsqtes_on_precomouvements;
       public          postgres    false    242    243    4839            %           2606    22686 8   precomouvementsqtes fk_precomouvementsqtes_on_ressources    FK CONSTRAINT     �   ALTER TABLE ONLY public.precomouvementsqtes
    ADD CONSTRAINT fk_precomouvementsqtes_on_ressources FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);
 b   ALTER TABLE ONLY public.precomouvementsqtes DROP CONSTRAINT fk_precomouvementsqtes_on_ressources;
       public          postgres    false    248    243    4849            *           2606    22656 0   promotions fk_promotions_on_distributeurs_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT fk_promotions_on_distributeurs_entity FOREIGN KEY (distributeurs_id) REFERENCES public.distributeurs(distributeurs_id);
 Z   ALTER TABLE ONLY public.promotions DROP CONSTRAINT fk_promotions_on_distributeurs_entity;
       public          postgres    false    220    246    4807                        2606    22696 #   rattacher fk_rattacher_on_personnes    FK CONSTRAINT     �   ALTER TABLE ONLY public.rattacher
    ADD CONSTRAINT fk_rattacher_on_personnes FOREIGN KEY (personnes_id) REFERENCES public.personnes(id);
 M   ALTER TABLE ONLY public.rattacher DROP CONSTRAINT fk_rattacher_on_personnes;
       public          postgres    false    4833    239    238            !           2606    22701 '   rattacher fk_rattacher_on_personnes_bis    FK CONSTRAINT     �   ALTER TABLE ONLY public.rattacher
    ADD CONSTRAINT fk_rattacher_on_personnes_bis FOREIGN KEY (rattacher_id) REFERENCES public.personnes(id);
 Q   ALTER TABLE ONLY public.rattacher DROP CONSTRAINT fk_rattacher_on_personnes_bis;
       public          postgres    false    238    4833    239            +           2606    22644    remplir fk_remplir_on_missions    FK CONSTRAINT     �   ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT fk_remplir_on_missions FOREIGN KEY (missions_id) REFERENCES public.missions(id);
 H   ALTER TABLE ONLY public.remplir DROP CONSTRAINT fk_remplir_on_missions;
       public          postgres    false    4823    247    230            ,           2606    22649    remplir fk_remplir_on_roles    FK CONSTRAINT     {   ALTER TABLE ONLY public.remplir
    ADD CONSTRAINT fk_remplir_on_roles FOREIGN KEY (roles_id) REFERENCES public.roles(id);
 E   ALTER TABLE ONLY public.remplir DROP CONSTRAINT fk_remplir_on_roles;
       public          postgres    false    4851    250    247            .           2606    22634 0   ressourcespromotions fk_res_on_promotions_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.ressourcespromotions
    ADD CONSTRAINT fk_res_on_promotions_entity FOREIGN KEY (promotions_id) REFERENCES public.promotions(id);
 Z   ALTER TABLE ONLY public.ressourcespromotions DROP CONSTRAINT fk_res_on_promotions_entity;
       public          postgres    false    4843    249    246            /           2606    22639 0   ressourcespromotions fk_res_on_ressources_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.ressourcespromotions
    ADD CONSTRAINT fk_res_on_ressources_entity FOREIGN KEY (ressources_id) REFERENCES public.ressources(id);
 Z   ALTER TABLE ONLY public.ressourcespromotions DROP CONSTRAINT fk_res_on_ressources_entity;
       public          postgres    false    4849    249    248                       2606    22726 +   respecter fk_respecter_on_mouvements_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.respecter
    ADD CONSTRAINT fk_respecter_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES public.mouvements(id);
 U   ALTER TABLE ONLY public.respecter DROP CONSTRAINT fk_respecter_on_mouvements_entity;
       public          postgres    false    4825    233    232                       2606    22731 1   respecter fk_respecter_on_preco_mouvements_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.respecter
    ADD CONSTRAINT fk_respecter_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);
 [   ALTER TABLE ONLY public.respecter DROP CONSTRAINT fk_respecter_on_preco_mouvements_entity;
       public          postgres    false    242    233    4839            -           2606    22629 $   ressources fk_ressources_on_familles    FK CONSTRAINT     �   ALTER TABLE ONLY public.ressources
    ADD CONSTRAINT fk_ressources_on_familles FOREIGN KEY (familles_id) REFERENCES public.familles(id);
 N   ALTER TABLE ONLY public.ressources DROP CONSTRAINT fk_ressources_on_familles;
       public          postgres    false    248    226    4815                       2606    22778 )   sapplique fk_sapplique_on_familles_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT fk_sapplique_on_familles_entity FOREIGN KEY (familles_id) REFERENCES public.familles(id);
 S   ALTER TABLE ONLY public.sapplique DROP CONSTRAINT fk_sapplique_on_familles_entity;
       public          postgres    false    227    226    4815                       2606    22783 6   sapplique fk_sapplique_on_preco_mouvements_qtes_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.sapplique
    ADD CONSTRAINT fk_sapplique_on_preco_mouvements_qtes_entity FOREIGN KEY (precomouvementsqtes_id) REFERENCES public.precomouvementsqtes(id);
 `   ALTER TABLE ONLY public.sapplique DROP CONSTRAINT fk_sapplique_on_preco_mouvements_qtes_entity;
       public          postgres    false    4841    243    227            0           2606    22624 %   services fk_services_on_filesattentes    FK CONSTRAINT     �   ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_services_on_filesattentes FOREIGN KEY (filesattentes_id) REFERENCES public.filesattentes(id);
 O   ALTER TABLE ONLY public.services DROP CONSTRAINT fk_services_on_filesattentes;
       public          postgres    false    251    4817    228                       2606    22803 $   suivre fk_suivre_on_documents_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT fk_suivre_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);
 N   ALTER TABLE ONLY public.suivre DROP CONSTRAINT fk_suivre_on_documents_entity;
       public          postgres    false    222    4809    223                       2606    22808 +   suivre fk_suivre_on_preco_mouvements_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.suivre
    ADD CONSTRAINT fk_suivre_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);
 U   ALTER TABLE ONLY public.suivre DROP CONSTRAINT fk_suivre_on_preco_mouvements_entity;
       public          postgres    false    223    242    4839            1           2606    22610 =   ticketsfilesattentes fk_ticketsfilesattentes_on_filesattentes    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT fk_ticketsfilesattentes_on_filesattentes FOREIGN KEY (filesattentes_id) REFERENCES public.filesattentes(id);
 g   ALTER TABLE ONLY public.ticketsfilesattentes DROP CONSTRAINT fk_ticketsfilesattentes_on_filesattentes;
       public          postgres    false    4817    228    253            2           2606    22615 7   ticketsfilesattentes fk_ticketsfilesattentes_on_tickets    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticketsfilesattentes
    ADD CONSTRAINT fk_ticketsfilesattentes_on_tickets FOREIGN KEY (tickets_id) REFERENCES public.tickets(id);
 a   ALTER TABLE ONLY public.ticketsfilesattentes DROP CONSTRAINT fk_ticketsfilesattentes_on_tickets;
       public          postgres    false    253    252    4859                       2606    22751 &   traiter fk_traiter_on_documents_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT fk_traiter_on_documents_entity FOREIGN KEY (documents_id) REFERENCES public.documents(id);
 P   ALTER TABLE ONLY public.traiter DROP CONSTRAINT fk_traiter_on_documents_entity;
       public          postgres    false    4809    231    222                       2606    22756 %   traiter fk_traiter_on_missions_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.traiter
    ADD CONSTRAINT fk_traiter_on_missions_entity FOREIGN KEY (missions_id) REFERENCES public.missions(id);
 O   ALTER TABLE ONLY public.traiter DROP CONSTRAINT fk_traiter_on_missions_entity;
       public          postgres    false    231    230    4823            3           2606    22605 #   validations fk_validations_on_roles    FK CONSTRAINT     �   ALTER TABLE ONLY public.validations
    ADD CONSTRAINT fk_validations_on_roles FOREIGN KEY (roles_id) REFERENCES public.roles(id);
 M   ALTER TABLE ONLY public.validations DROP CONSTRAINT fk_validations_on_roles;
       public          postgres    false    254    250    4851                       2606    22736 %   violer fk_violer_on_mouvements_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.violer
    ADD CONSTRAINT fk_violer_on_mouvements_entity FOREIGN KEY (mouvements_id) REFERENCES public.mouvements(id);
 O   ALTER TABLE ONLY public.violer DROP CONSTRAINT fk_violer_on_mouvements_entity;
       public          postgres    false    234    4825    232                       2606    22741 +   violer fk_violer_on_preco_mouvements_entity    FK CONSTRAINT     �   ALTER TABLE ONLY public.violer
    ADD CONSTRAINT fk_violer_on_preco_mouvements_entity FOREIGN KEY (precomouvements_id) REFERENCES public.precomouvements(id);
 U   ALTER TABLE ONLY public.violer DROP CONSTRAINT fk_violer_on_preco_mouvements_entity;
       public          postgres    false    242    234    4839            �   ,  x��Աj�0��O��	X��dIG�%�&�Zt��~�:5�%-�K����������ˉT��3����麶�.�M;�gӷ>����^����q�wo3R�ޝ���uݒ�ǧ���l�0��EFRS8�5 �:G*\�)��T"Z�sS�x�%j����6�
T���Zp�f\�t��Tw��e^�ۘK7��e�2>��C�Y/�zсk�j�-����T@M�e.+K����G�,⃧����Y����W��+f���[���� &��^���^5�U�^ӫg���+bz��?^��M�O�!��      �   �  x�ݕ�O�0���W�� �s�'�C�0��-�H��-F�{�ls��i���}����Z.Iӻ%$�ru�K��3c����p"r�0
]�QgJ�F��4̐�f
�Z�ѣ��JdżԴ���ب��W�1����8qX�ȳ(���� W#��a�9�x��,�%e�֛쒀7ը�>�~z~@漏B-��*�K�g�ӫ^rH갓���V�\�ފ{0O$��a�t��_�̊=k�T��:a���g��p�������E�Vƹ��T�濄uR)�sh�a'���z�dS#hV��N�y�B|F�saLF��xl��m4'#���.;�貅���*�d�����)�:�G�{���((Ԩ4Qc�:�����B���Ԇ����m���m�+&4=����lG��I�      �   l  x�Ք�J�0�������i>�R�9��V�&�@?F���{����0a�f'��sN���?']��Ok�.֏`Ӫ�fW���v�4`juj��	Aa�)��`��!�����m]����6�٧����T�y�z^n��+0b����(Π	���Z�ᘑ ���kW�6`i\SWՐC�_z���aQԯ��»�@,�FQ�����C�0RJS��(�]O�?f��09�9�TbH0%P*.���ǔ�f�?����RZ��$G؉ථ�ݗ�m�n��)�G@�T���t�fma��S�`D�7]p�I��@\�$ c���tl d�Q�.�����v�
�H�L.[���P�d��w�\      �   
   x���          �   �   x��Թ��0��O��	Dˌl]�J�°d!W<���A"��/ ¨�b�c�����#�v�/��{p�q�!���}������~��Í�p�����<mlQ�9k�u@�WÉ��Ȓo���Հ�����a�5 �R�+��u��cj
4��M"i��l�d˛���iꍋl�6ijg7��]>S�,h��TҤ&��l&�4�&��d�&3Ѥ
�L]�ߙ?SU� � �      �     x���=k�0��=�B��K�+���!P�Ҽ��N'QA�����Y7���~����:�����7:���e��B�)݆Q,���µ`�ҥ�Kĩ��ZĞS-,c�X�V���q��bY�����$������@Dm�MSբR�R���͋eh�4sv�nW�^�'`�?}2�@�
A�ɀYF0:{߰���GX;�z�qLCI�s�Ȝ}
��,�j���2ٸG�0��}�,kf���<�n� e��cl�Ԥ�U�����#^f�b����      �   
   x���          �   
   x���          �   �  x��KO�0���sH�*�nŉ U���c�=ag���خv�=v)��
VZ�B.�f<��q�e}uvy����t$�)#}��Y8 ��#ǘ�B+�GF��N��%���E�7�Z�[��;�_c̖�h��/��ϓ�59|2Y��x��S���ȉ�1�hG!��ƳD{?OV7gWp���"�S̊"/�y�/�Ţ*�y^�M���Y[$)$�q��:�
uF����eGkFC�УBI��ê��'�]�`������8��ʤ��*˫���k��6>�&1�q����x��B\�(�y�&
k=��S���C�#�]*�.C�~R���aO�>G�{�	�-)?�x���FA+���r$��fQ�FG��{�իB=-�pѓ�Q��y�L�(� ��3i����<�Ҿ����7ߠ�VX������drU	      �   
   x���          �   
   x���          �   �   x��ҽ
�0��Wq�Xh$���:�B��ir�HlK�޿� qp��{�!EY���r��~j��s�ʏ0�&gt08����v�-�G=�zץ3�d��%��f{�k�䒭x��s�i&��R.͘`Mc�tu�$����i?�`B��%�A	����pq'������ŝT�=����׷P�c���EW�D��      �   �   x�ՑOk!���)���Z�t��Ґ�B�B���]u�5��C{l��7�����pܿ��p8���$�UFx�$���E�J(�"IE{�6�-�,r�DA�Z%�5V]�%�ܾ|�h���u@��l8�I߯8�PN��]�6���.fcN���Tb`N9'e�:����S3��6�fۅ1�ф�˪����=u]�l�6��r7tO]k��R�R�q~�O�C���Q���      �   
   x���          �   �   x��α
�0��ݧ��
II"ZB��X�ڵ��V��}�
�ұ[;��3|UӖ���;�}F�w֍�U8��8C���zA�<��6g�~/T �qy8���L
�cݗ-$��<G�9�t/��Rf��`�`�<&&���VaY�@��uz��_��g߈��	�̚q      �     x�Œ;k�@�w��ۜ�UNw��:d0���k��ŵ������tJ�� �OB|���6o{Rm���خuO���q��DV�/H��� ���C3�C�����]ub���`�4s�4�}規Ӣ�Δ���K}���*�JFOQ�s�Bi��� �������&/��P��e(�ȯ+��(��*Q@L=Ũc8E��!��n��U�ōu.c�Pj���f�
�0�N��D~�{�,��{���:l���&YB��1X�w��/��䒬,��T��      �   �  x���j�@��~��)+���F��!����5�VcX����89Vϡ��BI!���!��vv���l���6��oЅJ��i�9j��+�砩B�q5:e��|4�ҳ$=*�r�bմ5I�����'����������"+�2[`�e"KW�(Ӳ,�t%rQU�b�<f���Q��`���ڢ
�:I��ֆ�7�d����6Ʌ�(R��w������������"��q����x�U���i���4:�C?u8�h�^�'f�>�"�pߺ������T��$a	�EL�k-�t���)�\L_�[�_����-��CR��<�ǎY�ҷd�3�YL�e�m�`���)�FL8r
���Q��bT\.��{�A s$����1��f� *I      �   �  x�͔�j1����M��o�驇�-4I�Œej��N�#�q�.}�z���Z�a���,���ǇOO�pz�(��Uz7\�������<�Tǥ^�{�}M�.��T_�3-L����y�a�k�\K�?��e���/��u^�����)�����ã��b�F�⠷)���6C$�d�B��^t�:	�C:gn��{�lw��� U;M?=��jz{�U�^9����������9_����!bJP6��m �/ew�~w�Y�X��������R""[�/�R?�VF�K��ܠ�!�k\6R����k��3���@��)�p�D%�$dliӁ�	|�:$&$�[����E�븥n�ې�M�ŕ�����c�v�$����Bd���sJ�M33%��C��Km�1g�J��o����mBS���Q��A���c���      �     x��ѱN1�Oq۵R��ĉc11t���D�%�#U����s��Tl������n�y|�����|�o�9�.���Ӱ<���i��h�_��a�����rw����1y�䢁s�=
��km1����0
��G�Tk���@4ƎF����b��2?�j7��f"� �`�ޥ��ו96K3���T%Lo ,�jOQj���
24�,P-)��<Ӫ��+c�92��O@��J��9qB���k��f �*��%@�P|���~�-?���*      �   
   x���          �   
   x���          �     x�Ւ�j�0��>En�`J�Z+���2��j�sԿ.1��~I�Җ>@!��_�@�H^�w����ߵ��j�Q+)Ah��m�Zf �$U?ɸ�L6�0|)	ӉV��v=�"@��K~g�W-?���}l��n�~ed&�Ð�8�$�YQ�J�M��1��SBcLRLS7U��0aB0�qHܴN�خ�s�CQXd��Å��ع���;�Ӳ?�y��僗�Sz���s�7���d���([K�It��I����P�v�֙���ϫ<��E�����>      �   1  x���=o�0��_�- �P��+�B+1 UT*���gC*H�$T�/�)�V!{��&?�j�Y�n�j�}a��J?oB��U:6-)eHm躐�#������}]����)|��t�>�6`_�յ�5����͌�?>�-7l����L�p�����q�s.�:˒�%O��u7L�h��yl��J����>�"2~����a��w%���� P�A ����
�<)3V��+��)3�mPVA�A����{P2Z��њ򱲩>�#�}}�����Ũ�Y��䅆�}ιt���n��v��R�e�L~ ���      �   
   x���          �   
   x���          �   K  x�ݓ�n�0�w��[@�+�Il�NHe�T�
(�έ�$F�A��=�bM�B�A;�uw�>�]��,�[T��Ohߩ��} ����6�ԙ�NA]C� ʘ"##� 2:ߞ��g��y�{�������e�AӄQAXV�2�aN��B�sB�R�,�͒%U{���G1t��	%�⾊�2.�t�ϝ�O��:����.k0���L��@O�6�P"�BYeY)���B��8Nf��x�ռ��bf(�E��6'X�zny)E&����c	���Z�B�>��ڕ��o��	 �!�����g��p�4�e>�m|�P#_���ܶ_�L� n��      �   l  x����k�0 �{���l��3��v�P:X�]G>A�ک��g����<���y�=��?Yow��=Zo���x2�}8��VEu��/�����n��Y����Z��*[]�}�g�N���^�yU���ry��P����xv훦:���t�^�6�����7$�X@�	*�Ѡ�`�f\�Z��,%qt���	 Lh�$��L�"�r�)�j��J��%b��\�~��#�-g�{w�F9��9�+H�HI���%�c��"�ދ��:̌J���b��3Ape�S�(��P�P��d\ʀ����T
�CJ�Nm$׊*6R�MB����*��(f���8�^ݺ�a����e��0�7�}�ol�M�H޺�.�f�o4�      �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   k  x��]o�0���+|G+�d���j�.R�MK���1����i��3��&�ȴ�z��~����ˇ���-�Ѷ�d��RP��RJt-ebY.J��Jl����@3m����5mu��D���-O+����*��Tl��	�V��R*-��
�n�raz,���}}s�e�B�NDb�<B0�f�^�ԛa�7�$��8.r>1Ÿ^.��P��t�PL�g���]DM��b�q���V�q�o�}�p��j9*�5�)-+�(q(�����2����!��A�멯8+
P���g˶P�5>�Q^.Ϡ��27��M�pMTϡZk���rO��i��6	��IF��~�@��$�1f�@�\i�4���Nfb�X��i�1��s��wS��Ó�s�����P���<�޹Z]0�خqP��^���;i{(�;���鏏'���V�;u�&�nB�§��y�iH" ��P?��on&⁏�,
 ��;�e�R��ji�(m��O�B�����*���N�d�fco�������$�z�5Bж\��Z/E�m�\�f�\<mES�w����(9��i+����i1����Q�Bi-�+���P��r�\>�k�S���į�~o�      �   
   x���          �   �   x��ϱj�0��Oq���$cөCCIK�vW�3=�es>��+��ӥ���8��;�/'��'��s w�c�6��<Ύic(VRd����m=��.��_�G��nU�k,�V��Ֆm[�r��:�}]7���?0z\x'�y����:��@%�^R��(c�tT]|o&��g�_�]�r����%�`~�Hsz�����7D�Zk��ޯ"7�#`^� 'q��)�>A��      �   �   x��ӱ�0Н��$Դ�-4N$AW�B������opҁ�Ų������4˓sҬ8�~VM]�F��M=�xF�u���VW����n~�Vߧq��w\�K��5X ���##�"$0B)U1�v�Ji����pH9���D@N�2f"����;�m���?lԺ-\�-�1�6�����md�[X�����f?��q^���!      �     x���=k�0�ݿB���$c��S)!-u�5��L+����ZnS<dͤ{�;<͡ݽIs8��˨,��j�MF��%��3bQ��0NK���kC�a����k/��3ء�v�30��=N�Z�����-�|��Z�I�Y���3N+�jZ׹�L)Se�ӌ�
����ц�H�ƍ�ʩ
>^Jy]	�J�E:��Q�SV���?u�\�>%�=Z���^*�ep�a�*�<NZ+T�F*q�T����K��Ը
%[����o��#T���\      �   �   x���;k�@�^��:����Ւ*��q����^ �#cG��FE�����������$���[�g�3���<�I���[��{^Ǹ�G
�m�_�?[����=�U+KT.�RRi��l4�����f�nD��`��l�Z*]��UUfQ)J	�B��z6�����>�c�sU�]TD�sD0jka�F�`B����VU��]U����
UTU���E�4oX�Pr      �   
   x���          �   
   x���          �   �   x���v
Q���W((M��L�+)J�,I-R�H�O.�M�+)��L�Q��,.���q4�}B]�4�-�MSuu͍,u--��t����RLM���uԍ�Q�i��9x�cD'�2��c�{�� ?��D      �   
   x���          �   
   x���         