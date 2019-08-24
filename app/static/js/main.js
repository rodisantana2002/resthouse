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

    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
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
