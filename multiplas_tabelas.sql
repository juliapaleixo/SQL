use restaurante;

select p.id_produto, p.nome, p.descricao, ip.ingredientes
	from produtos p
    join info_produtos ip
    on p.id_produto = ip.id_produto;
    
select p.id_pedido, p.quantidade, p.data_pedido, c.nome as "Nome Cliente", c.email
	from pedidos p
    join clientes c 
    on p.id_cliente = c.id_cliente;
    
select p.id_pedido, p.quantidade, p.data_pedido, c.nome as "Nome Cliente", c.email, f.nome as "Nome Funcionário"
	from pedidos p
    join clientes c on p.id_cliente = c.id_cliente
    join funcionarios f on f.id_funcionario = p.id_funcionario;
    
select p.id_pedido, p.quantidade, p.data_pedido, c.nome as "Nome Cliente", c.email, f.nome as "Nome Funcionário", pr.nome as "Produto", pr.preco
	from pedidos p
    join clientes c on p.id_cliente = c.id_cliente
    join funcionarios f on f.id_funcionario = p.id_funcionario
    join produtos pr on pr.id_produto = p.id_produto;
    
select clientes.nome
	from clientes
    join pedidos on pedidos.id_cliente = clientes.id_cliente
    where pedidos.status = "Pendente"
    order by pedidos.id_pedido desc;
    
select clientes.*
	from clientes
    left join pedidos on pedidos.id_cliente = clientes.id_cliente
    where pedidos.id_pedido is null;
    
select clientes.nome, count(pedidos.id_pedido) as "Número de pedidos"
	from clientes
    left join pedidos on pedidos.id_cliente = clientes.id_cliente
    group by clientes.nome;
    
select id_pedido, sum(preco * quantidade) as "Total Pedido"
	from pedidos
    group by id_pedido;
    
