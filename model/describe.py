from abc import ABC


class describe(ABC):
    def __init__():
        self._descricao = ""

    @property
    def descricao(self):
        return self._descricao

    @descricao.setter
    def descricao(self, value):
        self._descricao = value
