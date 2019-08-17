import os

from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite:////tmp/flask_app.db')

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
db = SQLAlchemy(app)


class Usuario(db.Model):
    # dados pessoais
    _id = db.Column(db.Integer, primary_key=True)
    _situacao = db.Column(db.String(30))
    _email = db.Column(db.String(100))
    _nomeCompleto = db.Column(db.String(100))
    _sexo = db.Column(db.String(30))
    _foneCelular = db.Column(db.String(12))
    _dtNascimento = db.Column(db.String(10))

    # endereço
    _logradouro = db.Column(db.String(100))
    _numero = db.Column(db.String(10))
    _complemento = db.Column(db.String(50))
    _bairro = db.Column(db.String(50))
    _cidade = db.Column(db.String(60))
    _estado = db.Column(db.String(30))
    _cep = db.Column(db.String(12))

    # acesso
    _senha = db.Column(db.String(30))
    _dtRegistro = db.Column(db.String(10))
    _superUser = db.Column(db.String(10))

    def __init__(self, email, nomeCompleto):
        self_situacao = "Ativo"
        self._email = email
        self._nomeCompleto = nomeCompleto
        self._sexo = sexo

        self._senha = ""
        self._dtRegistro = ""
        self._superUser = False

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def situacao(self):
        return self._situacao

    @situacao.setter
    def situacao(self, value):
        self._situacao = value

    @property
    def email(self):
        return self._email

    @email.setter
    def email(self, value):
        self._email = value

    @property
    def nomeCompleto(self):
        return self._nomeCompleto

    @nomeCompleto.setter
    def nomeCompleto(self, value):
        self._nomeCompleto = value

    @property
    def sexo(self):
        return self._sexo

    @sexo.setter
    def sexo(self, value):
        self._sexo = value

    @property
    def foneCelular(self):
        return self._foneCelular

    @foneCelular.setter
    def foneCelular(self, value):
        self._foneCelular = value

    @property
    def dtNascimento(self):
        return self._dtNascimento

    @dtNascimento.setter
    def dtNascimento(self, value):
        self._dtNascimento = value

    # endereço
    @property
    def cep(self):
        return self._cep

    @cep.setter
    def cep(self, value):
        self._cep = value

    @property
    def logradouro(self):
        return self._logradouro

    @logradouro.setter
    def logradouro(self, value):
        self._logradouro = value

    @property
    def numero(self):
        return self._numero

    @numero.setter
    def numero(self, value):
        self._numero = value

    @property
    def complemento(self):
        return self._complemento

    @complemento.setter
    def complemento(self, value):
        self._complemento = value

    @property
    def bairro(self):
        return self._bairro

    @bairro.setter
    def bairro(self, value):
        self._bairro = value

    @property
    def cidade(self):
        return self._cidade

    @cidade.setter
    def cidade(self, value):
        self._cidade = value

    @property
    def estado(self):
        return self._estado

    @estado.setter
    def estado(self, value):
        self._estado = value

    # acesso
    @property
    def senha(self):
        return self._senha

    @senha.setter
    def senha(self, value):
        self._senha = value

    @property
    def dtRegistro(self):
        return self._dtRegistro

    @dtRegistro.setter
    def dtRegistro(self, value):
        self._dtRegistro = value

    @property
    def isSuperUser(self):
        return self._superUser

    @superUser.setter
    def isSuperUser(self, value):
        self._superUser = value

    def serialize(self):
        return {
            'id': self.id,
            'situacao': self._situacao,
            'nomeCompleto': self._nomeCompleto,
            'apelido': self._apelido,
            'tipo': self._tipo,
            'genero': self._genero
        }
