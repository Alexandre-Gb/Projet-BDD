/* DROP */
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


/* Tables */
CREATE TABLE status(
    idStatus serial PRIMARY KEY,
    description varchar(50) NOT NULL
);

CREATE TABLE commandes(
    idCommande serial PRIMARY KEY,
    dateCommande timestamp WITHOUT TIME ZONE DEFAULT now(),
    note float CHECK ( note BETWEEN 0 AND 5 OR NULL) DEFAULT NULL,
    commentaire varchar(2000) DEFAULT NULL,
    idClient int,
    idRestaurant int,
    idLivreur int
);

CREATE TABLE plats(
    idPlat serial PRIMARY KEY,
    nom varchar(50) NOT NULL,
    prix float NOT NULL CHECK ( prix >= 0 ),
    description varchar(2000),
    photo varchar(200)
);

CREATE TABLE clients(
    idClient serial PRIMARY KEY,
    mail varchar(100) UNIQUE NOT NULL,
    nom varchar(50) NOT NULL,
    prenom varchar(50) NOT NULL,
    tel char(10) NOT NULL,
    passwd char(50) NOT NULL,
    pointsFidelite int DEFAULT 0 NOT NULL CHECK ( pointsFidelite >= 0 ),
    adresse varchar(100) NOT NULL,
    idVille int
);

CREATE TABLE parrainage(
    parrain int NOT NULL,
    filleul int NOT NULL,
    PRIMARY KEY(parrain, filleul)
);

CREATE TABLE carte_bancaire(
    idCb serial PRIMARY KEY,
    titulaire char(50) NOT NULL,
    pays char(50) NOT NULL,
    numero char(50) NOT NULL,
    date char(50) NOT NULL,
    crypto char(50) NOT NULL,
    idClient int
);

CREATE TABLE villes(
    idVille serial PRIMARY KEY,
    nomVille varchar(50) NOT NULL,
    codePostal char(5) NOT NULL,
    UNIQUE (nomVille, codePostal)
);

CREATE TABLE mots_clefs(
    idMotsClef serial PRIMARY KEY,
    mot varchar(50) UNIQUE NOT NULL
);

CREATE TABLE horaires(
    idHoraire serial PRIMARY KEY,
    jour int CHECK (jour BETWEEN 0 AND 6) NOT NULL ,
    ouverture time WITHOUT TIME ZONE NOT NULL,
    fermeture time WITHOUT TIME ZONE NOT NULL,
    idRestaurant int NOT NULL,
    CHECK ( ouverture < fermeture )
);

CREATE TABLE livreurs(
    idLivreur serial PRIMARY KEY,
    matricule char(8) UNIQUE NOT NULL,
    nom varchar(50) NOT NULL,
    prenom varchar(50) NOT NULL,
    telPro char(10) NOT NULL,
    passwd char(50) NOT NULL,
    enService boolean NOT NULL DEFAULT false
);

CREATE TABLE restaurants(
    idRestaurant serial PRIMARY KEY,
    nom varchar(50) NOT NULL,
    adresse varchar(100) NOT NULL,
    tempFerme boolean DEFAULT false,
    fraisCharge float CHECK ( fraisCharge >= 0 OR NULL ),
    idVille int
);




/* Many to Many */
CREATE TABLE etat(
    idStatus int,
    idCommande int,
    dateHeure timestamp WITHOUT TIME ZONE DEFAULT now()
);

CREATE TABLE contient(
    idCommande int,
    idPlat int
);

CREATE TABLE livre(
    idVille int,
    idLivreur int
);

CREATE TABLE associe(
    idRestaurant int,
    idMotsClef int
);

CREATE TABLE carte(
    idRestaurant int,
    idPlat int
);

/* Foreign Keys */

ALTER TABLE parrainage
    ADD CONSTRAINT fk_filleul_idclient
        FOREIGN KEY (filleul) REFERENCES clients(idClient),
    ADD CONSTRAINT fk_parrain_idclient
        FOREIGN KEY (parrain) REFERENCES clients(idClient);


ALTER TABLE commandes
    ADD CONSTRAINT fk_commandes_idclient
        FOREIGN KEY (idClient) REFERENCES clients(idClient),
    ADD CONSTRAINT fk_commandes_idrestaurant
        FOREIGN KEY (idRestaurant) REFERENCES restaurants(idRestaurant),
    ADD CONSTRAINT fk_commandes_idlivreur
        FOREIGN KEY (idLivreur) REFERENCES livreurs(idLivreur);

ALTER TABLE clients
    ADD CONSTRAINT fk_clients_idville
        FOREIGN KEY (idVille) REFERENCES villes(idVille);

ALTER TABLE restaurants
    ADD CONSTRAINT fk_restaurants_idville
        FOREIGN KEY (idVille) REFERENCES villes(idVille);

ALTER TABLE etat
    ADD CONSTRAINT fk_etat_idstatus
        FOREIGN KEY (idStatus) REFERENCES status(idStatus),
    ADD CONSTRAINT fk_etat_idcommande
        FOREIGN KEY (idCommande) REFERENCES commandes(idCommande);

ALTER TABLE contient
    ADD CONSTRAINT fk_contient_idplat
        FOREIGN KEY (idPlat) REFERENCES plats(idPlat),
    ADD CONSTRAINT fk_contient_idcommande
        FOREIGN KEY (idCommande) REFERENCES commandes(idCommande);

ALTER TABLE livre
    ADD CONSTRAINT fk_livre_idville
        FOREIGN KEY (idVille) REFERENCES villes(idVille),
    ADD CONSTRAINT fk_livre_idlivreur
        FOREIGN KEY (idLivreur) REFERENCES livreurs(idLivreur);

ALTER TABLE associe
    ADD CONSTRAINT fk_associe_idmotsclef
        FOREIGN KEY (idMotsClef) REFERENCES mots_clefs(idMotsClef),
    ADD CONSTRAINT fk_associe_idrestaurant
        FOREIGN KEY (idRestaurant) REFERENCES restaurants(idRestaurant);

ALTER TABLE carte
    ADD CONSTRAINT fk_carte_idplat
        FOREIGN KEY (idPlat) REFERENCES plats(idPlat),
    ADD CONSTRAINT fk_carte_idrestaurant
        FOREIGN KEY (idRestaurant) REFERENCES restaurants(idRestaurant);

ALTER TABLE carte_bancaire
    ADD CONSTRAINT fk_carte_bancaire_idClient
        FOREIGN KEY (idClient) REFERENCES clients(idClient);

ALTER TABLE horaires
    ADD CONSTRAINT fk_horaire_idRestaurant
        FOREIGN KEY (idRestaurant) REFERENCES restaurants(idRestaurant);