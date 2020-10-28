let appSettings;
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
        instance.renderDatatable();
    },
    addExtCSS: function (name) {
        let instance = this;
        let css = appSettings.pathPlugin + '/css/' + name + '.css?t=' + new Date().getTime();
        css = '<link rel="stylesheet" type="text/css" href="' + css + '">';

        appSettings.root.append(css);
    },
    renderDatatable: function () {
        let instance = this;
        instance.appSetting.dataTable = $('#dataTables-edoc').DataTable({
            serverSide: true,
            processing: true,
            pageLength: 25,
            ajax: {
                url: "/documents/" + instance.appSetting.mode,
                type: "GET"
            },
            drawCallback: function () {
                $.contextMenu({
                    selector: 'tbody tr td',
                    callback: function (key, options) {
                        let id = options.$trigger[0].parentElement.id;
                        let m = "clicked: " + key + ' ' + id;
                        console.log(m);
                        instance.deleteDocument(id);
                    },
                    items: {
                        /*"edit": {name: "Edit", icon: "edit"},
                        "cut": {name: "Cut", icon: "cut"},
                        copy: {name: "Copy", icon: "copy"},
                        "paste": {name: "Paste", icon: "paste"},*/
                        "delete": {name: app_message.edoc_remove_document, icon: "delete"}
                        /*"sep1": "---------",*/
                        /*"quit": {name: "Quit", icon: function(){
                                return 'context-menu-icon context-menu-icon-quit';
                            }}*/
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
                    "title": app_message.edoc_table_header_fromOrgan,
                    "data": "fromOrgan.name"
                },
                {
                    "title": app_message.table_header_code,
                    "data": null,
                    "render": function (data) {
                        return data.codeNumber + "/" + data.codeNotation;
                    }
                },
                {
                    "title": app_message.table_header_documentCate,
                    "data": null,
                    "render": function (data) {
                        return data.documentTypeName === null ? app_message.edoc_no_data : data.documentTypeName;
                    }
                },
                {
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
        instance.appSetting.dataTable = $('#dataTablesDraftDoc').DataTable({
            ajax: {
                url: "/documents/" + instance.appSetting.mode,
                dataSrc: ""
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
    deleteDocument: function (documentId) {
        if (documentId !== null && documentId !== "") {
            $.ajax({
                url: "/document/delete/" + documentId,
                type: "DELETE",
                statusCode: {
                    200: function (response) {
                        $.notify("Delete document success", "success");
                    },
                    400: function (response) {
                        $.notify("Delete document error", "success");
                    },
                    500: function (response) {
                        $.notify("Delete document error", "success");
                    }
                }
            })
        }
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
            console.log(documentRequest);
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
                            $("#outbox-menu").click();
                        }
                        $('#edoc-add-document').empty();
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
                console.log(response.code);
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
        timepicker: true,
        format: 'd/m/Y H:i'
    });
    $('#dueDate').datetimepicker({
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
        timepicker: true,
        format: 'd/m/Y H:i'
    });
    $("#toOrgan").select2({
        tags: true
    });
    $("#dataTables-edoc").on('click', 'tbody>tr', function () {
        let documentId = $(this).attr("id");
        console.log(documentId);
        $.get("/document/" + documentId, function (data) {
            console.log(data);
            data.attachments.forEach(function (key, index) {
                console.log(key.fileType + " " + index);
            });
            let toOrganNames = [];
            data.toOrgan.forEach(function (organ, index) {
                toOrganNames.push(organ["name"]);
            });
            data.toOrganName = toOrganNames.join(", ");
            data.code = data.codeNumber + "/" + data.codeNotation;
            $("#" + documentId).removeClass("not-visited");
            $('#edoc-detail').empty();
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

    $("#search-edoc").change(function () {
        if (edocDocument.appSetting.mode === "draft") {
            $('#dataTablesDraftDoc').DataTable().search(
                $('#search-edoc').val(),
            ).draw();
        } else if (edocDocument.appSetting.mode === "userManage") {
            $("#dataTables-user").DataTable().search(
                $("#search-edoc").val(),
            ).draw();
        } else if (edocDocument.appSetting.mode === "organManage") {
            $('#dataTables-organ').DataTable().search(
                $('#search-edoc').val(),
            ).draw();
        } else {
            $('#dataTables-edoc').DataTable().search(
                $('#search-edoc').val(),
            ).draw();
        }
    });

    $("#side-menu.nav a:not(.not-click)").on("click", function (e) {
        e.preventDefault();
        let dataMode = $(this).attr("data-mode");
        if (dataMode != null) {
            edocDocument.appSetting.mode = dataMode;
            $('.edoc-content > [class^=edoc-table]').hide();
            if (dataMode === "draft") {
                edocDocument.renderDaftTable();
                $(".edoc-table-draft").show();
            } else if (dataMode === "userManage") {
                userManage.renderUserDatatable();
                $(".edoc-table-user").show();
            } else if (dataMode === "organManage") {
                organManage.renderOrganDatatable();
                $(".edoc-table-organ").show();
            } else {
                edocDocument.renderDatatable();
                $(".edoc-table").show();
            }
            $("#side-menu.nav a").removeClass("active");
            $(this).addClass("active");
        }
    });

    $("#dataTablesDraftDoc").mouseenter('tbody>tr', function () {
        $(".delete-draft").on('click', function () {
            let edocDraftId = $(this).attr("data-id");
            console.log(edocDraftId);
            draftDocument.setDraftDocumentId(edocDraftId);
            $('#delete-confirm-modal').modal({
                backdrop: 'static',
                keyboard: false
            });
        });

        $(".edit-draft").on('click', function () {
            let edocDraftId = $(this).attr("data-id");
            console.log(edocDraftId);
            draftDocument.setDraftDocumentId(edocDraftId);
            $.get("/document/" + edocDraftId, function (data) {
                console.log(data);
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
});

$(document).on("contextmenu", "#dataTables-edoc>tbody>tr", function (event) {
    event.preventDefault();
    console.log("right click to end document");
});
$(document).on("click", ".show-trace-comment", function (event) {
    event.preventDefault();
    let dataId = $(this).attr("data-id");
    let jqueryDataId = "#" + dataId;
    // show hide paragraph on button click
    $(jqueryDataId).toggle("fast");
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

function validateDocument(subject, toOrgan, codeNation, codeNumber, staffName, promulgationDate, fromOrgan, signerFullName, attachments) {
    let result = false;
    let regex = /^[a-zA-Z0-9!@#\$%\^\&*\)\(+=._-]+$/g
    let regexCode = /^[a-zA-Z!@#\$%\^\&*\)\(+=._-]+$/g;
    if (subject === "") {
        $("#subject").notify(
            "Trích yếu văn bản không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (toOrgan == null) {
        $("#toOrgan").notify(
            "Đơn vị nhân văn bản không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (codeNumber === "") {
        $("#codeNumber").notify(
            "Số văn bản gửi không được để trống !",
            {position: "left"}
        );
        return true;
    } else {
        if (!regex.test(codeNumber)) {
            $("#codeNumber").notify(
                "Số văn bản gửi không được chứa ký tự đặc biệt !",
                {position: "left"}
            );
            return true;
        }
    }
    if (codeNation === "") {
        $("#codeNation").notify(
            "Ký hiệu văn bản gửi không được để trống !",
            {position: "right"}
        );
        return true;
    } else {
        if (!regexCode.test(codeNation)) {
            $("#codeNation").notify(
                "Ký hiệu văn bản gửi không được chứa ký tự đặc biệt !",
                {position: "right"}
            );
            return true;
        }
    }
    if (staffName === "") {
        $("#staffName").notify(
            "Tên người soạn thảo văn bản không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (promulgationDate === "") {
        $("#promulgationDate").notify(
            "Ngày phát hành văn bản không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (fromOrgan === "") {
        $("#fromOrganId").notify(
            "Đơn vị gửi không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (signerFullName === "") {
        $("#signerFullName").notify(
            "Tên cán bộ ký văn bản không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (attachments == null) {
        $("#uploadFile").notify(
            "Danh sách file đính kèm không được để trống !",
            {position: "right"}
        );
        return true;
    }
    if (attachments.length === 0) {
        $("#uploadFile").notify(
            "Danh sách file đính kèm không được để trống !",
            {position: "right"}
        );
        return true;
    }
}

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
    }
    return message;
}