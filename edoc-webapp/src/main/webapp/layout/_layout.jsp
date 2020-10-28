<%@ page import="com.bkav.edoc.service.database.cache.OrganizationCacheEntry" %>
<%@ page import="com.bkav.edoc.service.database.entity.EdocDocumentType" %>
<%@ page import="com.bkav.edoc.service.database.entity.EdocPriority" %>
<%@ page import="com.bkav.edoc.service.database.util.EdocDynamicContactServiceUtil" %>
<%@ page import="com.bkav.edoc.service.database.util.EdocPriorityServiceUtil" %>
<%@ page import="com.bkav.edoc.service.database.util.EdocTypeServiceUtil" %>
<%@ page import="com.bkav.edoc.service.kernel.util.Base64" %>
<%@ page import="com.bkav.edoc.web.OAuth2Constants" %>
<%@ page import="com.bkav.edoc.web.auth.CookieUtil" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page isELIgnored="true" %>
<%
    List<EdocPriority> priorityList = EdocPriorityServiceUtil.getPriorities();
    request.setAttribute("priorityList", priorityList);
    List<EdocDocumentType> typeList = EdocTypeServiceUtil.getTypes();
    request.setAttribute("typeList", typeList);
    List<OrganizationCacheEntry> organizationCacheEntries = EdocDynamicContactServiceUtil.getAllContacts();
    String organLogin = CookieUtil.getValue(request, OAuth2Constants.ORGANIZATION);
    String organCookie = CookieUtil.getValue(request, OAuth2Constants.ORGANIZATION_INFO);
    String userLogin = new String(Base64.decode(organCookie), StandardCharsets.UTF_8);
    OrganizationCacheEntry organizationCacheEntry = new Gson().fromJson(userLogin, OrganizationCacheEntry.class);
    //remove this organ login from list
    organizationCacheEntries.remove(organizationCacheEntry);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%--<link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon">
    <link rel="icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon">--%>
    <title><tiles:getAsString name="title"/></title>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/asset/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="<c:url value="/asset/css/metisMenu.min.css"/>" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="<c:url value="/asset/css/dataTables/jquery.dataTables.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/asset/css/dataTables/dataTables.bootstrap.min.css"/>" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="<c:url value="/asset/css/dataTables/responsive.dataTables.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/asset/css/dataTables/responsive.bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/asset/css/jquery.contextMenu.min.css"/>" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Custom CSS -->
    <link href="<c:url value="/asset/css/startmin.css"/>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<c:url value="/asset/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<c:url value="/asset/css/jquery.datetimepicker.min.css"/>">
    <link href="<c:url value="/asset/css/select2.min.css"/>" rel="stylesheet"/>
<body>
<tiles:insertAttribute name="header"/>
<div class="side-bar" id="layoutSideBar">
    <tiles:insertAttribute name="menu"/>
</div>
<div class="main-content" id="main-content">
    <tiles:insertAttribute name="body"/>
</div>
<!-- AJAX response must be wrapped in the modal's root class. -->
<div class="modal fade" id="edocDetail" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span class="close-modal"><i class="fa fa-close fa-fw"></i></span>
                </button>
                <span class="modal-title">
                    <i class="fa fa-envelope-open fa-fw"></i>
                    <spring:message code="edoc.detail.modal.title"/>
                </span>
            </div>
            <div class="modal-body edoc-detail" id="edoc-detail">
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>

<!-- AJAX response must be wrapped in the modal's root class. -->
<div class="modal fade" id="userInfo" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span class="close-modal"><i class="fa fa-close fa-fw"></i></span>
                </button>
                <span class="modal-title">
                    <i class="fa fa-user fa-fw"></i>
                    <spring:message code="user.detail"/>
                </span>
            </div>
            <div class="modal-body user-detail" id="user-detail">
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>

<div class="modal fade" id="delete-confirm-modal">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header flex-column" id="modal-header">
                <div class="icon-box">
                    <i class="material-icons">&#xE5CD;</i>
                </div>
                <h4 class="modal-title w-100"><spring:message
                        code="message.delete.document"/></h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer justify-content-center" id="delete-confirm">
                <div class="form-group">
                    <div class="btn-delete-confirm">
                        <button type="button" class="btn btn-danger" id="btn-confirm"><spring:message
                                code="edoc.button.confirm"/></button>
                        <button type="button" class="btn btn-secondary" id="btn-cancel-delete"><spring:message
                                code="edoc.button.not.confirm"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>

