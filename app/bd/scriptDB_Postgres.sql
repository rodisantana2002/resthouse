-- DROP TABLE usuario;
-- DROP TABLE associado;
-- -- 
-- -- SQLLite
CREATE TABLE usuario (  id SERIAL NOT NULL PRIMARY KEY,
                        situacao VARCHAR(30) NULL,
                        email VARCHAR(100) NULL UNIQUE,
                        nomecompleto VARCHAR(100) NULL,
                        sexo VARCHAR(30) NULL,
                        fonecelular VARCHAR(20) NULL UNIQUE,
                        dtnascimento VARCHAR(30) NULL,
                        logradouro VARCHAR(100) NULL,
                        numero VARCHAR(10) NULL,
                        complemento VARCHAR(50) NULL,
                        bairro VARCHAR(50) NULL,
                        cidade VARCHAR(60) NULL,
                        estado VARCHAR(30) NULL,
                        cep VARCHAR(20) NULL,
                        senha VARCHAR(300) NULL,
                        dtregistro VARCHAR(30)  NULL,
                        token VARCHAR(100) NULL,
                        superuser VARCHAR(12) NULL);
CREATE INDEX idx_Usuario_nomeCompleto ON usuario (nomecompleto);

-- Associado
CREATE TABLE associado (id SERIAL NOT NULL PRIMARY KEY,
                        situacao VARCHAR(30) NULL,
                        email VARCHAR(100) NULL UNIQUE,
                        nomefantasia VARCHAR(100) NULL,
                        tipopessoa VARCHAR(30) NULL,
                        logradouro VARCHAR(100) NULL,
                        numero VARCHAR(10) NULL,
                        complemento VARCHAR(50) NULL,
                        bairro VARCHAR(50) NULL,
                        cidade VARCHAR(60) NULL,
                        estado VARCHAR(30) NULL,
                        cep VARCHAR(20) NULL,
                        senha VARCHAR(300) NULL,
                        dtregistro VARCHAR(30)  NULL,
                        logo VARCHAR(100) NULL);
CREATE INDEX idx_associado_nomefantasia ON associado (nomefantasia);

