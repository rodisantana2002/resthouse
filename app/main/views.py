import os

from flask import Flask, Blueprint, render_template, request, redirect, url_for
from app.model.models import Usuario

views = Blueprint("views", __name__)


@views.route('/', methods=['GET', 'POST'])
def index():
    return render_template('login.html')


@views.route('/login', methods=['POST'])
def user():
    error = None
    # users = User(request.form['username'], request.form['password'])
    users = Usuario().query.all()

    if request.method == 'POST':
        print(request.form['username'])

        return render_template('index.html', users=users)
    else:
        error = 'Invalid username/password'
        return render_template('index.html', users=users)
