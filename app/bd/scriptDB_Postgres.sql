
-- DROP TABLE usuario;
-- DROP TABLE carrinho;
-- DROP TABLE produto_tamanho;
-- DROP TABLE associado_usuario_tags; 
-- DROP TABLE associado_caregorias;
-- DROP TABLE associado;
-- DROP TABLE categoria;
-- DROP TABLE produto;
-- -- 
-- -- SQLLite
-- CREATE TABLE usuario (  id SERIAL NOT NULL PRIMARY KEY,
--                         situacao VARCHAR(30) NULL,
--                         email VARCHAR(100) NULL UNIQUE,
--                         nomecompleto VARCHAR(100) NULL,
--                         sexo VARCHAR(30) NULL,
--                         fonecelular VARCHAR(20) NULL UNIQUE,
--                         dtnascimento VARCHAR(30) NULL,
--                         logradouro VARCHAR(100) NULL,
--                         numero VARCHAR(10) NULL,
--                         complemento VARCHAR(50) NULL,
--                         bairro VARCHAR(50) NULL,
--                         cidade VARCHAR(60) NULL,
--                         estado VARCHAR(30) NULL,
--                         cep VARCHAR(20) NULL,
--                         senha VARCHAR(300) NULL,
--                         dtregistro VARCHAR(30)  NULL,
--                         token VARCHAR(100) NULL,
--                         superuser VARCHAR(12) NULL);
-- CREATE INDEX idx_Usuario_nomeCompleto ON usuario (nomecompleto);

-- Associado
-- CREATE TABLE associado (id SERIAL NOT NULL PRIMARY KEY,
--                         situacao VARCHAR(30) NULL,
--                         email VARCHAR(100) NULL UNIQUE,
--                         nomefantasia VARCHAR(100) NULL,
--                         resumo VARCHAR(400) NULL,
--                         categoria VARCHAR(60) NULL,
--                         funcionamentodias VARCHAR(50),
--                         funcionamentohorarioinicio VARCHAR(20),
--                         funcionamentohorariotermino VARCHAR(20),
--                         taxaentrega VARCHAR(1),
--                         valortaxaentrega VARCHAR(10),
--                         tipopessoa VARCHAR(30) NULL,
--                         logradouro VARCHAR(100) NULL,
--                         numero VARCHAR(10) NULL,
--                         complemento VARCHAR(50) NULL,
--                         bairro VARCHAR(50) NULL,
--                         cidade VARCHAR(60) NULL,
--                         estado VARCHAR(30) NULL,
--                         cep VARCHAR(20) NULL,
--                         dtregistro VARCHAR(30)  NULL,
--                         logo VARCHAR(100) NULL);
-- CREATE INDEX idx_associado_nomefantasia ON associado (nomefantasia);

-- Tags Usuarios - Associados
-- CREATE TABLE associado_usuario_tags (id SERIAL NOT NULL PRIMARY KEY,
--                                      usuario_id INTEGER NOT NULL,
--                                      associado_id INTEGER NOT NULL,
--                                      recomendo VARCHAR(1) NULL,  
--                                      favorito VARCHAR(1) NULL, 
--                                      dtregistro VARCHAR(30)  NULL);  

--Tabela Categorias
-- CREATE TABLE categoria (id SERIAL NOT NULL PRIMARY KEY,
--                         descricao VARCHAR(60) NULL, 
--                         logo VARCHAR(100) NULL,
--                         dtregistro VARCHAR(30)  NULL);  

-- Categoria - Associados
-- CREATE TABLE associado_categorias (id SERIAL NOT NULL PRIMARY KEY,
--                                    categoria_id INTEGER NOT NULL,
--                                    associado_id INTEGER NOT NULL,
--                                    resumo VARCHAR(400) NULL,  
--                                    logo VARCHAR(100) NULL, 
--                                    dtregistro VARCHAR(30)  NULL);  

--Tabela Produtos
-- CREATE TABLE produto (id SERIAL NOT NULL PRIMARY KEY,
--                       descricao VARCHAR(200) NULL,
--                       valor VARCHAR(30) NULL,
--                       resumo VARCHAR(400) NULL,  
--                       medida VARCHAR(30) NULL,
--                       logo VARCHAR(100) NULL,
--                       associado_categoria_id INTEGER NOT NULL,                       
--                       tipo VARCHAR(30) NULL,
--                       dtregistro VARCHAR(30)  NULL);  

--Tabela ProdutoxTamanho
-- CREATE TABLE produto_tamanho (id SERIAL NOT NULL PRIMARY KEY,
--                               produto_id INTEGER NOT NULL,          
--                               tamanho VARCHAR(30) NULL,
--                               valor VARCHAR(30) NULL,
--                               dtregistro VARCHAR(30)  NULL);  

--Tabela Carrinho
CREATE TABLE carrinho (id SERIAL NOT NULL PRIMARY KEY,
                       usuario_id INTEGER NOT NULL,
                       produto_id INTEGER NOT NULL,          
                       associado_id INTEGER NOT NULL,          
                       categoria VARCHAR(100) NULL, 
                       resumo VARCHAR(1000) NULL,  
                       tamanho VARCHAR(30) NULL,
                       quantidade VARCHAR(30) NULL,
                       valor_unitario VARCHAR(30) NULL,
                       ids VARCHAR(100) NULL,                       
                       dtregistro VARCHAR(30)  NULL);  
