<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<header class="public-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-11 col-sm-6 col-xs-12">
                <h3>
                    <span class="header-title">
                        <spring:message code="edoc.report.title"/>
                    </span>
                    <small id="updateTime"><spring:message code="edoc.report.update.time"/>
                        <fmt:formatDate type="both" pattern="dd/MM/yyyy HH:mm:ss" value="${now}"/> ) </small>
                </h3>
            </div>
            <div class="col-md-1 col-sm-6 col-xs-12" style="text-align: center">
                <h3 class="public-stat-total" style="  height: 55px ">
                    <small>
                        <span class="label label-success pull-left" style="width: 130px; text-align: left ;">
                            <spring:message code="edoc.report.sent"/>
                            <span id="sendReport">
                            </span>
                        </span>
                    </small>
                    <small>
                        <span class="label label-success pull-left" style="width: 130px; text-align: left">
                            <spring:message code="edoc.report.received"/>
                            <span id="receivedReport">
                            </span>
                        </span>
                    </small>
                    <small>
                        <span class="label label-success pull-left" style="width: 130px; text-align: left">
                            <spring:message code="edoc.report.total"/>
                            <span id="totalReport">
                            </span>
                        </span>
                    </small>
                </h3>
            </div>
        </div>
    </div>
</header>
<div class="report-main">
    <div class="edoc-report-table">
        <div class="row report-search">
            <div class="col-md-2 col-sm-6 col-xs-12">
                <input type="text" class="report-time form-control" readonly
                       id="fromDate" value="" name="fromDate"
                       placeholder="<spring:message code="edoc.search.from.date"/>">
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
                <div class="form-inline form-inline">
                    <input type="text" class="report-time form-control"
                           readonly id="toDate" name="toDate" value=""
                           placeholder="<spring:message code="edoc.search.to.date"/>">
                </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
<%--                <input class="form-control" type="search" id="statDetailSearch" value="" placeholder="Nhập từ khóa...">--%>
<%--                <br>--%>
                <select class="form-control" multiple="" id="searchToOrgan">
                    <select class="form-control" multiple="" id="toOrganSearch">

                    </select>
                </select>
            </div>
            <ul class="nav navbar-top-links report-action">
                <li>
                    <button class="btn btn-info btn-report-group" id="btnSearchReport">
                        <i class="fa fa-calculator fa-fw"></i>
                        <spring:message code="edoc.report.button"/>
                    </button>
                </li>
                <li class="dropdown">
                    <button class="btn btn-primary btn-report-group" aria-haspopup="true" aria-expanded="false" id="exportReport">
                        <i class="fa fa-arrow-circle-down fa-fw"></i>
                        <spring:message code="edoc.export.report"/>
                    </button>
                    <div class="modal fade" id="ExportDailyCounterToExcel" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <span class="close-modal"><i class="fa fa-close fa-fw"></i></span>
                                    </button>
                                    <span class="modal-title">
                                    <i class="fa fa-file-excel-o fa-fw"></i>
                                    <spring:message code="edoc.export.report"/>
                                    </span>
                                </div>
                                <div class="modal-body edoc-resend" id="edoc-export">
                                </div>
                            </div>
                        </div>
                    </div>
                    <script id="exportTemplate" type="text/x-jquery-tmpl">
                        <form class="form-horizontal" action="javascript:void(0)">
                            <span class="resend-header">Chọn (các) cột để xuất dữ liệu...</span>
                            <br><br>
                            <div class="form-group">
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <span class="name">Tên đơn vị</span>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <input id="name" type="checkbox" value="0" /><br/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <span class="send">Số lượng gửi</span>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <input id="send" type="checkbox" value="1"/><br/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <span class="receive">Số lượng nhận</span>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <input id="receive" type="checkbox" value="2"/><br/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <span class="count">Tổng số</span>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <input id="count" type="checkbox" value="3"/><br/>
                                </div>
                            </div>
                            <br><hr>
                            <div class="form-group">
                                <div class="col-md-8 col-sm-6 col-xs-12">
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <button class="btn btn-success" data-id="" id="btn-choose-comfirm">
                                        Xác nhận
                                    </button>
                                    <button class="btn btn-danger" data-id="" id="btn-choose-cancel">
                                        Hủy
                                    </button>
                                </div>
                            </div>
                        </form>
                    </script>
<%--                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">--%>
<%--                        <li><a class="dropdown-item" id="exportReportPDF" href="javascript:void(0)">PDF</a></li>--%>
<%--                        <li><a class="dropdown-item" id="exportReportExcel" href="javascript:void(0)">Excel</a></li>--%>
<%--                    </ul>--%>
                </li>
            </ul>
        </div>
        <div class="row message-filter">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <p id="filterLabel"></p>
            </div>
        </div>
        <div class="row">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="edocReportTable">
                </table>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/asset/js/report.js"/>"></script>