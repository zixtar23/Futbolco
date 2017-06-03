function d() {
    $(document).ready(function () {
        var url = "https://s3.amazonaws.com/WidgetResultadosWin/services/round/8187.json?";
        $("#tblf tbody").html("");
        $.getJSON(url, function (datos) {
            $.each(datos.list, function (i, da) {
                $.each(da.mt, function (i, dato) {
                    var timestamp = dato.ti;
                    var date = new Date(timestamp * 1000);
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var monthNames = ["","Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
                    ];
                    var day = date.getDate();
                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    var seconds = date.getSeconds();

                    var d = (year + "-" + monthNames[month] + "-" + day + " " + hours + ":" + minutes + ":" + seconds);

                    var fila =
                            "<tr>"
                            + "<td>" + d + "</td>"
                            + "<td>" + dato.re + "</td>"
                            + "<td>" + dato.st + "</td>"
                            + "<td>" + dato.tv + "</td>"
                            + "<td>" + dato.lo.na + "</td>"
                            + "<td>" + dato.lo.sc + "</td>"
                            + "<td>" + dato.vi.sc + "</td>"
                            + "<td>" + dato.vi.na + "</td>"
                            + "</tr>";
                    $(fila).appendTo("#tblf tbody");
                });
            });
        });
    });
}
function run() {
    x = document.getElementById("Ultra").value;
    $(document).ready(function () {
        var url = "https://s3.amazonaws.com/WidgetResultadosWin/services/round/" + x + ".json?";
        $("#tblf tbody").html("");
        $.getJSON(url, function (datos) {
            $.each(datos.list, function (i, da) {
                $.each(da.mt, function (i, dato) {
                    var timestamp = dato.ti;
                    var date = new Date(timestamp * 1000);
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var monthNames = ["","Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
                    ];
                    var day = date.getDate();
                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    var seconds = date.getSeconds();

                    var d = (year + "-" + monthNames[month] + "-" + day + " " + hours + ":" + minutes + ":" + seconds);
                    var fila =
                            "<tr>"
                            + "<td>" + d + "</td>"
                            + "<td>" + dato.re + "</td>"
                            + "<td>" + dato.st + "</td>"
                            + "<td>" + dato.tv + "</td>"
                            + "<td>" + dato.lo.na + "</td>"
                            + "<td>" + dato.lo.sc + "</td>"
                            + "<td>" + dato.vi.sc + "</td>"
                            + "<td>" + dato.vi.na + "</td>"
                            + "</tr>";
                    $(fila).appendTo("#tblf tbody");
                });
            });
        });
    });
}