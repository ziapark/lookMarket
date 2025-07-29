<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>커뮤니티 글쓰기</title>
</head>
<body>
<c:if test="${empty sessionScope.loginUser}">
    <script>
        alert('로그인이 필요합니다.');
        location.href = '${pageContext.request.contextPath}/login.jsp';
    </script>
</c:if>

    <h2>글쓰기</h2>
    <form action="communityWrite.do" method="post" enctype="multipart/form-data">
        <label>카테고리:
            <select name="category">
                <option value="review">리뷰</option>
                <option value="question">질문</option>
                <option value="free">자유게시판</option>
            </select>
        </label><br/><br/>

        <label>제목: <input type="text" name="title" required></label><br/><br/>

        <label>내용:<br/>
            <textarea name="content" rows="10" cols="50" required></textarea>
        </label><br/><br/>

        <label>별점:
            <select name="rating">
                <option value="5">★★★★★</option>
                <option value="4">★★★★☆</option>
                <option value="3">★★★☆☆</option>
                <option value="2">★★☆☆☆</option>
                <option value="1">★☆☆☆☆</option>
            </select>
        </label><br/><br/>

        <label>이미지 첨부: <input type="file" name="image"></label><br/><br/>

        <input type="submit" value="등록">
    </form>
</body>
</html>
