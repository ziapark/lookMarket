<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고충방 상세보기</title>
</head>

<body>
	<div class="detail-container">
		<div class="detail-title">${review.b_title}</div>

		<div class="meta-info">작성자: ${review.m_id} | 작성일:
			${review.b_date} | 조회수: ${review.b_hit}</div>

		<!-- 공개 여부 -->
		<div class="star-display">
				<c:choose>
					<c:when test="${board.b_secret eq 1}">공개</c:when>
					<c:when test="${board.b_secret eq 2}">비공개</c:when>
					<c:otherwise>알 수 없음</c:otherwise>
				</c:choose>
		</div>

		<!--건의 내용 -->
		<div class="review-content">${review.b_content}</div>

		<div class="back-btn">
			<a href="blackBoardList.jsp">← 목록으로</a>
		</div>
	</div>
</body>
</html>
