use Biblio_sacha;

insert into Auteur (num_auteur, nom, adresse) values 
	('H', 'Hakim', 'Rue 123'),
	('M', 'Moujarrib', 'Rue 456'),
	('N', 'Neferiti', 'Rue 789'),
	('R', 'Ramsis', 'Rue 101'),
	('T', 'Tafih', 'Rue 102');

insert into
	Theme (num_theme, intitule_theme) 
values 
	('Eco', 'Economie'),
	('Info', 'Informatique'),
	('Math', 'Mathématiques'),
	('Div', 'Divers');
    

insert 
	Editeur(num_editeur, nom, adresse)
values 
	('DAO', 'Dar Al-Oujoum', 'rue abc'),
	('NP', 'Nul Part', 'Av DEF'),
	('PLB', 'Pour les Bêtes', 'RUE GHI');
    
insert into
	etudiant(num_etudiant, nom, prenom, age, tel, ville) 
values
	(50, 'Kaslani', 'Kassoul', 28, '065555555', 'Tanger'),
	(51, 'Kaslani', 'Kassoula', 27, '065555556', 'Tanger'),
	(100, 'Abbassi', 'Abbass', 23, '070000607', 'Tanger'),
	(101, 'Kaddouri', 'Kaddour', 24, '077777700', 'Chefchaouen'),
	(102, 'Jallouli', 'Jalloul', 23, '066666660', 'Tétouan'),
	(103, 'Ayyachi', 'Aicha', 22, NULL, 'Tétouan'),
	(113, 'Slaoui', 'Salwa', 21, '060000001', 'Tanger'),
	(202, 'Khaldouni', 'Khalid', 22, '060000002', 'Tanger'),
	(309, 'Karimi', 'Karim', 20, '066600005', 'Casa'),
	(310, 'Karimi', 'Karima', 20, NULL, 'Casa'),
	(567, 'Moussaoui', 'Moussa', 21, '050070070', 'Tanger'),
	(580, 'Moussi', 'Moussa', 22, NULL, 'Casa'),
	(998, 'Moujtahida', 'Moujidda', 21, NULL, 'Tanger'),
	(999, 'Moujtahid', 'Moujidd', 21, NULL, 'Tanger');

alter table Livre
modify date_edition date;	

alter table Livre
modify titre varchar(100) not null;	

insert into Livre
	(num_livre, titre, num_auteur, num_editeur, num_theme, date_edition)
values
	('BD1', 'Comment avoir 20 en BD', 'R', 'NP', 'Info', '2015-01-01'),
	('BD2', 'Tout sur les BD', 'N', 'NP', 'Info', '2014-12-01'),
	('BD3', 'Maitriser les BD', 'R', 'NP', 'Info', '2014-07-07'),
	('BD4', 'SGBD Relationnels', 'R', 'DAO', 'Info', '2014-01-01'),
	('BD5', 'SI et BD', 'N', 'DAO', 'Info', '2003-02-04'),
	('BD6', 'Les BD : Pour les nuls', 'R', 'NP', 'Info', '2014-01-01'),
	('ECO1', 'L''économie du Maroc en l''an 3050', 'M', 'DAO', 'Eco', '2015-04-01'),
	('Math1', 'Algèbre', 'H', 'NP', 'Math', '2014-09-02'),
	('Math2', 'Analyse', 'H', 'NP', 'Math', '2014-08-02'),
	('Math3', 'Algèbre linéaire', 'H', 'DAO', 'Math', '2015-08-02'),
	('Math4', 'Aimer les Maths', 'M', 'NP', 'Math', '2014-08-04'),
	('SE1', 'Systèmes d\'exploitation', 'R', 'NP', 'Info', '2003-08-06'),
	('SE2', 'Maitriser UNIX', 'R', 'DAO', 'Info', '2002-10-02'),
	('SE3', 'Tout sur les SE', 'N', 'NP', 'Info', '2001-08-07'),
	('TW1', 'Histoire', 'T', 'PLB', 'Div', NULL),
	('TW2', 'Personnes fameuses', 'T', 'PLB', 'Div', NULL),
	('TW3', 'Comment devenir un bon joueur en 5 jours et sans coach', 'T', 'PLB', 'Div', NULL);

select
	nom,
    prenom,
    age,
    ville
from Etudiant
where age > 21
order by nom asc, age desc;


select 
    a.nom as AuteurNom, 
    l.titre as TitreLivre, 
    p.date_pret 
from 
    Auteur a
join 
    Livre l on a.num_auteur = l.num_auteur
join 
    Pret p on l.num_livre = p.num_livre
where 
    p.rendu = FALSE
order by 
    a.nom ASC, p.date_pret;

-- RequêteLDD2
create table Professeur (
    cin numeric primary key,
    nom varchar(20) not null,
    prenom varchar(20) not null,
    adresse text
);

# khasna nruniw hadchi d professeur kaml
-- RequêteLDD3
alter table Professeur
add constraint unique_nom_prenom unique (nom, prenom);

-- RequêteLDD4
alter table Professeur
add email varchar(10);

-- RequêteLDD5
alter table Professeur
modify email varchar(50);

-- RequêteLDD6
alter table Professeur
drop column email;

-- RequêteLDD7
drop table Professeur;

-- RequeteLMD1
insert into Etudiant (num_etudiant, nom, prenom, age, tel, ville) 
values (1001, 'Hammadi', 'Hamada', 25, '061111111', 'Casa'),
       (1002, 'Tahiri', 'Tahir', 24, '066666600', 'Tanger');
       
-- RequeteLMD2
insert into Etudiant (num_etudiant, nom, prenom, age, ville) 
values (1003, 'Sallami', 'Salma', 26, 'Tanger'),
       (1004, 'Mimouni', 'Mimoun', 23, 'Casa');

