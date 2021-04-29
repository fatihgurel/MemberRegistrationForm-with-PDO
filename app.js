$(document).ready(function() {
    var swalInit = swal.mixin({
        buttonsStyling: false,
        confirmButtonClass: 'btn btn-primary',
        cancelButtonClass: 'btn btn-light'
    });

    $(".js-example-basic-sinif").attr(
        "data-placeholder", "SINIFINIZ"
    );
    $(".js-example-basic-komite").attr(
        "data-placeholder", "LÜTFEN BİR KOMİTE SEÇİNİZ"
    );
    $('.js-example-basic-sinif').select2({
        minimumResultsForSearch: -1,
    });
    $('.js-example-basic-komite').select2({
        minimumResultsForSearch: -1,
    });

    const form = document.querySelector("#form");
    const inputs = document.querySelectorAll(".form-control");


    form.addEventListener("submit", function(e) {
        e.preventDefault()
        var $form = $("#form");
        var serializedData = $form.serialize();
        $.post('memberRegistration.php', serializedData, function(response) {
            console.log(response);
            if (response === "allEmpty") {
                swalInit.fire(
                    "Uyarı!",
                    "Eksik Bilgi Girdiniz.Lütfen tüm alanları doldurunuz!",
                    'warning'
                );
            } else if (response === "success") {
                $(".form-control").val(null).trigger("change");
                swalInit.fire(
                    "Success!",
                    "Kayıt işlemi başarılı!",
                    'success'
                );
            } else if (response === "error") {
                swalInit.fire(
                    "Başarısız!",
                    "Kayıt işlemi başarısız!",
                    'error'
                );
            } else if (response === "duplicateSchoolNumber") {
                swalInit.fire(
                    "Uyarı!",
                    "Bu öğrenci numarasına ait üye bulunmaktadır. Lütfen öğrenci numaranızı kontrol ediniz!",
                    'warning'
                );
            } else if (response === "duplicateEmail") {
                swalInit.fire(
                    "Uyarı!",
                    "Bu Email adresine ait üye bulunmaktadır. Lütfen Email adresinizi kontrol ediniz!",
                    'warning'
                );
            } else if (response === "duplicatePhoneNumber") {
                swalInit.fire(
                    "Uyarı!",
                    "Bu telefon numarasına ait üye bulunmaktadır. Lütfen telefon numaranızı kontrol ediniz!",
                    'warning'
                );
            }

        });
    })
});