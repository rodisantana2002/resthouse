import os
from config import config
from flask import Flask
from model.models import Usuario
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
DATABASE_URL = os.environ.get(
    'DATABASE_URL', 'sqlite:////home/rodolfosantana/Documentos/projetos/resthouse/bd/flask_app.db')

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
db = SQLAlchemy(app)


def Main():
        # db.create_all()
    user = Usuario()
    user.nomecompleto = "rodolfo"
    user.email = "jose441d4d"
    user.situacao = "Ativo"

    db.session.add(user)
    db.session.commit()

    print(user.__str__())


if __name__ == '__main__':
    Main()
