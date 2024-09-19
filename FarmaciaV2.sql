/* Cria o banco de dados */
create database FarmaciaV2;

/* Seleciona o Banco de Dados */
use FarmaciaV2;

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

/* Dados */

-- Clientes
insert into Cliente (id_cliente, nome_cliente, CPF, endereco, idade) values
(1, 'Ana Silva', '123.456.789-00', 'Rua A, 123', 30),
(2, 'Bruno Souza', '234.567.890-12', 'Rua B, 234', 25),
(3, 'Carlos Oliveira', '345.678.901-23', 'Rua C, 345', 40),
(4, 'Diana Costa', '456.789.012-34', 'Rua D, 456', 35),
(5, 'Eduardo Lima', '567.890.123-45', 'Rua E, 567', 50),
(6, 'Fernanda Pereira', '678.901.234-56', 'Rua F, 678', 28),
(7, 'Gabriel Santos', '789.012.345-67', 'Rua G, 789', 33),
(8, 'Heloísa Martins', '890.123.456-78', 'Rua H, 890', 45),
(9, 'Igor Almeida', '901.234.567-89', 'Rua I, 901', 29),
(10, 'Juliana Rocha', '012.345.678-90', 'Rua J, 012', 38);

-- Funcionários
insert into Funcionario (id_funcionario, nome_funcionario, endereco, email, telefone, cargo, salario, data_contratacao) values
(1, 'Lucas Martins', 'Avenida 1, 100', 'lucas.martins@empresa.com', '(11) 1111-1111', 'Farmacêutico', 3000.00, '2023-01-15'),
(2, 'Mariana Silva', 'Avenida 2, 200', 'mariana.silva@empresa.com', '(11) 2222-2222', 'Gerente', 5000.00, '2022-08-20'),
(3, 'João Pereira', 'Avenida 3, 300', 'joao.pereira@empresa.com', '(11) 3333-3333', 'Caixa', 2500.00, '2024-02-10'),
(4, 'Tatiane Costa', 'Avenida 4, 400', 'tatiane.costa@empresa.com', '(11) 4444-4444', 'Assistente', 2800.00, '2023-07-01'),
(5, 'Roberto Lima', 'Avenida 5, 500', 'roberto.lima@empresa.com', '(11) 5555-5555', 'Farmacêutico', 3200.00, '2021-06-18'),
(6, 'Amanda Silva', 'Avenida 6, 600', 'amanda.silva@empresa.com', '(11) 6666-6666', 'Auxiliar', 2200.00, '2022-11-23'),
(7, 'Pedro Souza', 'Avenida 7, 700', 'pedro.souza@empresa.com', '(11) 7777-7777', 'Farmacêutico', 3100.00, '2023-03-05'),
(8, 'Juliana Santos', 'Avenida 8, 800', 'juliana.santos@empresa.com', '(11) 8888-8888', 'Gerente', 5500.00, '2022-10-10'),
(9, 'Carlos Lima', 'Avenida 9, 900', 'carlos.lima@empresa.com', '(11) 9999-9999', 'Caixa', 2600.00, '2023-09-15'),
(10, 'Eliane Martins', 'Avenida 10, 1000', 'eliane.martins@empresa.com', '(11) 1010-1010', 'Assistente', 2900.00, '2024-04-01');

-- Fornecedor
insert into Fornecedor (id_fornecedor, nome_fornecedor, endereco, telefone, email, CNPJ) values
(1, 'Farmacia ABC', 'Rua X, 123', '(11) 1111-0000', 'contato@farmaciaabc.com.br', '12.345.678/0001-91'),
(2, 'Laboratório Z', 'Rua Y, 456', '(11) 2222-0000', 'atendimento@laboratorioz.com.br', '23.456.789/0001-92'),
(3, 'Distribuidora XYZ', 'Rua Z, 789', '(11) 3333-0000', 'vendas@distribuidoraxyz.com.br', '34.567.890/0001-93'),
(4, 'Medicamentos São Paulo', 'Rua W, 101', '(11) 4444-0000', 'suporte@medsp.com.br', '45.678.901/0001-94'),
(5, 'Farmacia Moderna', 'Rua V, 202', '(11) 5555-0000', 'contato@farmaciamoderna.com.br', '56.789.012/0001-95'),
(6, 'Laboratório Saúde', 'Rua U, 303', '(11) 6666-0000', 'info@laboratoriosaude.com.br', '67.890.123/0001-96'),
(7, 'Distribuidora Farmácia', 'Rua T, 404', '(11) 7777-0000', 'comercial@distribuidorafarmacia.com.br', '78.901.234/0001-97'),
(8, 'Medicamentos Brasil', 'Rua S, 505', '(11) 8888-0000', 'contato@medbrasil.com.br', '89.012.345/0001-98'),
(9, 'Farmacia Premium', 'Rua R, 606', '(11) 9999-0000', 'atendimento@farmaciapremium.com.br', '90.123.456/0001-99'),
(10, 'Laboratório Total', 'Rua Q, 707', '(11) 1010-0000', 'suporte@laboratoriototal.com.br', '01.234.567/0001-00');

