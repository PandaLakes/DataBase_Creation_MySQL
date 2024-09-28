create database Biblio_sacha;
use Biblio_sacha;

create table Etudiant(
	num_etudiant int,
    nom varchar(30) not null,
    prenom varchar(30) not null,
    age int,
    ville varchar(20),
    tel varchar(20)
);

alter table etudiant
modify ville varchar(30) not null;

alter table etudiant add constraint pk primary key (num_etudiant);


create table Livre(
	num_livre varchar(10) primary key,
    titre varchar(50) not null,
    num_auteur varchar(10) not null,
    num_editeur varchar(10) not null,
    num_theme varchar(10) not null,
    date_edition date not null
);

create table Auteur(
	num_auteur varchar(10) primary key,
    nom varchar(30) not null,
    adresse varchar(50)
);

create table Editeur(
	num_editeur varchar(10) primary key,
    nom varchar(30) not null,
    adresse varchar(50)
);

show create table Auteur;
show create table Editeur;

alter table Livre
add constraint FK_Livre_Auteur
foreign key (num_auteur) references Auteur (num_auteur)
on delete cascade
on update cascade;

alter table Livre
add constraint FK_Livre_Editeur
foreign key (num_editeur) references Editeur (num_editeur)
on delete cascade
on update cascade;

select
	table_name,
    constraint_name,
    column_name,
    referenced_table_name,
    referenced_column_name
from information_schema.key_column_usage
where table_name = 'Livre' and table_schema = 'Biblio_sacha';

create table Theme(
	num_theme varchar(10) primary key,
    intitule_theme varchar(20) not null
);

create table Pret(
	num_etudiant int,
    num_livre varchar(10),
    date_pret date,
    rendu boolean default false,
    date_retour date,
    primary key (num_etudiant, num_livre, date_pret),
    constraint fk_pret_etudiant foreign key (num_etudiant) references Etudiant (num_etudiant),
    constraint fk_pret_livre foreign key (num_livre) references Livre (num_livre)
);

alter table pret
add constraint uq_pret_uniquedate
unique (num_livre, date_pret);

alter table pret
add constraint uq_numlivre_rendu_date_retour unique (num_livre, rendu, date_retour);


show index from pret;

alter table Etudiant
add constraint chq_age check (age between 15 and 30);

alter table Pret
add constraint CHK_Pret_DateRetour
check (date_retour is null or (date_retour >= date_pret and rendu));


insert into Editeur(num_editeur, nom, adresse) values ("E001", "jiji", "");
insert into Auteur(num_auteur, nom, adresse) values ("A001", "AKIRA TORIYAMA", "");
insert into Theme(num_theme, intitule_theme) values ("T001", "shonen");
insert into livre (num_livre, titre, num_auteur, num_editeur, num_theme, date_edition) values ('L001', "Dragon ball", "A001", "E001", "T001", '2023-04-30');
insert into Etudiant (num_etudiant, nom, prenom, age, tel, ville) values (1, 'SACHA', 'ILYAS', 18, '1234567890', 'Paris');

insert into Pret (num_etudiant, num_livre, date_pret, rendu, date_retour) values  (1, 'L001', '2024-03-01', true, '2024-04-30');



