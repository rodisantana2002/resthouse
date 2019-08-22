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

    // load da pagina
    if ($("#login-alerta").html() === "") {
        $("#login-alerta").hide();
    } else {
        $("#login-alerta").show();
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

    $('#btn-registrar').click(function () {
        $("#loginbox").hide();
        $("#signupbox").show();
    });

    $('#btn-registrar').click(function () {
        $("#loginbox").hide();
        $("#signupbox").show();
    });
    $('#btn-voltar').click(function () {
        $("#loginbox").show();
        $("#signupbox").hide();
    });

    $('#btn-recuperasenha').click(function () {
        $("#loginbox").hide();
        $("#recuperabox").show();
    });

    $('#btn-voltar-login').click(function () {
        $("#recuperabox").hide();
        $("#loginbox").show();
    });
});