-- Produto
insert into Produto (id_produto, nome_produto, descricao, preco, qtd_estoque, data_validade, categoria, id_fornecedor) values
(1, 'Paracetamol 500mg', 'Medicamento para dor e febre', 15.00, 100, '2025-10-31', 'Analgésico', 1),
(2, 'Ibuprofeno 200mg', 'Anti-inflamatório', 20.00, 80, '2024-01-03', 'Anti-inflamatório', 2),
(3, 'Amoxicilina 500mg', 'Antibiótico', 30.00, 50, '2026-05-20', 'Antibiótico', 3),
(4, 'Dipirona 1g', 'Medicamento para dor e febre', 18.00, 70, '2025-12-01', 'Analgésico', 4),
(5, 'Losartana 50mg', 'Anti-hipertensivo', 25.00, 60, '2026-05-10', 'Anti-hipertensivo', 5),
(6, 'Omeprazol 20mg', 'Medicamento para azia', 22.00, 90, '2024-06-10', 'Antiácido', 6),
(7, 'Cetirizina 10mg', 'Antialérgico', 17.00, 75, '2025-04-30', 'Antialérgico', 7),
(8, 'Azitromicina 500mg', 'Antibiótico', 35.00, 40, '2026-07-10', 'Antibiótico', 8),
(9, 'Metformina 850mg', 'Antidiabético', 28.00, 85, '2026-09-13', 'Antidiabético', 9),
(10, 'Loratadina 10mg', 'Antialérgico', 19.00, 65, '2025-08-11', 'Antialérgico', 10);

-- Venda
insert into Venda (id_venda, data_venda, valor_total, id_cliente, id_funcionario) values
(1, '2024-09-01 10:00:00', 45.00, 1, 1),
(2, '2024-09-02 11:30:00', 60.00, 2, 2),
(3, '2024-09-03 14:00:00', 90.00, 3, 3),
(4, '2024-09-04 09:15:00', 35.00, 4, 4),
(5, '2024-09-05 16:45:00', 50.00, 5, 5),
(6, '2024-09-06 12:00:00', 80.00, 6, 6),
(7, '2024-09-07 15:30:00', 55.00, 7, 7),
(8, '2024-09-08 17:00:00', 70.00, 8, 8),
(9, '2024-09-09 10:30:00', 45.00, 9, 9),
(10, '2024-09-10 11:00:00', 85.00, 10, 10);

-- Item_Venda
insert into Item_Venda (id_item, quantidade, preco_unitario, subtotal, id_venda, id_produto) values
(1, 2, 15.00, 30.00, 1, 1),
(2, 3, 20.00, 60.00, 2, 2),
(3, 1, 30.00, 30.00, 3, 3),
(4, 1, 18.00, 18.00, 4, 4),
(5, 2, 25.00, 50.00, 5, 5),
(6, 4, 22.00, 88.00, 6, 6),
(7, 3, 17.00, 51.00, 7, 7),
(8, 2, 35.00, 70.00, 8, 8),
(9, 3, 28.00, 84.00, 9, 9),
(10, 1, 19.00, 19.00, 10, 10);

/* Procedures */

/* Procedure 1 */
/* Procedure que faz uma consulta da tabela Cliente. */
delimiter /
create procedure consulta_cliente(in fun varchar(20), in id int)
begin
  if fun = 'all' then
    select * from Cliente where id_cliente = id;
  elseif fun = 'nome' then
    select nome_cliente from Cliente where id_cliente = id;
  elseif fun = 'cpf' then
    select CPF from Cliente where id_cliente = id;
  elseif fun = 'endereco' then
    select endereco from Cliente where id_cliente = id;
  elseif fun = 'idade' then
    select idade from Cliente where id_cliente = id;
  else
    select 'Essa operação não é possível.' as mensagem;
  end if;
