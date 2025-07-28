<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인창</title>
</head>
<body>
 	<h3>로그인</h3>
 	<div id="detatail_table">
 		<form action="${contextPath}/member/login.do" method="post">
 			<table>
 				<tbody>
 					<tr class="dot_line">
 						<td class="fixed_join">아이디</td>
 						<td><input type="text" name="m_id" size="20" /></td>
 					</tr>
 					<tr class="solid_line">
 						<td class="fixed_join">비밀번호</td>
 						<td><input type="password" name="m_pw" size="20" /></td>
 					</tr>	
 				</tbody>
 			</table>
 			<br><br>
 			<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=0Kh9BAPo35nGcE_1Jbvx&redirect_uri=http://localhost:8090/lookmarket/member/naverCallback.do&state=lookmarket&auth_type=reauthenticate">
    			<img height="50" src="http://static.nid.naver.com/oauth/_le/img/g_btn.png"/>
			</a>
 			<input type="submit" value="로그인" >
 			<input type="reset" value="다시입력" >
 			
 			<br><br>
 			<a href="#">아이디 찾기</a>
 			<a href="#">비밀번호 찾기</a>
 			<a href="${contextPath}/member/memberForm.do">회원가입</a>
 			<a href="#">고객센터</a>
 		</form>
 	</div>
</body>
</html>