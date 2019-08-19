import os
from app import create_app
from flask import Flask

app = create_app()

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)


# from flask_migrate import MigrateCommand

# app = create_app(os.getenv('FLASK_ENV') or 'config.DevelopementConfig')
# manager = Manager(app)

# # these names will be available inside the shell without explicit import


# def make_shell_context():
#     return dict(app=app,  db=db, User=User, Post=Post, Tag=Tag, Category=Category,
#                 Employee=Employee, Feedback=Feedback)


# manager.add_command('shell', Shell(make_context=make_shell_context))

# if __name__ == '__main__':
#     app.run()


# import os

# from flask_bootstrap import Bootstrap
# from flask import Flask, render_template, request, redirect, url_for
# from flask_sqlalchemy import SQLAlchemy
# from model.models import Usuario

# app = Flask(__name__, template_folder='templates')
# bootstrap = Bootstrap(app)

# DATABASE_URL = os.environ.get(
#     'DATABASE_URL', 'sqlite:////home/rodolfosantana/Documentos/projetos/resthouse/bd/flask_app.db')

# app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
# db = SQLAlchemy(app)


# @app.route('/', methods=['GET', 'POST'])
# def index():
#     return render_template('login.html')


# @app.route('/login', methods=['POST'])
# def user():
#     error = None
#     # users = User(request.form['username'], request.form['password'])
#     users = Usuario().query.all()

#     if request.method == 'POST':
#         print(request.form['username'])

#         return render_template('index.html', users=users)
#     else:
#         error = 'Invalid username/password'
#         return render_template('index.html', users=users)


# if __name__ == '__main__':
#     port = int(os.environ.get('PORT', 5000))
#     app.run(host='0.0.0.0', port=port, debug=True)
