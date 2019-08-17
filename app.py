import os

from flask_bootstrap import Bootstrap
from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from model.usuario import User

app = Flask(__name__, template_folder='templates')
bootstrap = Bootstrap(app)

DATABASE_URL = os.environ.get(
    'DATABASE_URL', 'sqlite:////home/rodolfosantana/Documentos/projetos/resthouse/bd/flask_app.db')

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
db = SQLAlchemy(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('login.html')


@app.route('/login', methods=['POST'])
def user():
    error = None
    user = User(request.form['username'], request.form['password'])

    if request.method == 'POST':
        print(request.form['username'])

        return render_template('index.html', users=users)
    else:
        error = 'Invalid username/password'
        return render_template('index.html', users=user)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
