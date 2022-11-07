create database if not exists BDSeguradora3;
use BDSeguradora3;

#Criando tabelas
create table if not exists pessoas(
idpessoa int not null auto_increment primary key,
nome varchar(200) not null,
endereco varchar(200) not null
);

create table if not exists proprietarios(
idpessoa int not null,
licenca int not null primary key,
foreign key(idpessoa) references pessoas(idpessoa)
);
create table if not exists automoveis(
licenca int not null primary key,
ano  int not null,
modelo varchar(100),
foreign key(licenca) references proprietarios(licenca)
);
create table if not exists acidentes(
idpessoa int not null,
data date not null primary key,
totalDanos double not null,
foreign key (idpessoa) references pessoas(idpessoa)
);



/*Adicionando colunas*/
alter table pessoas add cpf varchar(11) not null;
alter table pessoas add sexo varchar(1) not null;
alter table automoveis add placa varchar(7) not null;

/*Adicionando pessoas*/
insert into pessoas (nome, endereco,cpf,sexo) values
('Paulo C.', 'Rua dois irmão', '12345678901', 'M'),
('Fí do Zeca', 'Rua santa Maria','19374638439','M'),
('Zeca', 'Av. Principal','49903930994','F'),
('Sem nome', 'Rua da ladeira','74348794690','M'),
('Fulana', 'Rua da Vida', '52092625290','F');

/*Adicionando proprietarios*/
insert into proprietarios (idpessoa,licenca) values 
(1,'1234567'),
(2, '7349384'),
(3, '9844545'),
(4, '5443553'),
(5,'56544564');


/*Adicionando automoveis*/
insert into automoveis(licenca, ano, modelo, placa)values
('56544564', 2002,'Uno-Fiat','brrn-04'),
('9844545', 2018,'Gol-Volkswagen','brrn-05'),
('5443553', 1995,'Kombi-Volkswagen','brrn-04'),
('1234567', 2010,'Corola-Toyota', 'brrn-04'),
('7349384', 2015,'Civic-Honda', 'brrn-04');

/*Adicionando acidentes*/
insert into acidentes (idpessoa, data, totalDanos) values
(1,"2020-09-03",100.00),
(2,"2014-12-07",50.00),
(3,"2010-10-10",45.00),
(4,"2019-09-01",35.00),
(5,"2013-12-30",95.00)
;

create table if not exists sinistros(
licenca int not null,
data date not null,
idpessoa int not null primary key,

foreign key (idpessoa) references acidentes(idpessoa),
foreign key (data) references acidentes(data),
foreign key (licenca) references automoveis(licenca)

);

/*Adicionando Sinistros*/
insert into sinistros(licenca,data,idpessoa) values
('7349384',"2014-12-07",2),
('1234567',"2020-09-03",1),
('9844545',"2010-10-10",3),
('5443553',"2019-09-01",4),
('56544564',"2013-12-30",5);

select * from automoveis;
select * from proprietarios;
select * from pessoas;
select * from acidentes;
select * from sinistros;