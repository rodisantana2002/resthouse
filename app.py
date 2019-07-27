# from model.pessoa import pessoa
# from model.enum import *


# pessoa = pessoa("rodolfo", "jose", tipo.Fisica, genero.Masculino)

# print(pessoa.__str__())
from flask import Flask
app = Flask(__name__)


@app.route('/')
def app():
    return '<h1>Hello World!</h1>'


@app.route('/user/<name>')
def user(name):
    return '<h1>Hello, %s!</h1>' % name


if __name__ == '__main__':
    app.run()
