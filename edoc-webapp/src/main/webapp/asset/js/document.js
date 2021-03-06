let appSettings;
var arr = new Array();
var receiveName;
let fromOrgan = null, toOrgan = null, docCode = null;
let edocDocument = {
    appSetting: {
        host: "/documents",
        mod: "release",
        debugAgent: "web",
        root: $("#main-content"),
        cookie: 1,
        pathPlugin: "/asset",
        requestTimeout: 5000, // Timeout request for ajax,
        dataTable: null,
        mode: "inbox"
    },
    init: function () {
        let instance = this;
        appSettings = instance.appSetting;

        if (typeof jQuery === 'undefined') {
            edocDocument.log("Can not load jQuery environment");
            return;
        }
        instance.renderDatatable(fromOrgan, toOrgan, docCode);
    },
    addExtCSS: function (name) {
        let instance = this;
        let css = appSettings.pathPlugin + '/css/' + name + '.css?t=' + new Date().getTime();
        css = '<link rel="stylesheet" type="text/css" href="' + css + '">';

        appSettings.root.append(css);
    },
    renderDatatable: function (fromOrgan, toOrgan, docCode) {
        let instance = this;
        let url = "/documents?mode=" + instance.appSetting.mode;

        // need to optimize.....
        /*if (fromOrgan !== null || toOrgan !== null || docCode !== null) {
            if (fromOrgan !== null && toOrgan === null && docCode === null) {
                url = url + "&fromOrgan=" + fromOrgan;
            } else if (fromOrgan === null && toOrgan !== null && docCode === null) {
                url = url + "&toOrgan=" + toOrgan;
            } else if (fromOrgan === null && toOrgan === null && docCode !== null) {
                url = url + "&docCode=" + docCode;
            } else if (fromOrgan !== null && toOrgan !== null && docCode === null) {
                url = url + "&fromOrgan=" + fromOrgan + "&toOrgan=" + toOrgan;
            } else if (fromOrgan !== null && toOrgan === null && docCode !== null) {
                url = url + "&fromOrgan=" + fromOrgan + "&docCode=" + docCode;
            } else if (fromOrgan === null && toOrgan !== null && docCode !== null) {
                url = url + "&toOrgan=" + toOrgan + "&docCode=" + docCode;
            } else {
                url = url + "&fromOrgan=" + fromOrgan + "&toOrgan=" + toOrgan + "&docCode=" + docCode;
            }
        }*/

        if (fromOrgan != null) {
            url = url + "&fromOrgan=" + fromOrgan;
        }
        if (toOrgan != null) {
            url = url + "&toOrgan=" + toOrgan;
        }
        if (docCode != null) {
            url = url + "&docCode=" + docCode;
        }


        instance.appSetting.dataTable = $('#dataTables-edoc').DataTable({
            serverSide: true,
            processing: true,
            ajax: {
                url: url,
                type: "POST"
            },
            drawCallback: function () {
                $(this).contextMenu({
                    selector: 'tbody tr td',
                    callback: function (key, options) {
                        let id = options.$trigger[0].parentElement.id;
                        switch (key) {
                            case "resend":
                                console.log(id);
                                //reSendDocument(id);
                                reSendToVPCP(id);
                                break;
                            case "delete":
                                instance.deleteDocument(id);
                                break;
                            case "Resend":
                                //template();
                                reSendDocumentModal(id);
                                // reSend(id);
                                //edocDocument.renderUserDatatable();
                                break;
                        }
                    },
                    items: {
                        "resend": {name: app_message.edoc_resend_document, icon: "fa-repeat"},
                        "delete": {name: app_message.edoc_remove_document, icon: "delete"},
                        "Resend": {name: app_message.edoc_resend, icon: "fa-repeat"}
                    }
                });
            },
            rowId: "documentId",
            responsive: true,
            pageLength: 24,
            autoWidth: false,
            ordering: true,
            bDestroy: true,
            searching: true,
            lengthChange: false,
            paging: true,
            info: false,
            columns: [
                {
                    "name": "ed.subject",
                    "title": app_message.edoc_table_header_subject,
                    "data": null,
                    "render": function (data) {
                        return $('#edocSubjectTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "ed.from_organ_domain",
                    "title": app_message.edoc_table_header_fromOrgan,
                    "data": "fromOrgan.name"
                },
                {
                    "name": "ed.doc_code",
                    "title": app_message.table_header_code,
                    "data": null,
                    "render": function (data) {
                        return data.codeNumber + "/" + data.codeNotation;
                    }
                },
                {
                    "name": "ed.document_type_name",
                    "title": app_message.table_header_documentCate,
                    "data": null,
                    "render": function (data) {
                        return $('#edocDocTypeNameTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "ed.create_date",
                    "title": app_message.table_header_createDate,
                    "data": null,
                    "render": function (data) {

                        return convertToDate(data.createDate).formatDate();
                    }
                }
            ],
            language: app_message.language,
            order: [[4, 'desc']],
            createdRow: function (row, data, dataIndex) {
                // Set the data-status attribute, and add a class
                if (data["visited"] === false) {
                    $(row).addClass("not-visited");
                } else {
                    $(row).addClass("visited");
                }
            }
        });
    },
    renderDaftTable: function () {
        let instance = this;
        instance.dataTable = $('#dataTablesDraftDoc').DataTable({
            ajax: {
                url: "/documents?mode=" + instance.appSetting.mode,
                type: "POST"
            },
            rowId: "documentId",
            responsive: true,
            pageLength: 25,
            autoWidth: true,
            searching: false,
            processing: true,
            serverSide: true,
            lengthChange: false,
            bDestroy: true,
            paging: true,
            info: false,
            columns: [
                {
                    "title": app_message.edoc_table_header_subject,
                    "data": null,
                    "render": function (data) {
                        return $('#edocSubjectTemplate').tmpl(data).html();
                    }
                },
                {
                    "title": app_message.table_header_createDate,
                    "data": null,
                    "render": function (data) {
                        return convertToDate(data.createDate).formatDate();
                    }
                },
                {
                    "data": null,
                    "render": function (data) {
                        return $("#edocDraftActionTemplate").tmpl(data).html();
                    }
                }
            ],
            language: app_message.language,
            "order": [[1, "desc"]],
        });
    },
    //MinhTDb
    renderNotTakenDatatable: () => {
        let instance = this;
        instance.dataTable = $('#dataTables-edoc-notTaken').DataTable({
            serverSide: true,
            processing: true,
            pageLength: 15,
            ajax: {
                url: "/documents/-/not/taken",
                type: "POST",
            },

            drawCallback: function () {

                $("tr").mousedown(function (event) {
                    if (event.which === 3) {
                        receiveName = $(this).find('td').eq(2).text();
                        console.log(receiveName);
                    }
                }),
                    $(this).contextMenu({
                        selector: 'tbody tr td',
                        callback: (key, options) => {
                            let id = options.$trigger[0].parentElement.id;

                            switch (key) {
                                case "download":
                                    console.log(id);
                                    break;
                                case "comfirm-receive":
                                    console.log(id);
                                    console.log(receiveName);
                                    comfirmReceive(id, receiveName);
                                    $('#dataTables-edoc-notTaken').DataTable().ajax.reload();
                                    //edocDocument.renderNotTakenDatatable();
                                    break;
                                case "delete":
                                    edocDocument.deleteDocument(id);
                                    break;
                            }
                        },
                        items: {
                            "download": {name: app_message.edoc_download_xml, icon: "fa-download"},
                            "comfirm-receive": {name: app_message.edoc_comfirm_receive, icon: "fa-check"},
                            "delete": {name: app_message.edoc_remove_document, icon: "delete"}
                        }
                    });
            },
            rowId: "documentId",
            responsive: true,
            autoWidth: false,
            ordering: true,
            bDestroy: true,
            searching: true,
            lengthChange: false,
            paging: true,
            info: true,

            columns: [
                {
                    "name": "ed.subject",
                    "title": app_message.edoc_table_header_subject,
                    "data": null,
                    "render": function (data) {

                        return $('#edocSubjectTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "ed.from_organ_domain",
                    "title": app_message.edoc_table_header_fromOrgan,
                    "data": "fromOrgan.name",
                },
                {
                    "name": "ed.to_organ_domain",
                    "title": app_message.edoc_table_header_toOrgan,
                    "data": "toOrgan[0].name"
                },
                {
                    "name": "ed.doc_code",
                    "title": app_message.table_header_code,
                    "data": null,
                    "render": function (data) {

                        return data.codeNumber + "/" + data.codeNotation;
                    }
                },
                {
                    "name": "en.create_date",
                    "title": app_message.table_header_createDate,
                    "data": null,
                    "render": function (data) {

                        return $('#edocCreateDateTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "en.taken",
                    "title": app_message.table_header_taken,
                    "data": null,
                    "render": function (data) {
                        console.log(data)
                        for (let i = 0; i < data.notifications.length; i++) {
                            if (data.notifications[i].toOrganization.name === data.toOrgan[0].name) {
                                return app_message.taken_status_false;
                            }
                        }
                        return app_message.taken_status_true;
                    }
                }
            ],
            language: app_message.language,
            order: [[4, 'desc']],
            createdRow: (row, data) => {
                // Set the data-status attribute, and add a class
                if (data["visited"] === false) {
                    $(row).addClass("not-visited");
                } else {
                    $(row).addClass("visited");
                }
            }
        });
    },
    //MinhTDb
    renderDoneTakenDatatable: () => {
        let instance = this;
        instance.dataTable = $('#dataTables-edoc-doneTaken').DataTable({
            serverSide: true,
            processing: true,
            pageLength: 15,
            ajax: {
                url: "/documents/-/done/taken",
                type: "POST",
            },
            drawCallback: function () {

                var receiveName;
                $("tr").mousedown(function (event) {
                    if (event.which === 3) {
                        receiveName = $(this).find('td').eq(2).text();
                        console.log(receiveName);
                    }
                }),
                    $(this).contextMenu({
                        selector: 'tbody tr td',
                        callback: (key, options) => {
                            let id = options.$trigger[0].parentElement.id;
                            switch (key) {
                                case "download":
                                    console.log(id);
                                    break;
                                case "resend":
                                    console.log(id);
                                    console.log(receiveName);
                                    reSend(id, receiveName);
                                    // $('#dataTables-edoc-notTaken').DataTable().ajax.reload();
                                    edocDocument.renderDoneTakenDatatable();
                                    break;
                                case "delete":
                                    edocDocument.deleteDocument(id);
                                    break;
                            }
                        },
                        items: {
                            "download": {name: app_message.edoc_download_xml, icon: "fa-download"},
                            "resend": {name: app_message.edoc_resend, icon: "fa-repeat"},
                            "delete": {name: app_message.edoc_remove_document, icon: "delete"}
                        }
                    });
            },
            rowId: "documentId",
            responsive: true,
            autoWidth: false,
            ordering: true,
            bDestroy: true,
            searching: true,
            lengthChange: false,
            paging: true,
            info: true,

            columns: [
                {
                    "name": "ed.subject",
                    "title": app_message.edoc_table_header_subject,
                    "data": null,
                    "render": function (data) {
                        return $('#edocSubjectTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "ed.from_organ_domain",
                    "title": app_message.edoc_table_header_fromOrgan,
                    "data": "fromOrgan.name",
                },
                {
                    "name": "ed.to_organ_domain",
                    "title": app_message.edoc_table_header_toOrgan,
                    "data": "toOrgan[0].name"
                },
                {
                    "name": "ed.doc_code",
                    "title": app_message.table_header_code,
                    "data": null,
                    "render": function (data) {

                        return data.codeNumber + "/" + data.codeNotation;
                    }
                },
                {
                    "name": "en.create_date",
                    "title": app_message.table_header_createDate,
                    "data": null,
                    "render": function (data) {

                        return $('#edocCreateDateTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "en.taken",
                    "title": app_message.table_header_taken,
                    "data": null,
                    "render": function (data) {
                        console.log(data)
                        for (let i = 0; i < data.notifications.length; i++) {
                            if (data.notifications[i].toOrganization.name === data.toOrgan[0].name) {
                                return app_message.taken_status_true;

                            }
                        }
                        return app_message.taken_status_false;
                    }
                }
            ],
            language: app_message.language,
            order: [[4, 'desc']],
            createdRow: (row, data) => {
                // Set the data-status attribute, and add a class
                if (data["visited"] === false) {
                    $(row).addClass("not-visited");
                } else {
                    $(row).addClass("visited");
                }
            }
        });
    },

    renderNotSendVpcpDatatable: () => {
        let instance = this;
        instance.dataTable = $('#dataTables-edoc-not-sendVPCP').DataTable({
            serverSide: true,
            processing: true,
            pageLength: 15,
            ajax: {
                url: "/documents/-/not/sendVPCP",
                type: "POST"
            },
            drawCallback: function () {
                $(this).contextMenu({
                    selector: 'tbody tr td',
                    callback: (key, options) => {
                        let id = options.$trigger[0].parentElement.id;
                        switch (key) {
                            case "resend":
                                console.log(id);
                                //reSendDocument(id);
                                reSendToVPCP(id);
                                break;
                            case "delete":
                                instance.deleteDocument(id);
                                break;
                        }
                        //edocDocument.deleteDocument(id);
                    },
                    items: {
                        "resend": {name: app_message.edoc_resend_document, icon: "fa-repeat"},
                        "delete": {name: app_message.edoc_remove_document, icon: "delete"}
                    }
                });
            },
            rowId: "documentId",
            responsive: true,
            autoWidth: false,
            ordering: true,
            bDestroy: true,
            searching: true,
            lengthChange: false,
            paging: true,
            info: true,
            columns: [
                {
                    "name": "ed.subject",
                    "title": app_message.edoc_table_header_subject,
                    "data": null,
                    "render": function (data) {
                        return $('#edocSubjectTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "ed.from_organ_domain",
                    "title": app_message.edoc_table_header_fromOrgan,
                    "data": "fromOrgan.name"
                },
                {
                    "name": "ed.to_organ_domain",
                    "title": app_message.edoc_table_header_toOrgan,
                    "data": "toOrgan[0].name"
                },
                {
                    "name": "ed.doc_code",
                    "title": app_message.table_header_code,
                    "data": null,
                    "render": function (data) {
                        return data.codeNumber + "/" + data.codeNotation;
                    }
                },
                {
                    "name": "ed.transaction_status",
                    "title": "Tr???ng th??i",
                    "data": null,
                    "render": function (data) {
                        return $('#sendVPCPStatusTemplate').tmpl(data).html();
                    }
                },
                {
                    "name": "ed.create_date",
                    "title": app_message.table_header_createDate,
                    "data": null,
                    "render": function (data) {
                        return $('#edocCreateDateTemplate').tmpl(data).html();
                    }
                }
            ],
            language: app_message.language,
            order: [[4, 'desc']],
            createdRow: (row, data) => {
                // Set the data-status attribute, and add a class
                if (data["visited"] === false) {
                    $(row).addClass("not-visited");
                } else {
                    $(row).addClass("visited");
                }
            }
        });
    },

    getCookie: function (key, defaultValue) {
        let keyEQ = key + "=";
        let cookies = document.cookie.split(';');

        if (typeof defaultValue == 'undefined') {
            defaultValue = null;
        }

        if (typeof cookies === 'undefined' || cookies == null || cookies.length === 0) {
            return defaultValue;
        }

        for (let i = 0; i < cookies.length; i++) {
            let cookie = cookies[i];
            while (cookie.charAt(0) === ' ') {
                cookie = cookie.substring(1, cookie.length);
            }
            if (cookie.indexOf(keyEQ) === 0) {
                return cookie.substring(keyEQ.length, cookie.length);
            }
        }
        return defaultValue;
    },
    createDocument: function (isDraft) {
        //get subject
        let subject = $("#subject").val();
        //get toOrgan
        let toOrgan = $("#toOrgan").val();
        //get code number
        let codeNumber = $("#codeNumber").val();
        //get code nation
        let codeNation = $("#codeNation").val();
        //get priority
        let priority = $("#priority").val();
        //get documentType
        let documentType = $("#documentType").val();
        //get staffName
        let staffName = $("#staffName").val();
        // get promulgationAmount
        let promulgationAmount = $("#promulgationAmount").val();
        //get pageAmount
        let pageAmount = $("#pageAmount").val();
        //get content
        let content = $("#content").val();
        //get form organ
        let fromOrganDomain = $("#fromOrganId").val();
        //get promulgation place
        let promulgationPlace = $("#fromOrgan").val();
        // get promulgationDate
        let promulgationDate = $("#promulgationDate").val();
        // get signerFullName
        let signerFullName = $("#signerFullName").val();
        //get signerPosition
        let signerPosition = $("#signerPosition").val();
        // let dueDate
        let dueDate = $("#dueDate").val();
        //get sphereOfPromulgation
        let sphereOfPromulgation = $("#sphereOfPromulgation").val();
        let attachments = window.localEdocStorage.getAttachments();

        if (validateDocument(subject, toOrgan, codeNation, codeNumber, staffName, promulgationDate, fromOrganDomain, signerFullName, attachments)) {
            console.log(app_message.edoc_validate_document_request_fail);
        } else {
            let attachmentIds = [];
            attachments.forEach(att => {
                attachmentIds.push(att.attachmentId);
            });
            let documentRequest = {
                "subject": subject,
                "toOrganDomain": toOrgan,
                "priority": priority,
                "documentType": documentType,
                "codeNation": codeNation,
                "codeNumber": codeNumber,
                "staffName": staffName,
                "fromOrgan": fromOrganDomain,
                "promulgationAmount": promulgationAmount,
                "pageAmount": pageAmount,
                "promulgationDate": promulgationDate,
                "promulgationPlace": promulgationPlace,
                "content": content,
                "dueDate": dueDate,
                "signerFullName": signerFullName,
                "signerPosition": signerPosition,
                "sphereOfPromulgation": sphereOfPromulgation,
                "attachmentIds": attachmentIds,
                "draft": isDraft
            };
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "/van-ban/-/document/create",
                data: JSON.stringify(documentRequest),
                cache: false,
                success: function (response) {
                    if (response.code === 200) {
                        if (isDraft === true) {
                            $.notify(app_message.edoc_save_draft_success, "success");
                            $('#edocFormAdd').modal('toggle');
                            $("#draft-menu").click();
                        } else {
                            window.localEdocStorage.clearAttachments();
                            $.notify(app_message.edoc_publish_document_success, "success");
                            $('#edocFormAdd').modal('toggle');
                            edocDocument.renderDatatable(fromOrgan, toOrgan, docCode);
                        }
                        // $('#edoc-add-document').empty();
                        localEdocStorage.clearAttachments();
                    } else {
                        $.notify(app_message.edoc_publish_document_error, "error");
                    }
                },
                error: function (error) {
                    $.notify(error.responseText, "error");
                }
            });
        }
    },
    deleteDocument: function (documentId) {
        if (documentId !== null && documentId !== "") {
            $.ajax({
                url: "/document/delete/" + documentId,
                type: "DELETE",
                statusCode: {
                    200: () => {
                        $("#" + documentId).remove();
                        $.notify(app_message.edoc_delete_document_success, "success");
                    },
                    400: () => $.notify(app_message.edoc_delete_document_false, "error"),
                    500: () => $.notify(app_message.edoc_delete_document_error, "error")
                }
            })
        }
    }

};
let draftDocument = {
    draftDocumentId: null,
    getDraftDocumentId: function () {
        return this.draftDocumentId;
    },
    setDraftDocumentId: function (draftDocumentId) {
        this.draftDocumentId = draftDocumentId;
    },
    deleteDraftDocument: function (edocDraftId) {
        $.ajax({
            type: "POST",
            contentType: "application/json;charset=utf-8",
            url: "/document/-/draft/delete/" + edocDraftId,
            cache: false,
            success: function (response) {
                if (response.code === 200) {
                    window.localEdocStorage.clearAttachments();
                    $.notify(app_message.edoc_delete_draft_success, "success");
                    $("#draft-menu").click();
                } else {
                    $.notify(app_message.edoc_delete_draft_error, "error");
                }
            },
            error: function (error) {
                $.notify(error.responseText, "error");
            }
        });
    }
};

$(document).ready(function () {
    edocDocument.init();

    $.datetimepicker.setLocale('vi');
    //show datetime picker
    $('#promulgationDate').datetimepicker({
        i18n: {
            vi: {
                months: [
                    'Th??ng 1', 'Th??ng 2', 'Th??ng 3', 'Th??ng 4',
                    'Th??ng 5', 'Th??ng 6', 'Th??ng 7', 'Th??ng 8',
                    'Th??ng 9', 'Th??ng 10', 'Th??ng 11', 'Th??ng 12',
                ],
                dayOfWeek: [
                    "CN", "T2", "T3", "T4",
                    "T5", "T6", "T7",
                ]
            }
        },
        timepicker: true,
        format: 'd/m/Y H:i'
    });
    $('#dueDate').datetimepicker({
        i18n: {
            vi: {
                months: [
                    'Th??ng 1', 'Th??ng 2', 'Th??ng 3', 'Th??ng 4',
                    'Th??ng 5', 'Th??ng 6', 'Th??ng 7', 'Th??ng 8',
                    'Th??ng 9', 'Th??ng 10', 'Th??ng 11', 'Th??ng 12',
                ],
                dayOfWeek: [
                    "CN", "T2", "T3", "T4",
                    "T5", "T6", "T7",
                ]
            }
        },
        timepicker: true,
        format: 'd/m/Y H:i'
    });
    $("#toOrgan").select2({
        tags: true
    });
    $("#dataTables-edoc, #dataTables-edoc-notTaken, #dataTables-edoc-not-sendVPCP,#dataTables-edoc-doneTaken").on('click', 'tbody>tr', function () {
        let documentId = $(this).attr("id");
        $.get("/document/" + documentId, function (data) {
            // console.log(data);
            data.attachments.forEach(function (key, index) {
                console.log(key.fileType + " " + index);
            });
            let toOrganNames = [];
            let takenOrgan = "";
            data.toOrgan.forEach(function (organ, index) {
                if (data.notifications.length > 0) {
                    data.notifications.forEach(function (notification, index) {
                        if (notification.toOrganization["domain"] === organ["domain"]) {
                            if (notification["taken"]) {
                                let status = app_message.edoc_organ_taken;
                                //let takenStatus = status.fontcolor("blue");
                                takenOrgan = organ["name"] + " (" + status + ")";
                            } else {
                                let status = app_message.edoc_organ_not_taken;
                                //let notTakenStatus = status.fontcolor("red");
                                takenOrgan = organ["name"] + " (" + status + ")";
                            }
                        }
                    })
                    toOrganNames.push(takenOrgan);
                } else {
                    toOrganNames.push(organ["name"]);
                }
                var subdata = [];
                if (data.traces.length > 0) {
                    var subtraces = [];
                    for (let i = 0; i < data.traces.length; i++) {
                        var sum = 0;
                        for (let j = i; j >= 0; j --) {
                            if (Number(data.traces[i].statusCode) == Number(data.traces[j].statusCode) && data.traces[i].staffName.toString() === data.traces[j].staffName.toString() && data.traces[i].fromOrgan.domain.toString() === data.traces[j].fromOrgan.domain.toString()) {
                                sum++;
                                //subdata.traces.shift(data.traces[j]);
                            }
                        }
                        if (sum == 1) {
                            //subdata.push
                            subtraces.push(data.traces[i])

                        }
                    }
                    data.traces = subtraces;
                }
            });
            data.toOrganName = toOrganNames.join(", ");
            data.code = data.codeNumber + "/" + data.codeNotation;
            let documentEle = $("#" + documentId);
            if (documentEle.hasClass("not-visited")) {
                documentEle.removeClass("not-visited");
                documentEle.find(".edoc-subject").find("#statusViewDoc").remove();
                documentEle.find(".edoc-subject").prepend("<i class=\"fa fa-envelope-open-o fa-fw\" id=\"statusViewDoc\"></i>")
            }
            $('#edoc-detail').empty();
            console.log(data);
            $('#edocDetailTemplate').tmpl(data).appendTo('#edoc-detail');
            let attachmentsDoc = data.attachments;
            localStorage.setObj("attachmentsOfDoc", attachmentsDoc);
            $('#edocDetail').modal({
                backdrop: 'static',
                keyboard: false
            });
        });
    });

    $(".btn-create-edoc").on("click", function () {
        let attachments = localStorage.getObj("attachments");
        if (attachments != null && attachments.length > 0) {
            let files = {"attachments": attachments};
            $("#attachment-content").empty();
            $("#edocAttachmentTemplate").tmpl(files).appendTo("#attachment-content");
        }
        $("#edocFormAdd").modal({
            backdrop: 'static',
            keyboard: false
        });
    });

    $(".btn-promulgation").on("click", function (event) {
        event.preventDefault();
        // setting datetime picker
        $('#promulgationDate').datetimepicker("show");
    });
    $(".btn-promulgation-draft").on("click", function (event) {
        event.preventDefault();
        // setting datetime picker
        $('#promulgationDate-draft').datetimepicker("show");
    });

    $(".due-date").on("click", function (event) {
        event.preventDefault();
        // setting datetime picker
        $('#dueDate').datetimepicker("show");
    });

    let pageLength = 0;

    $("#search-edoc").change(function () {
        let keyword = $('#search-edoc').val();

        if (edocDocument.appSetting.mode === "draft") {
            $('#dataTablesDraftDoc').DataTable().search(
                keyword,
            ).draw();
        } else if (edocDocument.appSetting.mode === "userManage") {
            $(".edoc-table-user").show();
            $("#dataTables-user").DataTable().search(
                keyword,
            ).draw();
        } else if (edocDocument.appSetting.mode === "organManage") {
            if (keyword.length === 0) {
                organManage.organSetting.dataTable.page.len(pageLength);
                pageLength = 0;
            } else if (pageLength === 0) {
                pageLength = organManage.organSetting.dataTable.page.len();
                organManage.organSetting.dataTable.page.len(1000);
            }
            organManage.organSetting.dataTable.search(
                keyword,
            ).draw();
        } else if (edocDocument.appSetting.mode === "not-taken-edoc") {
            if (keyword.length === 0) {
                edocDocument.appSetting.dataTable.page.len(pageLength);
                pageLength = 0;
            } else if (pageLength === 0) {
                pageLength = edocDocument.appSetting.dataTable.page.len();
                edocDocument.appSetting.dataTable.page.len(1000);
            }
            $('#dataTables-edoc-notTaken').DataTable().search(keyword).draw();
        }
        //minhtd
        else if (edocDocument.appSetting.mode === "done-taken-edoc") {
            if (keyword.length === 0) {
                edocDocument.appSetting.dataTable.page.len(pageLength);
                pageLength = 0;
            } else if (pageLength === 0) {
                pageLength = edocDocument.appSetting.dataTable.page.len();
                edocDocument.appSetting.dataTable.page.len(1000);
            }
            $('#dataTables-edoc-doneTaken').DataTable().search(keyword).draw();
        } else {
            if (keyword.length === 0) {
                edocDocument.appSetting.dataTable.page.len(pageLength);
                pageLength = 0;
            } else if (pageLength === 0) {
                pageLength = edocDocument.appSetting.dataTable.page.len();
                edocDocument.appSetting.dataTable.page.len(1000);
            }
            $('#dataTables-edoc').DataTable().search(
                keyword,
            ).draw();
        }
    });

    $("#side-menu.nav a:not(.not-click)").on("click", function (e) {
        e.preventDefault();
        let dataMode = $(this).attr("data-mode");
        if (dataMode != null) {
            edocDocument.appSetting.mode = dataMode;
            $('.edoc-content > [class^=edoc-table]').hide();
            $(".edoc-statistic").hide();

            //MinhTDb
            // -> hide/show icon Filter when clicking on the userManage/organManage
            if (dataMode === "userManage" || dataMode === "organManage") {
                $('#search-filter').hide();
            } else {
                $('#search-filter').show();
            }

            if (dataMode === "draft") {
                edocDocument.renderDaftTable();
                $(".edoc-table-draft").show();
            } else if (dataMode === "userManage") {
                $("#user-import-excel").show();
                userManage.renderUserDatatable();
                $(".edoc-table-user").show();
            } else if (dataMode === "organManage") {
                $("#organ-import-excel").show();
                organManage.renderOrganDatatable();
                $(".edoc-table-organ").show();
            } else if (dataMode === "not-taken-edoc") {
                $("#warning-document-not-taken").show();
                edocDocument.renderNotTakenDatatable();
                $(".edoc-table-not-taken").show();
            } else if (dataMode === "not-send-vpcp") {
                $('#resend-documents-not-sendVPCP').show();
                edocDocument.renderNotSendVpcpDatatable();
                $('.edoc-table-not-sendPCP').show();
            }
                //MinhTDb
            //Tab Quan tri he thong-> Theo doi van ban da nhan
            else if (dataMode === "done-taken-edoc") {
                $("#warning-document-done-taken").show();
                edocDocument.renderDoneTakenDatatable();
                $(".edoc-table-done-taken").show();
            } else {
                edocDocument.renderDatatable(fromOrgan, toOrgan, docCode);
                $(".edoc-table").show();
            }
            $("#side-menu.nav a").removeClass("active");
            $(this).addClass("active");
        }
    });

    $("#dataTablesDraftDoc").mouseenter('tbody>tr', function () {
        $(".delete-draft").on('click', function () {
            let edocDraftId = $(this).attr("data-id");
            draftDocument.setDraftDocumentId(edocDraftId);
            $('#delete-confirm-modal').modal({
                backdrop: 'static',
                keyboard: false
            });
        });

        $(".edit-draft").on('click', function () {
            let edocDraftId = $(this).attr("data-id");
            draftDocument.setDraftDocumentId(edocDraftId);
            $.get("/document/" + edocDraftId, function (data) {
                $("#detail-draft-document").empty();
                $("#draftDetailTemplate").tmpl(data).appendTo("#detail-draft-document");
            })
            $('#draftDetail').modal({
                backdrop: 'static',
                keyboard: false
            });
        });
    })

    $("#detail-report").on("click", function (e) {
        e.preventDefault();
    });

    $("#resend-document-vpcp").on('click', function () {
        $.ajax({
            url: "/resendAll/VPCP",
            type: "POST",
            beforeSend: function () {
                $("#overlay").show();
            },
            success: function (response) {
                $.notify(response.message, "success");
            },
            error: function (error) {
                $.notify(error.errors, "error");
            }
        }).done(function () {
            $("#overlay").hide();
        });
    })

    $("#put-to-telegram").on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/send/telegram",
            cache: false,
            beforeSend: () => $("#overlay-edoc-not-taken").show(),
            success: () => $.notify(app_message.edoc_message_send_telegram_success, "success")
        })
        $("#overlay-edoc-not-taken").hide();
    })
    $("#put-to-telegram-vpcp").on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/send/telegram/vpcp",
            cache: false,
            beforeSend: () => $("#overlay-edoc-not-taken").show(),
            success: () => $.notify(app_message.edoc_message_send_telegram_success, "success")
        }).done(function () {
            $("#overlay-edoc-not-taken").hide()
        })
    })
    $("#put-to-email").on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/send/email",
            cache: false,
            beforeSend: () => $("#overlay-edoc-not-taken").show(),
            success: () => $.notify(app_message.edoc_message_send_email_success, "success")
        }).done(function () {
            $("#overlay-edoc-not-taken").hide()
        });
    })

    // search filter event
    $("#search-filter").on('click', function () {
        $("#searchFilter").toggle();
    })

    $("#btn-searchFilter-confirm").on('click', function (e) {
        fromOrgan = ($("#fromOrgan").val() === "" ? null : $("#fromOrgan").val());
        toOrgan = ($("#searchToOrgan").val() === "" ? null : $("#searchToOrgan").val());
        docCode = ($("#docCodeSearch").val() === "" ? null : $("#docCodeSearch").val());
        console.log(docCode);
        console.log(toOrgan)
        $("#searchFilter").toggle();
        edocDocument.appSetting.dataTable.clear();
        edocDocument.renderDatatable(fromOrgan, toOrgan, docCode);
        fromOrgan = null, toOrgan = null, docCode = null;
    })

    $("#btn-searchFilter-reset").on('click', function () {
        $('#fromOrganSearch, #toOrganSearch').val(null).trigger('change');
        $("#fromOrgan, #toOrgan").empty().trigger('change')
        $("#docCodeSearch").val("");
    })

    /*$(document).mouseup(function(e) {
        var searchFill = $("#searchFilter");

        // if the target of the click isn't the container nor a descendant of the container
        if (!searchFill.is(e.target) && searchFill.has(e.target).length === 0) {
            searchFill.hide();
        }
    });*/

    $("#fromOrganSearch").select2({
        tags: true,
        maximumSelectionLength: 1,
        width: "auto",
        ajax: {
            url: "/contact/-/contacts",
            dataType: "json"
        }
    });
    $("#toOrganSearch").select2({
        tag: true,
        maximumSelectionLength: 1,
        width: "auto"
    })
});

