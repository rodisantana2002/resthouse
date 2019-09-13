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
    var url_base = "http://resthouse.herokuapp.com/";
    
    var numSabores = 0

    //pagina CategoriasxProdutos
    $("#txtTamanho").change(function (){
        numSabores = $("#txtTamanho").val();
    
        if (numSabores != "Escolha um tamanho"){
            $("#divSelecaoSabores").show();
            $("#divSelecaoSaboresTitulo").html("<b>Escolha até " + numSabores +" sabor(es)</b>")
        }
        else{
            $("#divSelecaoSabores").hide();            
        }
    });    





    
    // ----------------------------------------------------------------------------------------------------------------------
    // load da pagina - login
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
    
    // filtra associados
    $("#btnAssociadoFiltrar").click(function () {
        if ($("#txtAssociadoFiltrar").val().trim().length>0) {
            $("#filtra-associado-form").submit();
        }    
        else{
            $("#txtAssociadoFiltrar").focus();
        }    
    });

    // carrega cep no formulario de registro usuario
    $("#cep").change(function () {
        var cep_code = $(this).val();
        if (cep_code.length <= 0) return;

        $.get("https://viacep.com.br/ws/" + cep_code + "/json/",
            function (result) {
                if (("erro" in result)) {
                    alert("CEP informado não foi encontrado!");
                    return;
                } else {
                    $("#cep").val(result.cep);
                    $("#logradouro").val(result.logradouro);
                    $("#bairro").val(result.bairro);
                    $("#cidade").val(result.localidade);
                    $("#estado").val(result.uf);
                    $("#numero").focus();
                }
            });
    });

    $("#cep").mask("99999-999");

    $("#btn-signup").click(function () {
        if (validar()) {
            $("#signupform").submit();
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
