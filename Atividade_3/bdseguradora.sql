use bdseguradora;
select *from pessoas;
#a
select nome from pessoas where endereco like  "rua das acácias";
#b
select nome from pessoas where nome like  "Maria%";
#c
select nome from pessoas where nome like  "%Silva%";
#d
select distinct nome from pessoas;
#e
select nome from proprietarios,pessoas where idpessoa=fk_idPessoa;
#f
select * from automoveis where ano>=2000 and ano<=2010;
#g
select  nome, modelo from proprietarios,pessoas, automoveis where  idpessoa=fk_idpessoa and fk_licenca=licenca order by nome asc;
#h
select  nome, modelo from proprietarios,pessoas, automoveis where  idpessoa=fk_idpessoa and fk_licenca=licenca  and ano>=2010 order by nome asc;
#i
select nome from pessoas, acidentes where fk_idPessoa = idpessoa;
#j
select nome, data from pessoas, acidentes where data >='2011-01-01' and data >='2011-12-31' and idpessoa=fk_idPessoa;
#k
select nome, totalDanos from pessoas, acidentes where totalDanos<1000 and idpessoa=fk_idPessoa;
#l
select nome, totalDanos from pessoas, acidentes where totalDanos>1000 and totalDanos<3000 and idpessoa=fk_idPessoa;
#m
select modelo from automoveis, sinistros where fk_licenca=licenca;
#n
select * from automoveis order by ano asc;
#o
select * from automoveis where ano>=2005 and ano<=2010;


