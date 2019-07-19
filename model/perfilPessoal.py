class perfilPessoal(object):
    def __init__():
        self._id = None
        self._dtNascimento = ""
        self._escolaridade = None
        self._imagem = None

    @property
    def id(self):
        return self._id

    @id.setter
    def id(self, value):
        self._id = value

    @property
    def dtNascimento(self):
        return self._dtNascimento

    @dtNascimento.setter
    def dtNascimento(self, value):
        self._dtNascimento = value

    @property
    def escolaridade(self):
        return self._escolaridade

    @escolaridade.setter
    def escolaridade(self, value):
        self._escolaridade = value

    @property
    def imagem(self):
        return self._imagem

    @imagem.setter
    def imagem(self, value):
        self._imagem = value
