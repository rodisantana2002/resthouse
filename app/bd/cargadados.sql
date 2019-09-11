-- DELETE FROM produto;        
-- DELETE FROM associado_categorias;
-- DELETE FROM associado;
-- DELETE FROM associado_usuario_tags;
-- DELETE FROM categoria;

-- Associados
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '1@gmail.com', 'DOG OSTENTA', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Lanches', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/dog_ostenta.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '2@gmail.com', 'DOGÃO TIA JU', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Lanches', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/dogao_tia_ju.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '3@gmail.com', 'GISA DOCES', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Doces, Bolos, Salgados', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/gisa_doces.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '4gmail.com', 'PIZZARIA DOM JUAN', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Lanches', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/dom_juam.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '5@gmail.com', 'PIZZARIA TOP 20', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Pizzaria, Lanches, Porções', 'Seg a Dom', '19:00', '23:59', 'S', '2,50','Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/500x300.jpg');

INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '6@gmail.com', 'ART NY – ATELIÊ DE DOCES', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Doces, Bolos, Sobremesas', 'Seg a Sáb', '08:00', '21:00', 'S', '3,00','Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/art_ny.jpg');

INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '7@gmail.com', 'BURGER TORRES', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Hambúrguer, Lanche', 'Seg a Sáb', '08:00', '21:00', 'N', '0,00','Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/burger_torres.jpg');


-- -- Categoria
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('BEBIDAS', NULL, 'categorias/bebidas.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('BOLOS', NULL, 'categorias/bolos.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('SOBREMESAS', NULL, 'categorias/sobremesas.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('HAMBURGUER', NULL, 'categorias/hamburguer.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('CACHORROS-QUENTES', NULL, 'categorias/hotdogs.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('KITS FESTA', NULL, 'categorias/doces.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('LANCHES', NULL, 'categorias/lanches.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('PIZZAS', NULL, 'categorias/pizzas.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('PORÇÕES', NULL, 'categorias/porcoes.jpg');
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('OUTROS', NULL, 'categorias/300x200.jpg');



-- 
--categoriaxassociado
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='LANCHES'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA DOM JUAN'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='PORÇÕES'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA DOM JUAN'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='PIZZAS'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA DOM JUAN'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);
-- ********
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='LANCHES'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA TOP 20'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='PORÇÕES'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA TOP 20'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

-- ********

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='PIZZAS'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA TOP 20'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='BEBIDAS'), (SELECT ID FROM associado WHERE nomefantasia='PIZZARIA TOP 20'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

-- ********
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='LANCHES'), (SELECT ID FROM associado WHERE nomefantasia='DOGÃO TIA JU'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='CACHORROS-QUENTES'), (SELECT ID FROM associado WHERE nomefantasia='DOGÃO TIA JU'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='BEBIDAS'), (SELECT ID FROM associado WHERE nomefantasia='DOGÃO TIA JU'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='OUTROS'), (SELECT ID FROM associado WHERE nomefantasia='DOGÃO TIA JU'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);


-- ********
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='BEBIDAS'), (SELECT ID FROM associado WHERE nomefantasia='DOG OSTENTA'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='CACHORROS-QUENTES'), (SELECT ID FROM associado WHERE nomefantasia='DOG OSTENTA'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);


-- ********
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='KITS FESTA'), (SELECT ID FROM associado WHERE nomefantasia='GISA DOCES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='OUTROS'), (SELECT ID FROM associado WHERE nomefantasia='GISA DOCES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);



-- ********
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='KITS FESTA'), (SELECT ID FROM associado WHERE nomefantasia='ART NY – ATELIÊ DE DOCES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='SOBREMESAS'), (SELECT ID FROM associado WHERE nomefantasia='ART NY – ATELIÊ DE DOCES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='BOLOS'), (SELECT ID FROM associado WHERE nomefantasia='ART NY – ATELIÊ DE DOCES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);


-- ********
INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='HAMBURGUER'), (SELECT ID FROM associado WHERE nomefantasia='BURGER TORRES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);

INSERT INTO associado_categorias(categoria_id, associado_id, resumo, logo, dtregistro)
    VALUES((SELECT ID FROM categoria WHERE descricao='BEBIDAS'), (SELECT ID FROM associado WHERE nomefantasia='BURGER TORRES'),  
            'Trata-se de um tipo de painel que facilita a navegação de um usuário/consumidor e a localização de um produto em um site e-commerce.',    
            '',
            NULL);


-- Produtos x CategoriasAssociados (LANCHES x PIZZARIA DOM JUAN)
INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Burguer', 'Pão, maionese, hambúrguer, queijo cheddar', '5,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Egg', 'Pão, maionese, hambúrguer, queijo cheddar, presunto e ovo', '6,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Salada', 'Pão, maionese, hambúrguer, queijo cheddar, presunto, alface e tomate', '5,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Bacon', 'Pão, maionese, hambúrguer, queijo cheddar, presunto, alface e tomate, bacon', '8,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Calabresa', 'Pão, maionese, hambúrguer, queijo cheddar, presunto, alface e tomate, calabresa',  '8,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Frango', 'Pão, maionese, hambúrguer, queijo cheddar, presunto, alface e tomate, filé de peito de frango',  '9,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('X-Tudo', 'Pão, maionese, hambúrguer, queijo cheddar, presunto, alface e tomate, filé de peito de frango, bacon, calabresa e milho', '12,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='LANCHES'), NULL); 



-- Produtos x CategoriasAssociados (PORÇÕES x PIZZARIA DOM JUAN)
INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('Porção de batata', 'não informado', '13,50', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='PORÇÕES'), NULL);

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('Porção de polenta',  'não informado', '13,50', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='PORÇÕES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('Porção de aipim',  'não informado', '13,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='PORÇÕES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('Porção de frango a passarinho', 'não informado',  '14,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='PORÇÕES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('Porção de anéis de cebola',  'não informado', '14,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='PORÇÕES'), NULL); 

