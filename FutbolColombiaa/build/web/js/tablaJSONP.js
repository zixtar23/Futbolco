$(document).ready(function () {
    var url = "https://s3.amazonaws.com/WidgetResultadosWin/services/tableRatingStage/1246.json?ts=";
    $("#tblp tbody").html("");
    $.getJSON(url, function (datos) {
        $.each(datos.list, function (i, da) {
            $.each(da.sg, function (i, dat) {
                $.each(dat.tr, function (i, dato) {
                    var fila =
                            "<tr>"
                            + "<td>" + dato.po + "</td>"
                            + "<td>" + dato.na + "</td>"
                            + "<td>" + dato.pi + "</td>"
                            + "<td>" + dato.tg + "</td>"
                            + "<td>" + dato.wi + "</td>"
                            + "<td>" + dato.dr + "</td>"
                            + "<td>" + dato.lo + "</td>"
                            + "<td>" + dato.go + "</td>"
                            + "<td>" + dato.gr + "</td>"
                            + "<td>" + dato.gd + "</td>"
                            + "</tr>";
                    $(fila).appendTo("#tblp tbody");
                });
            });
        });
    });
});


