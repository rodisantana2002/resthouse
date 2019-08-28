import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bootstrap import Bootstrap
from flask_mail import Mail, Message

from app.main.views import views
from app.controls.auth import auth
from app.model.models import models

db = SQLAlchemy()
app_dir = os.path.abspath(os.path.dirname(__file__))


def create_app():
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY=os.environ.get('SECRET_KEY') or 'key hesthouse')

    DATABASE_URL = os.environ.get(
        'DATABASE_URL', 'sqlite:////home/rodolfosantana/Documentos/projetos/resthouse/app/bd/flask_app.db')

    app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
    app.config['MAIL_SERVER'] = 'smtp.gmail.com'
    app.config['MAIL_PORT'] = 465
    app.config['MAIL_USERNAME'] = 'papersrs2002@gmail.com'
    app.config['MAIL_PASSWORD'] = '12345Perkons'
    app.config['MAIL_USE_TLS'] = false
    app.config['MAIL_USE_SSL'] = True
    app.config['MAIL_DEFAULT_SENDER'] = 'papersrs2002@gmail.com'

    app.register_blueprint(views)
    app.register_blueprint(auth)
    app.register_blueprint(models)

    bootstrap = Bootstrap(app)
    db.init_app(app)

    return app