$(document).on("contextmenu", "#dataTables-edoc>tbody>tr", function (event) {
    event.preventDefault();
});
$(document).on("click", ".show-trace-comment", function (event) {
    event.preventDefault();
    let dataId = $(this).attr("data-id");
    console.log(dataId);
    // show hide paragraph on button click
    $("#" + dataId).toggle("fast");
});
$(document).on("click", "#btn-publish", function (event) {
    event.preventDefault();
    edocDocument.createDocument(false);
});
$(document).on("click", "#btn-draft-toPublish", function (event) {
    event.preventDefault();
    $("#draftDetail").modal('toggle');
    draftDocument.deleteDraftDocument(draftDocument.getDraftDocumentId());
    edocDocument.createDocument(false);
    $("#edocFormAdd").modal('toggle');
})
$(document).on("click", "#btn-draft", function (event) {
    event.preventDefault();
    edocDocument.createDocument(true);
});
$(document).on("click", "#btn-cancel-draft", function (event) {
    event.preventDefault();
    $("#draftDetail").modal('toggle');
});
$(document).on("click", "#btn-cancel-delete", function (event) {
    event.preventDefault();
    $("#delete-confirm-modal").modal('toggle');
});
$(document).on("click", "#btn-confirm", function (event) {
    event.preventDefault();
    draftDocument.deleteDraftDocument(draftDocument.getDraftDocumentId());
    $("#delete-confirm-modal").modal('toggle');
})

