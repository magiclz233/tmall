
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="用户管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="2"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container" >
    <ol class="breadcrumb">
        <li>用户管理</li>
    </ol>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">用户</th>
            <th scope="col">用户组</th>
            <th scope="col">删除</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${users}" var="u" varStatus="vs">
            <tr>
                <th scope="row">${u.id}</th>
                <td>${u.name}</td>
                <td>${u.group}</td>
                <td><a href="delete?id=${u.id}" class="delete-button"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="common/adminPage.jsp" %>
<%@include file="../include/login/registerPageAdmin.jsp" %>


<%@include file="common/adminFooter.jsp" %>

