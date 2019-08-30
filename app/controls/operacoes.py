import os
import string

from flask import Flask, Blueprint
from app.model.models import *
from app.controls.utils import *


operacoes = Blueprint("operacoes", __name__)

class Operacoes():
    
    def obterAssociados(self):
        obj = Associado()
        return obj.query.all()





# obj = Associado()
# obj.nomefantasia = "Pizzaria Don Ruan"
# obj.email = "pizaria@gmail.com"
# obj.tipopessoa = "Jurídica"
# obj.resumo = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit"
# obj.cep = "82-300-600"    
# obj.logradouro = "Rua João Esmanhoto"
# obj.numero = "35"
# obj.bairro = "Santa Feleicidade"
# obj.cidade = "Curitiba"
# obj.estado = "Paraná"

# obj.add(obj)
