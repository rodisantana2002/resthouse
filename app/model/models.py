import os
import datetime


from enum import Enum
from flask import Flask, Blueprint
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import DateTime
from sqlalchemy.orm import relationship, backref

from werkzeug.security import generate_password_hash, check_password_hash

models = Blueprint("models", __name__)

app = Flask(__name__)
db = SQLAlchemy(app)


# Classe Usuario
class Usuario(db.Model):
    __tablename__ = "usuario"

    # dados pessoais
    id = db.Column(db.Integer, primary_key=True)

    situacao = db.Column(db.String(30), default="Ativa")
    email = db.Column(db.String(100))
    nomecompleto = db.Column(db.String(100))
    sexo = db.Column(db.String(30))
    fonecelular = db.Column(db.String(12))
    dtnascimento = db.Column(db.String(10))

    # endereço
    logradouro = db.Column(db.String(100))
    numero = db.Column(db.String(10))
    complemento = db.Column(db.String(50))
    bairro = db.Column(db.String(50))
    cidade = db.Column(db.String(60))
    estado = db.Column(db.String(30))
    cep = db.Column(db.String(12))

    # acesso
    senha = db.Column(db.String(30))
    dtregistro = db.Column(db.DateTime, default=datetime.datetime.today())
    superuser = db.Column(db.Boolean, default=False)
    token = db.Column(db.String(100))

    def set_password(self, password):
        self.senha = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.senha, password)

    def add(self, usuario):
        db.session.add(usuario)
        db.session.commit()

    def update(self):
        db.session.commit()    

    def serialize(self):
        return {
            'id': self.id,
            'situacao': self.situacao,
            'email': self.email,
            'nomeCompleto': self.nomecompleto,
            'token': self.token
        }

    def __repr__(self):
        return self.serialize()


# Classe Associado
class Associado(db.Model):
    __tablename__ = "associado"

    # dados essenciais
    id = db.Column(db.Integer, primary_key=True)

    situacao = db.Column(db.String(30), default="Ativa")
    email = db.Column(db.String(100))
    nomefantasia = db.Column(db.String(100))
    resumo = db.Column(db.String(400))
    tipopessoa = db.Column(db.String(30))
    categoria = db.Column(db.String(60))
    funcionamentodias = db.Column(db.String(50))
    funcionamentohorarioinicio = db.Column(db.String(20))
    funcionamentohorariotermino = db.Column(db.String(20))
    taxaentrega = db.Column(db.String(1), default="N")
    valortaxaentrega = db.Column(db.String(10), default="0,00")
    
    # endereço
    logradouro = db.Column(db.String(100))
    numero = db.Column(db.String(10))
    complemento = db.Column(db.String(50))
    bairro = db.Column(db.String(50))
    cidade = db.Column(db.String(60))
    estado = db.Column(db.String(30))
    cep = db.Column(db.String(12))

    # acesso
    dtregistro = db.Column(db.DateTime, default=datetime.datetime.today())
    logo = db.Column(db.String(100))
    
    categorias = relationship("Categoria", secondary='associado_categorias')

    def add(self, associado):
        db.session.add(associado)
        db.session.commit()

    def update(self):
        db.session.commit()    

    def serialize(self):
        return {
            'id': self.id,
            'situacao': self.situacao,
            'email': self.email,
            'nomeFantasia': self.nomefantasia,
            'resumo': self.resumo
        }

    def __repr__(self):
        return self.serialize()


# Classe associativa UsuarioxAssociadoxTags
class TagAssociado(db.Model):
    __tablename__ = "associado_usuario_tags"

    # dados essenciais
    id = db.Column('id', db.Integer, primary_key=True)
    
    associado_id = db.Column(db.Integer, db.ForeignKey('associado.id'))
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuario.id'))
    recomendo = db.Column(db.String(1))
    favorito = db.Column(db.String(1))
    dtregistro = db.Column(db.DateTime, default=datetime.datetime.today())
    
    user = relationship(Usuario, backref=backref("associado_usuario_tags", cascade="all, delete-orphan"))
    assoc = relationship(Associado, backref=backref("associado_usuario_tags", cascade="all, delete-orphan"))
    
    def add(self, tag):
        db.session.add(tag)
        db.session.commit()

    def update(self):
        db.session.commit()    
        
    def serialize(self):
        return {
            'id': self.id,
            'usuario_id': self.usuario_id,
            'nomeCompleto':self.user.nomecompleto,
            'associado_id': self.associado_id,
            'nomeFantasia': self.assoc.nomefantasia,
            'favorito': self.favorito,
            'recomendo': self.recomendo
        }

    def __repr__(self):
        return self.serialize()


# Classe Categorias
class Categoria(db.Model):
    __tablename__ = "categoria"

    # dados essenciais
    id = db.Column('id', db.Integer, primary_key=True)
    descricao = db.Column(db.String(60))
    logo = db.Column(db.String(100))
    dtregistro = db.Column(db.DateTime, default=datetime.datetime.today())
    
    def serialize(self):
        return {
            'id': self.id,
            'descricao': self.descricao,
            'logo': self.logo,
            'dtregistro': self.dtregistro
        }

    def __repr__(self):
        return self.serialize()   


# Classe associativa AssociadoxCategorias
class AssociadoCategoria(db.Model):
    __tablename__ = "associado_categorias"

    # dados essenciais
    id = db.Column('id', db.Integer, primary_key=True)
    
    associado_id = db.Column(db.Integer, db.ForeignKey('associado.id'))
    categoria_id = db.Column(db.Integer, db.ForeignKey('categoria.id'))
    resumo = db.Column(db.String(60))
    logo = db.Column(db.String(100))
    dtregistro = db.Column(db.DateTime, default=datetime.datetime.today())
    
    catego = relationship(Categoria, backref=backref("associado_categorias", cascade="all, delete-orphan"))
    assoc = relationship(Associado, backref=backref("associado_categorias", cascade="all, delete-orphan"))
            
    def serialize(self):
        return {
            'id': self.id,
            'associado_id': self.associado_id,
            'nomeFantasia': self.assoc.nomefantasia,
            'categoria_id':self.categoria_id,
            'categoria': self.catego.descricao,
            'resumo': self.resumo,
            'logo': self.logo    
        }

    def __repr__(self):
        return self.serialize()
