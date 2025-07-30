<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고충방 수정</title>
</head>

<body>
	<div class="edit-container">
		<div class="edit-title">고충방 수정하기</div>

		<form action="blackBoardUpdate.do" method="post"
			enctype="multipart/form-data">

			<label for="b_title">제목</label> <input type="text" id="b_title"
				name="b_title" value="${review.b_title}" required />

			<label for="b_content">내용</label> <textarea id="b_content"
				name="b_content" required>${review.b_content}</textarea> 
				
			<label for="b_secret">공개 여부</label> <select id="b_secret" name="b_secret">
				<option value="public">공개</option>
				<option value="private">비공개</option>
			</select>

			<div class="btn-group">
				<button type="submit">수정 완료</button>
				<a href="reviewDetail.jsp?m_id=${review.m_id}">취소</a>
			</div>
		</form>
	</div>
</body>
</html>
