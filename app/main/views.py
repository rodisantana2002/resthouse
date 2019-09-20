import os

from flask import Flask, Blueprint, render_template, session, request, redirect, url_for, send_from_directory
from app.controls.auth import *
from app.controls.operacoes import *
from app.controls.utils import *
from app.model.models import *
from decimal import Decimal

views = Blueprint("views", __name__)
auth = Autenticacao()
oper = Operacoes()

# Classes referentes a autenticação e regsitro no sistema
# ----------------------
@views.route('/', methods=['GET', 'POST'])
def index():
    if 'email' in session:
        return redirect(url_for('views.home'))
    else:
        return render_template('login.html', page=None)


@views.route('/home', methods=['GET', 'POST'])
def home():
    nome = session.get("nome")
    associados = oper.obterAssociados()
    tags = oper.obterTagsAssociadoByUser(usuario_id=session.get("id"))
    return render_template('index.html', nome=nome, associados=associados, tags=tags)


@views.route('/home/filtrar', methods=['POST'])
def filtrar_associado():
    nome = session.get("nome")
    associados = oper.obterAssociadosByNomeResumo(
        request.form['txtAssociadoFiltrar'])
    tags = oper.obterTagsAssociadoByUser(usuario_id=session.get("id"))
    return render_template('index.html', nome=nome, associados=associados, tags=tags)


@views.route('/logout', methods=['GET'])
def sair():
    session.pop('email', None)
    session.pop('id', None)
    session.pop('nome', None)
    session.pop('token', None)
    return redirect(url_for('views.index'))


@views.route('/validaremail/<email>')
def validar_email(email):
    result = auth.validar_email(email=email)
    return result.get("code")


@views.route('/validarfone/<celular>')
def validar_celular(celular):
    result = auth.validar_celular(celular)
    return result.get("code")


@views.route('/recuperasenha', methods=['GET'])
def recuperar_senha():
    if 'email' in session:
        return redirect(url_for('views.home'))
    else:
        return render_template('recuperasenha.html', page=None)


@views.route('/recuperasenha/envio', methods=['POST'])
def enviar_senha():
    result = auth.validar_email(request.form['email-recuperar'])

    if 'email' in session:
        return redirect(url_for('views.home'))
    else:
        if result.get("code") != "200":
            # atualizar senha e enviar email
            result = auth.enviar_senha(request.form['email-recuperar'])
            return redirect(url_for('views.recuperar_senha'))
        else:
            return render_template('recuperasenha.html', page=result)


@views.route('/login', methods=['POST'])
def user():
    result = auth.autenticarUsuario(
        request.form['email-login'], request.form['password'])

    if 'email' in session:
        return redirect(url_for('views.home'))
    else:
        if request.method == 'POST':
            if result.get("code") == "200":
                session['email'] = result.get("email")
                session['token'] = result.get("token")
                session['nome'] = result.get("nome")
                session['id'] = result.get("id")
                return redirect(url_for('views.home'))
            else:
                return render_template('login.html', page=result)
        else:
            return render_template('login.html', page=result)


@views.route('/registro', methods=['GET'])
def cadastro():
    if 'email' in session:
        return redirect(url_for('views.home'))
    else:
        return render_template('registro.html', page=None)


@views.route('/registro/envio', methods=['POST'])
def registrar():
    if 'email' in session:
        return redirect(url_for('views.home'))
    else:
        usuario = Usuario()

        usuario.nomecompleto = request.form["nomecompleto"]
        usuario.email = request.form["email"]
        usuario.fonecelular = request.form["celular"]
        usuario.sexo = request.form["sexo"]
        usuario.dtnascimento = request.form["dtnascimento"]
        usuario.cep = request.form["cep"]
        usuario.logradouro = request.form["logradouro"]
        usuario.numero = request.form["numero"]
        usuario.complemento = request.form["complemento"]
        usuario.bairro = request.form["bairro"]
        usuario.cidade = request.form["cidade"]
        usuario.estado = request.form["estado"]
        usuario.set_password(request.form["senha"])

        result = auth.registrarUsuario(usuario)

        return render_template('registro.html', page=result)


