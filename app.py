# from model.pessoa import pessoa
# from model.enum import *


# pessoa = pessoa("rodolfo", "jose", tipo.Fisica, genero.Masculino)

# print(pessoa.__str__())
from flask import Flask
import mysql.connector

app = Flask(__name__)


@app.route('/')
def index():
    return '<h1>Hello World!</h1>'


@app.route('/user/<name>')
def user(name):
    mydb = mysql.connector.connect(
        host="db4free.net",
        user="resthouse",
        passwd="123Perkons",
        database="resthouse"
    )

    mycursor = mydb.cursor()
    mycursor.execute("SHOW TABLES")

    for x in mycursor:
        print(x)

    return '<h1>Hello, %s!</h1>' % x


if __name__ == '__main__':
    app.run()
