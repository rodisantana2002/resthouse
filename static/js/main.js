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
    $("#cep").change(function () {
        var cep_code = $(this).val();
        if (cep_code.length <= 0) return;
        $.get("http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code },
            function (result) {
                if (result.status != 1) {
                    alert(result.message || "Houve um erro desconhecido");
                    return;
                }
                $("#cep").val(result.code);
                $("#logradouro").val(result.address);
                $("#bairro").val(result.district);
                $("#cidade").val(result.city);
                $("#estado").val(result.state);
                $("#numero").focus();
            });
    });
    $("#cep").mask("99999-999");
});

$(document).ready(function () {
    $('#btn-registrar').click(function () {
        $("#loginbox").hide();
        $("#signupbox").show();
    });
});

$(document).ready(function () {
    $('#btn-registrar').click(function () {
        $("#loginbox").hide();
        $("#signupbox").show();
    });
});

$(document).ready(function () {
    $('#btn-voltar').click(function () {
        $("#loginbox").show();
        $("#signupbox").hide();
    });
});

$(document).ready(function () {
    $('#btn-recuperasenha').click(function () {
        $("#loginbox").hide();
        $("#recuperabox").show();
    });
});

$(document).ready(function () {
    $('#btn-voltar-login').click(function () {
        $("#recuperabox").hide();
        $("#loginbox").show();
    });
});
