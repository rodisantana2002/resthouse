import os
import datetime


from enum import Enum
from flask import Flask, Blueprint
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import DateTime

from werkzeug.security import generate_password_hash, check_password_hash

models = Blueprint("models", __name__)

app = Flask(__name__)
db = SQLAlchemy(app)


# Usuario
class Usuario(db.Model):
    __tablename__ = "usuario"

    # dados pessoais
    id = db.Column(db.Integer, primary_key=True)

    situacao = db.Column(db.String(30), default="Ativa")
    email = db.Column(db.String(100))
    nomecompleto = db.Column(db.String(100))
    sexo = db.Column(db.String(30))
    fonecelular = db.Column(db.String(12))
    dtnascimento = db.Column(db.String(10))

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
    dtregistro = db.Column(db.DateTime, default=datetime.datetime.today())
    superuser = db.Column(db.Boolean, default=False)
    token = db.Column(db.String(100))

    def set_password(self, password):
        self.senha = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.senha, password)

    def add(self, usuario):
        db.session.add(usuario)
        db.session.commit()

    def update(self):
        db.session.commit()    

    def serialize(self):
        return {
            'id': self.id,
            'situacao': self.situacao,
            'email': self.email,
            'nomeCompleto': self.nomecompleto,
            'token': self.token
        }

    def __repr__(self):
        return self.serialize()
