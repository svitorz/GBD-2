create table MARCAS(
	CodigoM int not null,
	NomeM varchar(40),
	PaisOrigem varchar(40),
	constraint pk_MARCAS primary key
	(CodigoM)
);

insert into MARCAS values
(1014,'Audi','Alemanha')
,
(1012,'VolksWagen','Brasil'),
(1013,'Fiat','Brasil'),
(1015,'Chevrolet','Brasil'),
(1016,'Chevrolet','USA');

select * from MARCAS;

-- recriando-a com chave estrangeira.
	create table MODELOS(
	CodigoMo int not null,
	NomeMo varchar(20),
	TipoMo varchar(10),
	CorMo varchar(20),
	CodigoM int,
	constraint pk_MODELOS primary key (CodigoMo),
	constraint fk_MODELOS_MARCAS 
		foreign key(CodigoM) 
			references Marcas(CodigoM)
);


insert into MODELOS values
(101,'Gol','GT','Cinza',1012),
(102,'Pálio','XS','Preto',1013),
(103,'Zafira','GLS','Verde',1015),
(104,'Linea','GL','Cinza',1013),
(105,'A3','GT','Preto',1014),
(106,'Polo','GL','Cinza',1012),
(107,'Taurus','XLS','Preto',1016);

select * from MODELOS;

select nomem,nomemo 
	from modelos, marcas
	where modelos.nomemo='A3' and modelos.codigom=marcas.codigom;
	
delete from marcas where nomem='Audi';	

select Marcas.PaisOrigem,modelos.NomeMo,modelos.CorMo
	from Marcas inner join Modelos
	on Modelos.CodigoM = Marcas.CodigoM
	where modelos.CorMo = 'Cinza';
	
	--QUal o nome da marca Zafira?
	select modelos.nomemo,marcas.nomem
	from modelos inner join marcas
	on modelos.codigom=marcas.codigom
	where modelos.nomemo='Zafira';
	
	--Qual o país que fabrica o carro A3?
	
	select marcas.PaisOrigem, marcas.NomeM
	from modelos inner join marcas 
	on modelos.CodigoM=marcas.CodigoM
	where modelos.NomeMo='A3';
	
	
	-- qual o nome dos carros que a Fiat produz?
	
	select marcas.nomem, modelos.nomemo
	from marcas inner join modelos
	on modelos.codigom=marcas.codigom
	where marcas.nomem='Fiat';
	
	--Qual a cor do carro que o tipo de modelo
	--XS? Qual a marca dele?
	select marcas.nomem, modelos.cormo
	from marcas inner join modelos
	on modelos.codigom=marcas.codigom
	where modelos.tipomo='XS';
	
	--Qual o nome do modelos e o nome da marca doss carros de cor preta?
	
	select marcas.nomem, modelos.nomemo, modelos.cormo
	from marcas inner join modelos
	on modelos.codigom=marcas.codigom
	where modelos.cormo='Preto';
	
	--quais os carros que a Chevrolet do Brasil fabrica?
	select marcas.nomem, marcas.paisorigem, modelos.nomemo
	from marcas inner join modelos
	on modelos.codigom=marcas.codigom
	where marcas.paisorigem='Brasil' and marcas.nomem='Chevrolet';
	
	--a função count() é utilizada o númerode ocorrência que acontece em uma
	-- projeção(Select) 
	-- seu uso é count(nomeDoCampo)
	--Então vmamos perguntar quantos modelos
	--possuem a cor preta
	select count(nomemo) as "Número de modelos"
	from modelos
	where cormo='Preto';


	--Quanros carros são montados pela VolksWagem?
	--utilize a função count()
	select count(nomem) as "Número de modelos"
	from marcas
	where nomem='VolksWagen';