create Database TP_SGBD_sacha;

use TP_SGBD_sacha;
create table Employes (
	num_employe int auto_increment primary key,
    nom varchar(35),
    prenom varchar(35),
    tel varchar(13)
);

insert into 
	Employes (num_employe, nom, prenom, tel) 
values 
	(1112, "son", "goku", "0689754125"),
    (1113, "aimane", "achhab", "0656560565");


create table clients (
	Refclient varchar(20) primary key ,
    nom_ste varchar(50),
    ville varchar(50),
    code_postal varchar(10)
);

insert into 
	clients (Refclient, nom_ste, ville, code_postal) 
values 
	("C1", "Acom", "Tanger", "90000"),
    ("C2", "B2C", "CASA", "40000"),
    ("C3", "Tcom", "Rabat", "40000");
    
create table Commandes (
	Refcom varchar(50) primary key,
    ste varchar(50),
    date date,
    somme decimal(10, 2),
    TVA decimal(5, 2)
);

AlTer table Commandes
add column Refclient char,
add foreign key (Refclient) references clients (Refclient);

alter table Commandes add constraint fk_clt_cmd foreign key (Refclient) references clients (Refclient);

alter table Commandes drop foreign key fk_clt_cmd;

show create table commandes;


select 
	c.nom_ste,
    o.Refcom,
    o.ste,
    o.date,
    o.somme,
    o.tva
from clients c
inner join commandes o
on c.Refclient = o.Refclient
order by c.nom_ste, o.date;



