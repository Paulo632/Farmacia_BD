/* Cria o banco de dados */
create database SGBD_Farmacia;

/* Seleciona o Banco de Dados */
use SGBD_Farmacia;

/* Criação da tabela Cliente */
create table Cliente(
  id_cliente int primary key not null, /* Chave primária */
  nome_cliente varchar(80),
  CPF varchar(14),
  endereco varchar(60),
  idade int
);

/* Criação da tabela Funcionario */
create table Funcionario(
  id_funcionario int primary key not null, /* Chave primária */
  nome_funcionario varchar(80),
  endereco varchar(60),
  email varchar(40),
  telefone varchar(16),
  cargo varchar(40),
  salario float,
  data_contratacao date
);

/* Criação da tabela Fornecedor */
create table Fornecedor(
  id_fornecedor int primary key not null, /* Chave primária */
  nome_fornecedor varchar(80),
  endereco varchar(60),
  telefone varchar(16),
  email varchar(40),
  CNPJ varchar(20)
);

/* Criação da tabela Produto */
create table Produto(
  id_produto int primary key not null, /* Chave primária */
  nome_produto varchar(80),
  descricao varchar(500),
  preco float,
  qtd_estoque int,
  data_validade date, /* Corrigido para tipo date */
  categoria varchar(20),
  id_fornecedor int,
  foreign key (id_fornecedor) references Fornecedor(id_fornecedor)
);

/* Criação da tabela Venda */
create table Venda(
  id_venda int primary key not null, /* Chave primária */
  data_venda datetime,
  valor_total float,
  id_cliente int,
  foreign key (id_cliente) references Cliente(id_cliente),
  id_funcionario int,
  foreign key (id_funcionario) references Funcionario(id_funcionario)
);

/* Criação da tabela Item_Venda */
create table Item_Venda(
  id_item int primary key not null, /* Chave primária */
  quantidade int,
  preco_unitario float,
  subtotal float,
  id_venda int,
  foreign key (id_venda) references Venda(id_venda),
  id_produto int,
  foreign key (id_produto) references Produto(id_produto)
);

/* Procedures */

/* Procedure 1 */
delimiter /
create procedure consulta_cliente(in fun varchar(20), in id int)
begin
  case 
    when fun = 'all' then select * from Cliente where id_cliente = id;
    when fun = 'nome' then select nome_cliente from Cliente where id_cliente = id;
    when fun = 'cpf' then select CPF from Cliente where id_cliente = id;
    when fun = 'endereco' then select endereco from Cliente where id_cliente = id;
    when fun = 'idade' then select idade from Cliente where id_cliente = id;
    else select 'Essa operação não é possível.' as mensagem;
  end case;
end/
delimiter ;

/* Procedure 2 */
delimiter /
create procedure consulta_funcionario(in fun varchar(20), in id int)
begin
  case 
    when fun = 'all' then select * from Funcionario where id_funcionario = id;
    when fun = 'nome' then select nome_funcionario from Funcionario where id_funcionario = id;
    when fun = 'endereco' then select endereco from Funcionario where id_funcionario = id;
    when fun = 'email' then select email from Funcionario where id_funcionario = id;
    when fun = 'telefone' then select telefone from Funcionario where id_funcionario = id;
    when fun = 'cargo' then select cargo from Funcionario where id_funcionario = id;
    when fun = 'salario' then select salario from Funcionario where id_funcionario = id;
    when fun = 'contratacao' then select data_contratacao from Funcionario where id_funcionario = id;
    else select 'Essa operação não é possível.' as mensagem;
  end case;
end/
delimiter ;

/* Procedure 3 */
delimiter /
create procedure consulta_fornecedor(in fun varchar(20), in id int)
begin
  case 
    when fun = 'all' then select * from Fornecedor where id_fornecedor = id;
    when fun = 'nome' then select nome_fornecedor from Fornecedor where id_fornecedor = id;
    when fun = 'endereco' then select endereco from Fornecedor where id_fornecedor = id;
    when fun = 'telefone' then select telefone from Fornecedor where id_fornecedor = id;
    when fun = 'email' then select email from Fornecedor where id_fornecedor = id;
    when fun = 'CNPJ' then select CNPJ from Fornecedor where id_fornecedor = id;
    else select 'Essa operação não é possível.' as mensagem;
  end case;
end/
delimiter ;

/* Procedure 4 */
delimiter /
create procedure consulta_produto(in fun varchar(20), in id int)
begin
  case 
    when fun = 'all' then select * from Produto where id_produto = id;
    when fun = 'nome' then select nome_produto from Produto where id_produto = id;
    when fun = 'descricao' then select descricao from Produto where id_produto = id;
    when fun = 'preco' then select preco from Produto where id_produto = id;
    when fun = 'qtd_estoque' then select qtd_estoque from Produto where id_produto = id;
    when fun = 'data_validade' then select data_validade from Produto where id_produto = id;
    when fun = 'categoria' then select categoria from Produto where id_produto = id;
    when fun = 'id_fornecedor' then select id_fornecedor from Produto where id_produto = id;
    else select 'Essa operação não é possível.' as mensagem;
  end case;
end/
delimiter ;

/* Procedure 5 */
delimiter /
create procedure consulta_venda(in fun varchar(20), in id int)
begin
  case 
    when fun = 'all' then select * from Venda where id_venda = id;
    when fun = 'data_venda' then select data_venda from Venda where id_venda = id;
    when fun = 'valor_total' then select valor_total from Venda where id_venda = id;
    when fun = 'id_cliente' then select id_cliente from Venda where id_venda = id;
    when fun = 'id_funcionario' then select id_funcionario from Venda where id_venda = id;
    else select 'Essa operação não é possível.' as mensagem;
  end case;
