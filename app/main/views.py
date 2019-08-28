import os

from flask import Flask, Blueprint, render_template, session, request, redirect, url_for
from flask_login import login_required, login_user, current_user, logout_user
from app.controls.auth import *
from app.controls.utils import *
from app.model.models import *
from flask_mail import Mail, Message

views = Blueprint("views", __name__)


@views.route('/', methods=['GET', 'POST'])
def index():
    return render_template('login.html', page=None)


@views.route('/home', methods=['GET', 'POST'])
def home():
    return render_template('index.html')


@views.route('/registro', methods=['GET'])
def cadastro():
    return render_template('registro.html', page=None)


@views.route('/validaremail/<email>')
def validar_email(email):
    auth = Autenticacao()
    result = auth.validar_email(email=email)
    return result.get("code")


@views.route('/validarfone/<celular>')
def validar_celular(celular):
    auth = Autenticacao()
    result = auth.validar_celular(celular)
    return result.get("code")


@views.route('/recuperasenha', methods=['GET'])
def recuperar_senha():
    return render_template('recuperasenha.html', page=None)


@views.route('/recuperaemail', methods=['POST'])
def enviar_senha():
    auth = Autenticacao()

    result = auth.validar_email(request.form['email-recuperar'])
    if result.get("code") != "200":
        # enviar email
        # result = auth.enviar_senha(request.form['email-recuperar'])
        resul = Utils()
        resul.send_mail(current_app, "New Feedback",
                        current_app.config['MAIL_DEFAULT_SENDER'], 'feedback.html', )
        return render_template('recuperasenha.html', page=result)
    else:
        return render_template('recuperasenha.html', page=result)


@views.route('/login', methods=['POST'])
def user():
    auth = Autenticacao()
    result = auth.autenticarUsuario(
        request.form['email-login'], request.form['password'])

    if request.method == 'POST':
        if result.get("code") == "200":
            session['email'] = result.get("email")
            return redirect(url_for('views.home'))
        else:
            return render_template('login.html', page=result)
    else:
        return render_template('login.html', page=result)


@views.route('/sendregistro', methods=['POST'])
def registrar():
    usuario = Usuario()

    usuario.nomecompleto = request.form["nomecompleto"]
    usuario.email = request.form["email"]
    usuario.fonecelular = request.form["celular"]
    usuario.sexo = request.form["sexo"]
    usuario.dtnascimento = request.form["dtnascimento"]
    usuario.cep = request.form["cep"]
    usuario.logradouro = request.form["logradouro"]
    usuario.numero = request.form["numero"]
    usuario.complemento = request.form["complemento"]
    usuario.bairro = request.form["bairro"]
    usuario.cidade = request.form["cidade"]
    usuario.estado = request.form["estado"]
    usuario.set_password(request.form["senha"])

    auth = Autenticacao()
    result = auth.registrarUsuario(usuario)

    return render_template('registro.html', page=result)
