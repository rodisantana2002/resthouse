import os

from flask import Flask, Blueprint
from app.model.models import Usuario

auth = Blueprint("auth", __name__)


class Autenticacao():
    def __init__(self):
        self.usuario = Usuario()
        self.authentic = {"code": "", "msg": ""}

    def autenticarUsuario(self, email, password):
        try:
            self.usuario.email = email
            user = self.usuario.query.filter_by(email=email).first()
            if user == None:
                self.authentic["code"] = "404"
                self.authentic["msg"] = "Email não foi localizado!"
            else:
                if user.senha != password:
                    self.authentic["code"] = "404"
                    self.authentic["msg"] = "Senha informada esta incorreta!"
                else:
                    self.authentic["code"] = "200"
                    self.authentic["msg"] = "OK"

        except:
            self.authentic.code = "500"
            self.authentic.msg = "Erro desconhecido"

        print(self.authentic)
        return self.authentic

    def registrarUsuario(self, usuario):
        pass