end/
delimiter ;

-- call consulta_cliente('nome', 1);

/* Procedure 2 */
/* Procedure que faz uma consulta da tabela Funcionario. */
delimiter /
create procedure consulta_funcionario(in fun varchar(20), in id int)
begin
  if fun = 'all' then
    select * from Funcionario where id_funcionario = id;
  elseif fun = 'nome' then
    select nome_funcionario from Funcionario where id_funcionario = id;
  elseif fun = 'endereco' then
    select endereco from Funcionario where id_funcionario = id;
  elseif fun = 'email' then
    select email from Funcionario where id_funcionario = id;
  elseif fun = 'telefone' then
    select telefone from Funcionario where id_funcionario = id;
  elseif fun = 'cargo' then
    select cargo from Funcionario where id_funcionario = id;
  elseif fun = 'salario' then
    select salario from Funcionario where id_funcionario = id;
  elseif fun = 'contratacao' then
    select data_contratacao from Funcionario where id_funcionario = id;
  else
    select 'Essa operação não é possível.' as mensagem;
  end if;
end/
delimiter ;

-- call consulta_funcionario('all', 3);

/* Procedure 3 */
/* Procedure que faz uma consulta da tabela Fornecedor. */
delimiter /
create procedure consulta_fornecedor(in fun varchar(20), in id int)
begin
  if fun = 'all' then
    select * from Fornecedor where id_fornecedor = id;
  elseif fun = 'nome' then
    select nome_fornecedor from Fornecedor where id_fornecedor = id;
  elseif fun = 'endereco' then
    select endereco from Fornecedor where id_fornecedor = id;
  elseif fun = 'telefone' then
    select telefone from Fornecedor where id_fornecedor = id;
  elseif fun = 'email' then
    select email from Fornecedor where id_fornecedor = id;
  elseif fun = 'CNPJ' then
    select CNPJ from Fornecedor where id_fornecedor = id;
  else
    select 'Essa operação não é possível.' as mensagem;
  end if;
end/
delimiter ;

-- call consulta_fornecedor('all', 7);

/* Procedure 4 */
/* Procedure que faz uma consulta da tabela Produto. */
delimiter /
create procedure consulta_produto(in fun varchar(20), in id int)
begin
  if fun = 'all' then
    select * from Produto where id_produto = id;
  elseif fun = 'nome' then
    select nome_produto from Produto where id_produto = id;
  elseif fun = 'descricao' then
    select descricao from Produto where id_produto = id;
  elseif fun = 'preco' then
    select preco from Produto where id_produto = id;
  elseif fun = 'qtd_estoque' then
    select qtd_estoque from Produto where id_produto = id;
  elseif fun = 'data_validade' then
    select data_validade from Produto where id_produto = id;
  elseif fun = 'categoria' then
    select categoria from Produto where id_produto = id;
  elseif fun = 'id_fornecedor' then
    select id_fornecedor from Produto where id_produto = id;
  else
    select 'Essa operação não é possível.' as mensagem;
  end if;
end/
delimiter ;

/* Procedure 5 */
/* Procedure que faz uma consulta da tabela Venda. */
delimiter /
create procedure consulta_venda(in fun varchar(20), in id int)
begin
  if fun = 'all' then
    select * from Venda where id_venda = id;
  elseif fun = 'data_venda' then
    select data_venda from Venda where id_venda = id;
  elseif fun = 'valor_total' then
    select valor_total from Venda where id_venda = id;
  elseif fun = 'id_cliente' then
    select id_cliente from Venda where id_venda = id;
  elseif fun = 'id_funcionario' then
    select id_funcionario from Venda where id_venda = id;
  else
    select 'Essa operação não é possível.' as mensagem;
  end if;
end/
delimiter ;

/* Procedure 6 */
/* Procedure que faz uma consulta da tabela Item_Venda. */
delimiter /
create procedure consulta_item_venda(in fun varchar(20), in id int)
begin
  if fun = 'all' then
    select * from Item_Venda where id_item = id;
  elseif fun = 'quantidade' then
    select quantidade from Item_Venda where id_item = id;
  elseif fun = 'preco_unitario' then
    select preco_unitario from Item_Venda where id_item = id;
  elseif fun = 'subtotal' then
    select subtotal from Item_Venda where id_item = id;
  elseif fun = 'id_venda' then
    select id_venda from Item_Venda where id_item = id;
  elseif fun = 'id_produto' then
    select id_produto from Item_Venda where id_item = id;
  else
    select 'Essa operação não é possível.' as mensagem;
  end if;
