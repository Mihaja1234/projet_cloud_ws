

INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Hardi', 'Tojoniaina', 'hardi@gmail.com', 'hardi','2021-10-12');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Bryan', 'Ramarokoto', 'bryan@gmail.com', 'bryan','2020-05-09');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Anjary', 'Raharison', 'anjary@gmail.com', 'anjary','2022-08-11');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('NyAndo', 'Ras', 'Nyando@gmail.com', 'nyando','2022-04-03');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Brown', 'Bob', 'bobbrown@gmail.com', 'password789','2019-05-06');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Johnson', 'Samantha', 'samantha@gmail.com', 'password111','2022-06-16');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Williams', 'Michael', 'michael@gmail.com', 'password222','2019-03-22');



INSERT INTO Admin (email, mdp) VALUES ('admin@gmail.com', 'admin');


INSERT INTO CategorieProduit (typeCategorie) VALUES ('Electronique');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Oeuvres darts');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Bijoux');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Livres');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Objets de Collection');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Vêtements');


INSERT INTO Produit (nomProduit,description,prix,numero_serie,DateSortie,Etat,Provenance,idCategorieProduit) VALUES ('IPHONE 14','le tout nouveau produit de Apple. Elle très puissante',2000,'IPH-OLED-001','2020-10-09',9,'France',1);
INSERT INTO Produit (nomProduit,description,prix,numero_serie,DateSortie,Etat,Provenance,idCategorieProduit) VALUES ('Asus ROG Strix','Un ordinateur avec un processeur rapide',600,'LAP-I7-16G-020','2019-11-07',10,'Canada',1);
INSERT INTO Produit (nomProduit,description,prix,numero_serie,DateSortie,Etat,Provenance,idCategorieProduit) VALUES ('Batterie Panneau Solaire','Une batterie haut de gamme avec une capacité de rechargement rapide',500,'BT-004-6G','2022-05-04',10,'Belgique',1);


------

INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Tableau', 'Un magnifique tableau de style impressionniste', 500.0, 'A001','2021-04-10',10,'Madagascar',2);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Sculpture', 'Une sculpture en marbre de style classique', 2000.0, 'S001','2022-02-22',10,'Madagascar',2);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Peinture', 'Une peinture à l''huile de style abstrait', 800.0, 'P001','2022-08-07',10,'Madagascar',2);

--------

INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Collier', 'Un collier en argent avec pierre précieuse', 100.0, 'C001','2022-11-08',8,'Dubai',3);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Bague', 'Une bague en or avec diamant', 500.0, 'B001','2022-07-09',9,'Chine',3);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Bracelet', 'Un bracelet en perles', 150.0, 'BR001','2022-03-23',10,'France',3);



insert into PourcentagePrelevee(pourcentage) values (12.5);


INSERT INTO Enchere (idUtilisateur, description, prixMinimumVente,durreEnchere) 
VALUES (1, 'Enchere pour un iPhone', 700,30);
INSERT INTO Enchere (idUtilisateur, description, prixMinimumVente,durreEnchere)  
VALUES (2, 'Enchere pour une chemise',300,40);


INSERT INTO Produit_Enchere (idEnchere, idProduit) VALUES (1, 1);
INSERT INTO Produit_Enchere (idEnchere, idProduit) VALUES (2, 4);
INSERT INTO Produit_Enchere (idEnchere, idProduit) VALUES (2, 5);

INSERT INTO HistoriqueOffre (idEnchere, idUtilisateur, montant_offre) VALUES (1, 1, 750);
INSERT INTO HistoriqueOffre (idEnchere, idUtilisateur, montant_offre) VALUES (1, 2, 800);
INSERT INTO HistoriqueOffre (idEnchere, idUtilisateur, montant_offre) VALUES (2, 2,600);
INSERT INTO HistoriqueOffre (idEnchere, idUtilisateur, montant_offre) VALUES (2, 1,900);


insert into RechargementCompte(idUtilisateur,montant) values (1,300) , (1,400) ;
