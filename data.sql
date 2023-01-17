-- LES STATUS :
INSERT INTO status(description) VALUES
('En attente'),
('En préparation'),
('En cours de livraison'),
('Livré'),
('Annulé');


INSERT INTO mots_clefs(mot) VALUES
('Sushi'),
('France'),
('Japon'),
('Fast-Food'),
('Patisserie'),
('Savoyard'),
('Burger'),
('Tacos'),
('Mexicain'),
('Vegan'),
('Végétarien'),
('Gastronomique');


INSERT INTO plats(nom, prix, description, photo) VALUES
('Boeuf-Bourgignon', 12.99, 'Un délicieu Boeuf-Bourgignon de nos terroirs français.', '/boeuf-bourgignon.png'),
('Pizza Margherita', 9.99, 'Une pizza à la mozarella qui fera saliver vos papilles.', '/margherita.png'),
('Ratatouille', 9.99, 'Une savoureuse ratatouille faite avec les légumes frais de notre jardin.', '/ratatouille.png'),
('Coq au Vin', 14.99, 'Un classique de la cuisine française : le Coq au Vin.', '/coq-au-vin.png'),
('Croque-Monsieur', 8.99, 'Un croque-monsieur traditionnel accompagné de frites.', '/croque-monsieur.png'),
('Crêpes Suzette', 7.99, 'Des crêpes Suzette flambées à la liqueur d\'orange.', '/crepes-suzette.png'),
('Quiche Lorraine', 11.99, 'Une quiche Lorraine traditionnelle avec des lardons et des oignons.', '/quiche-lorraine.png'),
('Soupe à l\'oignon', 7.99, 'Une soupe à l\'oignon traditionnelle accompagnée de croûtons.', '/soupe-a-l-oignon.png'),
('Steak frites', 16.99, 'Un steak de bœuf grillé accompagné de frites fraîches.', '/steak-frites.png'),
('Salade niçoise', 12.99, 'Une salade niçoise avec des légumes frais, des olives et des anchois.', '/salade-nicoise.png'),
('Bouillabaisse', 18.99, 'Une bouillabaisse traditionnelle avec des poissons frais de la mer.', '/bouillabaisse.png'),
('Crème brûlée', 6.99, 'Une crème brûlée classique.', '/creme-brulee.png'),
('Blanquette de veau', 15.99, 'Une blanquette de veau traditionnelle accompagnée de riz.', '/blanquette-de-veau.png'),
('Croissant au jambon', 6.99, 'Un croissant au jambon et fromage fondu.', '/croissant-au-jambon.png'),
('Boulettes de viande', 12.99, 'Des boulettes de viande accompagnées de purée de pommes de terre.', '/boulettes-de-viande.png'),
('Hamburger', 8.99, 'Un hamburger américain avec des oignons grillés, de la laitue et de la tomate.', '/hamburger.png'),
('Sushi', 14.99, 'Un assortiment de sushi japonais, y compris du thon, du saumon et du concombre.', '/sushi.png'),
('Taco', 3.99, 'Un taco mexicain rempli de viande hachée, de fromage, de laitue et de salsa.', '/taco.png'),
('Burrito végétarien', 9.99, 'Un burrito rempli de légumes grillés, de riz et de haricots rouges.', '/burrito-vegetarien.png'),
('Poulet Teriyaki', 12.99, 'Un poulet teriyaki grillé accompagné de riz et de légumes.', '/poulet-teriyaki.png'),
('Enchiladas', 10.99, 'Des enchiladas mexicaines remplies de fromage et de poulet, accompagnées de riz et de haricots rouges.', '/enchiladas.png'),
('Ramen', 13.99, 'Un bol de ramen japonais avec des nouilles, du porc et des légumes.', '/ramen.png'),
('Steak de tofu', 11.99, 'Un steak de tofu accompagné de légumes grillés et de riz brun.', '/steak-de-tofu.png'),
('Fajitas végétariennes', 9.99, 'Des fajitas végétariennes accompagnées de riz et de haricots rouges.', '/fajitas-vegetariennes.png'),
('Poulet Curry', 12.99, 'Un délicieux poulet curry de nos terroirs indiens.', '/poulet-curry.png'),
('Poulet Tikka Masala', 12.99, 'Un délicieux poulet tikka masala de nos terroirs indiens.', '/poulet-tikka-masala.png');



