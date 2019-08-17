import os
import datetime

from enum import Enum
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import DateTime

app = Flask(__name__)
db = SQLAlchemy(app)


# Usuario
class Usuario(db.Model):
    __tablename__ = "Usuario"

    # dados pessoais
    id = db.Column(db.Integer, primary_key=True)

    situacao = db.Column(db.String(30), default="Ativo")
    email = db.Column(db.String(100))
    nomeCompleto = db.Column(db.String(100))
    sexo = db.Column(db.String(30))
    foneCelular = db.Column(db.String(12))
    dtNascimento = db.Column(db.String(10))

    # endereço
    logradouro = db.Column(db.String(100))
    numero = db.Column(db.String(10))
    complemento = db.Column(db.String(50))
    bairro = db.Column(db.String(50))
    cidade = db.Column(db.String(60))
    estado = db.Column(db.String(30))
    cep = db.Column(db.String(12))

    # acesso
    senha = db.Column(db.String(30))
    dtRegistro = db.Column(db.DateTime, default=datetime.datetime.today())
    superUser = db.Column(db.Boolean, default=False)

    def serialize(self):
        return {
            'id': self.id,
            'situacao': self.situacao,
            'email': self.email,
            'nomeCompleto': self.nomeCompleto
        }

    def __repr__(self):
        return self.serialize()


class tipo(Enum):
    Fisica = "Fisica"
    Juridica = "Jurídica"


class genero(Enum):
    Masculino = "M"
    Feminino = "F"
    Outro = "O"


class situacaoPessoa(Enum):
    Ativa = "Ativa"
    Inativa = "Inativa"


class situacaoUsuario(Enum):
    Ativo = "Ativo"
    Inativo = "Inativo"
    Bloqueado = "Bloqueado"


class tipoCanal(Enum):
    Telefone = "telefone"
    Email = "email"
    Chat = "chat-Online"
    Facebook = "facebook"
    Linkedin = "linkedin"
    Twitter = "twitter"
    Site = "site"
    WhatsApp = "whatsapp"
    SMS = "SMS"


class situacaoCanal(Enum):
    Ativo = "Ativo"
    Inativo = "Inativo"
