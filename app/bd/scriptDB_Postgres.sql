DROP TABLE usuario;
-- -- 
-- -- SQLLite
CREATE TABLE usuario (  id SERIAL NOT NULL PRIMARY KEY,
                        situacao VARCHAR(30) NULL,
                        email VARCHAR(100) NULL UNIQUE,
                        nomecompleto VARCHAR(100) NULL,
                        sexo VARCHAR(30) NULL,
                        fonecelular VARCHAR(12) NULL UNIQUE,
                        dtnascimento VARCHAR(10) NULL,
                        logradouro VARCHAR(100) NULL,
                        numero VARCHAR(10) NULL,
                        complemento VARCHAR(50) NULL,
                        bairro VARCHAR(50) NULL,
                        cidade VARCHAR(60) NULL,
                        estado VARCHAR(30) NULL,
                        cep VARCHAR(12) NULL,
                        senha VARCHAR(300) NULL,
                        dtregistro VARCHAR(30)  NULL,
                        superuser VARCHAR(12) NULL);
CREATE INDEX idx_Usuario_nomeCompleto ON usuario (nomecompleto);

