<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>글 상세보기</title>
</head>
<body>
    <h2>${post.title}</h2>
    <p>작성자: ${post.writer} | 작성일: ${post.date} | 조회수: ${post.views}</p>
    <p>카테고리: ${post.category}</p>
    <p>별점: 
        <c:forEach var="i" begin="1" end="${post.rating}">
            ★
        </c:forEach>
        <c:forEach var="i" begin="1" end="${5 - post.rating}">
            ☆
        </c:forEach>
    </p>
    <p>${post.content}</p>

    <c:if test="${not empty post.imagePath}">
        <img src="${post.imagePath}" width="300"/>
    </c:if>

    <hr/>

    <h4>댓글</h4>
    <c:forEach var="comment" items="${commentList}">
        <div>
            <strong>${comment.writer}</strong>: ${comment.content}
        </div>
    </c:forEach>

    <form action="commentWrite.do" method="post">
        <input type="hidden" name="postId" value="${post.id}">
        <textarea name="commentContent" rows="3" cols="50" placeholder="댓글을 입력하세요"></textarea><br/>
        <input type="submit" value="댓글 등록">
    </form>

    <br/>
    <a href="communityList.jsp">목록</a>
</body>
</html>