end/
delimiter ;

/* Procedure 6 */
delimiter /
create procedure adicionar_cliente(
    in p_nome_cliente varchar(80),
    in p_CPF varchar(14),
    in p_endereco varchar(60),
    in p_idade int
)
begin
    insert into Cliente (nome_cliente, CPF, endereco, idade)
    values (p_nome_cliente, p_CPF, p_endereco, p_idade);
end/
delimiter ;

/* Procedure 7 */

delimiter /
create procedure atualizar_cliente(
    in p_id_cliente int,
    in p_nome_cliente varchar(80),
    in p_CPF varchar(14),
    in p_endereco varchar(60),
    in p_idade int
)
begin
    update Cliente
    set nome_cliente = p_nome_cliente,
        CPF = p_CPF,
        endereco = p_endereco,
        idade = p_idade
    where id_cliente = p_id_cliente;
end/
delimiter ;

/* Procedure 8 */
delimiter /
create procedure deletar_cliente(in p_id_cliente int)
begin
    delete from Cliente where id_cliente = p_id_cliente;
end/
delimiter ;

/* Procedure 9 */
delimiter /
create procedure adicionar_funcionario(
    in p_nome_funcionario varchar(80),
    in p_endereco varchar(60),
    in p_email varchar(40),
    in p_telefone varchar(16),
    in p_cargo varchar(40),
    in p_salario float,
    in p_data_contratacao date
)
begin
    insert into Funcionario (nome_funcionario, endereco, email, telefone, cargo, salario, data_contratacao)
    values (p_nome_funcionario, p_endereco, p_email, p_telefone, p_cargo, p_salario, p_data_contratacao);
end/
delimiter ;

/* Procedure 10 */
delimiter /
create procedure atualizar_funcionario(
    in p_id_funcionario int,
    in p_nome_funcionario varchar(80),
    in p_endereco varchar(60),
    in p_email varchar(40),
    in p_telefone varchar(16),
    in p_cargo varchar(40),
    in p_salario float,
    in p_data_contratacao date
)
begin
    update Funcionario
    set nome_funcionario = p_nome_funcionario,
        endereco = p_endereco,
        email = p_email,
        telefone = p_telefone,
        cargo = p_cargo,
        salario = p_salario,
        data_contratacao = p_data_contratacao
    where id_funcionario = p_id_funcionario;
end/
delimiter ;

/* Procedure 11 */
delimiter /
create procedure deletar_funcionario(in p_id_funcionario int)
begin
    delete from Funcionario where id_funcionario = p_id_funcionario;
end/
delimiter ;

/* Procedure 12 */
delimiter /
create procedure registrar_venda(
    in p_data_venda datetime,
    in p_valor_total float,
    in p_id_cliente int,
    in p_id_funcionario int
)
begin
    insert into Venda (data_venda, valor_total, id_cliente, id_funcionario)
    values (p_data_venda, p_valor_total, p_id_cliente, p_id_funcionario);
end/
delimiter ;

/* Procedure 13 */
delimiter /
create procedure adicionar_item_venda(
    in p_quantidade int,
    in p_preco_unitario float,
    in p_subtotal float,
    in p_id_venda int,
    in p_id_produto int
)
begin
    insert into Item_Venda (quantidade, preco_unitario, subtotal, id_venda, id_produto)
    values (p_quantidade, p_preco_unitario, p_subtotal, p_id_venda, p_id_produto);
end/
delimiter ;

/* Procedure 14 */
delimiter /
create procedure verificar_estoque(in p_id_produto int)
begin
    select nome_produto, qtd_estoque
    from Produto
    where id_produto = p_id_produto;
end/
delimiter ;

/* Procedure 15 */
delimiter /
create procedure atualizar_estoque(
    in p_id_produto int,
    in p_qtd_estoque int
)
begin
    update Produto
    set qtd_estoque = p_qtd_estoque
    where id_produto = p_id_produto;
end/
delimiter ;

/* Procedure 16 */
delimiter /
create procedure listar_vendas_por_cliente(in p_id_cliente int)
begin
    select * from Venda
    where id_cliente = p_id_cliente;
end/
delimiter ;

/* Procedure 17 */
delimiter /
create procedure listar_produtos_por_fornecedor(in p_id_fornecedor int)
begin
    select * from Produto
    where id_fornecedor = p_id_fornecedor;
end/
delimiter ;

/* Procedure 18 */
delimiter /
create procedure consultar_produto(
    in p_id_produto int
)
begin
    declare v_exist int;

    -- Verifica se o produto existe
    select count(*) into v_exist
    from Produto
    where id_produto = p_id_produto;

    if v_exist = 0 then
        select 'Produto não encontrado.' as mensagem;
    else
        -- Retorna as informações do produto
        select * from Produto
        where id_produto = p_id_produto;
    end if;
end/
delimiter ;

/* Procedure 19 */
delimiter /
create procedure atualizar_cliente(
    in p_id_cliente int,
    in p_nome_cliente varchar(80),
    in p_CPF varchar(14),
    in p_endereco varchar(60),
    in p_idade int
)
begin
    -- Verifica se o cliente existe
    if not exists (select 1 from Cliente where id_cliente = p_id_cliente) then
        select 'Cliente não encontrado.' as mensagem;
    else
        -- Atualiza os campos fornecidos
        update Cliente
        set nome_cliente = if(p_nome_cliente is not null, p_nome_cliente, nome_cliente),
            CPF = if(p_CPF is not null, p_CPF, CPF),
            endereco = if(p_endereco is not null, p_endereco, endereco),
            idade = if(p_idade is not null, p_idade, idade)
        where id_cliente = p_id_cliente;
        select 'Cliente atualizado com sucesso.' as mensagem;
    end if;
end/
delimiter ;