INSERT INTO ville(nomVille, codePostal) VALUES
('Lyon 1er', '69001'),
('Marseille 8e', '13008'),
('Bordeaux', '33000'),
('Toulouse', '31000'),
('Strasbourg', '67000'),
('Nice', '06000'),
('Nantes', '44000'),
('Rouen', '76000'),
('Montargis', '45200')
('Lille', '59000'),
('Dijon', '21000');




INSERT INTO restaurants(nom, adresse,tempFerme, fraisCharge, idVille) VALUES
('À la bonne fourchette !', '13 rue du chat noir', false, 10.45, 1),
('O\'tacos', '70 place de la République', false, 1.11, 5),
('Le Bistrot des Amis', '3 avenue des Champs-Élysées', true, 15.50, 3),
('Chez Pierre', '5 rue des Fleurs', false, 12.00, 2),
('La Table du Marché', '22 rue de la Boulangerie', false, 18.75, 4),
('La Belle Époque', '16 boulevard Saint-Germain', false, 20.00, 8),
('La Cantina Mexicaine', '10 rue de la Paix', true, 11.50, 5),
('Le Jardin Gourmand', '7 rue des Jardins', false, 14.00, 11),
('La Trattoria', '12 avenue Victor Hugo', false, 16.25, 2),
('La Table Ronde', '18 rue de la Renaissance', false, 19.50, 1),
('Le Bistrot des Halles', '25 place des Halles', false, 21.75, 4),
('La Table du Chef', '2 avenue de la Gastronomie', false, 25.00, 3),
('Le Comptoir des Saveurs', '9 rue des Epices', false, 30.00, 2),
('Le Gourmet', '4 boulevard des Gourmands', false, 35.00, 10),
('La Cave à Manger', '15 rue des Vins', false, 40.00, 9),
('Le Bistrot du Terroir', '20 place des Terroirs', false, 45.00, 4);


