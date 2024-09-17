/*Cria o banco de dados*/
create database SGBD_Farmácia;

/*Seleciona o Banco de Dados*/
use SGBD_Farmácia;

/*Criação da tabela Cliente*/
create table Cliente(
id_cliente int primary key not null, /*Chave primária*/
nome_cliente varchar(80),
CPF varchar(14),
endereço varchar(60),
idade int
);

/*Criação de uma tabela Funcionario*/
create table Funcionario(
id_funcionario int primary key not null, /*Chave primária*/
nome_funcionario varchar(80),
endereco varchar(60),
email varchar(40),
telefone varchar(16),
cargo varchar(40),
salario float,
data_contratacao date
);

/*Criação da tabela Fornecedor, que armazena os dados dos fornecedores, para que haja um controle de onde é conseguido os medicamentos.*/
create table Fornecedor(
id_fornecedor int primary key not null, /*Chave primária*/
nome_fornecedor varchar(80),
endereco varchar(60),
telefone varchar(16),
email varchar(40),
CNPJ varchar(20)
);

/*Criação da tabela Produto, que tem a função de controlar os estoque, guardando a quantidade e mais algumas informações dos produtos.*/
create table Produto(
id_produto int primary key not null, /*Chave primária*/
nome_produto varchar(80),
descricao varchar(500),
preco float,
qtd_estoque int,
data_validade int,
categoria varchar(20),
id_fornecedor int,
foreign key (id_fornecedor) references Fornecedor(id_fornecedor)
);

/*Criação da tabela Venda, que armazena os dados das vendas realizadas.*/
create table Venda(
id_venda int primary key not null, /*Chave primária*/
data_venda datetime,
valor_total float,
id_cliente int,
Foreign key (id_cliente) references Cliente(id_cliente),
id_funcionario int,
Foreign key (id_funcionario) references Funcionario(id_funcionario)
);

/*Criação da tabela Item_Venda, que armazena os dados dos itens vendidos.*/
create table Item_Venda(
id_item int primary key not null, /*Chave primaria*/
quantidade int,
preço_unitario float,
subtotal float,
id_venda int,
foreign key (id_venda) references Venda(id_venda),
id_produto int,
foreign key (id_produto) references Produto(id_produto)
);

/*Procedures*/

-- 1
delimiter /
/*Essa procedure executa uma consulta da tabela cliente e faz uso do switch para selecionar o que mostrar na tela*/
-- all, nome, cpf, endereço, idade
  create procedure consulta_cliente(in fun char(20),in id int)
  begin
  case fun
    when fun == "all" then select * from Cliente where id_cliente = id;
    when fun == "nome" then select nome_cliente from Cliente where id_cliente = id;
    when fun == "cpf" then select CPF from Cliente where id_cliente = id;
    when fun == "endereço" then select endereco from Cliente where id_cliente = id;
    when fun == "idade" then select idade from Cliente where id_cliente = id;
    else "Essa operação não é possível.";
  end case;
  end/
  
delimiter ;

-- 2
delimiter /
/*Procedure que executa a consulta da tabela Funcionario e faz uso do switch para selecionar o que mostrar na tela*/
-- all, nome, endereço, cargo, salario, contrataçao
  create procedure consulta_funcionario(in fun char(20),in id int)
  begin
  case fun
    when fun == "all" then select * from Funcionario where id_funcionario = id;
    when fun == "nome" then select nome_funcionario from Funcionario where id_funcionario = id;
    when fun == "endereço" then select endereco from Funcionario where id_funcionario = id;
    when fun == "email" then select email from Funcionario where id_funcionario = id;
    when fun == "telefone" then select telefone from Funcionario where id_funcionario = id;
    when fun == "cargo" then select cargo from Funcionario where id_funcionario = id;
    when fun == "salario" then select salario from Funcionario where id_funcionario = id;
    when fun == "contrataçao" then select data_contratacao from Funcionario where id_funcionario = id;
    else "Essa operação não é possível.";
  end case;
  end/

delimiter ;






