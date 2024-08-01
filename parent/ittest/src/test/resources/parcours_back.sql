PGDMP  /                    |           parcoursback    16.3    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
   TABLE DATA                 public          postgres    false    216   x�       �          0    22316 
   categories 
   TABLE DATA                 public          postgres    false    217   B�       �          0    22331 	   concerner 
   TABLE DATA                 public          postgres    false    219   ��       �          0    22343 
   constituer 
   TABLE DATA                 public          postgres    false    221   ��       �          0    22336    distributeurs 
   TABLE DATA                 public          postgres    false    220   ��       �          0    22561    docetats 
   TABLE DATA                 public          postgres    false    255   /�       �          0    22568    docetats_predecesseurs 
   TABLE DATA                 public          postgres    false    256   I�       �          0    22348 	   documents 
   TABLE DATA                 public          postgres    false    222   c�       �          0    22490    documentspromotions 
   TABLE DATA                 public          postgres    false    244   9�       �          0    22367    etapes 
   TABLE DATA                 public          postgres    false    225   S�       �          0    22360    etats 
   TABLE DATA                 public          postgres    false    224   m�       �          0    22374    familles 
   TABLE DATA                 public          postgres    false    226   R�       �          0    22495    famillespromotions 
   TABLE DATA                 public          postgres    false    245   [�       �          0    22386    filesattentes 
   TABLE DATA                 public          postgres    false    228   u�       �          0    22393 
   jouerroles 
   TABLE DATA                 public          postgres    false    229   ?�       �          0    22400    missions 
   TABLE DATA                 public          postgres    false    230   z�       �          0    22412 
   mouvements 
   TABLE DATA                 public          postgres    false    232   )�       �          0    22844 	   mouvpreco 
   TABLE DATA                 public          postgres    false    257   �       �          0    22429 
   ordreetats 
   TABLE DATA                 public          postgres    false    235   >�       �          0    22436    parcours 
   TABLE DATA                 public          postgres    false    236   X�       �          0    22443 
   personnels 
   TABLE DATA                 public          postgres    false    237   r�       �          0    22450 	   personnes 
   TABLE DATA                 public          postgres    false    238   ��       �          0    22462    personnesmorales 
   TABLE DATA                 public          postgres    false    240   �       �          0    22469    personnesphysique 
   TABLE DATA                 public          postgres    false    241   -�       �          0    22476    precomouvements 
   TABLE DATA                 public          postgres    false    242   �       �          0    22483    precomouvementsqtes 
   TABLE DATA                 public          postgres    false    243   w�       �          0    22500 
   promotions 
   TABLE DATA                 public          postgres    false    246   	�       �          0    22457 	   rattacher 
   TABLE DATA                 public          postgres    false    239   #�       �          0    22507    remplir 
   TABLE DATA                 public          postgres    false    247   =�       �          0    22419 	   respecter 
   TABLE DATA                 public          postgres    false    233   W�       �          0    22514 
   ressources 
   TABLE DATA                 public          postgres    false    248   q�       �          0    22521    ressourcespromotions 
   TABLE DATA                 public          postgres    false    249   �       �          0    22526    roles 
   TABLE DATA                 public          postgres    false    250    �       �          0    22381 	   sapplique 
   TABLE DATA                 public          postgres    false    227   9       �          0    22533    services 
   TABLE DATA                 public          postgres    false    251   )      �          0    22355    suivre 
   TABLE DATA                 public          postgres    false    223   \      �          0    22540    tickets 
   TABLE DATA                 public          postgres    false    252   Z      �          0    22547    ticketsfilesattentes 
   TABLE DATA                 public          postgres    false    253   t      �          0    22407    traiter 
   TABLE DATA                 public          postgres    false    231   �      �          0    22554    validations 
   TABLE DATA                 public          postgres    false    254   <      �          0    22424    violer 
   TABLE DATA                 public          postgres    false    234   V      �           2606    22330    associer pk_associer 
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
       public          postgres    false    242    234    4839            �   @  x����K�0�{��ܶ�"m�&yx�9�0Zpի�5�(*����YPBss
����K���%�� �#�����}[5�#�v�Ofh��mI���c��kp���nIewj��]�y�;��d=t�M�de��P�H��5E��JD@�ul�d5�D-�մ�FQ�JR ��X�V�K�ڐ"'�"8d���$/ʧ,���?d0?�Q�s?e��#��c��"�]���B�Ԧ�Q�RA*���2���)w�U��Z���u�up�:X8��V񙡃f�E��b��2<O�̐�2�"C~3 X�Zd�k����!dx��0��E]�
%      �   �  x��Mo�0���s�UaEh��$�@�`�н�0A�(F����1M?����i��d�3�d�y{�f닛Ҭȡ�y#��%xo4��#�B*ԥ���3$1��B��Y�NVb#ʭb;�x��U�T�֛c���n/�p�1"/�8�ː��ΧU0�<���,d��W0�4h���&�U5���xQEA8���"�)��&+�]��!�`�g��tQ�2�,/�����(��0"'�!�_RT�#�qKI��~�p�ũ%�?%�ẅ�5��`�d02�e��9�8n����jX���L
��)����Ԇp�d�!h�֢�J��ć�z�Ü�s2���V�^N��<�Wr�Nr�C�TAT-P��@)۶��p����c�|��*M0���N��B��	�Ԇ�W/�(�+�lӡeBӕR���]^4�	e4z3�9
      �   �  x�ݔ�J�0�������i�6x%ۜ�ъ��Jڤ蟑��䞣/f�!D��iB�9	''?�|a�Y>$ ��l۴P�Uƍ|����*a�Z-mP�TE�����T�%7��QY���=Sgm)+�<+1O7���L-���� �����2 �p!�v�g��B�)��Z�C��K��U���7�n�^,�0���uᡆ�u�����|�X����0JSA�k����v���A'wa������&�L枟CA8�&�� ����	q��Y�G4Z�\��%8�� �y]	u���vU����z�c�BN���{����Bu�����П|�K��;:4l.㍔����t	�!#�����ұsa�q����-�`!sޚ�a��2�����=      �   
   x���          �     x����j�0�{�B��Pۉ혝F�m�����:"ۅ�֎6y��=��C<���!���a��Bm��F��흽�oC?��
�n�=����wp;~��o�����qw�U�1��jM��HJ��tD"jtEE;���i*���1ʈ���C�(�)�B�X�����1O�z��c�i_j�|���C-�C�Py��S�� U�BN��T���M-��2�|�:_X��2H��el�
R�D��M���j"U.���$@�5˾ݑ�|      �   !  x���?O�0�Ὗ�[[)�b'�'&ZD�DSVt���R۠$��4#CA���m��;z�X�t-���c�w��iH�2��0�Տ��(c�S8��b�8���1�S�؀i��c�Ú�?�՞���j�H[��;(�q�D�!hg�sETy���R�B@ί7/�6W\�Y5U�\��a۶y��ێ=��i���y�_�`��b�4�%��YFcr�JQqˠ��8�aH�!T�<FS�@%�� Q ��FH�I�[;�a��gB$���3e��[�����	B�E(�|���O�@�oA��q      �   
   x���          �   
   x���          �   �  x���o�0���W�[6)AIJ[*��~@�*���wǾ��Ď�v�=v)�"46�y�t�����������-T���ѷ=�g�H?�vNH���1���J�ё�)�.��C�(���5EɃ�}���0fKAt��{����59�3Y��z��S���ȉ�1�hG!��ƳD{
o�6��7p���:_̊"/�U����z^f����V-ˮHRHj�H;�]H�΋Cˡ˞v�0
�a@��4^�]�@�!�$�XY��/�q�C�I���,�g��y����chc�m�q=�����T�[�h�n�o����Y��*�NW񘨷����ʪFj�`=����?~������:ݣG�y�Gcx� >���I	M���Q'��h-����3`�Q�WFGy��սtB=�0[��I�ߖ���QgA�����_��4)�@�_�ǱG��!Y��t�=�?�}�62�      �   
   x���          �   
   x���          �   �   x�Ւ���0E�����B3$qj)�����V�i�
