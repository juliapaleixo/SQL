create database restaurante;

use restaurante;

create table funcionarios(
	id_funcionario int primary key auto_increment, -- Identificador único para cada funcionário.
    nome varchar(255) NOT NULL, -- Nome completo do funcionário.
    cpf varchar(14) NOT NULL UNIQUE, -- CPF do funcionário.
    data_nascimento date, -- Data de nascimento do funcionário.
    endereco varchar(255), -- Endereço residencial do funcionário.
    telefone varchar(15), -- Número de telefone do funcionário.
    email varchar(100) UNIQUE, -- E-mail do funcionário.
    cargo varchar(100), -- Cargo do funcionário no restaurante.
    salario decimal(10,2), -- Salário do funcionário.
    data_admissao date -- Data de admissão do funcionário no restaurante.
    );
    
create table clientes(
	id_cliente int primary key auto_increment, -- Identificador único para cada cliente.
    nome varchar(255) NOT NULL, -- Nome completo do cliente.
    cpf varchar(14) NOT NULL UNIQUE, -- CPF do cliente.
    data_nascimento date, -- Data de nascimento do cliente.
    endereco varchar(255), -- Endereço residencial do cliente.
    telefone varchar(15), -- Número de telefone do cliente.
    email varchar(100) UNIQUE, -- E-mail do cliente.
    data_cadastro date -- Data em que o cliente foi cadastrado no sistema.
    );
    
create table produtos(
	id_produto int primary key auto_increment, -- Identificador único para cada produto.
    nome varchar(255) NOT NULL, -- Nome do produto.
    descricao text, -- Descrição detalhada do produto.
    preco decimal(10,2) NOT NULL, -- Preço do produto.
    categoria varchar(100) -- Categoria do produto
);

create table pedidos(
	id_pedido int primary key auto_increment, -- Identificador único para cada pedido.
    id_cliente int NOT NULL, 
    foreign key (id_cliente) references clientes (id_cliente), -- Referência ao cliente que fez o pedido.
    id_funcionario int,
    foreign key (id_funcionario) references funcionarios (id_funcionario), -- Referência ao funcionário que atendeu o pedido.
    id_produto int NOT NULL,
    foreign key (id_produto) references produtos (id_produto), -- Referência ao produto pedido.
    quantidade int NOT NULL, -- Quantidade do produto pedido.
    preco decimal(10,2) NOT NULL, -- Preço do produto no momento do pedido.
    data_pedido date, -- Data em que o pedido foi realizado.
    status varchar(50) -- Status do pedido
);

create table info_produtos(
	id_info int primary key auto_increment, -- Identificador único para cada informação.
	id_produto int NOT NULL,
    foreign key (id_produto) references produtos (id_produto), -- Referência ao produto.
    ingredientes text, -- Lista de ingredientes do produto.
    fornecedor varchar(255) -- Nome do fornecedor do produto.
);
