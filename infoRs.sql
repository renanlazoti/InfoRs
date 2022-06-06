/**
	Loja De Informática
    @author Renan Lazoti
    version 1.2
*/

create database infoRs;
use infoRs;

create table produtos(
	id int primary key auto_increment,
    produto varchar(100) not null,
    descricao varchar(255) not null,
    fabricante varchar(50) not null,
    datacad timestamp default current_timestamp,
    departamento varchar(50) not null,
    estoque int not null,
    estoquemin int not null,
    localizacao varchar(50),
	custo decimal(10,2) not null,
    lucro decimal(10,2),
    venda decimal(10,2),
    idfor int not null,
    foreign key(idfor) references fornecedores(idfor)
);

-- Relatório de reposição de estoque
select id as ID,produto as Produto,
estoque as Estoque,estoquemin as Estoque_Mínimo
from produtos where estoque < estoquemin;

-- Produtos
insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Pasta Térmica','Pasta térmica Silver','Rise','Coolers',458,20,'Prateleira 3',8.90,100,17.80,1);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('AMD Ryzen 5 4600G', 'Cachê 11MB, 3.7GHz (4.2GHz Max Turbo), AM4, Vídeo Integrado','AMD','Hardwares',10,40,'Prateleira 24',946.90,50,1420.35,1);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Playstation 5','Console Sony','Sony','Consoles',17,35,'Prateleira 52',4499.90,70,7649.83,2);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Cartucho de Tinta','Hp 29875, 667, 2ml, Tri-Color','HP','Impressora',26,8,'Prateleira 48',49.90,100,99.80,1);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Fita para Rotulador','M231 12mm Preto sobre Branco','Brother','Impressora',69,10,'Prateleira 49',59.20,80,106.56,2);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Samsung Smart TV 43','Processador Crystal 4K, Tela sem limites','Samsung','Tvs',180,26,'Prateleira 105',2299.00,69,3885.31,2);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Headset Gamer Sem Fio','G533 7.1 Dolby Surround','Logitech','Periféricos',490,36,'Prateleira 150',549.90,100,1099.80,2);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Memória Corsair Vengeance','LPX, 8GB, 2666MHz, DDR4','Corsair','Hardwares',288,37,'Prateleira 251',214.90,90,408.31,1);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Smartphone Samsung Galaxy A33','5G, 6GB RAM, 128GB, Octa Core','Samsung','SmartPhones',5,1,'Prateleira 106',2249.10,100,4498.20,1);

insert into produtos(produto,descricao,fabricante,departamento,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values 
('Cadeira Gamer','Com Almofadas, Reclinável','Husky','Cadeiras',42,10,'Prateleira 502',1079.90,77,1911.42,2);

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    nascimento date not null,
    fone varchar(20) not null,
    cpf varchar(15) unique,
    email varchar(50),
    marketing varchar(3) not null,
    cep varchar(10),
    endereco varchar(100),
    numero varchar(10),
    complemento varchar(10),
    bairro varchar(50),
    cidade varchar(50),
    uf char(2)
);

-- Relatório para email marketing 
select nome as Cliente, email as E_mail  from clientes where marketing=('Sim');

-- Clientes
insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Renan Lazoti',20040731,11954968772,52255522302,'renanlazoti@gmail.com','Sim',03544010,'rua cachoeiro do itapemirim',24,'Apartamento','Patriarca','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Dimitri Saraiva',20031224,11950280735,2282084298,'dimitri2005@gmail.com','Não',02022020,'rua Tuiuti',322,'Uma avenida','Tatuapé','São Paulo','SP');

insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,complemento,bairro,cidade,uf)
values
('Maria Fiori',20030422,1192989892,8935289329,'fiorimaria@gmail.com','Não',020202049,'rua Pedro Carlos',245,'Condominio','Jardim Robru','São Paulo','SP');

create table pedidos (
	pedido int primary key auto_increment,
	dataped timestamp default current_timestamp,
    total decimal (10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
);

-- Pedidos
insert into pedidos(idcli) values(1);

insert into pedidos(idcli) values(3);

insert into pedidos(idcli) values(2);

select * from pedidos;

create table usuarios (
	idusu int primary key auto_increment,
    usuario varchar(50) not null,
    login varchar(15) not null unique, -- unique não permite valores duplicados (exemplo: não vai conseguir criar um login com o nome de usuario)
    senha varchar(255) not null,
    perfil varchar(50) not null
);

-- Usuarios
insert into usuarios(usuario,login,senha,perfil)
values ('Administrador','admin',md5('admin'),'admin');

insert into usuarios(usuario,login,senha,perfil)
values ('Renan','eors',md5('123456'),'user');

create table fornecedores (
	idfor int primary key auto_increment,
    cnpj varchar(20) unique not null,
    ie varchar(15) unique,
    im varchar(15) unique,
    razao varchar(50) not null,
    fantasia varchar(50) not null,
    site varchar(50),
    fone varchar(20) not null,
    contato varchar(50),
    email varchar(50),
    cep varchar(10) not null,
    endereco varchar(100) not null,
    numero int not null,
    complemento varchar(100), 
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf char(2)
);

-- Fornecedores
insert into fornecedores (cnpj,ie,im,razao,fantasia,site,fone,contato,email,cep,endereco,numero,bairro,cidade,uf)
values
(24821974777,2828489,91895378,"Renan Informática","Kabum","www.kabum.com.br",9994995009,"Renan Lazoti",
"renanlazoti@gmail.com",020410050,"rua jaguatirica",24,"Vila Josias","Jaguaré","SP");

insert into fornecedores (cnpj,ie,im,razao,fantasia,site,fone,contato,email,cep,endereco,numero,bairro,cidade,uf)
values
(02194759000,40028922,89224002,"Informática Miranda","Infomiranda","www.infomiranda.com.br",9548729950,"Fernando Miranda",
"mirandafernando@gmail.com",559210799,"rua cepo de madeira",663,"Poá","São Paulo","SP");

create table carrinho (
	pedido int not null,
    id int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
    foreign key(id) references produtos(id)
);

-- Carrinho para cada pedido
insert into carrinho values (2,3,2);

insert into carrinho values (1,4,5);

insert into carrinho values (4,1,3);

-- Relatório de venda
select pedidos.pedido as Pedido,
carrinho.id as ID,
produtos.produto as Produto,
carrinho.quantidade as Quantidade,
produtos.venda as Preco_Uni,
produtos.venda * carrinho.quantidade as Sub_total
from (carrinho inner join pedidos on carrinho.pedido =
pedidos.pedido)
inner join produtos on carrinho.id = produtos.id;

-- Atualização de estoque
update carrinho 
inner join produtos
on carrinho.id= produtos.id
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;
