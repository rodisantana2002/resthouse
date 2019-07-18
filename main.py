from model.pessoa import pessoa
from model.enum import *


pessoa = pessoa("rodolfo", "jose", tipo.Fisica, genero.Masculino)

print(pessoa.__str__())
