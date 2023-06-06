create table MARCAS(
	CodigoM int not null,
	NomeM varchar(40),
	PaisOrigem varchar(40),
	constraint pk_MARCAS primary key
	(CodigoM)
);

insert into MARCAS values
(1012,'VolksWagen','Brasil'),
(1013,'Fiat','Brasil'),
(1014,'Audi','Alemanha'),
(1015,'Chevrolet','Brasil'),
(1016,'Chevrolet','USA');

select * from MARCAS;

create table MODELOS(
CodigoMo int not null,
NomeMo varchar(20),
	TipoMo varchar(10),
	CorMo varchar(20),
	CodigoM int,
	constraint pk_MODELOS primary key (CodigoMo)
);

select * from MODELOS;

insert into MODELOS values
(101,'Gol','GT','Cinza',1012),
(102,'Pálio','XS','Preto',1013),
(103,'Zafira','GLS','Verde',1015),
(104,'Linea','GL','Cinza',1013),
(105,'A3','GT','Preto',1014),
(106,'Polo','GL','Cinza',1012),
(107,'Taurus','XLS','Preto',1016);

select NomeMo,CorMo from MODELOS
where NomeMo = 'Zafira';

select NomeMo,TipoMo from MODELOS
where NomeMo = 'Taurus';

select NomeM,PaisOrigem from MARCAS
where NomeM = 'VolksWagen';

select NomeM, PaisOrigem from MARCAS 
where PaisOrigem = 'USA';

select NomeMo,CodigoMo from MODELOS
where NomeMo = 'Pálio';

select NomeMo,CorMo from MODELOS 
where CorMo = 'Preto';
