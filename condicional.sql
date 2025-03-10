use restaurante;

select * from pedidos where id_funcionario = 4 and status = "Pendente";

select * from pedidos where not status = "Concluído"; 

select * from pedidos where id_produto = 1 or id_produto = 3 or id_produto = 5 or id_produto = 7 or id_produto = 8;

select * from clientes where nome like "C%";

select * from info_produtos where ingredientes like "%carne%" or ingredientes like "%frango%";

select * from produtos where preco between 20 and 30;

update pedidos
set status = null
where id_pedido = 6;

select * from pedidos where status is null;

select id_pedido, coalesce(status, "Cancelado") as status from pedidos;

select nome, cargo, salario, 
	case 
		when salario > 3000 then "Acima da média"
		else "Abaixo da média"
    end as media_salario 
from funcionarios;