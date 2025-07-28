<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인창</title>
	<style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 360px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .login-container input[type="checkbox"] {
            margin-right: 5px;
        }

        .login-container .remember {
            text-align: left;
            margin-top: 10px;
            font-size: 13px;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .login-container .links {
            margin-top: 20px;
            font-size: 13px;
        }

        .login-container .links a {
            color: #333;
            text-decoration: none;
            margin: 0 5px;
        }

        .login-container .links a:hover {
            text-decoration: underline;
        }

        .naver-login {
            margin-top: 20px;
        }

        .naver-login a img {
            width: 100%;
            max-width: 200px;
        }
    </style>
</head>
<body>
	<div class="login-container">
 		<h3>로그인</h3>
 		<form action="${contextPath}/member/login.do" method="post">
 			<input type="text" name="m_id" size="20" placeholder="아이디" required />
 			<input type="password" name="m_pw" size="20" placeholder="비밀번호" required/>
 			
 			<input type="submit" value="로그인" >
 			<input type="reset" value="다시입력" >
 		</form>
 		
		<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=0Kh9BAPo35nGcE_1Jbvx&redirect_uri=http://localhost:8090/lookmarket/member/naverCallback.do&state=lookmarket&auth_type=reauthenticate">
   			<img height="50" src="${contextPath}/resources/image/naverlogin.png"/>
		</a>

		<div class="links">
			<a href="#">아이디 찾기</a>
			<a href="#">비밀번호 찾기</a>
			<a href="${contextPath}/member/memberForm.do">회원가입</a>
			<a href="#">고객센터</a>
 		</div>
 	</div>
</body>
</html>