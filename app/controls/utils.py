from flask import render_template, current_app, Blueprint
from threading import Thread
from flask_mail import Message, Mail


class Utils():

    def async_send_mail(self, app, msg):
        with app.app_context():
            self.mail.send(msg)

    def send_mail(self, app, subject, recipient, template, **kwargs):
        # # msg = Message(
        # #     subject, sender=current_app.config['MAIL_DEFAULT_SENDER'], recipients=[recipient])

        # # msg.html = render_template(template, **kwargs)

        # # thr = Thread(target=self.async_send_mail, args=[
        # #     current_app._get_current_object(), msg])
        # # thr.start()
        # # return thr

        mail = Mail(app)
        # message = Message(subject, recipients=[
        #                   "rodisantana2002@gmail.com"], html=template)
        # thr = Thread(target=self.send_async_mail(),
        #              args=[app, message])  # pass app
        # thr.start()
        # return thr

        msg = Message('Hello', sender='papersrs2002@gmail.com',
                      recipients=['rodisantana2002@gmail.com'])
        msg.body = "Hello Flask message sent from Flask-Mail"
        mail.send(msg)
        # with app.app_context():
        #     app.mail.send(msg)
        return "Sent"