��J�_���t#��yp�xBn�MBV
N��;�A�&�&�]��cӻSp]{����t�k���La�X��-Lbd9��	c���Ӝ�����rZ�6M����Lw���)��ڤlD<���P(��EKRU+!�"�b~[���Y�7t�ݖn����]>�K���Ř�p��1��U      �   �   x�ݑAk�0������d���zj�n3t���!�����s�;��'$�'qq:�W�EU�y�;�Zitס��n�t��hЩA���}������6���n��(K��?'X�-�ɚf�RJh�a$O�|��a���,[�4N ~�&4콻F?��F�ci�B.?��%��R<yQ�S	��^�x�F�VB��ra{g�������L�5���z'XM���ο���">N�wJ�sV�[��CF�7��\      �   
   x���          �   �   x���O�0���w3��6Q���d�Ԯ��'*Cg�?�.�;D���s�HUl�%HUj�O�Ŷ��^p��Û�ք`j�퀵���U���ζ�]�Bqx�ǳ5��y�-`�wLЄ�H����
"D�IJ9m�I��|N9'�~�����<@+ȴ��2+a�A�� �~��_���D_�x�ۗ��      �   +  x�͒KK�@���{KY��;�$�j l��^%��HmJ����`=H��9���ǔf�xnPi�m�vݹ��~��_��v>Gal��vn����S���.v�����O3�0���&�w��Eǝ)����j�X�i楈�����MV�p��D�^;�f92���QF	��@�켢߈�(�&x� �')�XkF�$�X�9��q�7C�A��<T�A�52u�T���I����Υ�c�V\Q$<���� v���5(�E�>��E�$9��+@z��pU���P�E�g���5�	+      �   �  x���j�@��~��)����F�T\�)�n�a����O�O���X=�^������C
	9η������(��#层�ךԛ�����pE�4ը5.�A�����N:��CeP�Z�ھ���b�<�B{O�5|y���;�U�%�X'+��D$�&y��YoD*�Y�֧$ZB��d+�b�BmPyv����֦���;��i�sƳ�(B�"��&�M���*��P���ʏ�b{����(?�[ϒY&�C�5�{Y�A��m�;��рFf���] �7fꈑ�W�/���v '5��sA���(b:��EȠ��/}q�ކ�nj|���W o���Ƌz��8l�<#]O_1�ռ�ݼ���iT���@��|�46���B��8|�?	=J�����O�Ǩ-?N�1�      �   �  x�ՔKj1��s
�چ���Zd'z gTR��3�~'w�Ţ���"QP=(>J���?ٮ;ذ������z:��)i�Mq,�\Χ-����\fڲa,�5f�#�?��h�~x��s*�Ŀ#M�y#M_/��4����qUnٗw���v�x����@�C�b���>�9i�<o������s߇S���e��jɥ.�z�����ɵ�
ϭ0BT�I��{%�q��16�����cr�ڷ(�r�Qe�ys��;t���#{`���i�}|�����19�+Ul#h�x��r��bD�x������1R��$�����/yIq�s�@+A�M�T`\t�4�q�4')p�{��.!�6%�E�dW !~3��am]���d���9[/�b[�
Ax9F%�F�Bx���@)�<oA�z70%\s���D^@�Ӻϡ�t}��
�7����>      �   &  x���=KA�>�b�K #s�5;XI�z w`N[ُY�������L7�6�0�]��>����A���m������C�Q-���w�#9����ZM�ߺR/7��۝Z6^3��	�-�@��B�)�|m��j��imul,`)dpv��XG��J����c�����a|����EwI�������I�Bk�2�Aj�drNtpK"~�:=�&6��l�����Zg0
e�HP�l%�$>�/ES�������RpDu��=XCb5��P�En���"9J�"c ��^�R<�E��ڢ�?���L�Ў      �   
   x���          �   
   x���          �   -  x�ݒAk�0@����Th$����2Q�
];f��i��iR��m�~��ED�u��@x$��ۗ%Y��������i%%�&��P��4���jz ך��2�w%�?Ѫ3��a\x���|I�� 4��G^1Õ���Uz���d�c��C��O|Q�8�SJʲ���{hL	0�0��T����I�}�Ev-����"��O.���{۬R�s�,�v��A��<C�<{H�u�69���1�vw��/բ׵��@7Բxy�V�L&��l�����_�ڨ�TC*j;�NU;�d?��X�3�]���}Y�      �   T  x�ՑKk�@�������Hv��Ћ}7 	���ٝ]M��&��_'���CAv��i?��x�}�����l��C�5u:6�hĐ��ua�VX-Gl�a�h�����\�o�p|pS5��VU���ː�\N�o�ؠ�3�92D���:pB�eι4�$�X�
�M��6t4���8�;�J�����|��DH�v�H�,�uY�M���)YQ��������<�	�Ѧ P�A ����
�<)s,O��,/�F>��eD+$��%��	�)=�_ׯ��
ǾY��O��>��Qg��2E�3���s�!�w�I7?^������/�C�Kz��5~��1�s�      �   
   x���          �   �   x�e�QK�0F��+�[7hF�.���M-���\��X�ش��^+����w�i�qwh����8���^D�S�R|�L�}$��K���CW@���}P��RB���Y�qp����z��;�,/률JT�
