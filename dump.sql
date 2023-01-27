/* DROP */
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


-- PARTIE STRUCTURE 
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
    fk_commandes_idlivreur int
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
    codeParrainage char(20) UNIQUE NOT NULL,
    parrain int,
    dateInscription timestamp WITHOUT TIME ZONE DEFAULT now(),
    adresse varchar(100) NOT NULL,
    idVille int
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



/* Table associations */
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

/* Clés étrangères */
ALTER TABLE clients
    ADD CONSTRAINT fk_clients_parrain
        FOREIGN KEY (parrain) REFERENCES clients(idClient):

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

ALTER TABLE fk_etat_idstatus
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




-- PARTIE DONNEES

-- LES STATUS :
INSERT INTO status(idStatus, description) VALUES
(1, 'En attente'),
(2, 'En préparation'),
(3, 'En cours de livraison'),
(4, 'Livré'),
(5, 'Annulé');


INSERT INTO mots_clefs(idMotsClef, mot) VALUES
(1, 'Sushi'),
(2, 'France'),
(3, 'Japon'),
(4, 'Fast-Food'),
(5, 'Patisserie'),
(6, 'Savoyard'),
(7, 'Burger'),
(8, 'Tacos'),
(9, 'Mexicain'),
(10, 'Vegan'),
(11, 'Végétarien'),
(12, 'Gastronomique');


INSERT INTO plats(idPlat, nom, prix, description, photo) VALUES
(1, 'Boeuf-Bourgignon', 12.99, 'Un délicieu Boeuf-Bourgignon de nos terroirs français.', '/boeuf-bourgignon.png'),
(2, 'Pizza Margherita', 9.99, 'Une pizza à la mozarella qui fera saliver vos papilles.', '/margherita.png'),
(3, 'Ratatouille', 9.99, 'Une savoureuse ratatouille faite avec les légumes frais de notre jardin.', '/ratatouille.png'),
(4, 'Coq au Vin', 14.99, 'Un classique de la cuisine française : le Coq au Vin.', '/coq-au-vin.png'),
(5, 'Croque-Monsieur', 8.99, 'Un croque-monsieur traditionnel accompagné de frites.', '/croque-monsieur.png'),
(6, 'Crêpes Suzette', 7.99, 'Des crêpes Suzette flambées à la liqueur d''orange.', '/crepes-suzette.png'),
(7, 'Quiche Lorraine', 11.99, 'Une quiche Lorraine traditionnelle avec des lardons et des oignons.', '/quiche-lorraine.png'),
(8, 'Soupe à l''oignon', 7.99, 'Une soupe à l''oignon traditionnelle accompagnée de croûtons.', '/soupe-a-l-oignon.png'),
(9,'Steak frites', 16.99, 'Un steak de bœuf grillé accompagné de frites fraîches.', '/steak-frites.png'),
(10,'Salade niçoise', 12.99, 'Une salade niçoise avec des légumes frais, des olives et des anchois.', '/salade-nicoise.png'),
(11,'Bouillabaisse', 18.99, 'Une bouillabaisse traditionnelle avec des poissons frais de la mer.', '/bouillabaisse.png'),
(12,'Crème brûlée', 6.99, 'Une crème brûlée classique.', '/creme-brulee.png'),
(13,'Blanquette de veau', 15.99, 'Une blanquette de veau traditionnelle accompagnée de riz.', '/blanquette-de-veau.png'),
(14,'Croissant au jambon', 6.99, 'Un croissant au jambon et fromage fondu.', '/croissant-au-jambon.png'),
(15,'Boulettes de viande', 12.99, 'Des boulettes de viande accompagnées de purée de pommes de terre.', '/boulettes-de-viande.png'),
(16,'Hamburger', 8.99, 'Un hamburger américain avec des oignons grillés, de la laitue et de la tomate.', '/hamburger.png'),
(17,'Sushi', 14.99, 'Un assortiment de sushi japonais, y compris du thon, du saumon et du concombre.', '/sushi.png'),
(18,'Taco', 3.99, 'Un taco mexicain rempli de viande hachée, de fromage, de laitue et de salsa.', '/taco.png'),
(19,'Burrito végétarien', 9.99, 'Un burrito rempli de légumes grillés, de riz et de haricots rouges.', '/burrito-vegetarien.png'),
(20,'Poulet Teriyaki', 12.99, 'Un poulet teriyaki grillé accompagné de riz et de légumes.', '/poulet-teriyaki.png'),
(21,'Enchiladas', 10.99, 'Des enchiladas mexicaines remplies de fromage et de poulet, accompagnées de riz et de haricots rouges.', '/enchiladas.png'),
(22,'Ramen', 13.99, 'Un bol de ramen japonais avec des nouilles, du porc et des légumes.', '/ramen.png'),
(23,'Steak de tofu', 11.99, 'Un steak de tofu accompagné de légumes grillés et de riz brun.', '/steak-de-tofu.png'),
(24,'Fajitas végétariennes', 9.99, 'Des fajitas végétariennes accompagnées de riz et de haricots rouges.', '/fajitas-vegetariennes.png'),
(25,'Poulet Curry', 12.99, 'Un délicieux poulet curry de nos terroirs indiens.', '/poulet-curry.png'),
(26,'Poulet Tikka Masala', 12.99, 'Un délicieux poulet tikka masala de nos terroirs indiens.', '/poulet-tikka-masala.png');



