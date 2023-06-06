--Criando uma nova tabela e com a utilização de constraint's. A chave primaria
-- trata de um conceito em que define que um ou mais determinado campo se torne identificado unico para algum tipo
-- de entidade (clients, funcionarios, etc).
--Além disso, a chave-primária possibilita
-- criar consistencia entre os relacionamentos entre tabelas
create table funcionario(
	codf int,
	nome varchar(30),
	cidade varchar(40),
	salario real,
	horas int,
	constraint pk_funcionario 
		PRIMARY KEY(codf)
);

select * from funcionario;

insert into funcionario values(
 1,'Bruno','Votuporanga',2000,40
);


insert into funcionario values(
 2,'Gabriela','Jales',2300,20
);


--EX-02
create table paciente(
	codPaciente int,
	Nome varchar(50),
	Cidade varchar(40),
	Estado char(2),
	Tratamento varchar(50),
	constraint pk_paciente 
		PRIMARY KEY(codPaciente)
);
insert into funcionario values(
 111,'Claudio Henrique','São Paulo','SP','Cardiovascular'
),
(
	112,'Maria Helena','Votuporanga','SP','Oftamologia'
),
(
	113,'Jorge Silva','Cardoso','SP','Otorino'
),
(
	114,'Clara Magalhães','Parisi','SP','Oftamologia'
),
(
	115,'Pedro Vieira','Votuporanga','SP','Osteopatia'
),