�le*��rͪ��4�6y��!���?Q���B�n
��xv~b^r�������$l���7��
�j�yw�e�)�M      �   _  x�ݓMn�0����;@�$6VWh	%P��=n]��7�=z�&P�m���Y�����$�f�ޢ$�fh��U{�.��%T��FVOPas(
� ��O����m]�UYkk��{�_{����l��ܠѐQAX`N��B�sBI��8f&N�0���QZ��i?RB)n]�TqQ�S)4���,E�,}Z%�-Zd(Ͷ/I��8H���{��z"�A7���:(j��Q.B,T�0����EnL|�>���8��=���Әs���G!gX��`������ض��Vu�PR�J��}ǻw�uu�����
�f��#?�u�n�:{ N�؛�y����`{����~�l%�      �   �  x���Ok�0 �"7�H�&i�i8�J��:�
k�j��k���t�м�=���x$N����i���V}�n�X]���˖�j7��݀Iaf���E�{��(몕U��~�ndkuce[��.+kS�B�+>���n�fSom}:o�j����*aȈc0d�C%��,4:�"�¹�`�G�>tqL!��f�g��0���	P��@�R�P�\���� K�<K��x����Y�������y�A���3�� ���䚁� `�voL��bn-�J�iC%(t�!��Q�Q��S��׌�΁˹�(�2C�SΠt�2Б�T
,��5��7/�\\z�������sY�.]%���e�t�6�|��3�E7K���u��F�i�k�      �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   �  x�����0��y
�ؕ�2����l�EJɪI{��Vg���o_c�$ۆ��pA�X�=����p=��AA�Y�]�MY�F@Q�RDP��(e[HS0QE$�N2��$�j�J��z��2��E��SIsɤz����4Q;�~@.4��B2��\ߛЌ���,�E_�-?�����>�X��mkB�o��C�	&x��=o�؆��*h�����4��Tb��`�D�&"�D6��R��x�պ�;�.k�E��V�e0۠�
W�� \��튖1�B�2z�jy����n�;��'�a�TD��s��[��ް��3���L݊H��Wfj^8��W���BV�gŁ� Y�����= ~5ӱ�*�S��<`��د�5��L'�;����9�A�x_����L�S���YFc8���Ŭ.՞�X2)�Ǚ��(@��[	G��/�f3���/�e�7��.`I����y���r����x����ĉ-7Jlk�����d��jp5e�R����?�uO��O�[�j`|=ƺ�[@��c�iq��h��>��@�Ơ�_�O��θ��Kѡ��Ɲ�?�ث��v�>�hU�V��H.iV��@���|f7���?�u;���!�^��GxZ7?6FѪ?c|-��~͊q�      �   
   x���          �   	  x�͐AK�@���sK��nIK�$�j�$b�����ݲ����Ԣ�D��ޛaxߔ�q��@Y55���'s|�#,ɦ��S�8�@'&�R@�#�h�lv��ԑ9'+x�;�LrY���1�R�l�D��Ze[�D��<�t2I!�@gq
�<a�s؃��x��0�({B�q��[%J(�ţ�|�۩du��z8���k��橬o�_�n�����r����^;��1���Z�+�����y��?��)@���#ܯP�OA��      �   �   x���?��0��nU0��Mjx��矀$��U�6�B�����E'�����?�H�[lS�*�P��,�ic�,έ��7UQ��9���Nթ����_���y��w�_�`z"0'�!B0A	�	Q�`���㞄�H�ųǋ�(�$A�P�x�g3&"#�Ǡ̵Zn�<�?J�k�V?��.����9�+9�$?Rf}$��K��L�7��.�6��.�v~��r�z�      �   #  x����N�0�;O���ִ%,OW%!`���q�.]K���u�1\���'3����z�ܐ�l*r[��j ��
�B�!�����b�c`*����/�4)=(�ޜ�Vc���QV����8�wh`���{�P���m��*<e[�q���4�M�`m��x��pC�������h��Ȝ���S��|)�i"(�R.�cJeeɜ��Oݒ�kR�$���"�rW��j���&��"�8',dk��\�ͮ'��b���o�ѹ�ӻt{��`�L�_��/��/� S�Z      �   �   x��һj�@�^_q;����Z\�If��6h_ �#cG���"m�*l;3�)����k��;���s��y�_#����s���}�a�k��y���7[����v8����P�T$�QF�SC�� �Թ��N��@�y�n��}g������l׿��y[����X^V,X�1���"��x�	dpI+�R*+,�kb":pM�@M�$(�o��0#K�����:�K�b&K�6���lU� �Y�:      �   
   x���          �   
   x���          �   �   x���M�0���S��^�2:�Yd��]#_�Aj����/ު���'UU�He4<��aۍ�o��3D��.C?zw�]�u�N�;b��ʺ� 
18%�G�`�2��Q�a����<��0����b�
r����5(mNR���&�.����d�� x�괨      �   
   x���          �   
   x���         