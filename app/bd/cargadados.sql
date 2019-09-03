DELETE FROM associado;
DELETE FROM associado_usuario_tags;
DELETE FROM categoria;

-- Associados
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '1@gmail.com', 'DOG OSTENTA', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Lanches', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/500x300.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '2@gmail.com', 'DOGÃO TIA JU', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Lanches', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/500x300.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '3@gmail.com', 'GISA DOCES', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Doces, Bolos, Salgados', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/500x300.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '4gmail.com', 'PIZZARIA DOM JUAN', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Lanches', 'Seg a Dom', '19:00', '23:59', 'S', '2,50', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/500x300.jpg');
            
INSERT INTO associado (situacao, email, nomefantasia, resumo, categoria, funcionamentodias, funcionamentohorarioinicio, funcionamentohorariotermino, taxaentrega, valortaxaentrega, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
	VALUES ('Disponivel', '5@gmail.com', 'PIZZARIA TOP 20', 'Atualmente a correria diária das grandes cidades, aliada a certa dose de comodidade, tem alterado os hábitos das famílias que procuram cada vez mais os serviços de fast foods e entregas á domicílio.', 
            'Pizzaria, Lanches, Porções', 'Seg a Dom', '19:00', '23:59', 'S', '2,50','Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'associados/500x300.jpg');



-- Categoria
INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('BEBIDAS', NULL, 'categorias/300x200.jpg');

INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('CACHORROS-QUENTES', NULL, 'categorias/300x200.jpg');

INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('KITS FESTA', NULL, 'categorias/300x200.jpg');

INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('LANCHES', NULL, 'categorias/300x200.jpg');

INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('PIZZAS', NULL, 'categorias/300x200.jpg');

INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('PORÇÕES', NULL, 'categorias/300x200.jpg');

INSERT INTO categoria (descricao, dtregistro, logo)  VALUES ('OUTROS', NULL, 'categorias/300x200.jpg');
