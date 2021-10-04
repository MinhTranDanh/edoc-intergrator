let yearTitle, myBar, id;
let edocChart = {
    appSetting: {
        host: "/chart",
        mod: "release",
        debugAgent: "web",
        root: $("#main-content"),
        cookie: 1,
        pathPlugin: "/asset",
        requestTimeout: 5000, // Timeout request for ajax,
        dataTable: null,
        mode: "report"
    },
    drawChart: () => {
        if (myBar) {
            $("#canvas").remove();
            $("#chart-area").append('<canvas id="canvas"></canvas>');
        }
        let ctx = document.getElementById('canvas').getContext('2d');
        myBar = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                datasets: [{
                    label: chart_message.chart_sent_document,
                    backgroundColor: window.chartColors.red,
                    data: null
                }, {
                    label: chart_message.chart_received_document,
                    backgroundColor: window.chartColors.blue,
                    data: null
                }]
            },
            options: {
                title: {
                    display: true,
                    text: chart_message.chart_in_year + yearTitle
                },
                tooltips: {
                    mode: 'index',
                    intersect: false
                },
                responsive: true,
                scales: {
                    xAxes: [{
                        stacked: true,
                    }],
                    yAxes: [{
                        stacked: true
                    }]
                }
            }
        });
    },
    renderDetailStat: (fromDate, toDate) => {
        let instance = this;
        let url = "/public/-/statistic/detail";
        if (fromDate === null && toDate === null) {
            url = url + "?userId=" + id;
        } else {
            url = url + "?fromDate=" + fromDate + "&toDate=" + toDate + "&userId=" + id;
        }
        instance.dataTable = $('#dataTables-statistic').DataTable({
            ajax: {
                url: url,
                type: "POST",
                dataSrc: ""
            },
            rowId: "organId",
            responsive: true,
            pageLength: 25,
            autoWidth: true,
            ordering: true,
            searching: true,
            bDestroy: true,
            processing: true,
            paging: true,
            info: false,
            columns: [
                {
                    "title": statistic_message.table_hesder_organ_name,
                    "data": "organDomain"
                },
                {
                    "title": statistic_message.table_header_total,
                    "data": "total_received",
                },
                {
                    "title": statistic_message.table_header_recieved_ext,
                    "data": "received_ext",
                },
                {
                    "title": statistic_message.table_header_received_int,
                    "data": "received_int",
                },
                {
                    "title": statistic_message.table_header_signed,
                    "data": "signed"
                },
                {
                    "title": statistic_message.tables_header_not_signed,
                    "data": "not_signed"
                }
            ],
            language: app_message.language,
            order: [[1, "asc"]],
        });
    }
}

$(document).ready(function () {
    $.datetimepicker.setLocale('vi');
    $("#fromStatisticDate").datetimepicker({
        i18n: {
            vi: {
                months: [
                    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
                    'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8',
                    'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12',
                ],
                dayOfWeek: [
                    "CN", "T2", "T3", "T4",
                    "T5", "T6", "T7",
                ]
            }
        },
        timepicker: false,
        format: 'd/m/Y'
    });
    $("#toStatisticDate").datetimepicker({
        i18n: {
            vi: {
                months: [
                    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
                    'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8',
                    'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12',
                ],
                dayOfWeek: [
                    "CN", "T2", "T3", "T4",
                    "T5", "T6", "T7",
                ]
            }
        },
        timepicker: false,
        format: 'd/m/Y'
    });

    $("#btnRunStatisticDetail").on('click', function (e) {
        e.preventDefault();
        console.log("Click");
        let fromDate = $("#fromStatisticDate").val();
        let toDate = $("#toStatisticDate").val();
        let fromDateValue = new Date(fromDate);
        let toDateValue = new Date(toDate);

        if (fromDateValue > toDateValue) {
            $.notify(app_message.edoc_message_error_report_date, "error");
        } else {
            console.log("Call ajax !!");
            $.ajax({
                url: "/public/-/dailycounter/converter" + "?fromDate=" + fromDate + "&toDate=" + toDate,
                type: "POST",
                beforeSend: () => $("#overlay-statistic").show(),
                statusCode: {
                    200: () => $.notify("Success", "success"),
                    400: () => $.notify("Error", "error")
                }
            }).done(() => $("#overlay-statistic").hide());
        }
    })

    $("#report-menu.nav a:not(.not-click)").on("click", function (e) {
        e.preventDefault();
        let dataMode = $(this).attr("data-mode");
        let userId = $(this).attr("data-id");
        id = userId;
        console.log(id)
        let year = getCurrentYear();
        if (dataMode != null) {
            edocChart.appSetting.mode = dataMode;
            if (dataMode === "viewChart") {
                $('.edoc-content > [class^=edoc-table]').hide();
                $(".edoc-table-statistic").hide();
                $("#search-statistic-header").show();
                yearTitle = year;
                ajax_chart(year, userId);
                edocChart.drawChart();
                $(".edoc-statistic").show();
            } else if (dataMode === "viewDetail") {
                $('.edoc-content > [class^=edoc-table]').hide();
                $(".edoc-statistic").hide();
                $("#statistic-detail").show();
                //edocChart.renderDetailStat();
                $(".edoc-table-statistic").show();
            } else {
                edocDocument.renderDatatable();
                $(".edoc-table").show();
            }
            $("#report-menu.nav a").removeClass("active");
            $(this).addClass("active");
        }
    });

    $("#btnRunDrawChart").on('click', function (e) {
        e.preventDefault();
        let val = document.getElementById("yearPicker");
        let year = val.options[val.selectedIndex].text;
        yearTitle = year;
        ajax_chart(year, id);
        edocChart.drawChart();
    })

    $("#yearPicker").yearselect({
        start: 2020,
        end: new Date().getFullYear(),
        step: 1,
        order: 'asc',
        selected: new Date().getFullYear() + 1,
        formatDisplay: null,
        displayAsValue: true
    })
})

let ajax_chart = (year, userId) => {
    let url = "/public/-/statistic/chart";
    if (userId !== "") {
        url = url + "?year=" + year + "&userId=" + userId;
    } else {
        url = url + "?year=" + year;
    }
    $.get(url, (response, status) => {
        myBar.reset();
        myBar.data.datasets[0].data = response.sent;
        myBar.data.datasets[1].data = response.received;
        myBar.update();
    })
}