# Classes referentes a operações
# ----------------------
@views.route('/media/<path:filename>')
def media(filename):
    return send_from_directory(current_app.config.get('MEDIA_ROOT'), filename)


@views.route('/favorito/associado/<id>')
def registrarFavorito(id):
    result = oper.registrarFavorito(id, session.get("id"))
    return result.get("msg")


@views.route('/associado/<associado_id>')
def carregar_cardapio(associado_id):
    if 'email' in session:
        associado = oper.obterAssociadoById(associado_id)
        return render_template('cardapio.html', associado=associado)
    else:
        return render_template('login.html', page=None)


@views.route('/associado/categoria/<associado_categoria_id>')
def carregar_cardapio_produtos(associado_categoria_id):
    if 'email' in session:
        associado_categoria = oper.obterAssociadoCategoriaById(
            associado_categoria_id)
        return render_template('cardapio_produtos.html', associado_categoria=associado_categoria)
    else:
        return render_template('login.html', page=None)


@views.route('/produto', methods=['GET'])
def obterProdutoPreco():
    if 'email' in session:
        id = request.args.get('id')
        tamanho = request.args.get('tamanho')

        produto_tamanho = oper.obterPreco(id, tamanho)
        return produto_tamanho.valor
    else:
        return render_template('login.html', page=None)


@views.route('/carrinho', methods=['POST'])
def registrarCarrinho():
    if 'email' in session:
        carrinho = Carrinho()

        carrinho.usuario_id = session.get("id")
        carrinho.produto_id = request.values.get('produto_id')
        carrinho.associado_id = request.values.get('associado_id')
        carrinho.categoria = request.values.get('categoria')
        carrinho.resumo = request.values.get('resumo')
        carrinho.tamanho = request.values.get('tamanho')
        # ------------------------------------------------------------------
        carrinho.quantidade = request.values.get('quantidade')
        carrinho.valor_unitario = request.values.get('valor_unitario')
        carrinho.total_item = str((int(request.values.get('quantidade')) * Decimal(
            request.values.get('valor_unitario')[3:].replace(",", "."))))
        carrinho.ids = request.values.get('ids')

        result = oper.registrarProdutoCarrinho(carrinho)
        return result.get("code")

    else:
        return render_template('login.html', page=None)


@views.route('/carrinho/itens', methods=['GET'])
def obterCarrinho():
    if 'email' in session:
        carrinho = oper.obterCarrinho(session.get("id"))
        return render_template('carrinho.html', carrinho=carrinho)
    else:
        return render_template('login.html', page=None)


@views.route('/carrinho/item', methods=['POST'])
def deleteItemCarrinho():
    id = request.values.get('id')

    if 'email' in session:
        # remove item
        result = oper.deletarItemCarrinho(id)
        return "200"

    else:
        return render_template('login.html', page=None)


@views.route('/carrinho/limpar', methods=['POST'])
def limparCarrinho():
    if 'email' in session:
        # limpa o carrinho
        itens = oper.obterCarrinho(session.get("id"))
        for item in itens:
            result = oper.deletarItemCarrinho(item.id)

        return "200"

    else:
        return render_template('login.html', page=None)

@views.route('/perfil', methods=['GET'])
def atualizarPerfil():
    if 'email' in session:
        return render_template('perfil.html', Usuario=None)

    else:
        return render_template('login.html', page=None)
    
@views.route('/pedido', methods=['GET'])
def obterPedidos():
    if 'email' in session:
        itens = oper.obterCarrinho(session.get("id"))
        if len(itens)>0:
            Pedidos = oper.gerarPedidos(session.get('id'))
            limparCarrinho()
                    
            return render_template('pedidos.html', Pedidos=Pedidos)
        else:
            return redirect(url_for('views.home'))

    else:
        return render_template('login.html', page=None)
    