$(document).on('click', '#btn-resend-submit', function (e) {
    e.preventDefault();

    $("#resendDocument").modal('toggle');
})
$(document).on('click', '#btn-resend-cancel', function (e) {
    e.preventDefault();
    $("#resendDocument").modal('toggle');
})

function reSendDocumentModal(documentId) {
    $.get("/document/" + documentId, function (data) {
        console.log(data.toOrgan);
        $('#edoc-resend').empty();
        $('#resendDocumentTemplate').tmpl(data).appendTo('#edoc-resend');
        $("#resendDocument").modal({
            backdrop: 'static',
            keyboard: false
        })

        $(document).on('click', '#btn-resend-confirm', function (e) {
            e.preventDefault();
            $("#resendDocument").modal('toggle');
            //console.log("dsnfnf");

            for (let i = 0; i < data.toOrgan.length; i++) {
                let valuecheck = "#" + data.toOrgan[i].id;
                //console.log(valuecheck);
                if ($(valuecheck).prop('checked')) {
                    arr.push($(valuecheck).val());
                }
            }
            console.log(arr);
            reSend(documentId, arr);
        });
    });

}


function reSendToVPCP(id) {
    let url = "/resend/toVPVP";
    $.ajax({
        url: url,
        type: "POST",
        data: {"documentId": id},
        beforeSend: function () {
            $("#overlay-edoc-not-taken").show();
        },
        success: function (response) {
            if (response.code === 200)
                $.notify(response.message, "success");
            else if (response.code === 400)
                $.notify(response.message, "error");
            else
                $.notify(response.message, "error");
        },
        error: function (error) {
            $.notify(app_message.edoc_resend_document_vpcp_fail, "error");
        }
    }).done(function () {
        $("#overlay-edoc-not-taken").hide()
    });
}

