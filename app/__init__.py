import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from app.main.views import views
from flask_bootstrap import Bootstrap

db = SQLAlchemy()
migrate = Migrate()


def create_app():
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY=os.environ.get('SECRET_KEY') or 'dev_key',
        SQLALCHEMY_DATABASE_URI=os.environ.get('DATABASE_URL') or
        'sqlite:////home/rodolfosantana/Documentos/projetos/resthouse/app/bd/flask_app.db',
        SQLALCHEMY_TRACK_MODIFICATIONS=False
    )

    app.register_blueprint(views)
    bootstrap = Bootstrap(app)

    db.init_app(app)
    migrate.init_app(app, db)

    return app
