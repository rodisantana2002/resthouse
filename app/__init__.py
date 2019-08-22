import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bootstrap import Bootstrap

from app.main.views import views
from app.controls.auth import auth
from app.model.models import models

db = SQLAlchemy()


def create_app():
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY=os.environ.get('SECRET_KEY') or 'key hesthouse')

    DATABASE_URL = os.environ.get(
        'DATABASE_URL', 'sqlite:////home/rodolfosantana/Documentos/projetos/resthouse/app/bd/flask_app.db')

    app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
    app.register_blueprint(views)
    app.register_blueprint(auth)
    app.register_blueprint(models)

    bootstrap = Bootstrap(app)

    db.init_app(app)

    return app