//MinhTDb
//Tab Quan tri he thong-> Theo doi van ban da gui
function reSend(id, arr) {
    let url = "/document/resend";

    $.ajax({
        url: url,
        type: "POST",
        data: {"documentId": id, "arr": arr},
        beforeSend: function () {
            $("#overlay-edoc-not-taken").show();
        },
        success: function (response) {
            if (response.code === 200)
                $.notify(response.message, "success");
            else if (response.code === 500)
                $.notify(response.message, "error");
            else
                $.notify(response.message, "error");
        },
        error: function (error) {
            $.notify(app_message.edoc_resend_document_fail, "error");
        }
    }).done(function () {

        $("#overlay-edoc-not-taken").hide()
    });
}

//MinhTDb
//Tab Quan tri he thong-> Theo doi van ban da nhan
function comfirmReceive(id, receiveName) {
    let url = "/document/comfirm_receive";

    $.ajax({
        url: url,
        type: "POST",
        data: {"documentId": id, "receiveName": receiveName},
        beforeSend: function () {
            $("#overlay-edoc-not-taken").show();
        },
        success: function (response) {
            if (response.code === 200)
                $.notify(response.message, "success");
            else if (response.code === 500)
                $.notify(response.message, "error");
            else
                $.notify(response.message, "error");
        },
        error: function (error) {
            $.notify(app_message.edoc_resend_document_fail, "error");
        }
    }).done(function () {
        $("#overlay-edoc-not-taken").hide()

    });
}

