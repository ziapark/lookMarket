<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>커뮤니티 목록</title>
</head>
<body>
    <h2>커뮤니티</h2>

<!--     <form method="get" action="communityList.do"> -->
<!--         <select name="category"> -->
<!--             <option value="">전체</option> -->
<!--             <option value="review">리뷰</option> -->
<!--             <option value="question">질문</option> -->
<!--             <option value="free">자유게시판</option> -->
<!--         </select> -->
<!--         <input type="text" name="keyword" placeholder="검색어 입력"> -->
<!--         <input type="submit" value="검색"> -->
<!--     </form> -->

<!--     <table border="1"> -->
<!--         <tr> -->
<!--             <th>번호</th> -->
<!--             <th>카테고리</th> -->
<!--             <th>제목</th> -->
<!--             <th>작성자</th> -->
<!--             <th>작성일</th> -->
<!--             <th>조회수</th> -->
<!--         </tr> -->
<%-- <%--         <c:forEach var="post" items="${postList}"> --%> --%>
<!-- <!--             <tr> --> -->
<%-- <%--                 <td>${post.id}</td> --%> --%>
<%-- <%--                 <td>${post.category}</td> --%> --%>
<%-- <%--                 <td><a href="communityDetail.do?id=${post.id}">${post.title}</a></td> --%> --%>
<%-- <%--                 <td>${post.writer}</td> --%> --%>
<%-- <%--                 <td>${post.date}</td> --%> --%>
<%-- <%--                 <td>${post.views}</td> --%> --%>
<!-- <!--             </tr> --> -->
<%-- <%--         </c:forEach> --%> --%>
<!--     </table> -->

    <a href="communityWrite.jsp">글쓰기</a>
</body>
</html>
