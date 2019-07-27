from model.enum import *
from app import db


class pessoa(db.Model):
    __tablename__ = 'pessoa'

    db = SQLAlchemy(app)

    _id = db.Column(db.Integer, primary_key=True)
    _situacao = db.Column(db.String())
    _nomeCompleto = db.Column(db.String())
    _apelido = db.Column(db.String())
    _tipo = db.Column(db.String())
    _genero = db.Column(db.String())

    def __init__(self, nomeCompleto, apelido, tipo, genero):
        self._situacao = situacaoPessoa.Ativa
        self._nomeCompleto = nomeCompleto
        self._apelido = apelido
        self._tipo = tipo
        self._genero = genero

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
    def nomeCompleto(self):
        return self._nomeCompleto

    @nomeCompleto.setter
    def nomeCompleto(self, value):
        self._nomeCompleto = value

    @property
    def tipo(self):
        return self._tipo

    @tipo.setter
    def tipo(self, value):
        self._tipo = value

    @property
    def genero(self):
        return self._genero

    @genero.setter
    def genero(self, value):
        self._genero = value

    def serialize(self):
        return {
            'id': self.id,
            'situacao': self._situacao,
            'nomeCompleto': self._nomeCompleto,
            'apelido': self._apelido,
            'tipo': self._tipo,
            'genero': self._genero
        }

    def __str__(self):
        return self.nomeCompleto + "\n{}".format(self.tipo.value) + "\n{}".format(self.genero.value) + "\n{}".format(self.situacao.value)
