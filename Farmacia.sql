create database SGBD_Farmácia;

use SGBD_Farmácia;

create table Cliente(
id_cliente int primary key not null,
nome_cliente varchar(80),
CPF varchar(14),
endereço varchar(60),
idade int
);

create table Funcionario(
id_funcionario int primary key not null,
nome_funcionario varchar(80),
endereço varchar(60),
email varchar(40),
telefone varchar(16),
cargo varchar(40),
salario float,
data_contratação datetime
);

create table Fornecedor(
id_fornecedor int primary key not null,
nome_fornecedor varchar(80),
endereço varchar(60),
telefone varchar(16),
email varchar(40),
CNPJ varchar(20)
);

create table Produto(
id_produto int primary key not null,
nome_produto varchar(80),
descricao varchar(500),
preco float,
qtd_estoque int,
data_validade int,
categoria varchar(20),
id_fornecedor int,
foreign key (id_fornecedor) references Fornecedor(id_fornecedor)
);

create table Venda(
id_venda int primary key not null,
data_venda datetime,
valor_total float,
id_cliente int,
Foreign key (id_cliente) references Cliente(id_cliente),
id_funcionario int,
Foreign key (id_funcionario) references Funcionario(id_funcionario)
);

create table Item_Venda(
id_item int primary key not null,
quantidade int,
preço_unitario float,
subtotal float,
id_venda int,
foreign key (id_venda) references Venda(id_venda),
id_produto int,
foreign key (id_produto) references Produto(id_produto)
);
