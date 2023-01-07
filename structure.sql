/* DROP */
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


/* Tables */
CREATE TABLE status(
    idStatus serial PRIMARY KEY,
    description varchar(50)
);

CREATE TABLE commandes(
    idCommande serial PRIMARY KEY,
    dateCommande timestamp WITHOUT TIME ZONE,
    note float DEFAULT null,
    commentaire text DEFAULT null,
    idClient int
);

CREATE TABLE plats(
    idPlat serial PRIMARY KEY,
    nom varchar(50),
    prix float,
    description text,
    photo varchar(200)
);

CREATE TABLE clients(
    idClient serial PRIMARY KEY,
    mail varchar(100) UNIQUE ,
    nom varchar(50),
    prénom varchar(50),
    tel char(10),
    passwd varchar(100),
    pointsFidélite int,
    codePostal char(5),
    adresse varchar(100),
    idVille int
);

CREATE TABLE villes(
    idVille serial PRIMARY KEY,
    nomVille varchar(50)
);

CREATE TABLE mots_clefs(
    idMotsClef serial PRIMARY KEY,
    mot varchar(50) UNIQUE
);

CREATE TABLE horaires(
    idHoraire serial PRIMARY KEY,
    jour int CHECK (jour BETWEEN 0 AND 6),
    ouverture time WITHOUT TIME ZONE,
    fermeture time WITHOUT TIME ZONE
);

CREATE TABLE livreurs(
    idLivreur serial PRIMARY KEY,
    nom varchar(50),
    prénom varchar(50),
    telPro char(10),
    passwd varchar(100),
    enService boolean
);

CREATE TABLE restaurants(
    idRestaurant serial PRIMARY KEY,
    nom varchar(50),
    tempFerme boolean,
    fraisCharge float,
    idVille int
);


/* Many to Many */
CREATE TABLE état(
    idStatus int,
    idCommande int,
    dateHeure timestamp WITHOUT TIME ZONE
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
ALTER TABLE commandes
    ADD CONSTRAINT fk_commandes_idclient
        FOREIGN KEY (idClient) REFERENCES clients(idClient);

ALTER TABLE clients
    ADD CONSTRAINT fk_clients_idville
        FOREIGN KEY (idVille) REFERENCES villes(idVille);

ALTER TABLE restaurants
    ADD CONSTRAINT fk_restaurants_idville
        FOREIGN KEY (idVille) REFERENCES villes(idVille);

ALTER TABLE état
    ADD CONSTRAINT fk_état_idstatus
        FOREIGN KEY (idStatus) REFERENCES status(idStatus),
    ADD CONSTRAINT fk_état_idcommande
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