INSERT INTO produto(descricao, resumo, valor, medida, logo, associado_categoria_id, dtregistro)
    VALUES('Porção de tiras de frango empanado', 'não informado', '14,00', 'UN', 'produtos/100x100.jpg', (SELECT associado_categorias.id FROM associado_categorias INNER JOIN associado ON associado.id = associado_id INNER JOIN categoria ON categoria.id = categoria_id WHERE associado.nomefantasia='PIZZARIA DOM JUAN' AND categoria.descricao='PORÇÕES'), NULL);

   
-- Produtos x CategoriasAssociados (PIZZAS x PIZZARIA DOM JUAN)
-- INSERT INTO produto(descricao, valor, resumo, medida, logo, associado_categoria_id, dtregistro)
--    VALUES()
-- Mussarela Molho, mussarela, azeitona e orégano
-- Alho e Óleo Molho, mussarela, alho, óleo e orégano
-- Napolitano Molho, mussarela, tomate, parmesão e orégano
-- Marguerita Molho, mussarela, tomate, manjericão e orégano
-- Milho Molho, mussarela, milho e orégano
-- Calabresa Molho, mussarela, calabresa, cebola, azeitona e orégano
-- Milho com Bacon Molho, mussarela, milho, bacon e orégano
-- Presunto Molho, mussarela, presunto e orégano
-- Toscana Molho, mussarela, presunto, tomate e orégano
-- Lombo Molho, mussarela, lombo e orégano
-- Catupiry Molho, mussarela, catupiry e orégano
-- Palmito Molho, mussarela, palmito e orégano
-- Bacon Molho, mussarela, bacon e orégano
-- Crocante I Molho, mussarela, calabresa, batata-palha e orégano
-- Crocante II Molho, mussarela, bacon, batata-palha e orégano
-- Frango Molho, mussarela, frango e orégano
-- Portuguesa Molho, mussarela, presunto, cebola, azeitona, ovo e orégano
-- Parmegiana Molho, mussarela, presunto, molho, parmesão e orégano
-- Americana Molho, mussarela, tomate, bacon, pimentão, palmito e orégano
-- Hot-Dog Molho, mussarela, vina, milho, ervilha, batata-palha e orégano
-- 
-- 
-- PIZZAS ESPECIAIS 
-- Atum Molho, mussarela, atum, cebola e orégano
-- Brasileira Molho, mussarela, bacon, calabresa, cheddar, azeitona e orégano
-- Caipira Molho, mussarela, frango, milho,bacon e orégano
-- Romanesca Molho, mussarela, frango, milho, tomate, palmito e orégano
-- Peruana Molho, mussarela, atun, ervilha, cebola e orégano
-- Queijos Molho, mussarela, catupiry, parmesão e orégano
-- Frango com Catupiry/Cheddar Molho, mussarela, frango, catupiry/cheddar e orégano
-- Especial Molho, mussarela, calabresa, milho, ovo e orégano
-- Lombo com Bacon Molho, mussarela, lombo, bacon, cheddar e orégano
-- Lombo com Champignon Molho, mussarela, lombo, champignon, catupiry e orégano
-- Paulista Molho, mussarela, milho, ervilha, palmito e orégano
-- Baiana Molho, mussarela, calabresa, palmito, ovo, pimenta calabresa e orégano
-- 
-- PIZZAS PREMIUM 
-- A Moda Molho, mussarela, champignon, pepperone, azeitona e orégano
-- A Moda II Molho, mussarela, calabresa, tomate, ovo, milho, ervilha e orégano
-- A Moda da Casa I Molho, mussarela, calabresa, presunto, bacon, cheddar e orégano
-- A Moda da Casa II Molho, mussarela, lombo, champignon, bacon, ovo, catupiry, azeitona e orégano
-- Imperial Molho, mussarela, frango, palmito, bacon, cream cheese e orégano
-- Salame Molho, mussarela, salame, cheddar e orégano
-- Pepperone Molho, mussarela, pepperone, cream cheese e orégano
-- Strogonofe de Carne Molho, mussarela, estrogonofe de carne, champignon, batata-palha e orégano
-- Strogonofe de Frango Molho, mussarela, estrogonofe de frango, champignon, batata-palha e orégano
-- Queijos Molho, mussarela, provolone, parmesão, catupiry e orégano
-- Queijos Molho, mussarela, provolone, parmesão, catupiry, gongorzola e orégano
-- Queijos Molho, mussarela, provolone, parmesão, catupiry, gongorzola, cheddar e orégano
-- Queijos Molho, mussarela, provolone, parmesão, catupiry, gongorzola, cheddar, cream cheese e orégano
-- Florença Molho, mussarela, calabresa, bacon, ovos, tomate, parmesão, manjericão e orégano
-- Do Cliente Até 5 ingredientes
--  
-- 
-- PIZZAS DOCES 
-- Banana Creme de leite, mussarela, banana e canela
-- Banana com Chocolate Creme de leite, mussarela, banana, chocolate preto ou branco
-- Morango Creme de leite, mussarela
-- Confet
-- Ele e Ela
-- Brigadeiro
-- Dois Amores
-- Sensação
-- Floresta negra
-- Beijinho
-- Sonho de Valsa
-- Prestígio
-- Chocolate Preto
-- Chocolate Branco
