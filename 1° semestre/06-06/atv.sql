create table EMPREGADO (
nome varchar(40),
RG int,
CIC int not null,
depto int not null,
RG_supervisor int,
salario real,
	constraint pk_empregado PRIMARY KEY(
	RG)
);

create table DEPENDENTES(
rg_r int not null,
nome_d varchar(40),
data_nasc date,
relacao varchar(15),
sexo varchar(30),
	constraint pk_DEPENDENTE PRIMARY KEY(nome_d),
	constraint fk_dependentes_empregado FOREIGN KEY(rg_r)
	references EMPREGADO (RG)
);

DELETE FROM EMPREGADO;

insert into EMPREGADO values 
('João luiz',10101010,11111111,1,null,3000),
('Fernando',20202020,22222222,2,10101010,2500),
('Ricardo',30303030,33333333,2,10101010,2300),
('Jorge',40404040,44444444,2,20202020,4200),
('Renato',50505050,55555555,3,20202020,1300);

insert into DEPENDENTES values
(10101010,'Jorge','27-12-86','Filho','Masculino'),
(10101010,'Luiz','18-11-79','Filho','Masculino'),
(20202020,'Fernanda','14-12-69','Conjuge','Feminino'),
(20202020,'Angelo','10-02-95','Filho','Masculino'),
(30303030,'Andreia','01-05-90','Filho','Feminino');

select * from DEPENDENTES;
select * from EMPREGADO;


-- Mostrar os nomes e relação dos dependentes do Ricardo

select DEPENDENTES.nome_d,DEPENDENTES.relacao
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where EMPREGADO.nome='Ricardo';
			
			
-- Mostrar o nome e a data de nascimento de todos os dependentes que possuem
-- relação do tipo Filho.			
select DEPENDENTES.nome_d,DEPENDENTES.data_nasc
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.relacao='Filho';

--Mostra o nome e o sexo de todos os dependentes que têm como tipo de
--relacionamento “Conjuge”
select DEPENDENTES.nome_d,DEPENDENTES.sexo
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.relacao='Conjuge';
			
--Mostra o nome, rg, cpd e o departamento (depto) de quem tem dependentes
--do tipo filho
select EMPREGADO.nome,EMPREGADO.RG,EMPREGADO.depto,EMPREGADO.CIC
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.relacao='Filho';
			
--Mostrar o nome, relação e sexo dos dependentes do Fernando (utilizar INNER
--JOIN).	
select DEPENDENTES.nome_d,DEPENDENTES.relacao,DEPENDENTES.sexo
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where EMPREGADO.nome='Fernando';

--Qual o empregado responsável por Angelo?
select EMPREGADO.nome
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.nome_d='Angelo';
			
--Qual o salário do responsável por Fernanda?
select EMPREGADO.salario
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.nome_d='Fernanda';
			
--Mostre o nome do funcionário, seu salário e o nome de seus dependentes para 
select EMPREGADO.nome, EMPREGADO.salario,DEPENDENTES.nome_d
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where EMPREGADO.salario>3000;			
			
--Quem é o funcionário que tem como relacionamento um cônjuge? Quanto ele
--ganha?	
select EMPREGADO.nome, EMPREGADO.salario
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.relacao='Conjuge';
			
--Mostra o código e o nome dos dependentes do sexo masculino	
select EMPREGADO.nome, EMPREGADO.rg
	from DEPENDENTES inner join EMPREGADO 
		on DEPENDENTES.rg_r=EMPREGADO.RG 
			where DEPENDENTES.sexo='Masculino';
