//Validar Campos
(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('form-horizontal');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();


$(document).ready(function () {
    //var url_base = "http://localhost:5000/";
   var url_base = "https://resthouse.herokuapp.com/";

    var numSabores = 0;
    var lstProdutos = []
    var linha = 0;

    $("#ex19").change(function () {
        numSabores = $("#ex19").val();
        ExibirPrecos();
    });

    // adiciona sabora da pizza para a lista de opçoes
    $(".adicionaSabor").click(function () {
        var produto = jQuery.parseJSON($(this).val());
        var script = "";

        $('#tblSaboresSelecionados').show();
        $('#lblItensSelecionados').show();
        $('#paneSubTotal').show();

        $('#lblNenhumSaborSelecionado').hide();

        if (numSabores > lstProdutos.length) {
            $("#tblSaboresSelecionados tbody").append(
                "<tr>" +
                "<td style='color:#563A2D'>" + "<b>" + produto.descricao + " </b> - " + produto.resumo + "</td>" +
                "<td ><button type='button' style='color:#563A2D' class='btnDelete btn-link'> <i class='material-icons'>cancel</i> </button></td>" +
                "</tr>");

            // popula array com produtos adicionados
            script = url_base + "produto?id=" + produto.id + "&tamanho=" + numSabores;

            $.ajax({
                url: script,
                type: 'get',
                dataType: 'html',
                async: false,
                success: function (data) {
                    produto.valor = data;
                }
            });

            lstProdutos.push(produto);
            AtualizarPreco();
        }
        else {
            bootbox.alert({
                message: "A quantidade de sabores atingiu o limite permitido",
                size: 'small'
            });
        }
    });

    // exclui um sabor adicionado a lista de opçoes
    $("#tblSaboresSelecionados").on('click', '.btnDelete', function () {
        lstProdutos.splice($(this).closest('tr').index(), 1);
        $(this).closest('tr').remove();
        AtualizarPreco();

        if (lstProdutos.length === 0) {
            $('#tblSaboresSelecionados').hide();
            $('#lblItensSelecionados').hide();
            $('#paneSubTotal').hide();

            $('#lblNenhumSaborSelecionado').show();
        }
    });


    // Adiciona Pizzas ao Carrinho
    $("#btnAdicionarPizzaCarrinho").click(function () {
        var resumo = "";
        var categoria = $("#lblCategoria").html().trim().replace('<b>', "").replace('</b>', "");
        var tamanho = getTamanho($("#ex19").val());
        var ids = "";

        for (var i = 0; i < lstProdutos.length; i++) {
            resumo = resumo + lstProdutos[i].descricao + " (" + lstProdutos[i].tipo + "), ";
            ids = ids + ", " + lstProdutos[i].id
        }

        $.ajax({
            type: "POST",
            data: { produto_id: lstProdutos[0].id, resumo: resumo.substr(0, resumo.length - 2), quantidade: "01", valor_unitario: $("#lblPreco").html(), tamanho: tamanho, associado_id: lstProdutos[0].associado_id, ids: ids, categoria: categoria },
            url: url_base + "carrinho",
            async: false,
            success: function (data) {
                if (data === "200") {
                    bootbox.alert({
                        message: "Produto adicionado ao carrinho com sucesso!",
                        size: 'small'
                    });
                }
            }
        });
        LimparTabela();
        $("#divSelecaoSabores").hide();
        $('#ex19').slider('refresh');
    });

    //Adiciona produtos simples ao carrinho 
    $(".btnAdicionarProdutoCarrinho").click(function () {
        var produto = jQuery.parseJSON($(this).val());
        var categoria = $("#lblCategoria").html().trim().replace('<b>', "").replace('</b>', "");
        var quantidade = $("input[class=quantity" + produto.id + "]").val();

        $.ajax({
            type: "POST",
            data: { produto_id: produto.id, resumo: produto.descricao, quantidade: quantidade, valor_unitario: "R$ " + produto.valor, tamanho: "", associado_id: produto.associado_id, ids: "", categoria: categoria },
            url: url_base + "carrinho",
            async: false,
            success: function (data) {
                if (data === "200") {
                    bootbox.alert({
                        message: "Produto adicionado ao carrinho com sucesso!",
                        size: 'small'
                    });

                }
            }
        });
        $("input[class=quantity" + produto.id + "]").val("1");
    });

    $(".btnDeleteItemCarrinho").click(function () {
        var id = $(this).val();
        bootbox.confirm({
            message: "Confirma a remoção do item de seu Carrinho?",
            size: "small",
            buttons: {
                confirm: {
                    label: 'Sim',
                    label: '<i class="fa fa-check"></i> Confirm',                    
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Não',
                    label: '<i class="fa fa-times"></i> Cancel',                                        
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result) {
                    $.ajax({
                        type: "POST",
                        data: { id: id },
                        url: url_base + "carrinho/item",
                        async: false,
                        success: function (data) { }
                    });
                    location.reload();
                }
            }
        });
    });


    $("#btnLimparCarrinho").click(function () {
        bootbox.confirm({
            message: "Confirma a remoção de todos os itens de seu Carrinho?",
            size: "small",
            buttons: {
                confirm: {
                    label: 'Sim',
                    label: '<i class="fa fa-check"></i> Confirm',                    
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Não',
                    label: '<i class="fa fa-times"></i> Cancel',                    
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: url_base + "carrinho/limpar",
                        async: false,
                        success: function (data) { }
                    });
                    location.reload();
                }
            }
        });

    });

    $("#btnFinalizarCompra").click(function () {
        bootbox.confirm({
            message: "Confirma a compra dos produtos?",
            size: "small",
            buttons: {
                confirm: {
                    label: 'Sim',
                    label: '<i class="fa fa-check"></i> Confirm',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Não',
                    label: '<i class="fa fa-times"></i> Cancel',                    
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: url_base + "pedido/gerar",
                        async: false,
                        success: function (data) { }
                    });
                    $(location).attr('href', url_base + 'pedido/1');
                }
            }
        });
    });

    //Funcoes referentes aos pedidos
    $("#btn-pesquisar").click(function () {
        bootbox.prompt({
            title: "Filtrar pedidos",
            size: "small",
            message: '<p>Selecine os status desejados</p>',
            inputType: 'checkbox',
            inputOptions: [
                {
                    text: 'Iniciado',
                    value: '1',
                },
                {
                    text: 'Em Análise',
                    value: '2',
                },
                {
                    text: 'Entrega',
                    value: '3',
                },
                {
                    text: 'Finalizado',
                    value: '4',
                },
                {
                    text: 'Cancelado',
                    value: '5',
                },
                {
                    text: 'Todos',
                    value: '0',
                },
            ],
            callback: function (result) {
                if (result != null && result != '0') {
                    $(location).attr('href', url_base + 'pedido/' + result);
                }
                else {
                    $(location).attr('href', url_base + 'pedido/');
                }
            }
        });
    });

    $(".btnAdicionarComentario").click(function () {
        var pedido = jQuery.parseJSON($(this).val());

        bootbox.prompt({
            size: "small",
            title: "Adicione comentários e observações ao seu pedido:",
            value: pedido.observacao,
            callback: function (result) {
                if (result != null) {
                    $.ajax({
                        type: "POST",
                        data: { id: pedido.id, observacao: result},
                        url: url_base + "pedido/atualizar",
                        async: false,
                        success: function (data) { 
                            $(location).attr('href', url_base + 'pedido');
                        }
                    });
                }
            }
        });       
    });

    $(".btnCancelarPedido").click(function () {
        var pedido = jQuery.parseJSON($(this).val());

        bootbox.confirm({
            message: "Confirma o cancelamento do Pedido?",
            size: "small",
            buttons: {
                confirm: {
                    label: 'Sim',
                    label: '<i class="fa fa-check"></i> Confirm',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Não',
                    label: '<i class="fa fa-times"></i> Cancel',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: url_base + "pedido/cancelar",
                        data:{id: pedido.id},
                        async: false,
                        success: function (data) { 
                            $(location).attr('href', url_base + 'pedido/5');
                        }
                    });
                }
            }           
        });
    });

    $(".btnFinalizarPedido").click(function () {
        var pedido = jQuery.parseJSON($(this).val());
        
        if (pedido.agenda_entrega==="S") {
           bootbox.prompt({
                title: "Informe a Data de Agendamento para o pedido:",
                inputType: 'date',
                callback: function (result) {
                    if (result!=null && result!=''){
                        if (result) {
                            $.ajax({
                                type: "POST",
                                url: url_base + "pedido/finalizar",
                                data:{id: pedido.id, dtagendamento: result, agenda_entrega:pedido.agenda_entrega},
                                async: false,
                                success: function (data) { 
                                    if (data==="200"){
                                        $(location).attr('href', url_base + 'pedido/2');
                                    }
                                    else{
                                        bootbox.alert({
                                            message: data,
                                            size: 'small'
                                        });                                          
                                    }
                                },
                                error: function (data) { 
                                    $(location).attr('href', url_base + 'pedido/');
                                }                           
                            });
                        }
                    }
                    else{
                        bootbox.alert({
                            message: "Deve ser informada uma Data de Agendamento para o pedido",
                            size: 'small'
                        });                        
                    }
                }
            });
        }
        else{
            bootbox.confirm({
                message: "Confirma a finalização do Pedido?",
                size: "small",
                buttons: {
                    confirm: {
                        label: 'Sim',
                        label: '<i class="fa fa-check"></i> Confirm',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'Não',
                        label: '<i class="fa fa-times"></i> Cancel',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            type: "POST",
                            url: url_base + "pedido/finalizar",
                            data:{id: pedido.id, dtagendamento:"", agenda_entrega:pedido.agenda_entrega},
                            async: false,
                            success: function (data) { 
                                $(location).attr('href', url_base + 'pedido/2');
                            }
                        });
                    }
                }
            });        
        }
    });


    $("#btn-dados").click(function(){
        $("#paneDados").show();
        $("#paneSenha").hide();
        $("#paneMenu").hide();
    });
    
    $("#btn-senha").click(function(){
        $("#paneDados").hide();
        $("#paneSenha").show();
        $("#paneMenu").hide();        
    });

    $("#btnSalvarDados").click(function(){
        if (validarDados()){
            $.ajax({
                type: "POST",
                url: url_base + "perfil/atualizar",
                data:{nomecompleto: $("#nomecompleto").val(),
                      celular: $("#celular").val(),
                      dtnascimento: $("#dtnascimento").val(),
                      sexo: $("#sexo").val(),
                      cep: $("#cep").val(),
                      logradouro: $("#logradouro").val(),
                      numero: $("#numero").val(),
                      complemento: $("#complemento").val(),
                      bairro: $("#bairro").val(),
                      cidade: $("#cidade").val(),
                      estado: $("#estado").val()
                    },
                async: false,
                success: function (data) { 
                    $(location).attr('href', url_base + 'perfil');
                }
            });     
        }        
    });

    $("#btnSalvarSenha").click(function(){
        if(validarSenha()){
            $.ajax({
                type: "POST",
                url: url_base + "perfil/acesso",
                data:{senhaAtual: $("#senhaAtual").val(), senha: $("#senha").val()},
                async: false,
                success: function (data) {
                    if (data==="403"){
                        bootbox.alert({
                            message: "Senha atual não confere!",
                            size: 'small'
                        });                        
                        $("#senhaAtual").focus();                        
                    }
                    else{
                        bootbox.alert({
                            message: "Senha alterada com sucesso!",
                            size: 'small'
                        });                        
                        $("#senhaAtual").val("");
                        $("#senha").val(""),
                        $("#resenha").val("");
                    }
                }
            });     
        }        
    });

    // filtra associados
    $("#btnAssociadoFiltrar").click(function () {
        bootbox.prompt({
            size: "small",
            title: "Informe um valor para ser pesquisado",
            callback: function (result) {
                if (result != null) {
                    $(location).attr('href', url_base + 'associado/' + result);
                }
            }
        });        
    });



    // Atualiza precos conforme mudança de tamanh
    function ExibirPrecos() {
        if (numSabores > 0) {
            LimparTabela();
            $("#divSelecaoSabores").show();
            $("#divSelecaoSaboresTitulo").html("<b>Escolha até " + numSabores + " sabor(es)</b>")

            if (numSabores === '4') {
                $("span[name='4']").show();
                // 
                $("span[name='3']").hide();
                $("span[name='2']").hide();
                $("span[name='1']").hide();

            }

            if (numSabores === '3') {
                $("span[name='3']").show();
                // 
                $("span[name='4']").hide();
                $("span[name='2']").hide();
                $("span[name='1']").hide();
            }

            if (numSabores === '2') {
                $("span[name='2']").show();
                // 
                $("span[name='4']").hide();
                $("span[name='3']").hide();
                $("span[name='1']").hide();
            }

            if (numSabores === '1') {
                $("span[name='1']").show();
                // 
                $("span[name='4']").hide();
                $("span[name='3']").hide();
                $("span[name='2']").hide();
            }
        }
        else {
            LimparTabela();
            $("#divSelecaoSabores").hide();
        }
    }

    //Retorna o tamanhos e Num de pedaços
    function getTamanho(tamanho) {
        if (tamanho === "1") {
            return "Pequena - 4 pedaços"
        }
        if (tamanho === "2") {
            return "Mẽdia - 6 pedaços"
        }
        if (tamanho === "3") {
            return "Grande - 8 pedaços"
        }
        if (tamanho === "4") {
            return "Big - 12 pedaços"
        }
    }

    // limpa a lista de opções
    function LimparTabela() {
        numSaboresAdicionados = 0;
        lstProdutos = []
        $("#tblSaboresSelecionados tr").remove();
        $("#lblPreco").html("R$ 0.00");

        $('#tblSaboresSelecionados').hide();
        $('#lblItensSelecionados').hide();
        $('#paneSubTotal').hide();
        $('#lblNenhumSaborSelecionado').show();
    }

    // define eexibe o maior valor entre as opções selecionadas
    function AtualizarPreco() {
        var maxValor = 0.00
        for (var i = 0; i < lstProdutos.length; i++) {
            var valor = lstProdutos[i].valor.replace(",", ".");
            if (parseFloat(valor) >= maxValor) {
                maxValor = valor;
            }
        }
        $("#lblPreco").html("R$ " + maxValor.toString().replace(".", ","));
    }


    // Select first tab
    $("a[name='observacao']").tab('show')

    if ($("#login-alerta").html() === "") {
        $("#login-alerta").hide();
    } else {
        $("#login-alerta").show();
    };

    // exibe alerta regsitro
    if ($("#registro-alerta").html() === "") {
        $("#registro-alerta").hide();
    } else {
        $("#registro-alerta").show();
    };

    // exibe alerta envioemail
    if ($("#recupera-senha").html() === "") {
        $("#recupera-senha").hide();
    } else {
        $("#recupera-senha").show();
    };

    // carrega cep no formulario de registro usuario
    $("#cep").change(function () {
        var cep_code = $(this).val();
        if (cep_code.length <= 0) return;

        $.get("https://viacep.com.br/ws/" + cep_code + "/json/",
            function (result) {
                if (("erro" in result)) {
                    bootbox.alert("CEP informado não foi encontrado!");
                    return;
                } 
                else {
                    $("#cep").val(result.cep);
                    $("#logradouro").val(result.logradouro);
                    $("#bairro").val(result.bairro);
                    $("#cidade").val(result.localidade);
                    $("#estado").val(result.uf);
                    $("#numero").focus();
                }
            }
        );
    });

    $("#cep").mask("99999-999");

    $("#btn-signup").click(function () {
        if (validar()) {
            $.ajax({
                type: "POST",
                url: url_base + "registro/envio",
                data:{nomecompleto: $("#nomecompleto").val(),
                      email: $("#email").val(),
                      celular: $("#celular").val(),
                      dtnascimento: $("#dtnascimento").val(),
                      sexo: $("#sexo").val(),
                      senha: $("#senha").val(),
                      cep: $("#cep").val(),
                      logradouro: $("#logradouro").val(),
                      numero: $("#numero").val(),
                      complemento: $("#complemento").val(),
                      bairro: $("#bairro").val(),
                      cidade: $("#cidade").val(),
                      estado: $("#estado").val()
                    },
                async: false,
                success: function (data) { 
                    bootbox.alert({
                        message: "Registro efetuado com sucesso",
                        size: 'small'
                    });    

                    $("#nomecompleto").val("");
                    $("#email").val("");
                    $("#celular").val("");
                    $("#dtnascimento").val("");
                    $("#sexo").val("Sexo *");
                    $("#senha").val("");
                    $("#resenha").val("");
                    $("#cep").val("");
                    $("#logradouro").val("");
                    $("#numero").val("");
                    $("#complemento").val("");
                    $("#bairro").val("");
                    $("#cidade").val("");
                    $("#estado").val("Estado *");

                }
            });            
        }
    });

    $("#btn-enviar-email").click(function () {
        if (validaremail()) {
            $("#recuperaform").submit();
        }
    });

    // functions
    function validaremail() {
        var msg = "O campo deve ser informado!"

        if ($("#email-recuperar").val().trim().length === 0) {
            $("#recupera-senha").html(msg);
            $("#recupera-senha").show();
            $("#email-recuperar").focus();
            return false;
        }

        if (!validateEmail($("#email-recuperar").val())) {
            $("#recupera-senha").html("Email não esta no formato válido!");
            $("#recupera-senha").show();
            $("#email-recuperar").focus();
            return false;
        }
        return true;
    }


    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    function email_exist(email) {
        $.get("validaremail/" + email,
            function (result) {
                if (result === "404") {
                    $("#registro-alerta").html("Ops! Esse email já esta sendo utilizado por outro usuário!");
                    $("#registro-alerta").show();
                    $("#email").focus();
                    return true;
                };
                return false;
            });
    }

    function celular_exist(celular) {
        $.get("validarfone/" + celular,
            function (result) {
                if (result === "404") {
                    $("#registro-alerta").html("Ops! Esse telefone celular já esta sendo utilizado por outro usuário!");
                    $("#registro-alerta").show();
                    $("#celular").focus();
                    return true;
                };
                return false;
            });
    }


    function validarSenha(){
        var msg = "O campo deve ser informado!"        

        if ($("#senhaAtual").val().trim().length == 0) {
            $("#registro-alerta-senha").html(msg);
            $("#registro-alerta-senha").show();
            $("#senhaAtual").focus();
            return false;
        }

        if ($("#senha").val().trim().length == 0) {
            $("#registro-alerta-senha").html(msg);
            $("#registro-alerta-senha").show();
            $("#senha").focus();
            return false;
        }
        if ($("#senha").val().trim().length < 5) {
            $("#registro-alerta-senha").html("A senha informada deve ter ao menos 5 caracteres");
            $("#registro-alerta-senha").show();
            $("#senha").focus();
            return false;
        }
        if ($("#resenha").val().trim().length == 0) {
            $("#registro-alerta-senha").html(msg);
            $("#registro-alerta-senha").show();
            $("#resenha").focus();
            return false;
        }
        if ($("#senha").val().trim() != $("#resenha").val().trim()) {
            $("#registro-alerta-senha").html("O valor não confere com a senha informada");
            $("#registro-alerta-senha").show();
            $("#resenha").focus();
            return false;
        }

        return true;

    }

    function validarDados() {
        var msg = "O campo deve ser informado!"

        if ($("#nomecompleto").val().trim().length === 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#nomecompleto").focus();
            return false;
        }

        if ($("#celular").val().trim().length === 0 || $("#celular").val().trim() === "() -") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#celular").focus();
            return false;
        }

        if ($("#dtnascimento").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#dtnascimento").focus();
            return false;
        }

        if ($("#sexo").val() === "Sexo *") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#sexo").focus();
            return false;
        }

        if ($("#cep").val().trim().length == 0 || $("#cep").val().trim() === "-") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#cep").focus();
            return false;
        }
        if ($("#logradouro").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#logradouro").focus();
            return false;
        }
        if ($("#numero").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#numero").focus();
            return false;
        }
        if ($("#bairro").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#bairro").focus();
            return false;
        }
        if ($("#cidade").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#cidade").focus();
            return false;
        }
        if ($("#estado").val() === "Estado *") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#estado").focus();
            return false;
        }

        return true;
    }


    function validar() {
        var msg = "O campo deve ser informado!"

        if ($("#nomecompleto").val().trim().length === 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#nomecompleto").focus();
            return false;
        }

        if ($("#email").val().trim().length === 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#email").focus();
            return false;
        }

        if (!validateEmail($("#email").val())) {
            $("#registro-alerta").html("Email não esta no formato válido!");
            $("#registro-alerta").show();
            $("#email").focus();
            return false;
        }

        if ($("#celular").val().trim().length === 0 || $("#celular").val().trim() === "() -") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#celular").focus();
            return false;
        }

        if (celular_exist($("#celular").val())) {
            return false;
        }

        if (email_exist($("#email").val())) {
            return false;
        }

        if ($("#dtnascimento").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#dtnascimento").focus();
            return false;
        }

        if ($("#sexo").val() === "Sexo *") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#sexo").focus();
            return false;
        }
        if ($("#senha").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#senha").focus();
            return false;
        }
        if ($("#senha").val().trim().length < 5) {
            $("#registro-alerta").html("A senha informada deve ter ao menos 5 caracteres");
            $("#registro-alerta").show();
            $("#senha").focus();
            return false;
        }
        if ($("#resenha").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#resenha").focus();
            return false;
        }
        if ($("#senha").val().trim() != $("#resenha").val().trim()) {
            $("#registro-alerta").html("O valor não confere com a senha informada");
            $("#registro-alerta").show();
            $("#resenha").focus();
            return false;
        }

        if ($("#cep").val().trim().length == 0 || $("#cep").val().trim() === "-") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#cep").focus();
            return false;
        }
        if ($("#logradouro").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#logradouro").focus();
            return false;
        }
        if ($("#numero").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#numero").focus();
            return false;
        }
        if ($("#bairro").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#bairro").focus();
            return false;
        }
        if ($("#cidade").val().trim().length == 0) {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#cidade").focus();
            return false;
        }
        if ($("#estado").val() === "Estado *") {
            $("#registro-alerta").html(msg);
            $("#registro-alerta").show();
            $("#estado").focus();
            return false;
        }

        return true;
    }
});
