use restaurante;

select count(*) from pedidos;

select count(distinct id_cliente) from pedidos;

select round(avg(preco),2) from produtos;

select max(preco) from produtos;

select min(preco) from produtos;

select distinct nome, preco, dense_rank() over (order by preco desc) as ranking_preco from produtos limit 5;

select categoria, round(avg(preco),2) as media_preco from produtos group by categoria;

select fornecedor, count(id_produto) from info_produtos group by fornecedor;

select fornecedor, count(id_produto) from info_produtos group by fornecedor having count(id_produto) > 1;

select id_cliente, count(id_pedido) from pedidos group by id_cliente having count(id_pedido) = 1;

