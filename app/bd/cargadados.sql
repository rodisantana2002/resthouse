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
