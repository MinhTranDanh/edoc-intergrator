<%@ page import="com.bkav.edoc.web.auth.CookieUtil" %>
<%@ page import="com.bkav.edoc.web.OAuth2Constants" %>
<%@ page import="com.bkav.edoc.service.database.cache.UserCacheEntry" %>
<%@ page import="com.bkav.edoc.service.kernel.util.Base64" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="com.bkav.edoc.web.util.PropsUtil" %>
<%@ page import="com.bkav.edoc.service.database.util.EdocDynamicContactServiceUtil" %>
<%@ page import="com.bkav.edoc.service.database.cache.OrganizationCacheEntry" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userLoginCookie = CookieUtil.getValue(request, OAuth2Constants.USER_LOGIN);
    String userLogin = new String(Base64.decode(userLoginCookie), StandardCharsets.UTF_8);
    UserCacheEntry user = new Gson().fromJson(userLogin, UserCacheEntry.class);
    List<OrganizationCacheEntry> organizationCacheEntries = EdocDynamicContactServiceUtil.getAllContacts();
%>
<%--<nav class="navbar navbar-default nav-top-header" id="header-nav">
    <div class="navbar-header edoc-header">
        <a href="<c:url value="/"/>">
            <img src="<c:url value="/asset/img/Logo.png"/>" alt=""/>
            <span><spring:message code="edoc.header.title"/></span>
        </a>
    </div>
    <div class="search-container">
        <input class="search-input" id="search-edoc" type="search" placeholder="<spring:message code="edoc.search"/>">
        <a href="javascript:void(0)" type="button" data-toggle="modal-popover" data-placement="bottom" id="search-filter">
            <i class="fa fa-filter fa-lg" title="<spring:message code="edoc.search.filter"/>"></i>
        </a>
        &lt;%&ndash;<a href="#searchAdvanced" data-toggle="modal-popover" data-placement="bottom" id="search-filter">
            <i class="fa fa-filter fa-lg" title="<spring:message code="edoc.search.filter"/>"></i>
        </a>&ndash;%&gt;
    </div>
    &lt;%&ndash;<div id="searchAdvanced" class="popover">
        <div class="arrow"></div>
        <h3 class="popover-title"><spring:message code="edoc.search.filter"/></h3>

        <div class="popover-content">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="control-label" for="fromOrganSearch">
                            <spring:message code="edoc.search.fromOrgan"/>
                        </label>
                        <select class="form-control" multiple="multiple" id="fromOrganSearch">
                            <%
                                for (OrganizationCacheEntry organization: organizationCacheEntries) {
                            %>
                            <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="control-label" for="toOrganSearch">
                            <spring:message code="edoc.search.toOrgan"/>
                        </label>
                        <select class="form-control" multiple="multiple" id="toOrganSearch">
                            <%
                                for (OrganizationCacheEntry organization: organizationCacheEntries) {
                            %>
                            <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="control-label" for="docCodeSearch">
                            <spring:message code="edoc.search.docCode"/>
                        </label>
                        <input class="form-control" type="text" id="docCodeSearch" value="">
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                </div>
            </div>
            <hr>
            <div class="row" id="search-btn">
                <div class="form-group" id="btn-search-filter">
                    <a href="javascript:void(0)" class="btn btn-info" id="btn-searchFilter-reset">
                        <span>Xoa het</span>
                    </a>
                    <a href="javascript:void(0)" class="btn btn-success" id="btn-searchFilter-confirm">
                        <span>Tim kiem</span>
                    </a>
                </div>
            </div>
        </div>
    </div>&ndash;%&gt;
    <div class="popover" id="searchFilter">
        <div class="popover-content">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <label class="control-label" for="fromOrganSearch">
                        <spring:message code="edoc.search.fromOrgan"/>
                    </label>
                </div>
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <select class="form-control" multiple="multiple" id="fromOrganSearch">
                        <%
                            for (OrganizationCacheEntry organization: organizationCacheEntries) {
                        %>
                        <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <label class="control-label" for="toOrganSearch">
                        <spring:message code="edoc.search.toOrgan"/>
                    </label>
                </div>
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <select class="form-control" multiple="multiple" id="toOrganSearch">
                        <%
                            for (OrganizationCacheEntry organization: organizationCacheEntries) {
                        %>
                        <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <label class="control-label" for="docCodeSearch">
                        <spring:message code="edoc.search.docCode"/>
                    </label>
                </div>
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <input class="form-control" type="text" id="docCodeSearch" value="">
                </div>
            </div>
            <hr>
            <div class="row" id="search-btn">
                <div class="form-group" id="btn-search-filter">
                    <a href="javascript:void(0)" class="btn btn-info" id="btn-searchFilter-reset">
                        <span>Xoá hết</span>
                    </a>
                    <a href="javascript:void(0)" class="btn btn-success" id="btn-searchFilter-confirm">
                        <span>Tìm kiếm</span>
                    </a>
                </div>
            </div>
        </div>
        &lt;%&ndash;<div class="popover-content">
            <div class="form-input">
                <label class="control-label" for="fromOrganSearch">
                    <spring:message code="edoc.search.fromOrgan"/>
                </label>
                <select class="form-control" multiple="multiple" id="fromOrganSearch">
                    <%
                        for (OrganizationCacheEntry organization: organizationCacheEntries) {
                    %>
                    <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-input">
                <label class="control-label" for="toOrganSearch">
                    <spring:message code="edoc.search.toOrgan"/>
                </label>
                <select class="form-control" multiple="multiple" id="toOrganSearch">
                    <%
                        for (OrganizationCacheEntry organization: organizationCacheEntries) {
                    %>
                    <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-input">
                <label class="control-label" for="docCodeSearch">
                    <spring:message code="edoc.search.docCode"/>
                </label>
                <input class="form-control" type="text" id="docCodeSearch" value="">
            </div>
            <hr>
            <div class="form-input">
                <div class="form-group" id="btn-search-filter">
                    <a href="javascript:void(0)" class="btn btn-info" id="btn-searchFilter-reset">
                        <span class="glyphicon glyphicon-erase"></span>
                    </a>
                    <a href="javascript:void(0)" class="btn btn-success" id="btn-searchFilter-confirm">
                        <span class="glyphicon glyphicon-ok"></span>
                    </a>
                </div>
            </div>
        </div>&ndash;%&gt;
    </div>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <ul class="nav navbar-right navbar-top-links">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                <i class="fa fa-user fa-fw"></i><%=user.getDisplayName()%>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a class="user-info" href="javascript:void(0)" data-id="<%=user.getUserId()%>">
                        <i class="fa fa-user fa-fw"></i>
                        <spring:message code="user.profile"/>
                    </a>
                </li>
                <%
                    String changePassUrl = PropsUtil.get("user.change.password.url");
                %>
                <li>
                    &lt;%&ndash;<a class="change-password" href="<%= changePassUrl %>" target="_blank">&ndash;%&gt;
                    <a class="change-password" id="change-password" href="javascript:void(0)">
                        <i class="fa fa-key fa-fw"></i>
                        <spring:message code="user.change.password"/>
                    </a>
                </li>
                <li>
                    <a class="logout" href="<c:url value="/logout"/>">
                        <i class="fa fa-sign-out fa-fw"></i>
                        <spring:message code="logout"/>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</nav>--%>

<nav class="navbar navbar-default nav-top-header" id="">
    <div class="navbar-header edoc-header">
        <a href="<c:url value="/"/>">
            <img src="<c:url value="/asset/img/Logo.png"/>" alt=""/>
            <span><spring:message code="edoc.header.title"/></span>
        </a>
    </div>
    <div class="search-container">
        <input class="search-input" id="search-edoc" type="search" placeholder="<spring:message code="edoc.search"/>">

        <a class="btn-open" href="javascript:void(0)" type="button" data-toggle="" data-placement="bottom"
           id="search-filter"
           data-trigger="focus">
            <i class="fa fa-filter fa-lg" title="<spring:message code="edoc.search.filter"/>"></i>
        </a>
    </div>
    <div class="back"></div>
    <div id="dialog" class="dialog_box">
        <div class="">
            <h6 class="popover-title"><strong><spring:message code="edoc.search.filter"/></strong></h6>
        </div>
        <br>
        <div class="popover-content">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <label class="control-label"><spring:message code="edoc.search.fromOrgan"/></label>
                </div>
                <div class="col-md-8 col-sm-6 col-xs-12" style="padding-left: 0px;">
                    <select class="form-control" multiple="multiple" id="fromOrganSearch"></select>
                    <%--<select class="form-control" multiple="multiple" id="fromOrganSearch">
                        <%
                            for (OrganizationCacheEntry organization : organizationCacheEntries) {
                        %>
                        <option value="<%=organization.getDomain()%>"><%=organization.getName()%></option><%
                        }
                    %>
                    </select>--%>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 col-sm-5 col-xs-12 label-popover">
                    <label class="control-label"><spring:message code="edoc.search.toOrgan"/></label>
                </div>
                <div class="col-md-8 col-sm-6 col-xs-12" style="padding-left: 0px;">
                    <select class="form-control" multiple="multiple" id="toOrganSearch">
                        <%
                            for (OrganizationCacheEntry organization : organizationCacheEntries) {
                        %>
                        <option value="<%=organization.getDomain()%>"><%=organization.getName()%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4 col-sm-5 col-xs-12">
                    <label class="control-label"><spring:message code="edoc.search.docCode"/></label>
                </div>
                <div class="col-md-8 col-sm-5 col-xs-12" style="padding-left: 0px">
                    <input class="form-control" id="docCodeSearch">
                </div>
            </div>
            <br>
            <hr>
            <div class=" form-input">
                <div class="group-btn " id="btn-search-filter">

                    <a href="javascript:void(0)" type="" class="btn btn-info" id="btn-searchFilter-reset">
                        <span><spring:message code="edoc.search.eraser"/></span>
                    </a>&nbsp;
                    <a href="javascript:void(0)" class="btn btn-success" id="btn-searchFilter-confirm" style="text-align: center;">
                        <span><spring:message code="edoc.search.search"/></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <ul class="nav navbar-right navbar-top-links">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
                <i class="fa fa-user fa-fw"></i><%=user.getDisplayName()%>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a class="user-info" href="javascript:void(0)" data-id="<%=user.getUserId()%>">
                        <i class="fa fa-user fa-fw"></i>
                        <spring:message code="user.profile"/>
                    </a>
                </li>
                <%
                    String changePassUrl = PropsUtil.get("user.change.password.url");
                %>
                <li>
                    <%--<a class="change-password" href="<%= changePassUrl %>" target="_blank">--%>
                    <a class="change-password" id="change-password" href="javascript:void(0)">
                        <i class="fa fa-key fa-fw"></i>
                        <spring:message code="user.change.password"/>
                    </a>
                </li>
                <li>
                    <a class="logout" href="<c:url value="/logout"/>">
                        <i class="fa fa-sign-out fa-fw"></i>
                        <spring:message code="logout"/>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</nav>