// function reSendToVPCP() {
//     let url ="jdbc:mysql://localhost:3306/edoc_lamdong?useSSL=false&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
//
//     $.ajax({
//         url: "/config/dynamic",
//         type: "POST",
//         data: {"url": url },
//         beforeSend: function () {
//             $("#overlay-edoc-not-taken").show();
//         },
//         success: function (response) {
//             if (response.code === 200)
//                 $.notify(response.message, "success");
//             else if (response.code === 500)
//                 $.notify(response.message, "error");
//             else
//                 $.notify(response.message, "error");
//         },
//         error: function (error) {
//             $.notify(app_message.edoc_resend_document_fail, "error");
//         }
//     }).done(function () {
//         $("#overlay-edoc-not-taken").hide()
//
//     });
// }

function validateDocument(subject, toOrgan, codeNation, codeNumber, staffName, promulgationDate, fromOrgan, signerFullName, attachments) {
    let result = false;
    let regex = /^[a-zA-Z0-9!@#\$%\^\&*\)\(+=._-]+$/g
    let regexCode = /^[a-zA-Z!@#\$%\^\&*\)\(+=._-]+$/g;
    if (subject === "") {
        $("#subject").notify(
            "Tr??ch y???u v??n b???n kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (toOrgan == null) {
        $("#toOrgan").notify(
            "????n v??? nh??n v??n b???n kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (codeNumber === "") {
        $("#codeNumber").notify(
            "S??? v??n b???n g???i kh??ng ???????c ????? tr???ng !",
            {position: "left"}
        );
        return true;
    } else {
        if (!regex.test(codeNumber)) {
            $("#codeNumber").notify(
                "S??? v??n b???n g???i kh??ng ???????c ch???a k?? t??? ?????c bi???t !",
                {position: "left"}
            );
            return true;
        }
    }
    if (codeNation === "") {
        $("#codeNation").notify(
            "K?? hi???u v??n b???n g???i kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    } else {
        if (!regexCode.test(codeNation)) {
            $("#codeNation").notify(
                "K?? hi???u v??n b???n g???i kh??ng ???????c ch???a k?? t??? ?????c bi???t !",
                {position: "right"}
            );
            return true;
        }
    }
    if (staffName === "") {
        $("#staffName").notify(
            "T??n ng?????i so???n th???o v??n b???n kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (promulgationDate === "") {
        $("#promulgationDate").notify(
            "Ng??y ph??t h??nh v??n b???n kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (fromOrgan === "") {
        $("#fromOrganId").notify(
            "????n v??? g???i kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (signerFullName === "") {
        $("#signerFullName").notify(
            "T??n c??n b??? k?? v??n b???n kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (attachments == null) {
        $("#uploadFile").notify(
            "Danh s??ch file ????nh k??m kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
    if (attachments.length === 0) {
        $("#uploadFile").notify(
            "Danh s??ch file ????nh k??m kh??ng ???????c ????? tr???ng !",
            {position: "right"}
        );
        return true;
    }
};

function formatResult(station) {
    var markup = "";
    if (station.name !== undefined) {
        markup += "<option value=" + station.domain + ">" + station.name + "</option>";
    }
    return markup;
}

function formatSelection(station) {
    // loadOption(station);
    return station.name;
}

$("#fromOrgan").select2({
    ajax: {
        url: "/contact/-/document/searchcontacts",
        dataType: 'json',
        type: "GET",

        data: function (params) {
            var selectedLocationId = $(this).val();
            return {search_content: params.term, selected_location_id: selectedLocationId}
        },
        processResults: function (data) {
            if (data.length > 20) {
                data.shift();
            }
            console.log(data)
            return {
                results: $.map(data, function (item) {
                    return {
                        text: item.name,
                        id: item.domain
                    }
                })
            };
        },
    }
});

$("#searchToOrgan").select2({
    ajax: {
        url: "/contact/-/document/searchcontacts",
        dataType: 'json',
        type: "GET",

        data: function (params) {
            var selectedLocationId = $(this).val();
            return {search_content: params.term, selected_location_id: selectedLocationId}
        },

        processResults: function (data) {
            if (data.length > 20) {
                data.shift();
            }
            return {
                results: $.map(data, function (item) {
                    return {
                        text: item.name,
                        id: item.domain
                    }
                })
            };
        },
    }
});

function getStatusOfTrace(statusCode) {
    let message = "";
    switch (statusCode) {
        case 1:
            message = app_message.edoc_status_arrived;
            break;
        case 2:
            message = app_message.edoc_status_refuse;
            break;
        case 3:
            message = app_message.edoc_status_received;
            break;
        case 4:
            message = app_message.edoc_status_assignment;
            break;
        case 5:
            message = app_message.edoc_status_processing;
            break;
        case 6:
            message = app_message.edoc_status_finish;
            break;
        case 13:
            message = app_message.edoc_status_recover;
            break;
        case 15:
            message = app_message.edoc_status_accept_recover;
            break;
        case 16:
            message = app_message.edoc_status_refuse_recover;
            break;
        case 999:
            message = app_message.edoc_status_send_fail;
            break;
    }
    return message;
}

