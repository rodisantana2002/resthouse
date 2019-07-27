from app.model.pessoa import pessoa
from app.model.enum import *

from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)

# # app.config.from_pyfile('config.cfg')
# # 'SQLALCHEMY_DATABASE_URI'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres://slgbapiwlblkgw:8430dc6f67f50a7d333656b1aa792b7c3549052e51bc6a464e134fae63236b03@ec2-174-129-41-127.compute-1.amazonaws.com:5432/dfcitm8gug7cja'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


@app.route("/")
def hello():
    return "Hello World!"


@app.route("/add")
def add_book():
    situacao = situacaoPessoa.Ativa
    nomeCompleto = "mane "
    apelido = "as"
    tipo = tipo.Fisica
    genero = genero.Masculino

    try:
        pessoa = pessoa(nomeCompleto, apelido, tipo, genero)
        db.session.add(pessoa)
        db.session.commit()
        return "Book added. Pessoa id={}".format(pessoa.id)
    except Exception as e:
        return(str(e))