-- Requête LMD3
update Etudiant e
join (
    select num_etudiant 
    from Etudiant 
    where ville = 'Casa' 
) as v on e.num_etudiant = v.num_etudiant
set e.ville = 'Casablanca';


-- Requête LMD4
update Etudiant
set age = age + 1
where num_etudiant > 1000;


#khasna nrunnewha 3la hssab rapport
-- Requête LMD5
delete from Etudiant
where num_etudiant > 1000;

-- Requête 7
SELECT nom, prenom, ville AS adresse
FROM Etudiant
WHERE nom = 'Moujtahid';


-- Requête 8
select titre
from Livre
where num_auteur = 'R';

-- Requête 9
select L.titre
from Livre L
join Auteur A on L.num_auteur = A.num_auteur
where A.nom = 'Ramsis';

-- Requête 10
select num_auteur
from Livre
where titre = 'Comment avoir 20 en BD';

-- Requête 11
select A.nom, A.adresse
from Livre L
join Auteur A on L.num_auteur = A.num_auteur
where L.titre = 'Comment avoir 20 en BD';

-- Requête 12
select L.titre
from Livre L
join Editeur E on L.num_editeur = E.num_editeur
where E.nom = 'Nul Part' and L.num_auteur = (select num_auteur from Auteur where nom = 'Ramsis');

-- Requête 13
select L.titre
from Livre L
join Auteur A on L.num_auteur = A.num_auteur
where A.nom in ('Ramsis', 'Neferiti');

-- Requête 14
select distinct T.intitule_theme
from Livre L
join Theme T on L.num_theme = T.num_theme
join Editeur E on L.num_editeur = E.num_editeur
where E.nom = 'Nul Part';

-- Requête 15
select T.intitule_theme, E.nom AS editeur
from Livre L
join Theme T on L.num_theme = T.num_theme
join Editeur E on L.num_editeur = E.num_editeur;

-- Requête 16
select L.titre
from Livre L
join Pret P on L.num_livre = P.num_livre
where L.num_auteur = (select num_auteur from Auteur where nom = 'Ramsis') and P.num_etudiant = (select num_etudiant from Etudiant where nom = 'Moujtahid');

-- Requête 17
select L.titre
from Livre L
left join Pret P on L.num_livre = P.num_livre
where P.num_livre is null;

-- Requête 18
select L.titre
from Livre L
left join Pret P on L.num_livre = P.num_livre
where L.num_auteur = (select num_auteur from Auteur where nom = 'Ramsis');

-- Requête 19
select L.titre, T.intitule_theme
from Livre L
join Pret P on L.num_livre = P.num_livre
join Theme T on L.num_theme = T.num_theme
where P.num_etudiant in (select num_etudiant from Etudiant where nom like '%Moujtahid%');

-- Requête 20
select L.titre, T.intitule_theme, E.nom AS EditeurNom
from Livre L
join Pret P on L.num_livre = P.num_livre
join Theme T on L.num_theme = T.num_theme
join Editeur E on L.num_editeur = E.num_editeur
where P.num_etudiant in (
    select num_etudiant
    from Etudiant
    where nom like '%Moujtahid%'
);

-- Requête 21
select distinct T.intitule_theme
from Theme T
where not exists (
    select 1
    from Pret P
    join Livre L on P.num_livre = L.num_livre
    where L.num_theme = T.num_theme and P.num_etudiant = 999
);

-- Requête 22
select L.titre, P.date_pret
from Pret P
join Livre L on P.num_livre = L.num_livre
join Etudiant E on P.num_etudiant = E.num_etudiant
where E.nom like '%Kaslani%';

-- Requête 23
select L.titre, E.nom AS Emprunteur, P.date_pret
FROM Pret P
JOIN Livre L ON P.num_livre = L.num_livre
JOIN Etudiant E ON P.num_etudiant = E.num_etudiant
WHERE P.rendu = FALSE
ORDER BY P.date_pret ASC
LIMIT 1;

-- Requête 24
select L.titre, A.nom AS AuteurNom, E.nom AS EditeurNom, T.intitule_theme
from Livre L
join Auteur A on L.num_auteur = A.num_auteur
join Editeur E on L.num_editeur = E.num_editeur
join Theme T on L.num_theme = T.num_theme;

-- Requête 25
select L.titre
from Pret P
join Livre L on P.num_livre = L.num_livre
where P.date_pret between '2015-01-01' and '2015-05-31';

-- Requête 26
select titre
from Livre
where titre like '%BD%';

-- Requête 27
select A.nom, count(L.num_livre) AS NombreLivres
from Auteur A
join Livre L on A.num_auteur = L.num_auteur
group by A.nom;

-- Requête 28
select ville, avg(age) as AgeMoyen
from Etudiant
group by  ville;

-- Requête 29
select L.titre, count(*) as NombreEmprunts
from Pret P
join Livre L on P.num_livre = L.num_livre
group by  L.titre
having count(*) > 3;

-- Requête 30
select L.titre, count(*) as NombreEmprunts
from Pret P
join Livre L on P.num_livre = L.num_livre
where P.rendu = false
group by L.Titre
having count(*) > 3;

-- Requête 31
select L.titre, count(*) as NombreEmprunts
from Pret P
join Livre L on P.num_livre = L.num_livre
where L.num_auteur = (SELECT num_auteur from Auteur where nom = 'Ramsis')
group by L.titre
having count(*) > 4;

-- Requête 32
select E.num_etudiant, E.nom, count(distinct P.num_livre) AS NombreLivres
from Pret P
join Etudiant E on P.num_etudiant = E.num_etudiant
where year(P.date_pret) = 2015 and E.age < 23
group by E.num_etudiant, E.nom
having count(distinct P.num_livre) > 3;



