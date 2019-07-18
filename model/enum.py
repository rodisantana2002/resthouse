from enum import Enum


class tipo(Enum):
    Fisica = "Fisica"
    Juridica = "Jurídica"


class genero(Enum):
    Masculino = "M"
    Feminino = "F"
    Outro = "X"


class situacaoPessoa(Enum):
    Ativa = "Ativa"
    Inativa = "Inativa"


class situacaoUsuario(Enum):
    Ativo = "Ativo"
    Inativo = "Inativo"
    Bloqueado = "Bloqueado"
