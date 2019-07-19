class perfilCorporativo(object):
    def __init__():
        self._id = None
        self._razaoSocial = ""
        self._noneFantasia = ""
        self._areaAtuacao = None
        self._enquadramento = None
        self._dtAbertura = None

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def razaoSocial(self):
        return self._razaoSocial

    @razaoSocial.setter
    def razaoSocial(self, value):
        self._razaoSocial = value

    @property
    def noneFantasia(self):
        return self._noneFantasia

    @noneFantasia.setter
    def noneFantasia(self, value):
        self._noneFantasia = value

    @property
    def areaAtuacao(self):
        return self._areaAtuacao

    @areaAtuacao.setter
    def areaAtuacao(self, value):
        self._areaAtuacao = value

    @property
    def enquadramento(self):
        return self._enquadramento

    @enquadramento.setter
    def enquadramento(self, value):
        self._enquadramento = value

    @property
    def dtAbertura(self):
        return self._dtAbertura

    @dtAbertura.setter
    def dtAbertura(self, value):
        self._dtAbertura = value
