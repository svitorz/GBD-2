create table PRODUTOS(
	codprod int not null,
 	nomeprod varchar(50),
	preco real,
	codcat int not null,
	constraint pk_func primary key 
	(codprod),
	constraint fk_PRODUTOS_CATEGORIAS  
	foreign key (codcat)
		references CATEGORIAS(codcat) 
);

create table CATEGORIAS(
	codcat int not null,
	descricao varchar(40),
	codfor int not null,
	constraint pk_categorias primary key
	(codcat),
	constraint fk_CATEGORIAS_FORNECEDORES
		foreign key (codfor)
		references FORNECEDORES(codfor)
);

create table FORNECEDORES(
codfor int not null,
fornecedor varchar(50),
			constraint pk_fornecedores primary key (codfor)
);

insert into PRODUTOS values
	(1,'Feijão Tia Maria',14.00,101),
	(2,'Arroz Solthim',9.00,101),
	(3,'Coca-Cola',7.00,102),
	(4,'Shampo Jubba',19.55,104),
	(5,'Bolacha Dabboa',8.70,103),
	(6,'Bombom Dobhom',15.00,103),
	(7,'Sabonete Xerobom',3.99,104),
	(8,'Desinfetante',5.00,105),
	(9,'Banana',3.00,106),
	(10,'Coco da bahia',6.50,106);

insert into CATEGORIAS values
	(101,'Cereal',204),
	(102,'Refrigerante',200),
	(103,'Doces',203),
	(104,'Cosméticos',201),
	(105,'Higiene',201),
	(106,'Frutas',205);

insert into FORNECEDORES values 
(200,'Bomdiapreço'),
(201,'Temditudo'),
(203,'Sodubom'),
(204,'Fhrescou'),
(205,'Darozza');

	select * from PRODUTOS;
	select * from FORNECEDORES;
	select * from CATEGORIAS;
	
	--Exercícios:
	
	--Mostre o preço do Arroz Solthim (nomeproduto) e o seu fornecedor (JEITO 1)

select PRODUTOS.preco,PRODUTOS.nomeprod,FORNECEDORES.fornecedor	
	from PRODUTOS,CATEGORIAS,FORNECEDORES
		where PRODUTOS.codcat=CATEGORIAS.codcat AND CATEGORIAS.codfor=FORNECEDORES.codfor
		and PRODUTOS.nomeprod = 'Arroz Solthim';
		
		
	--Mostre o preço do feijão Tio João (nomeproduto) e a sua categoria. (JEITO 2)
	select f.fornecedor,p.nomeprod
	from FORNECEDORES f inner join CATEGORIAS c
	on f.codfor=c.codfor inner join PRODUTOS p
	on p.codcat=c.codcat
	where p.nomeprod='Feijão Tia Maria';
	
	--Mostre o nome dos produtos que custam mais que 3 reais
	select nomeprod,preco 
	from PRODUTOS
	where preco > 3.00;
	
	-- Mostre o nome dos produtos que custam menos de 5 reais e o nome de suas
	-- categorias
		select c.descricao,p.nomeprod,p.preco
	from FORNECEDORES f inner join CATEGORIAS c
	on f.codfor=c.codfor inner join PRODUTOS p
	on p.codcat=c.codcat
	where p.preco < 5;
	
	--Mostre o nome da categoria do Bombom DoBhom (nomeproduto) e o seu preço
	select c.descricao,p.nomeprod,p.preco
	from FORNECEDORES f inner join CATEGORIAS c
	on f.codfor=c.codfor inner join PRODUTOS p
	on p.codcat=c.codcat
	where p.nomeprod='Bombom Dobhom';
	
		--Mostre o nome da categoria da Coca-Cola (nomeproduto).
	select c.descricao,p.nomeprod,p.preco
	from FORNECEDORES f inner join CATEGORIAS c
	on f.codfor=c.codfor inner join PRODUTOS p
	on p.codcat=c.codcat
	where p.nomeprod='Coca-Cola';
	
	
	-- Quem é o fornecedor das batata?
		select f.fornecedor,p.nomeprod
	from FORNECEDORES f inner join CATEGORIAS c
	on f.codfor=c.codfor inner join PRODUTOS p
	on p.codcat=c.codcat
	where p.nomeprod='Batatas';
	
	--  Quanto uma pessoa gastaria se comprasse um item de cada?
	SELECT SUM(preco) from PRODUTOS;