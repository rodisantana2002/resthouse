import os

from flask import Flask, Blueprint, render_template, request, redirect, url_for
from app.controls.auth import Autenticacao
from app.model.models import *

views = Blueprint("views", __name__)


@views.route('/', methods=['GET', 'POST'])
def index():
    return render_template('login.html', page=None)


@views.route('/home', methods=['GET', 'POST'])
def home():
    return render_template('index.html')


@views.route('/login', methods=['POST'])
def user():
    auth = Autenticacao()
    result = auth.autenticarUsuario(
        request.form['email-login'], request.form['password'])

    if request.method == 'POST':
        if result.get("code") == "200":
            return redirect(url_for('views.home', page=None))
        else:
            return render_template('login.html', page=result)
    else:
        return render_template('login.html', page=None)
