use restaurante;

create or replace view resumo_pedido as
	select p.id_pedido, p.quantidade, p.data_pedido, c.nome as nome_cliente, c.email, f.nome as nome_funcionário, pr.nome as produto, pr.preco
	from pedidos p
    join clientes c on p.id_cliente = c.id_cliente
    left join funcionarios f on f.id_funcionario = p.id_funcionario
    join produtos pr on pr.id_produto = p.id_produto;
    
select * from resumo_pedido;
    
select id_pedido, nome_cliente, sum(preco * quantidade) as total_pedido
	from resumo_pedido
    group by id_pedido;
    
create or replace view resumo_pedido as
	select p.id_pedido, p.quantidade, p.data_pedido, (p.preco * p.quantidade) as total, c.nome as nome_cliente, c.email, f.nome as nome_funcionário, pr.nome as produto, pr.preco
	from pedidos p
    join clientes c on p.id_cliente = c.id_cliente
    left join funcionarios f on f.id_funcionario = p.id_funcionario
    join produtos pr on pr.id_produto = p.id_produto;
    
select id_pedido, nome_cliente, total
	from resumo_pedido;
    
explain
	select id_pedido, nome_cliente, total
	from resumo_pedido;

    
DELIMITER //
	DROP FUNCTION IF EXISTS BuscaIngredientesProduto;

	CREATE FUNCTION BuscaIngredientesProduto(id INT)
	RETURNS TEXT
	DETERMINISTIC
	BEGIN
		DECLARE result TEXT;
		
		-- Tenta obter o valor dos ingredientes
		SELECT ingredientes INTO result
		FROM info_produtos
		WHERE id_produto = id
		LIMIT 1;
		
		-- Caso não encontre, retorna uma mensagem de erro
		IF result IS NULL THEN
			RETURN 'Produto não encontrado ou ingredientes nulos';
		ELSE
			RETURN result;
		END IF;
	END //
DELIMITER ;

SELECT BuscaIngredientesProduto(10);  -- Substituir o número pelo id_produto desejado

DELIMITER //
	DROP FUNCTION IF EXISTS mediaPedido;

	CREATE FUNCTION mediaPedido(id INT)
	RETURNS VARCHAR(255)
	DETERMINISTIC
	BEGIN
		DECLARE total_pedido DECIMAL(10,2);
		DECLARE media DECIMAL(10,2);
		DECLARE mensagem VARCHAR(255);

		-- Calcular o total do pedido (quantidade * preco)
		SELECT p.quantidade * pr.preco INTO total_pedido
		FROM pedidos p
		JOIN produtos pr ON p.id_produto = pr.id_produto
		WHERE p.id_pedido = id;

		-- Calcular a média de todos os pedidos (quantidade * preco)
		SELECT AVG(p.quantidade * pr.preco) INTO media
		FROM pedidos p
		JOIN produtos pr ON p.id_produto = pr.id_produto;

		-- Comparar o total do pedido com a média e criar a mensagem
		IF total_pedido > media THEN
			SET mensagem = 'O total do pedido é acima da média.';
		ELSEIF total_pedido < media THEN
			SET mensagem = 'O total do pedido é abaixo da média.';
		ELSE
			SET mensagem = 'O total do pedido é igual à média.';
		END IF;

		-- Retornar a mensagem
		RETURN mensagem;
	END //
DELIMITER ;

SELECT mediaPedido(6);  -- Substitua o número pelo id do pedido que você quer testar
