from model.enum import *
from model.pessoa import pessoa


class usuario(object):

    def __init__(self):
        self._id = None
        self._login = ""
        self._senha = ""
        self._situacao = situacaoUsuario.Bloqueado
        self._dtRegistro = ""
        self._superUser = False
        self._pessoa = pessoa()

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def login(self):
        return self._login

    @login.setter
    def id(self, value):
        self._login = value

    @property
    def situacao(self):
        return self._situacao

    @situacao.setter
    def situacao(self, value):
        self._situacao = value

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

    @property
    def pessoa(self):
        return self._pessoa

    @pessoa.setter
    def pessoa(self, value):
        self._pessoa = value
