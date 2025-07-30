<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
</head>
<body>
	<div class="container py-4">

		<h2 class="mb-4 text-center">아이디 찾기</h2>

		<div class="row justify-content-center">
			<div class="col-md-6">
				<form action="${contextPath}/FindIdAction.do" method="post" class="p-4 border rounded shadow-sm">
					<div class="mb-3">
						<label for="m_name" class="form-label">이름</label>
						<input type="text" class="form-control" id="m_name" name="m_name" required>
					</div>
					<div class="mb-3">
						<label for="m_email" class="form-label">이메일</label>
						<input type="email" class="form-control" id="m_email" name="m_email" required>
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-primary">아이디 찾기</button>
					</div>
				</form>

				<%-- 아이디 찾기 결과 메시지 표시 영역 --%>
				<c:if test="${not empty requestScope.findIdMessage}">
					<div class="mt-4 p-3 alert alert-info text-center" role="alert">
						${requestScope.findIdMessage}
					</div>
				</c:if>
				<c:if test="${not empty requestScope.foundId}">
					<div class="mt-4 p-3 alert alert-success text-center" role="alert">
						찾으시는 아이디는 **${requestScope.foundId}** 입니다.
					</div>
					<div class="mt-4 p-3 alert alert-success text-center" role="alert">
						이름은 **${requestScope.foundName}** 입니다.
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
