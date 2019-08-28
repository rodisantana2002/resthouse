from flask import render_template, current_app, Blueprint
from threading import Thread
from flask_mail import Message, Mail
from app.model.models import *


class Utils():
    def __init__(self):
        self.usuario = Usuario()
    
    def async_send_mail(self, app, msg):
        self.mail = Mail(app)
        with app.app_context():
            self.mail.send(msg)

    def send_mail(self, app, subject, recipient, template):
        user = self.usuario.query.filter_by(email=recipient).first()                
        
        msg = Message(subject, sender=current_app.config['MAIL_DEFAULT_SENDER'], recipients=[recipient])
        msg.html = render_template(template, name=user.nomecompleto, senha=user.senha)

        thr = Thread(target=self.async_send_mail, args=[current_app._get_current_object(), msg])
        thr.start()

        return thr