INSERT INTO villes(idVille, nomVille, codePostal) VALUES
(1, 'Lyon 1er', '69001'),
(2, 'Marseille 8e', '13008'),
(3,'Bordeaux', '33000'),
(4,'Toulouse', '31000'),
(5,'Strasbourg', '67000'),
(6,'Nice', '06000'),
(7,'Nantes', '44000'),
(8,'Rouen', '76000'),
(9,'Montargis', '45200'),
(10,'Lille', '59000'),
(11, 'Dijon', '21000');


INSERT INTO restaurants(idRestaurant, nom, adresse, tempFerme, fraisCharge, idVille) VALUES
(1,'À la bonne fourchette !', '13 rue du chat noir', false, 10.45, 1),
(2,'O''tacos', '70 place de la République', false, 1.11, 5),
(3,'Le Bistrot des Amis', '3 avenue des Champs-Élysées', true, 15.50, 3),
(4,'Chez Pierre', '5 rue des Fleurs', false, 12.00, 2),
(5,'La Table du Marché', '22 rue de la Boulangerie', false, 18.75, 4),
(6,'La Belle Époque', '16 boulevard Saint-Germain', false, 20.00, 8),
(7,'La Cantina Mexicaine', '10 rue de la Paix', true, 11.50, 5),
(8,'Le Jardin Gourmand', '7 rue des Jardins', false, 14.00, 11),
(9,'La Trattoria', '12 avenue Victor Hugo', false, 16.25, 2),
(10,'La Table Ronde', '18 rue de la Renaissance', false, 19.50, 1),
(11,'Le Bistrot des Halles', '25 place des Halles', false, 21.75, 4),
(12,'La Table du Chef', '2 avenue de la Gastronomie', false, 25.00, 3),
(13,'Le Comptoir des Saveurs', '9 rue des Epices', false, 30.00, 2),
(14,'Le Gourmet', '4 boulevard des Gourmands', false, 35.00, 10),
(15,'La Cave à Manger', '15 rue des Vins', false, 40.00, 9),
(16,'Le Bistrot du Terroir', '20 place des Terroirs', false, 45.00, 4);