INSERT INTO clients(mail, nom, prenom, tel, passwd, pointsFidelite, adresse, idVille)
('jean.dupont@gmail.com', 'Dupont', 'Jean', '0612345678', 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 120, '1 rue des Lilas', 7),
('paul.martin@yahoo.fr', 'Martin', 'Paul', '0623456789', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6', 50, '2 avenue des Tilleuls', 3),
('claire.durand@hotmail.com', 'Durand', 'Claire', '0634567890', 'a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5', 80, '3 rue des Cerisiers', 6),
('luc.bertrand@gmail.com', 'Bertrand', 'Luc', '0645678901', 'g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5', 130, '4 avenue des Marronniers', 8),
('sophie.lopez@yahoo.fr', 'Lopez', 'Sophie', '0601234567', 'j8i7h6g5j9i8h7g6j0i9h8g7j1i0h9g8j2i1h0g9', 20, '5 rue des Orchidées', 1),
('julien.robert@gmail.com', 'Robert', 'Julien', '0698765432', 'k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8', 100, '6 avenue des Pins', 11),
('chloe.petit@yahoo.fr', 'Petit', 'Chloe', '0613579864', 'h3g2f1h4g3f2h5g4f3h6g5f4h7g6f5h8g7f6', 40, '7 rue des Sapins', 2),
('antoine.durand@hotmail.com', 'Durand', 'Antoine', '0624681012', 'f9e8d7f0e9d8f1e0d9f2e1d0f3e2d1f4e3d2', 60, '8 avenue des Peupliers', 9),
('emilie.leclerc@gmail.com', 'Leclerc', 'Emilie', '0635792468', 'd5c4b3d6c5b4d7c6b5d8c7b6d9c8b7d0c9b8', 110, '9 rue des Chênes', 5),
('thomas.dupont@yahoo.fr', 'Dupont', 'Thomas', '0646813579', 'b1a0b2a1b3a2b4a3b5a4b6a5b7a6b8a7b9a8', 30, '10 boulevard des Eglantines', 4),
('elise.roger@gmail.com', 'Roger', 'Elise', '0615263748', 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 90, '11 rue des Champs', 10),
('lucie.simon@yahoo.fr', 'Simon', 'Lucie', '0628463719', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6', 30, '12 avenue des Bois', 1),
('antoine.lefebvre@hotmail.com', 'Lefebvre', 'Antoine', '0639745628', 'a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5', 120, '13 rue des Ecoles', 7),
('julie.rousseau@gmail.com', 'Rousseau', 'Julie', '0650983746', 'g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5', 50, '14 avenue des Fleurs', 3),
('marie.noel@hotmail.com', 'Noel', 'Marie', '0678965432', 'k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8', 130, '16 avenue des Lacs', 8),
('michel.garcia@gmail.com', 'Garcia', 'Michel', '0612347856', 'h3g2f1h4g3f2h5g4f3h6g5f4h7g6f5h8g7f6', 20, '17 rue des Oiseaux', 1),
('nathalie.ruiz@yahoo.fr', 'Ruiz', 'Nathalie', '0623456789', 'f9e8d7f0e9d8f1e0d9f2e1d0f3e2d1f4e3d2', 100, '18 avenue des Pommiers', 11),
('olivier.fernandez@hotmail.com', 'Fernandez', 'Olivier', '0634567890', 'd5c4b3d6c5b4d7c6b5d8c7b6d9c8b7d0c9b8', 40, '19 rue des Roses', 2),
('pascale.miller@gmail.com', 'Miller', 'Pascale', '0645678901', 'b1a0b2a1b3a2b4a3b5a4b6a5b7a6b8a7b9a8', 60, '20 avenue des Tulipes', 9),
('quentin.davis@yahoo.fr', 'Davis', 'Quentin', '0601234567', 'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 110, '21 rue des Arts', 5),
('rachel.gonzalez@hotmail.com', 'Gonzalez', 'Rachel', '0698765432', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6', 30, '22 avenue des Bois', 4),
('sebastien.rodriguez@gmail.com', 'Rodriguez', 'Sebastien', '0613579864', 'a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5', 90, '23 rue des Ecoles', 10),
('tatiana.martinez@yahoo.fr', 'Martinez', 'Tatiana', '0624681012', 'g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5', 20, '24 avenue des Fleurs', 1),
('ulrike.rodriquez@hotmail.com', 'Rodriguez', 'Ulrike', '0635792468', 'j8i7h6g5j9i8h7g6j0i9h8g7j1i0h9g8j2i1h0g9', 80, '25 rue des Arts', 6),
('valerie.wright@gmail.com', 'Wright', 'Valerie', '0601234567', 'k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8', 130, '26 avenue des Lacs', 8);

INSERT INTO carte_bancaire(titulaire, pays, numero, date, crypto, idClient)
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 1),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 2),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 3),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 4),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 5),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 6),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 7),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 8),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 9),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 10),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 11),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 12),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 13),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 14),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 15),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 16),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 17),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 18),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 19),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 20),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 21),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 22),
('f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 'f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3', 23);


INSERT INTO livreurs(prenom, nom, telPro, passwd, enService)
("Dupont", "Jean", "0612345678", "f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6", true),
("Martin", "Paul", "0623456789", "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4", false),
("Durand", "Claire", "0634567890", "g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5", true),
("Bertrand", "Luc", "0645678901", "j8i7h6g5j9i8h7g6j0i9h8g7j1i0h9g8j2i1h0g9", false),
("Lopez", "Sophie", "0601234567", "k7j6i5h4k8j7i6h5k9j8i7h6k0j9i8h7k1j0i9h8", true),
("Robert", "Julien", "0698765432", "h3g2f1h4g3f2h5g4f3h6g5f4h7g6f5h8g7f6", false),
("Petit", "Chloe", "0613579864", "f9e8d7f0e9d8f1e0d9f2e1d0f3e2d1f4e3d2", true),
("Durand", "Antoine", "0624681012", "d5c4b3d6c5b4d7c6b5d8c7b6d9c8b7d0c9b8", false),
("Leclerc", "Emilie", "0635792468", "b1a0b2a1b3a2b4a3b5a4b6a5b7a6b8a7b9a8", true),
("Dupont", "Thomas", "0646813579", "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4", false),
("Garcia", "Michel", "0612347856", "f5e4d3c2b1a0f6e5d4c3b2a1f7e6d5c4b3a2f1e0d9c8b7a6", true),
("Ruiz", "Nathalie", "0623456789", "a8b7c6d5e4f3a2b1c0d9e8f7g6h5i4j3k2l1a0b9c8d7e6f5", false),
("Fernandez", "Olivier", "0634567890", "g4h3i2j1g5h4i3j2g6h5i4j3g7h6i5j4g8h7i6j5", true),
("Miller", "Pascale", "0645678901", "j8i7h6g5j9i8h7g6j0i9h8g7j1i0h9g8j2i1h0g9", false),
("Rodriguez", "Sebastien", "0613579864", "f9e8d7f0e9d8f1e0d9f2e1d0f3e2d1f4e3d2", true);