<!-- AJAX response must be wrapped in the modal's root class. -->
<div class="modal fade" id="organDetail" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span class="close-modal"><i class="fa fa-close fa-fw"></i></span>
                </button>
                <span class="modal-title">
                    <i class="fa fa-users"></i>
                    <spring:message code="organ.detail"/>
                </span>
            </div>
            <div class="modal-body organ-detail" id="organ-detail">
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>

<script id="edocDetailTemplate" type="text/x-jquery-tmpl">
    <form class="form-horizontal" action="javascript:void(0)">
        <div class="form-group">
            <div class="col-md-1 col-sm-6 col-xs-12">
                <label class="control-label " for="subjectInfo">${app_message.edoc_table_header_subject}</label>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <textarea class="form-control" readonly rows="2" id="subjectInfo">${subject}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1 col-sm-6 col-xs-12">
                <label class="control-label " for="toOrganInfo">
                    ${app_message.edoc_table_header_fromOrgan}
                </label>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <textarea class="form-control" readonly rows="3" id="toOrganInfo">${toOrganName}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 edoc-content">
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label " for="codeInfo">
                            ${app_message.edoc_table_header_code}
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" readonly id="codeInfo" name="codeInfo" value="${code}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="documentTypeInfo">
                                ${app_message.edoc_document_type}
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" readonly id="documentTypeInfo" name="documentTypeInfo" value="${documentTypeName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="priorityInfo">
                                ${app_message.edoc_detail_priority}
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" readonly id="priorityInfo" name="priorityInfo" value="${priority.value}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="staffNameInfo">
                                ${app_message.edoc_staff_name}
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" readonly id="staffNameInfo" name="staffNameInfo" value="{{if traceHeaderList.staff}}${traceHeaderList.staff}{{else}}${app_message.no_data}{{/if}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="pageAmountInfo">
                                ${app_message.edoc_page_amount}
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" readonly id="pageAmountInfo"
                            name="pageAmountInfo" value="{{if documentDetail.promulgationAmount > 0}}${documentDetail.promulgationAmount}{{else}}${app_message.no_data}{{/if}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="pageNumberInfo">
                                ${app_message.edoc_page_number}
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" readonly id="pageNumberInfo" name="pageNumberInfo"
                             value="{{if documentDetail.pageAmount > 0}}${documentDetail.pageAmount}{{else}}${app_message.no_data}{{/if}}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 edoc-content">
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="fromOrganInfo">
                                ${app_message.edoc_from_organ}
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" readonly id="fromOrganInfo" name="fromOrganInfo" value="${fromOrgan.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="promulgationDateInfo">
                                ${app_message.edoc_date_publish}
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" readonly id="promulgationDateInfo"
                                name="promulgationDateInfo" value="${convertToDate(promulgationDate).formatDate()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="signerInfo">
                                ${app_message.edoc_signer_info}
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" readonly id="signerInfo"
                                name="signerInfo"
                                value="{{if documentDetail.signerFullName}}${documentDetail.signerFullName}{{else}}${app_message.no_data}{{/if}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="signerPositionInfo">
                                ${app_message.edoc_document_position}
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" readonly id="signerPositionInfo"
                                               name="signerPositionInfo"
                                               value="{{if documentDetail.signerPosition}}${documentDetail.signerPosition}{{else}}${app_message.no_data}{{/if}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="dueDateInfo">
                                ${app_message.edoc_deadline}
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" readonly id="dueDateInfo" name="dueDateInfo"
                                value="{{if signer}}${documentDetail.dueDate}{{else}}${app_message.message_no_data}{{/if}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="rangeInfo">
                                ${app_message.edoc_range}
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" readonly id="rangeInfo" name="rangeInfo"
                                value="{{if documentDetail.sphereOfPromulgation}}${documentDetail.sphereOfPromulgation}{{else}}${app_message.message_no_data}{{/if}}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1 col-md-6 col-xs-12">
                <label class="control-label " for="contentInfo">
                    ${app_message.edoc_detail_content}
                </label>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <textarea class="form-control" readonly rows="5" id="contentInfo">{{if documentDetail.content}}${documentDetail.content}{{else}}${app_message.message_no_data}{{/if}}</textarea>
            </div>
        </div>
        <div class="form-group attachment-area">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <span class="field-title">
                    ${app_message.edoc_attachment}
                </span>
                <a href="javascript:void(0)" id="downloadAllAttachment">
                    <span class="pull-right"><i class="fa fa-download fa-fw"></i>${app_message.edoc_download_all_attachment}</span>
                </a>
            </div>
            <div class="row">
                <div class="col-md-12 edoc-attachment">
                    {{each attachments}}
                        <div class="form-group">
                            <div class="col-md-9 col-sm-6 col-xs-12 pull-left">
                                <a href="javascript:void(0)" class="attachment-name" title="${name}" data-id="${attachmentId}">
                                    {{if fileType == "application/pdf"}}
                                        <i class="fa fa-file-pdf-o fa-fw"></i>
                                    {{else fileType == "application/msword"}}
                                        <i class="fa fa-file-word-o fa-fw"></i>
                                    {{else fileType == "application/vnd.ms-excel"}}
                                        <i class="fa fa-file-excel-o fa-fw"></i>
                                    {{else fileType == "application/xlsx"}}
                                        <i class="fa fa-file-excel-o fa-fw"></i>
                                    {{else fileType == "application/docx"}}
                                        <i class="fa fa-file-word-o fa-fw"></i>
                                    {{else}}
                                        <i class="fa fa-file-archive-o fa-fw"></i>
                                    {{/if}}
                                    <span>
                                        ${name} (${bytesToSize(size)})
                                    </span>
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12 text-right download-attachment">
                                <a href="<c:url value="/attachment/-/download/${attachmentId}"/>" download class="attachment-link" data-id=${attachmentId}>
                                    <span><i class="fa fa-download fa-fw"></i>${app_message.attachment_download}</span>
                                </a>
                            </div>
                        </div>
                    {{/each}}
                </div>
            </div>
        </div>
        <div class="form-group trace-area">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <span class="field-title">
                    ${app_message.edoc_trace}
                </span>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 traces">
                    {{if traces.length > 0}}
                        {{each traces}}
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-8 col-sm-6 col-xs-12">
                                        <span class="from-to">${fromOrgan.name} -> ${toOrgan.name}</span>
                                    </div>
                                    <div class="col-md-2 col-sm-6 col-xs-12 text-center">
                                        ${getStatusOfTrace(statusCode)}
                                    </div>
                                    <div class="col-md-1 col-sm-6 col-xs-12 text-center">
                                        <span>${convertToDate(timeStamp).formatTime()}</span>
                                    </div>
                                    <div class="col-md-1 col-sm-6 col-xs-12 text-right" >
                                        <span style="float:left">${convertToDate(timeStamp).formatDate()}</span>
                                        <a href="javascript:void(0)" class="show-trace-comment" data-id="${traceId}">
                                            ...
                                        </a>
                                    </div>
                                </div>
                                <div class="row" id="${traceId}" style="display:none">
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <div class="staff-handler>
                                            <span>${app_message.edoc_main_handler}</span> <span><b>${staffName}</b></span>
                                        </div>
                                        <div class="staff-comment">
                                            <span>${app_message.edoc_handler_comment}</span> <span class="comment-trace">${comment}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {{/each}}
                    {{else}}
                        {{each notifications}}
                            <div class="form-group">
                                <div class="col-md-8 col-sm-6 col-xs-12">
                                    <span class="from-to">${fromOrgan.name} -> ${toOrganization.name}</span>
                                </div>
                                <div class="col-md-2 col-sm-6 col-xs-12 text-center">
                                    {{if taken == false}}
                                        ${app_message.edoc_not_received_message}
                                    {{else}}
                                        ${app_message.edoc_received_message}
                                    {{/if}}
                                </div>
                                <div class="col-md-1 col-sm-6 col-xs-12 text-center">
                                    <span>${convertToDate(modifiedDate).formatTime()}</span>
                                </div>
                                <div class="col-md-1 col-sm-6 col-xs-12 text-right" >
                                    <span>${convertToDate(modifiedDate).formatDate()}</span>
                                </div>
                            </div>
                        {{/each}}
                    {{/if}}
                </div>
            </div>
        </div>
    </form>

</script>
<script id="edocAttachmentTemplate" type="text/x-jquery-tmpl">
    <ul class="attachment-list">
        {{each attachments}}
            <li class="attachment-item" data-id="${attachmentId}">
                <span class="att-name" title="${name}">${name} (${bytesToSize(size)})</span>
                <a href="javascript:void(0)" class="delete-attachment" data-id="${attachmentId}" title="${app_message.edoc_delete_document}">
                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                </a>
            </li>
        {{/each}}
    </ul>

</script>
<script id="edocDraftActionTemplate" type="text/x-jquery-tmpl">
    <div>
        <a href="javascript:void(0)" data-id="${documentId}" class="edit-draft">
            <i class="fa fa-pencil-square-o fa-fw"></i>
        </a>
        <a href="javascript:void(0)" data-id="${documentId}" class="delete-draft">
            <i class="fa fa-trash fa-fw"></i>
        </a>
    </div>

</script>
<script id="edocSubjectTemplate" type="text/x-jquery-tmpl">
    <div>
        <a href="javascript:void(0)" title="${subject}" data-id="${documentId}"
            class="edoc-subject {{if visited==false}}${app_message.edoc_new_document}{{/if}}">
            {{if visited}}
                <i class="fa fa-envelope-open-o fa-fw"></i>
            {{else}}
                <i class="fa fa-envelope-o fa-fw"></i>
            {{/if}}
            <span>${shortenSubject.trim()}</span>
        </a>
    </div>

</script>
<script id="userFullNameTemplate" type="text/x-jquery-tmpl">
    <div>
        <a href="javascript:void(0)" title="${displayName}" data-id="${userId}"
            class="user-displayName">
            <i class="fa fa-user fa-fw"></i>
            <span>${displayName}</span>
        </a>
    </div>

</script>
<script id="userStatusTemplate" type="text/x-jquery-tmpl">
    <div>
        {{if status === false}}
            <span>${user_message.user_table_header_status_0}</span>
        {{else status === true}}
            <span>${user_message.user_table_header_status_1}</span>
        {{/if}}
    </div>

</script>
<script id="userTemplate" type="text/x-jquery-tmpl">
    <form class="form-horizontal" action="javascript:void(0)">
        <div class="form-group">
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="subjectInfo">${user_message.user_table_header_fullName}</label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <textarea class="form-control" readonly rows="2" id="displayName">${displayName}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="userName">
                        ${user_message.user_table_header_userName}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="userName" value="${username}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="organize">
                        ${user_message.user_table_header_organize}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="organize" value="${organization.name}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="emailAddress">
                        ${user_message.user_table_header_email}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="email" value="${emailAddress}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="status">
                        ${user_message.user_table_header_status}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    {{if status === false}}
                    <input type="text" class="form-control" readonly id="status" value="${user_message.user_table_header_status_0}">
                    {{else status === true}}
                    <input type="text" class="form-control" readonly id="status" value="${user_message.user_table_header_status_1}">
                    {{/if}}
                </div>
            </div>
             <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="onSSO">
                        ${user_message.user_is_on_sso}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    {{if onSso === false}}
                    <input type="text" class="form-control" readonly id="isOnSso" value="${user_message.user_is_on_sso_false}">
                    {{else onSso === true}}
                    <input type="text" class="form-control" readonly id="isOnSso" value="${user_message.user_is_on_sso_true}">
                    {{/if}}
                </div>
            </div>
             <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="IpLogin">
                        ${user_message.user_last_login_ip}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="IpLogin" value="${lastLoginIP}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="loginTime">
                        ${user_message.user_last_login_time}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="loginTime" value="${convertToDate(lastLoginDate).formatDate()}">
                </div>
            </div>
        </div>
    </form>

</script>
<script id="organNameTemplate" type="text/x-jquery-tmpl">
<div>
    <a href=javascript:void(0)" title="${name}" data-id="${id}"
       class="organ-name">
        <i class="fa fa-users"></i>
        <span>${name}</span>
    </a>
</div>

</script>
<script id="organDetailTemplate" type="text/x-jquery-tmpl">
    <form class="form-horizontal" action="javascript:void(0)">
        <div class="form-group">
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label " for="name">
                        ${organ_message.organ_table_header_name}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <textarea class="form-control" readonly rows="2" id="userName">${name}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label " for="inCharge">
                        ${organ_message.organ_table_header_incharge}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="inCharge" value="${inCharge}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="domain">
                        ${organ_message.organ_table_header_domain}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="domain" value="${domain}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="telephone">
                        ${organ_message.organ_table_header_phonenumber}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="telephone" value="${telephone}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="email">
                        ${organ_message.organ_table_header_email}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="email" value="${email}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="address">
                        ${organ_message.organ_table_header_address}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <input type="text" class="form-control" readonly id="address" value="${address}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <label class="control-label" for="token">
                        ${organ_message.organ_token}
                    </label>
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <a href="javascript:void(0)" class="organ-view-token">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                    </a>
                    <input type="password" class="form-control input-token" readonly id="token" password-shown="false" value="${token}">
                </div>
            </div>
             <div class="form-group">
                <div class="col-md-3 col-sm-6 col-xs-12">
                </div>
                <div class="col-md-9 col-sm-6 col-xs-12">
                    <button class="organ-change-token btn btn-success" data-id="${id}">
                        ${organ_message.organ_token_change}
                    </button>
                    <button class="organ-change-token btn btn-danger" data-id="${id}">
                        ${organ_message.organ_token_revoke}
                    </button>
                </div>
            </div>
        </div>
    </form>
</script>

<!-- AJAX response must be wrapped in the modal's root class. -->
<div class="modal fade" id="edocFormAdd" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span class="close-modal"><i class="fa fa-close fa-fw"></i></span>
                </button>
                <span class="modal-title">
                    <i class="fa fa-envelope-open fa-fw"></i>
                    <spring:message code="edoc.add.document.title"/>
                </span>
            </div>
            <div class="modal-body edoc-detail" id="edoc-add-document">
                <form class="form-horizontal" id="formAddEdoc" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-md-1 col-sm-6 col-xs-12">
                            <label class="control-label " for="subject">
                                <spring:message code="table.header.subject"/></label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-11 col-sm-6 col-xs-12">
                            <textarea class="form-control" required rows="2" id="subject"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-1 col-sm-6 col-xs-12">
                            <label class="control-label " for="toOrgan">
                                <spring:message code="edoc.detail.to"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-11 col-sm-6 col-xs-12">
                            <%--<textarea class="form-control" required rows="5" id="toOrgan"></textarea>--%>
                            <select class="form-control to-organ" multiple="multiple" id="toOrgan">
                                <%
                                    for (OrganizationCacheEntry organization : organizationCacheEntries) {
                                %>
                                <option value="<%=organization.getDomain()%>">
                                    <%=organization.getName()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12 edoc-content">
                                <div class="form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label " for="codeNation">
                                            <spring:message code="table.header.code"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-10 col-sm-6 col-xs-12 code-area">
                                        <span class="code-number">
                                            <input type="text" class="form-control edoc-code" id="codeNumber" required
                                                   name="codeNumber" value="">
                                        </span>
                                        <span class="code-nation">
                                            <input type="text" class="form-control edoc-code" id="codeNation" required
                                                   name="codeNation" value="">
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label" for="documentType">
                                            <spring:message code="edoc.document.type"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-10 col-sm-6 col-xs-12">
                                        <select class="form-control" id="documentType">
                                            <%
                                                for (EdocDocumentType documentType : typeList) {
                                            %>
                                            <option value="<%=documentType.getDocumentType()%>"><%=documentType.getValue()%>
                                            </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label" for="priority">
                                            <spring:message code="edoc.detail.priority"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-10 col-sm-6 col-xs-12">
                                        <select class="form-control" id="priority">
                                            <%
                                                for (EdocPriority priority : priorityList) {
                                            %>
                                            <option value="<%=priority.getPriorityId()%>"><%=priority.getValue()%>
                                            </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label" for="staffName">
                                            <spring:message code="edoc.staff.name"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-10 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" required id="staffName" name="staffName"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label" for="pageAmount">
                                            <spring:message code="edoc.page.amount"/>
                                        </label>
                                    </div>
                                    <div class="col-md-10 col-sm-6 col-xs-12">
                                        <input type="number" min="1" class="form-control" id="pageAmount"
                                               name="pageAmount"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label" for="promulgationAmount">
                                            <spring:message code="edoc.page.number"/>
                                        </label>
                                    </div>
                                    <div class="col-md-10 col-sm-6 col-xs-12">
                                        <input type="number" min="1" class="form-control" id="promulgationAmount"
                                               name="promulgationAmount"
                                               value="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12 edoc-content">
                                <div class="form-group">
                                    <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                                        <label class="control-label" for="fromOrgan">
                                            <spring:message code="edoc.from.organ"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                                        <input type="hidden" class="form-control" id="fromOrganId" name="fromOrganId"
                                               value="<%=organLogin%>">
                                        <input type="text" class="form-control" id="fromOrgan" required name="fromOrgan"
                                               value="<%=organizationCacheEntry.getName()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                                        <label class="control-label" for="promulgationDate">
                                            <spring:message code="edoc.date.publish"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-8 col-sm-6 col-xs-12 f-right promulgationDate">
                                        <a href="javascript:void(0)" class="btn-promulgation">
                                            <i class="fa fa-calendar fa-fw"></i>
                                        </a>
                                        <input type="text" class="form-control" readonly id="promulgationDate"
                                               name="promulgationDate" required value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                                        <label class="control-label" for="signerFullName">
                                            <spring:message code="edoc.signer.info"/>
                                        </label>
                                        <span class="required">*</span>
                                    </div>
                                    <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                                        <input type="text" class="form-control" required id="signerFullName"
                                               name="signerFullName"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                                        <label class="control-label" for="signerPosition">
                                            <spring:message code="edoc.document.position"/>
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                                        <input type="text" class="form-control" id="signerPosition"
                                               name="signerPosition"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                                        <label class="control-label" for="dueDate">
                                            <spring:message code="edoc.deadline"/>
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                                        <a href="javascript:void(0)" class="due-date">
                                            <i class="fa fa-calendar fa-fw"></i>
                                        </a>
                                        <input type="text" readonly class="form-control" id="dueDate" name="dueDate"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                                        <label class="control-label" for="sphereOfPromulgation">
                                            <spring:message code="edoc.range"/>
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                                        <input type="text" class="form-control" id="sphereOfPromulgation"
                                               name="sphereOfPromulgation"
                                               value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-1 col-md-6 col-xs-12">
                            <label class="control-label " for="content">
                                <spring:message code="edoc.detail.content"/>
                            </label>
                        </div>
                        <div class="col-md-11 col-sm-6 col-xs-12">
                            <textarea class="form-control" rows="5" id="content"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-1 col-md-6 col-xs-12">
                            <label class="control-label" for="uploadFile">
                                <spring:message code="edoc.attachment"/>
                            </label>
                        </div>
                        <div class="col-md-11 col-sm-6 col-xs-12">
                            <input type="file" multiple="multiple" class="form-control" id="uploadFile"
                                   placeholder="Upload File"
                                   name="uploadFile">
                        </div>
                    </div>
                    <div class="form-group attachment-template">
                        <div class="col-md-1 col-sm-6 col-xs-12"></div>
                        <div class="col-md-11 col-sm-6 col-xs-12" id="attachment-content">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-8 col-sm-6 col-xs-12"></div>
                        <div class="col-md-4 col-sm-6 col-xs-12 text-right btn-group-edoc">
                            <button class="btn btn-success" id="btn-draft"><spring:message
                                    code="edoc.button.draft"/></button>
                            <button class="btn btn-primary" id="btn-publish"><spring:message
                                    code="edoc.button.publish.document"/></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>

<div class="modal fade" id="draftDetail" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span class="close-modal"><i class="fa fa-close fa-fw"></i></span>
                </button>
                <span class="modal-title">
                    <i class="fa fa-envelope-open fa-fw"></i>
                    <spring:message code="edoc.add.document.title"/>
                </span>
            </div>
            <div class="modal-body edoc-detail" id="detail-draft-document">
            </div>
        </div>
    </div>
</div>
<script id="draftDetailTemplate" type="text/x-jquery-tmpl">
    <form class="form-horizontal" id="formAddEdoc" method="POST" action="javascript:void(0)">
        <div class="form-group">
            <div class="col-md-1 col-sm-6 col-xs-12">
                <label class="control-label " for="subject">
                    <spring:message code="table.header.subject"/></label>
                <span class="required">*</span>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <textarea class="form-control" required rows="2" id="subject">${subject}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1 col-sm-6 col-xs-12">
                <label class="control-label " for="toOrgan">
                    <spring:message code="edoc.detail.to"/>
                </label>
                <span class="required">*</span>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <select class="form-control to-organ" id="toOrgan">
                    <option value="" selected>${toOrgan[0].name}</option>
                    <%
    for (OrganizationCacheEntry organization : organizationCacheEntries) {
%>
                    <option value="<%=organization.getDomain()%>">
                        <%=organization.getName()%>
                    </option>
                    <%
    }
%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 edoc-content">
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label " for="codeNation">
                                <spring:message code="table.header.code"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12 code-area">
                            <span class="code-number">
                                <input type="text" class="form-control edoc-code" id="codeNumber" required
                                     name="codeNumber" value="${codeNumber}">
                                </span>
                            <span class="code-nation">
                                <input type="text" class="form-control edoc-code" id="codeNotation" required
                                     name="codeNotation" value="${codeNotation}">
                                </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="documentType">
                                <spring:message code="edoc.document.type"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <select class="form-control" id="documentType">
                                <option value"" selected>${documentTypeName}</option>
                                <%
    for (EdocDocumentType documentType : typeList) {
%>
                                <option value="<%=documentType.getDocumentType()%>"><%=documentType.getValue()%>
                                </option>
                                <%
    }
%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="priority">
                                <spring:message code="edoc.detail.priority"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <select class="form-control" id="priority">
                                <option value="" selected>${priority.value}</option>
                                <%
    for (EdocPriority priority : priorityList) {
%>
                                <option value="<%=priority.getPriorityId()%>"><%=priority.getValue()%>
                                </option>
                                <%
    }
%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="staffName">
                                <spring:message code="edoc.staff.name"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="text" class="form-control" required id="staffName" name="staffName"
                                   value="${traceHeaderList.staff}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="pageAmount">
                                <spring:message code="edoc.page.amount"/>
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="number" min="1" class="form-control" id="pageAmount"
                                   name="pageAmount"
                                   value="${documentDetail.pageAmount}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                            <label class="control-label" for="promulgationAmount">
                                <spring:message code="edoc.page.number"/>
                            </label>
                        </div>
                        <div class="col-md-10 col-sm-6 col-xs-12">
                            <input type="number" min="1" class="form-control" id="promulgationAmount"
                                   name="promulgationAmount"
                                   value="${documentDetail.promulgationAmount}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 edoc-content">
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="fromOrgan">
                                <spring:message code="edoc.from.organ"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="hidden" class="form-control" id="fromOrganId" name="fromOrganId"
                                   value="<%=organLogin%>">
                            <input type="text" class="form-control" id="fromOrgan" required name="fromOrgan"
                                   value="<%=organizationCacheEntry.getName()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="promulgationDate">
                                <spring:message code="edoc.date.publish"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right promulgationDate">
                            <a href="javascript:void(0)" class="btn-promulgation-draft">
                                <i class="fa fa-calendar fa-fw"></i>
                            </a>
                            <input type="text" class="form-control" readonly id="promulgationDate-draft"
                                   name="promulgationDateDraft" required value="${convertToDate(promulgationDate).formatDate()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="signerFullName">
                                <spring:message code="edoc.signer.info"/>
                            </label>
                            <span class="required">*</span>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" required id="signerFullName"
                                   name="signerFullName"
                                   value="${documentDetail.signerFullName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="signerPosition">
                                <spring:message code="edoc.document.position"/>
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" id="signerPosition"
                                   name="signerPosition"
                                   value="${documentDetail.signerPosition}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="dueDate">
                                <spring:message code="edoc.deadline"/>
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <a href="javascript:void(0)" class="due-date">
                                <i class="fa fa-calendar fa-fw"></i>
                            </a>
                            <input type="text" readonly class="form-control" id="dueDate-draft" name="dueDateDraft"
                                   value="${documentDetail.dueDate}">
                        </div>D
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-sm-6 col-xs-12 p-left">
                            <label class="control-label" for="sphereOfPromulgation">
                                <spring:message code="edoc.range"/>
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-6 col-xs-12 f-right">
                            <input type="text" class="form-control" id="sphereOfPromulgation"
                                   name="sphereOfPromulgation"
                                   value="${documentDetail.sphereOfPromulgation}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1 col-md-6 col-xs-12">
                <label class="control-label " for="content">
                    <spring:message code="edoc.detail.content"/>
                </label>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <textarea class="form-control" rows="5" id="content">${documentDetail.content}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-1 col-md-6 col-xs-12">
                <label class="control-label" for="uploadFile">
                    <spring:message code="edoc.attachment"/>
                </label>
            </div>
            <div class="col-md-11 col-sm-6 col-xs-12">
                <input type="file" multiple="multiple" class="form-control" id="uploadFile"
                       placeholder="Upload File"
                       name="uploadFile">
            </div>
        </div>
        <div class="form-group attachment-template">
            <div class="col-md-1 col-sm-6 col-xs-12"></div>
            <div class="col-md-11 col-sm-6 col-xs-12" id="attachment-content">
                <ul class="attachment-list">
                    {{each attachments}}
                        <li class="attachment-item" data-id="${attachmentId}">
                            <span class="att-name" title="${name}">${name} (${bytesToSize(size)})</span>
                            <a href="javascript:void(0)" class="delete-attachment" data-id="${attachmentId}" title="${app_message.edoc_delete_document}">
                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                            </a>
                        </li>
                    {{/each}}
                </ul>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-8 col-sm-6 col-xs-12"></div>
            <div class="col-md-4 col-sm-6 col-xs-12 text-right btn-group-edoc">
                <button class="btn btn-primary" id="btn-draft-toPublish"><spring:message
        code="edoc.button.publish.document"/></button>
                <button class="btn btn-danger" id="btn-cancel-draft"><spring:message
        code="edoc.button.cancel"/></button>
            </div>
        </div>
    </form>

</script>

<%--Jquery--%>
<script src="<c:url value="/asset/js/jquery.min.js"/>"></script>
<script src="<c:url value="/asset/js/message.js"/>"></script>
<script src="<c:url value="/asset/js/jquery.cookie.js"/>"></script>
<script src="<c:url value="/asset/js/notify.min.js"/>"></script>
<script src="<c:url value="/asset/js/jquery.formatter.js"/>"></script>
<script src="<c:url value="/asset/js/select2.min.js"/>"></script>
<%--datetimepicker--%>
<script src="<c:url value="/asset/js/jquery.datetimepicker.full.js"/>"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/asset/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/asset/js/jquery.contextMenu.min.js"/>"></script>
<%--JQuery template--%>
<script src="<c:url value="/asset/js/jquery.tmpl.min.js"/>"></script>
<script src="<c:url value="/asset/js/datetime.js" />"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value="/asset/js/metisMenu.min.js"/>"></script>
<!-- DataTables JavaScript -->
<script src="<c:url value="/asset/js/dataTables/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/asset/js/dataTables/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/asset/js/dataTables/dataTables.responsive.min.js"/>"></script>
<script src="<c:url value="/asset/js/dataTables/responsive.bootstrap.min.js"/>"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/asset/js/startmin.js"/>"></script>
<script src="<c:url value="/asset/js/document.js"/>"></script>
<script src="<c:url value="/asset/js/user.js"/>"></script>
<script src="<c:url value="/asset/js/organization.js"/>"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script src="<c:url value="/asset/js/attachment.js"/>"></script>
</body>
</html>