\c postgres;
drop database enchere;
create database enchere;
\c enchere


create sequence sqtokenadmin;
create sequence sqtokenuser;



create table Utilisateur(
idUtilisateur serial primary key,
nom varchar(20),
prenom varchar(20),
email varchar(30),
mdp varchar(20),
DateInscription date default CURRENT_DATE,
compte float default 0
);

create table Admin(
idAdmin serial primary key,    
email varchar(20),
mdp varchar(20)
);

create table RechargementCompte(
idRechargementCompte serial primary key,    
idUtilisateur int references Utilisateur(idUtilisateur),
montant float,
DateHeureRechargement TIMESTAMP default CURRENT_TIMESTAMP ,
estValider int default 0
);

create table CategorieProduit(
idCategorieProduit serial primary key,
typeCategorie text
);


create table Produit(
idProduit serial primary key,
nomProduit varchar(50),
description text,
prix float,
numero_serie varchar(30),
DateSortie date,
Etat varchar(10),
Provenance varchar(10),
idCategorieProduit int REFERENCES CategorieProduit(idCategorieProduit)
);



create table Enchere(
idEnchere serial primary key,
idUtilisateur int references Utilisateur(idUtilisateur),
description text,
prixMinimumVente float,
durreEnchere int,
DateHeureEnchere TIMESTAMP default CURRENT_TIMESTAMP,
status int default 0
);


create table Photo_Produit(
idProduit int references Produit(idProduit),
photo text
);


create table Produit_Enchere(
idEnchere int references Enchere(idEnchere),
idProduit int references Produit(idProduit)
);


create table HistoriqueOffre(
idHistoriqueOffre serial primary key,
idEnchere int references Enchere(idEnchere),
idUtilisateur int references Utilisateur(idUtilisateur),
montant_offre float,
DateHeureOffre TIMESTAMP default CURRENT_TIMESTAMP
);



create table PourcentagePrelevee(
pourcentage float
);


create table PrelevementEnchere(
idPrelevement serial primary key,
idEnchere int references Enchere(idEnchere),
montant float,
DatePrelevement DATE default CURRENT_DATE
);

create table tokenAdmin(
idtokenadmin varchar(10) primary key not null default 'tokena'||nextval('sqtokenadmin'),
idadmin int references Admin(idAdmin),
token varchar(100),
datecreation date,
dateexpiration date,
role varchar(10)
);

create table tokenUser(
idtokenuser varchar(10) primary key not null default 'tokena'||nextval('sqtokenuser'),
idUtilisateur int references Utilisateur(idUtilisateur),    
token varchar(100),
datecreation date,
dateexpiration date,
role varchar(15)
);


----view categorie Produit Vendu----
create or replace view categorieProduitVendu as  
WITH all_categories AS (SELECT idCategorieProduit FROM CategorieProduit)
SELECT cp2.idCategorieProduit, cp2.typeCategorie , COUNT(re.idEnchere) as total_produit_vendu
FROM all_categories cp
LEFT JOIN Produit p 
using(idCategorieProduit)
LEFT JOIN Produit_Enchere pe 
using(idProduit)
LEFT JOIN Enchere e 
using(idEnchere)
LEFT JOIN ResultatEnchere re 
ON re.idEnchere = e.idEnchere AND re.idEnchere = pe.idEnchere
LEFT JOIN CategorieProduit cp2
ON cp2.idCategorieProduit = cp.idCategorieProduit
GROUP BY cp2.idCategorieProduit,cp2.typeCategorie order by COUNT(re.idEnchere) desc;


-----view statistique client----
create or replace view StatClient as
WITH all_utilisateurs AS ( SELECT idUtilisateur FROM utilisateur)
SELECT cp2.nom ,cp2.prenom , cp2.idUtilisateur , COUNT(e.idUtilisateur) as nombre_produit_vendu
FROM all_utilisateurs cp
LEFT JOIN Enchere e 
using(idUtilisateur)
LEFT JOIN utilisateur cp2
ON cp2.idUtilisateur = cp.idUtilisateur
GROUP BY cp2.idUtilisateur order by COUNT(e.idUtilisateur) desc;

