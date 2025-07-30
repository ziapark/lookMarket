<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lookmarket</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
	<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div>
		<header>
			<%@ include file="header.jsp" %>
		</header>
		<div style="display:flex">
			<aside>
				<%@ include file="side.jsp" %>
			</aside>
			<article>
				<jsp:include page="/WEB-INF/views${viewName}.jsp" />
			</article>
		</div>
		<footer>
			<%@ include file="footer.jsp" %>
		</footer>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>