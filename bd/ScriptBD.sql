DROP TABLE Usuario;
-- -- 
-- -- SQLLite
CREATE TABLE Usuario (  id INTEGER NOT NULL PRIMARY KEY,
                        situacao VARCHAR(30) NULL,
                        email VARCHAR(100) NULL UNIQUE,
                        nomeCompleto VARCHAR(100) NULL,
                        sexo VARCHAR(30) NULL,
                        foneCelular VARCHAR(12) NULL UNIQUE,
                        dtNascimento VARCHAR(10) NULL,
                        logradouro VARCHAR(100) NULL,
                        numero VARCHAR(10) NULL,
                        complemento VARCHAR(50) NULL,
                        bairro VARCHAR(50) NULL,
                        cidade VARCHAR(60) NULL,
                        estado VARCHAR(30) NULL,
                        cep VARCHAR(12) NULL,
                        senha VARCHAR(30) NULL,
                        dtRegistro VARCHAR(30)  NULL,
                        superUser VARCHAR(12) NULL);
CREATE INDEX idx_Usuario_nomeCompleto ON Usuario (nomeCompleto);

