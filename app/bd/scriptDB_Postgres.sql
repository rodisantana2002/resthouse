-- DROP TABLE usuario;
-- DROP TABLE associado;
-- DROP TABLE associado_usuario_tags 
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
-- -- Script de popular vendedores
-- INSERT INTO associado (situacao, email, nomefantasia, resumo, tipopessoa, logradouro, numero, complemento, bairro, cidade, estado, cep, dtregistro, logo) 
-- 	VALUES ('Ativa', 'rodisantana@gmail.com', 'Lanches da Esquina', 'Produzimos lanches de primeira, tem para todos os gostos, pois somos fodas no que fazemos', 'Juridica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

-- Tags Usuarios - Associados
CREATE TABLE associado_usuario_tags (id SERIAL NOT NULL PRIMARY KEY,
                                     usuario_id INTEGER NOT NULL,
                                     associado_id INTEGER NOT NULL,
                                     recomendo VARCHAR(1) NULL,  
                                     favorito VARCHAR(1) NULL, 
                                     dtregistro VARCHAR(30)  NULL);  
