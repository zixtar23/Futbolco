$(document).ready(function () {
    var url = "https://s3.amazonaws.com/WidgetResultadosWin/services/tableRankingTournamentScorers/150977.json?ts=";
    $("#tblg tbody").html("");
    $.getJSON(url, function (datos) {
        $.each(datos.list, function (i, dat) {
            $.each(dat.so, function (i, dato) {
                if (dato.te == 9404) {
                    dato.te = "Deportivo Cali";
                }
                if (dato.te == 137185) {
                    dato.te = "Jaguares FC";
                }
                if (dato.te == 9413) {
                    dato.te = "Deportivo Cali";
                }
                if (dato.te == 9404) {
                    dato.te = "Huila";
                }
                if (dato.te == 9396) {
                    dato.te = "Envigado FC";
                }
                if (dato.te == 9628) {
                    dato.te = "Patriotas FC";
                }
                if (dato.te == 9402) {
                    dato.te = "América De Cali";
                }
                if (dato.te == 9615) {
                    dato.te = "Cortuluá";
                }
                if (dato.te == 9398) {
                    dato.te = "Atlético Nacional";
                }
                if (dato.te == 9405) {
                    dato.te = "Once Caldas";
                }
                if (dato.te == 9401) {
                    dato.te = "Millonarios";
                }
                if (dato.te == 9412) {
                    dato.te = "Pasto";
                }
                if (dato.te == 9625) {
                    dato.te = "Rionegro Águilas";
                }
                if (dato.te == 9399) {
                    dato.te = "Santa Fe";
                }
                if (dato.te == 9403) {
                    dato.te = "Junior";
                }
                if (dato.te == 9415) {
                    dato.te = "Bucaramanga";
                }
                if (dato.te == 9408) {
                    dato.te = "Tolima";
                }
                if (dato.te == 9397) {
                    dato.te = "Medellín";
                }
                if (dato.te == 9417) {
                    dato.te = "Equidad";
                }
                if (dato.te == 150131) {
                    dato.te = "Tigres FC";
                }
                if (dato.te == 9617) {
                    dato.te = "Alianza Petrolera";
                }
                var fila =
                        "<tr>"
                        + "<td>" + dato.po + "</td>"
                        + "<td>" + dato.te + "</td>"
                        + "<td>" + dato.na + "</td>"
                        + "<td>" + dato.pg + "</td>"
                        + "<td>" + dato.gp + "</td>"
                        + "<td>" + dato.tg + "</td>"
                        + "</tr>";
                $(fila).appendTo("#tblg tbody");
            });
        });
    });
});




