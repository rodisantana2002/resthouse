class perfilProfissional(object):
    def __init__():
        self._id = None
        self._profissao = ""

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def profissao(self):
        return self._profissao

    @profissao.setter
    def profissao(self, value):
        self._profissao = value