INSERT INTO clients(idClient, mail, nom, prenom, tel, passwd, pointsFidelite, adresse, idVille) VALUES
(1,'jean.dupont@gmail.com', 'Dupont', 'Jean', '0612345678', 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 120, '1 rue des Lilas', 7),
(2,'paul.martin@yahoo.fr', 'Martin', 'Paul', '0623456789', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6', 50, '2 avenue des Tilleuls', 3),
(3,'claire.durand@hotmail.com', 'Durand', 'Claire', '0634567890', 'a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5', 80, '3 rue des Cerisiers', 6),
(4,'luc.bertrand@gmail.com', 'Bertrand', 'Luc', '0645678901', 'g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5', 130, '4 avenue des Marronniers', 8),
(5,'sophie.lopez@yahoo.fr', 'Lopez', 'Sophie', '0601234567', 'j8i7h6g5j9i8h7g6j0i9h8g7j1i0h9g8j2i1h0g9', 20, '5 rue des Orchidées', 1),
(6,'julien.robert@gmail.com', 'Robert', 'Julien', '0698765432', 'k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8', 100, '6 avenue des Pins', 11),
(7,'chloe.petit@yahoo.fr', 'Petit', 'Chloe', '0613579864', 'h3g2f1h4g3f2h5g4f3h6g5f4h7g6f5h8g7f6', 40, '7 rue des Sapins', 2),
(8,'antoine.durand@hotmail.com', 'Durand', 'Antoine', '0624681012', 'f9e8d7f0e9d8f1e0d9f2e1d0f3e2d1f4e3d2', 60, '8 avenue des Peupliers', 9),
(10,'emilie.leclerc@gmail.com', 'Leclerc', 'Emilie', '0635792468', 'd5c4b3d6c5b4d7c6b5d8c7b6d9c8b7d0c9b8', 110, '9 rue des Chênes', 5),
(11,'thomas.dupont@yahoo.fr', 'Dupont', 'Thomas', '0646813579', 'b1a0b2a1b3a2b4a3b5a4b6a5b7a6b8a7b9a8', 30, '10 boulevard des Eglantines', 4),
(12,'elise.roger@gmail.com', 'Roger', 'Elise', '0615263748', 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 90, '11 rue des Champs', 10),
(13,'lucie.simon@yahoo.fr', 'Simon', 'Lucie', '0628463719', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6', 30, '12 avenue des Bois', 1),
(14,'antoine.lefebvre@hotmail.com', 'Lefebvre', 'Antoine', '0639745628', 'a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5', 120, '13 rue des Ecoles', 7),
(15,'julie.rousseau@gmail.com', 'Rousseau', 'Julie', '0650983746', 'g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5', 50, '14 avenue des Fleurs', 3),
(16,'marie.noel@hotmail.com', 'Noel', 'Marie', '0678965432', 'k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8', 130, '16 avenue des Lacs', 8),
(17,'michel.garcia@gmail.com', 'Garcia', 'Michel', '0612347856', 'h3g2f1h4g3f2h5g4f3h6g5f4h7g6f5h8g7f6', 20, '17 rue des Oiseaux', 1),
(18,'nathalie.ruiz@yahoo.fr', 'Ruiz', 'Nathalie', '0623456789', 'f9e8d7f0e9d8f1e0d9f2e1d0f3e2d1f4e3d2', 100, '18 avenue des Pommiers', 11),
(19,'olivier.fernandez@hotmail.com', 'Fernandez', 'Olivier', '0634567890', 'd5c4b3d6c5b4d7c6b5d8c7b6d9c8b7d0c9b8', 40, '19 rue des Roses', 2),
(20,'pascale.miller@gmail.com', 'Miller', 'Pascale', '0645678901', 'b1a0b2a1b3a2b4a3b5a4b6a5b7a6b8a7b9a8', 60, '20 avenue des Tulipes', 9),
(21,'quentin.davis@yahoo.fr', 'Davis', 'Quentin', '0601234567', 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 110, '21 rue des Arts', 5),
(22,'rachel.gonzalez@hotmail.com', 'Gonzalez', 'Rachel', '0698765432', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6', 30, '22 avenue des Bois', 4),
(23,'sebastien.rodriguez@gmail.com', 'Rodriguez', 'Sebastien', '0613579864', 'a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5', 90, '23 rue des Ecoles', 10),
(24,'tatiana.martinez@yahoo.fr', 'Martinez', 'Tatiana', '0624681012', 'g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5', 20, '24 avenue des Fleurs', 1),
(25,'ulrike.rodriquez@hotmail.com', 'Rodriguez', 'Ulrike', '0635792468', 'j8i7h6g5j9i8h7g6j0i9h8g7j1i0h9g8j2i1h0g9', 80, '25 rue des Arts', 6),
(26,'valerie.wright@gmail.com', 'Wright', 'Valerie', '0601234567', 'k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8', 130, '26 avenue des Lacs', 8);

INSERT INTO carte_bancaire(idCb, titulaire, pays, numero, date, crypto, idClient) VALUES
(1,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 1),
(2,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 2),
(3,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 3),
(4,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 4),
(5,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 5),
(6,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 6),
(7,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 7),
(8,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 8),
(9,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 9),
(10,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 10),
(11,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 11),
(12,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 12),
(13,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 13),
(14,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 14),
(15,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 15),
(16,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 16),
(17,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 17),
(18,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 18),
(19,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 19),
(20,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 20),
(21,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 21),
(22,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 22),
(23,'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', 23);


INSERT INTO livreurs(idLivreur, matricule, prenom, nom, telPro, passwd, enService) VALUES
(1,'d0293018', 'Dupont', 'Jean', '0612345678', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(2,'d4933018', 'Martin', 'Paul', '0623456789', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(3,'d0123018', 'Durand', 'Claire', '0634567890', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(4,'d0297718', 'Bertrand', 'Luc', '0645678901', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(5,'d0278918', 'Lopez', 'Sophie', '0601234567', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(6,'d0295768', 'Robert', 'Julien', '0698765432', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(7,'d0293008', 'Petit', 'Chloe', '0613579864', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(8,'d0211018', 'Durand', 'Antoine', '0624681012', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(9,'d1293018', 'Leclerc', 'Emilie', '0635792468', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(10,'d2293018', 'Dupont', 'Thomas', '0646813579', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(11,'d3293018', 'Garcia', 'Michel', '0612347856', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(12,'d4293018', 'Ruiz', 'Nathalie', '0623456789', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(13,'d5293018', 'Fernandez', 'Olivier', '0634567890', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true),
(14,'d6293018', 'Miller', 'Pascale', '0645678901', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', false),
(15,'d7293018', 'Rodriguez', 'Sebastien', '0613579864', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7d4c3', true);


INSERT INTO commandes(idCommande, dateCommande, note, commentaire, idClient, idRestaurant, idLivreur) VALUES
(1,'15/01/2022', 3, 'La livraison était en retard mais la qualité des produits était satisfaisante', 10, 7, 12),
(2,'07/05/2021', 5, 'La livraison était à l''heure et la qualité des produits était excellente', 15, 12, 8),
(3,'31/12/2021', 2, 'La livraison était en avance mais la qualité des produits était moyenne', 24, 15, 12),
(4,'01/03/2022', 4, 'La livraison était à l''heure et la qualité des produits était très bonne', 12, 8, 15),
(5,'25/09/2021', 1, 'La livraison était en retard et la qualité des produits était médiocre', 14, 11, 9),
(6,'15/01/2022', 3, 'La livraison était en retard mais la qualité des produits était satisfaisante', 10, 7, 12),
(7,'07/05/2021', 5, 'La livraison était à l''heure et la qualité des produits était excellente', 15, 12, 8),
(8,'31/12/2021', 2, 'La livraison était en avance mais la qualité des produits était moyenne', 24, 15, 12),
(9,'01/03/2022', 4, 'La livraison était à l''heure et la qualité des produits était très bonne', 12, 8, 15),
(10,'25/09/2021', 1, 'La livraison était en retard et la qualité des produits était médiocre', 14, 11, 9),
(11,'15/01/2022', NULL, NULL, 10, 7, 12),
(12,'07/05/2021', NULL, NULL, 15, 12, 8),
(13,'31/12/2021', NULL, NULL, 24, 15, 12),
(14,'01/03/2022', NULL, NULL, 12, 8, 15),
(15,'25/09/2021', NULL, NULL, 14, 11, 9);


INSERT INTO horaires(jour, ouverture, fermeture, idRestaurant) VALUES
(0, '08:15:00', '22:15:00', 1),
(1, '08:15:00', '22:15:00', 1),
(2, '08:15:00', '22:15:00', 1),
(3, '08:15:00', '22:15:00', 1),
(4, '08:15:00', '22:15:00', 1),
(5, '08:15:00', '22:15:00', 1),
(6, '08:15:00', '22:15:00', 1),

(0, '11:00:00', '19:30:00', 2),
(1, '11:00:00', '19:30:00', 2),
(2, '11:00:00', '19:30:00', 2),
(3, '11:00:00', '19:30:00', 2),
(4, '11:00:00', '19:30:00', 2),
(5, '11:00:00', '19:30:00', 2),

(0, '11:00:00', '14:30:00', 3),
(0, '18:00:00', '23:00:00', 3),
(1, '11:00:00', '14:30:00', 3),
(1, '18:00:00', '23:00:00', 3),
(2, '11:00:00', '14:30:00', 3),
(2, '18:00:00', '23:00:00', 3),
(3, '11:00:00', '14:30:00', 3),
(3, '18:00:00', '23:00:00', 3),
(4, '11:00:00', '14:30:00', 3),
(4, '18:00:00', '23:00:00', 3),


(0, '11:00:00', '19:30:00', 4),
(1, '11:00:00', '19:30:00', 4),
(2, '11:00:00', '19:30:00', 4),
(3, '11:00:00', '19:30:00', 4),
(4, '11:00:00', '19:30:00', 4),
(5, '11:00:00', '19:30:00', 4),
(6, '11:00:00', '19:30:00', 4),


(0, '11:00:00', '19:30:00', 5),
(1, '11:00:00', '19:30:00', 5),
(2, '11:00:00', '19:30:00', 5),
(3, '11:00:00', '19:30:00', 5),
(4, '11:00:00', '19:30:00', 5),
(5, '11:00:00', '19:30:00', 5),
(6, '11:00:00', '19:30:00', 5),


(0, '11:00:00', '19:30:00', 6),
(1, '11:00:00', '19:30:00', 6),
(2, '11:00:00', '19:30:00', 6),
(3, '11:00:00', '19:30:00', 6),
(4, '11:00:00', '19:30:00', 6),
(5, '11:00:00', '19:30:00', 6),
(6, '11:00:00', '19:30:00', 6),


(0, '11:00:00', '19:30:00', 7),
(1, '11:00:00', '19:30:00', 7),
(2, '11:00:00', '19:30:00', 7),
(3, '11:00:00', '19:30:00', 7),
(4, '11:00:00', '19:30:00', 7),
(5, '11:00:00', '19:30:00', 7),
(6, '11:00:00', '19:30:00', 7),

(0, '11:00:00', '19:30:00', 8),
(1, '11:00:00', '19:30:00', 8),
(2, '11:00:00', '19:30:00', 8),
(3, '11:00:00', '19:30:00', 8),
(4, '11:00:00', '19:30:00', 8),
(5, '11:00:00', '19:30:00', 8),
(6, '11:00:00', '19:30:00', 8),

(0, '11:00:00', '19:30:00', 9),
(1, '11:00:00', '19:30:00', 9),
(2, '11:00:00', '19:30:00', 9),
(3, '11:00:00', '19:30:00', 9),
(4, '11:00:00', '19:30:00', 9),
(5, '11:00:00', '19:30:00', 9),
(6, '11:00:00', '19:30:00', 9),

(0, '11:00:00', '19:30:00', 10),
(1, '11:00:00', '19:30:00', 10),
(2, '11:00:00', '19:30:00', 10),
(3, '11:00:00', '19:30:00', 10),
(4, '11:00:00', '19:30:00', 10),
(5, '11:00:00', '19:30:00', 10),
(6, '11:00:00', '19:30:00', 10),

(0, '11:00:00', '19:30:00', 11),
(1, '11:00:00', '19:30:00', 11),
(2, '11:00:00', '19:30:00', 11),
(3, '11:00:00', '19:30:00', 11),
(4, '11:00:00', '19:30:00', 11),
(5, '11:00:00', '19:30:00', 11),
(6, '11:00:00', '19:30:00', 11),

(0, '11:00:00', '19:30:00', 12),
(1, '11:00:00', '19:30:00', 12),
(2, '11:00:00', '19:30:00', 12),
(3, '11:00:00', '19:30:00', 12),
(4, '11:00:00', '19:30:00', 12),
(5, '11:00:00', '19:30:00', 12),
(6, '11:00:00', '19:30:00', 12),

(0, '11:00:00', '19:30:00', 13),
(1, '11:00:00', '19:30:00', 13),
(2, '11:00:00', '19:30:00', 13),
(3, '11:00:00', '19:30:00', 13),
(4, '11:00:00', '19:30:00', 13),
(5, '11:00:00', '19:30:00', 13),
(6, '11:00:00', '19:30:00', 13),

(0, '11:00:00', '19:30:00', 16),
(1, '11:00:00', '19:30:00', 16),
(2, '11:00:00', '19:30:00', 16),
(3, '11:00:00', '19:30:00', 16),
(4, '11:00:00', '19:30:00', 16),
(5, '11:00:00', '19:30:00', 16),
(6, '11:00:00', '19:30:00', 16),

(0, '11:00:00', '19:30:00', 14),
(1, '11:00:00', '19:30:00', 14),
(2, '11:00:00', '19:30:00', 14),
(3, '11:00:00', '19:30:00', 14),
(4, '11:00:00', '19:30:00', 14),
(5, '11:00:00', '19:30:00', 14),
(6, '11:00:00', '19:30:00', 14),

(0, '11:00:00', '19:30:00', 15),
(1, '11:00:00', '19:30:00', 15),
(2, '11:00:00', '19:30:00', 15),
(3, '11:00:00', '19:30:00', 15),
(4, '11:00:00', '19:30:00', 15),
(5, '11:00:00', '19:30:00', 15),
(6, '11:00:00', '19:30:00', 15);


INSERT INTO etat(idCommande, idStatus) VALUES
(1, 4),
(2, 2),
(3, 5),
(4, 3),
(5, 1),
(6, 2),
(7, 5),
(8, 1),
(9, 3),
(10, 2),
(11, 5),
(12, 4),
(13, 2),
(14, 1),
(15, 3),
(1, 5),
(2, 2),
(3, 1),
(4, 4),
(5, 2),
(6, 5),
(7, 1),
(8, 3),
(9, 2),
(10, 4),
(11, 1),
(12, 3),
(13, 5),
(14, 2),
(15, 4);

INSERT INTO contient(idCommande, idPlat) VALUES
(1, 4),
(2, 22),
(3, 5),
(4, 13),
(5, 21),
(6, 18),
(7, 8),
(8, 15),
(9, 12),
(10, 26),
(11, 1),
(12, 14),
(13, 6),
(14, 19),
(15, 3),
(1, 24),
(2, 9),
(3, 5),
(4, 21),
(5, 15),
(6, 12),
(7, 26),
(8, 3),
(9, 20),
(10, 8),
(11, 14),
(12, 4),
(13, 18),
(14, 9),
(15, 26),
(1, 7),
(2, 17),
(3, 12),
(4, 26),
(5, 15),
(6, 8),
(7, 14),
(8, 1),
(9, 11),
(10, 5),
(11, 26),
(12, 3),
(13, 17),
(14, 12),
(15, 6),
(1, 22),
(2, 18),
(3, 8),
(4, 14),
(5, 26),
(6, 11),
(7, 3),
(8, 20),
(9, 15),
(10, 12),
(11, 4),
(12, 18),
(13, 7),
(14, 25),
(15, 12);

INSERT INTO livre(idVille, idLivreur) VALUES 
(1, 4),
(2, 12),
(3, 5),
(4, 8),
(5, 14),
(6, 9),
(7, 11),
(8, 3),
(9, 6),
(10, 15),
(11, 1),
(1, 2),
(2, 7),
(3, 8),
(4, 11),
(5, 15),
(6, 4),
(7, 12),
(8, 3),
(9, 5),
(10, 14),
(11, 8),
(1, 9),
(2, 6),
(3, 15),
(4, 1),
(5, 2),
(6, 7),
(7, 8),
(8, 11),
(9, 15),
(10, 4),
(11, 12);



INSERT INTO associe(idRestaurant, idMotsClef) VALUES
(1, 4),
(2, 12),
(3, 9),
(4, 8),
(5, 6),
(6, 5),
(7, 11),
(8, 3),
(9, 10),
(10, 12),
(11, 1),
(12, 7),
(13, 9),
(14, 2),
(15, 2),
(16, 1),
(1, 3),
(2, 12),
(3, 8),
(4, 9),
(5, 5),
(6, 6),
(7, 11),
(8, 3),
(9, 10),
(10, 12),
(11, 1),
(12, 7),
(13, 3),
(14, 2),
(15, 4),
(16, 1);

INSERT INTO carte(idRestaurant, idPlat) VALUES
(1, 4),
(2, 12),
(3, 9),
(4, 8),
(5, 6),
(6, 21),
(7, 11),
(8, 24),
(9, 10),
(10, 12),
(11, 1),
(12, 7),
(13, 16),
(14, 22),
(15, 15),
(16, 1),
(1, 3),
(2, 26),
(3, 8),
(4, 9),
(5, 5),
(6, 6),
(7, 21),
(8, 3),
(9, 10),
(10, 12),
(11, 1),
(12, 7),
(13, 16),
(14, 22),
(15, 15),
(16, 26);