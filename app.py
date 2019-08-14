import os

from flask_bootstrap import Bootstrap
from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from model.usuario import User

app = Flask(__name__)


DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite:////tmp/flask_app.db')

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
db = SQLAlchemy(app)


@app.route('/', methods=['GET'])
def index():
    return render_template('index.html', users=User.query.all())


@app.route('/user', methods=['POST'])
def user():
    u = User(request.form['name'], request.form['email'])
    db.session.add(u)
    db.session.commit()
    return redirect(url_for('index'))


if __name__ == '__main__':
    db.create_all()
    port = int(os.environ.get('PORT', 5000))
    Bootstrap(app)
    app.run(host='0.0.0.0', port=port, debug=True)
