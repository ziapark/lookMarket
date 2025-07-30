<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 리뷰 목록</title>
    <style>
        .container {
            width: 90%;
            margin: 0 auto;
            padding: 30px 0;
        }

        .review-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .review-box {
            width: 30%;
            background-color: #f9f9f9;
            margin-bottom: 30px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .review-img {
            width: 100%;
            height: 200px;
            background-color: #3366cc;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }

        .review-info {
            padding: 15px;
            line-height: 1.6;
        }

        .review-info .rating {
            color: red;
            font-weight: bold;
        }

        .review-info .title {
            font-weight: bold;
        }

        .review-info .date {
            color: #777;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>커뮤니티 리뷰 목록</h2>
    <div class="review-grid">
        <c:forEach var="review" items="${communityList}">
            <div class="review-box">
                <div class="review-img">
                    이미지 사진
                    <%-- <img src="${review.r_filename}" alt="리뷰 이미지" style="width:100%; height:100%; object-fit:cover;" /> --%>
                </div>
                <div class="review-info">
                    <div class="r_star">${review.r_star}점</div>
                    <div class="r_title">${review.r_title}</div>
                    <div class="r_date">${review.r_date}</div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
