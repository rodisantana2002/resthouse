import os
import string

from flask import Flask, Blueprint
from app.model.models import *
from app.controls.utils import *


operacoes = Blueprint("operacoes", __name__)

class Operacoes():
    
    def obterAssociados(self):
        obj = Associado()
        return obj.query.all()
    
    
    def obterTagsAssociado(self, associado_id, usuario_id):
        obj = TagAssociado()        
        return obj.query.filter_by(associado_id = associado_id, usuario_id=usuario_id).first()