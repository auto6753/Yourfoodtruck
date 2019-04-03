<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!------ Include the above in your HEAD tag ---------->

 
<c:forEach var="s" items="${menulist}">
	${s.menu_name }
</c:forEach>

 d