-----view categorie produit-----
create or replace view ProduitCategorie as
select p.idProduit , p.nomProduit , p.description , p.prix , p.numero_serie , p.DateSortie , p.Etat , p.Provenance , c.idCategorieProduit , c.typeCategorie  from Produit p inner join CategorieProduit c using(idCategorieProduit);



----view total_membre----
create or replace view v_total_membre as
select count(idUtilisateur) as nombre , extract(year from DateInscription) as annee , extract(month from DateInscription) as mois, extract(day from DateInscription) as jour from Utilisateur group by
extract(year from DateInscription) , extract(month from DateInscription) , extract(day from DateInscription);


--- chiffre d'affaire par annee , mois ----
create or replace view chiffreAffaire as
SELECT idenchere, SUM(montant) AS montant_total, DATE(dateprelevement) AS date 
FROM prelevementenchere
GROUP BY idenchere, DATE(dateprelevement);


create or replace view enchereUser as 
select e.idenchere , e.idutilisateur , e.description , e.prixMinimumVente , e.durreenchere , e.DateHeureEnchere , e.status , p.nomProduit , p.description as descProduit , cp.typecategorie from enchere e  join produit_enchere pe using(idenchere) join produit p using(idproduit) join CategorieProduit cp using(idCategorieProduit);



create or replace view graphe as 
SELECT CategorieProduit.typeCategorie, COALESCE(SUM(HistoriqueOffre.montant_offre), 0) as montant_total
FROM CategorieProduit
LEFT JOIN Produit ON Produit.idCategorieProduit = CategorieProduit.idCategorieProduit
LEFT JOIN Produit_Enchere ON Produit_Enchere.idProduit = Produit.idProduit
LEFT JOIN Enchere ON Enchere.idEnchere = Produit_Enchere.idEnchere
LEFT JOIN HistoriqueOffre ON HistoriqueOffre.idEnchere = Enchere.idEnchere
GROUP BY CategorieProduit.typeCategorie;



create or replace view fiche_enchere as 
select e.idenchere,e.idutilisateur,u.nom,u.prenom,e.description,e.prixminimumvente,e.durreenchere,e.dateheureenchere,(e.dateheureenchere + e.durreenchere * INTERVAL '1 minute') AS dateheurefin , p.nomProduit , pp.photo , cp.typeCategorie , e.status from utilisateur u join enchere e using(idutilisateur) join produit_enchere pe using(idenchere) join produit p using(idproduit) join photo_produit pp using(idproduit) join CategorieProduit cp using(idCategorieProduit);



create or replace view ResultatEnchere as
SELECT h1.idenchere as idEnchere, h2.idutilisateur as idUtilisateur, h1.montant_offre as prix_gagnant,h2.dateheureoffre
as DateHeureGagnat FROM historiqueoffre h1
INNER JOIN historiqueoffre h2 ON h1.idenchere=h2.idenchere and h1.montant_offre=h2.montant_offre 
WHERE h1.montant_offre = (SELECT MAX(montant_offre) FROM historiqueoffre h3 WHERE h1.idenchere = h3.idenchere)
GROUP BY h1.idenchere, h1.montant_offre, h2.idutilisateur, h2.dateheureoffre;


create or replace view ResultatEnchereFinal as
SELECT h1.idenchere as idEnchere, u.idutilisateur as idUtilisateur,u.nom,u.prenom,h1.montant_offre as prix_gagnant, h2.dateheureoffre as DateHeureGagnat
FROM historiqueoffre h1
INNER JOIN (SELECT idenchere, max(montant_offre) as max_montant_offre FROM historiqueoffre GROUP BY idenchere) h3 
ON h1.idenchere = h3.idenchere AND h1.montant_offre = h3.max_montant_offre
INNER JOIN historiqueoffre h2 ON h1.idenchere = h2.idenchere AND h1.montant_offre = h2.montant_offre
INNER JOIN utilisateur u ON h2.idutilisateur = u.idutilisateur;
