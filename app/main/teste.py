import os
from flask import Flask
from flask_mail import Mail, Message


# @app.route("/")
# def index():
#     msg = Message('Hello', sender='papersrs2002@gmail.com',
#                   recipients=['papersrs2002@gmail.com'])
#     msg.body = "Hello Flask message sent from Flask-Mail"
#     mail.send(msg)
#     return "Sent"


if __name__ == '__main__':
    app = Flask(__name__)

    app.config['MAIL_SERVER'] = 'smtp.gmail.com'
    app.config['MAIL_PORT'] = 587
    app.config['MAIL_USERNAME'] = 'papersrs2002@gmail.com'
    app.config['MAIL_PASSWORD'] = '12345Perkons'
    app.config['MAIL_USE_TLS'] = True
    app.config['MAIL_USE_SSL'] = False

    mail = Mail(app)
    msg = Message('Hello', sender='papersrs2002@gmail.com',
                  recipients=['papersrs2002@gmail.com'])
    msg.body = "Hello Flask message sent from Flask-Mail"
    mail.send(msg)

    # port = int(os.environ.get('PORT', 5000))
    # app.run(host='0.0.0.0', port=port, debug=True)
