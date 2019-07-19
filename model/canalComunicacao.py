from model.enum import *


class pessoa(object):
    def __init__(self):
        self._id = None  # default
        self._situacao = situacaoCanal.Ativo
        self._canalTipo = None
        self._canalCategoria = None
        self._canalValor = ""
        self._complemento = ""

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
    def canalTipo(self):
        return self._canalTipo

    @canalTipo.setter
    def canalTipo(self, value):
        self._canalTipo = value

    @property
    def canalCategoria(self):
        return self._canalCategoria

    @canalCategoria.setter
    def canalCategoria(self, value):
        self._canalCategoria = value

    @property
    def canalValor(self):
        return self._canalValor

    @canalValor.setter
    def canalValor(self, value):
        self._canalValor = value

    @property
    def complemento(self):
        return self._complemento

    @complemento.setter
    def complemento(self, value):
        self._complemento = value
