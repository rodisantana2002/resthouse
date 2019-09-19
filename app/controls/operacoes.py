import os
import string

from flask import Flask, Blueprint
from app.model.models import *
from app.controls.utils import *


operacoes = Blueprint("operacoes", __name__)


class Operacoes():

    def __init__(self):
        self.authentic = {"code": "", "msg": "", "email": "",
                          "token": "", "nome": "", "id": "", "value": ""}
        self.associado = Associado()
        self.tags = TagAssociado()
        self.associado_categoria = AssociadoCategoria()
        self.produtoTamanho = ProdutoTamanho()
        self.carrinho = Carrinho()

    def obterAssociados(self):
        return self.associado.query.all()

    def obterAssociadoById(self, valor):
        return self.associado.query.filter_by(id=valor).first()

    def obterAssociadoCategoriaById(self, valor):
        return self.associado_categoria.query.filter_by(id=valor).first()

    def obterAssociadosByNomeResumo(self, valor):
        return self.associado.query.filter(Associado.nomefantasia.contains(valor.upper()) | Associado.resumo.contains(valor.lower())).all()

    def obterTagsAssociadoByUser(self, usuario_id):
        return self.tags.query.filter_by(usuario_id=usuario_id).all()

    def registrarFavorito(self, associado_id, usuario_id):
        # validar se a Tag existe
        try:
            obj = TagAssociado()
            obj = self.tags.query.filter_by(
                associado_id=associado_id, usuario_id=usuario_id).first()

            if obj != None:
                obj.favorito = "S"
                obj.update()
            else:
                obj = TagAssociado()
                obj.associado_id = associado_id
                obj.usuario_id = usuario_id
                obj.recomendo = "N"
                obj.favorito = "S"

                self.tags.add(obj)

            self.authentic["code"] = "200"
            self.authentic["msg"] = "Registro efetuado com sucesso!"
            return self.authentic

        except:
            self.authentic["code"] = "500"
            self.authentic["msg"] = "Erro desconhecido"

    def obterPreco(self, produto_id, tamanho):
        return self.produtoTamanho.query.filter_by(produto_id=produto_id, tamanho=tamanho).first()

    def registrarProdutoCarrinho(self, Produto):
        try:
            obj = Carrinho()

            obj.add(Produto)

            self.authentic["code"] = "200"
            self.authentic["msg"] = "Registro efetuado com sucesso!"
            return self.authentic

        except:
            self.authentic["code"] = "500"
            self.authentic["msg"] = "Erro desconhecido"

    def obterCarrinho(self, usuario_id):
        return self.carrinho.query.filter_by(usuario_id=usuario_id).all()

    def deleteItemCarrinho(self, id):
        obj = Carrinho()
        obj = self.carrinho.query.filter_by(id=id).first()
        obj.delete(obj)