end/
delimiter ;

/* Procedure 7 */
/* Procedure que adiciona um cliente a tabela. */
delimiter /
create procedure adicionar_cliente(in p_id int,
    in p_nome_cliente varchar(80),
    in p_CPF varchar(14),
    in p_endereco varchar(60),
    in p_idade int
)
begin
    insert into Cliente (id_cliente, nome_cliente, CPF, endereco, idade)
    values (p_id, p_nome_cliente, p_CPF, p_endereco, p_idade);
end/
delimiter ;

/* Procedure 8 */
/* Procedure que atualiza um cliente da tabela */
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

/* Procedure 9 */
/* Procedure que deleta um cliente da tabela. */
delimiter /
create procedure deletar_cliente(in p_id_cliente int)
begin
    delete from Cliente where id_cliente = p_id_cliente;
end/
delimiter ;

/* Procedure 10 */
/* Procedure que adiciona um funcionário a tabela. */
delimiter /
create procedure adicionar_funcionario(in p_id int,
    in p_nome_funcionario varchar(80),
    in p_endereco varchar(60),
    in p_email varchar(40),
    in p_telefone varchar(16),
    in p_cargo varchar(40),
    in p_salario float,
    in p_data_contratacao date
)
begin
    insert into Funcionario (id_funcionario, nome_funcionario, endereco, email, telefone, cargo, salario, data_contratacao)
    values (p_id, p_nome_funcionario, p_endereco, p_email, p_telefone, p_cargo, p_salario, p_data_contratacao);
end/
delimiter ;

/* Procedure 11 */
/* Procedure que atualiza um funcionário da tabela. */
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

/* Procedure 12 */
/* Procedure que deleta um funcionário da tabela. */
delimiter /
create procedure deletar_funcionario(in p_id_funcionario int)
begin
    delete from Funcionario where id_funcionario = p_id_funcionario;
end/
delimiter ;

/* Procedure 13 */
/* Procedure que registra uma venda. */
delimiter /
create procedure registrar_venda(in p_id int,
    in p_data_venda datetime,
    in p_valor_total float,
    in p_id_cliente int,
    in p_id_funcionario int
)
begin
    insert into Venda (id_venda, data_venda, valor_total, id_cliente, id_funcionario)
    values (p_id, p_data_venda, p_valor_total, p_id_cliente, p_id_funcionario);
end/
delimiter ;

/* Procedure 14 */
/* Procedure que registra o item vendido*/
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

/* Procedure 15 */
/* Procedure que verifica se há itens ainda em estoque. */
delimiter /
create procedure verificar_estoque(in p_id_produto int)
begin
    select nome_produto, qtd_estoque
    from Produto
    where id_produto = p_id_produto;
end/
delimiter ;

/* Procedure 16 */
/* Procedure que faz a atualização de quantos itens se tem em estoque. */
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

/* Procedure 17 */
/* Lista as vendas feitas por cada cliente. */
delimiter /
create procedure listar_vendas_por_cliente(in p_id_cliente int)
begin
    select * from Venda
    where id_cliente = p_id_cliente;
end/
delimiter ;

/* Procedure 18 */
/* Procedure que lista os produtos por fornecedor. */
delimiter /
create procedure listar_produtos_por_fornecedor(in p_id_fornecedor int)
begin
    select * from Produto
    where id_fornecedor = p_id_fornecedor;
end/
delimiter ;

/* Procedure 19 */
/* Procedure que verifica se um cliente é maior de idede. */
delimiter /
create procedure verificar_maioridade(in p_id_cliente int)
begin
  declare v_idade int;

  -- Buscar a idade do cliente
  select idade into v_idade from Cliente where id_cliente = p_id_cliente;

  -- Verificar se a idade foi encontrada
  if v_idade is null then
    select 'Cliente não encontrado.' as mensagem;
  else
    select
      case
        when v_idade >= 18 then 'Maior de idade'
        else 'Menor de idade'
      end as status_maioridade;
  end if;
end/
delimiter ;

/* Procedure 20 */
delimiter /
create procedure soma_salarios(out soma_salarial decimal(15, 2))
begin
  select sum(salario) into soma_salarial from Funcionario;
end/
delimiter ;

/*
declare v_soma_salario decimal(15, 2);
call soma_salarios(@v_soma_salario);

select @v_soma_salario as soma_total_salarios;
*/





