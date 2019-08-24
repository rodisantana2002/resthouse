import os
from flask import Flask
from app.model.models import *
from flask_sqlalchemy import SQLAlchemy

views = Blueprint("views", __name__)


def Main():
    user = Usuario()
    user.nomecompleto = "rodolfo"
    user.email = "rodisantana@gmail.com"
    user.situacao = "Ativo"
    user.set_password("rodolfo")

    user.add()
    # print(user.exist("rodisantana2002@gmail.com"))

    # db.session.add(user)
    # db.session.commit()

    # print(user.__str__())


if __name__ == '__main__':
    Main()
