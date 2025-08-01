<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 수정</title>
    <style>
        .form-container {
            width: 600px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fafafa;
        }

        .form-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="file"] {
            margin-top: 5px;
        }

        /* ⭐ 별점 관련 스타일 */
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            font-size: 30px;
            color: #ccc;
            cursor: pointer;
            margin: 0 2px;
        }

        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: gold;
        }

        .submit-btn {
            text-align: center;
            margin-top: 20px;
        }

        .submit-btn button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #3366cc;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-btn button:hover {
            background-color: #254a9a;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>리뷰 수정</h2>
    <form action="updateReview.do" method="post" enctype="multipart/form-data">
        <!-- 리뷰 번호 (hidden) -->
        <input type="hidden" name="r_no" value="${review.r_no}" />

        <!-- 작성자 -->
        <div class="form-group">
            <label for="m_id">작성자 ID</label>
            <input type="text" id="m_id" name="m_id" value="${review.m_id}" readonly />
        </div>

        <!-- 리뷰 제목 -->
        <div class="form-group">
            <label for="r_title">리뷰 제목</label>
            <input type="text" id="r_title" name="r_title" value="${review.r_title}" required />
        </div>

        <!-- 상품 ID -->
        <div class="form-group">
            <label for="g_id">상품 ID</label>
            <input type="text" id="g_id" name="g_id" value="${review.g_id}" required />
        </div>

        <!-- 별점 ★ 클릭 방식 -->
        <div class="form-group">
            <label for="r_star">별점</label>
            <div class="star-rating">
                <input type="radio" id="star5" name="r_star" value="5" <c:if test="${review.r_star == 5}">checked</c:if>><label for="star5">★</label>
                <input type="radio" id="star4" name="r_star" value="4" <c:if test="${review.r_star == 4}">checked</c:if>><label for="star4">★</label>
                <input type="radio" id="star3" name="r_star" value="3" <c:if test="${review.r_star == 3}">checked</c:if>><label for="star3">★</label>
                <input type="radio" id="star2" name="r_star" value="2" <c:if test="${review.r_star == 2}">checked</c:if>><label for="star2">★</label>
                <input type="radio" id="star1" name="r_star" value="1" <c:if test="${review.r_star == 1}">checked</c:if>><label for="star1">★</label>
            </div>
        </div>

        <!-- 내용 -->
        <div class="form-group">
            <label for="r_content">내용</label>
            <textarea id="r_content" name="r_content" rows="5" required>${review.r_content}</textarea>
        </div>

        <!-- 기존 이미지 보여주기 -->
        <c:if test="${not empty review.r_filename}">
            <div class="form-group">
                <label>현재 업로드된 이미지</label>
                <img src="/upload/${review.r_filename}" alt="리뷰 이미지" style="max-width: 100%; height: auto; margin-bottom: 10px;" />
            </div>
        </c:if>

        <!-- 이미지 업로드 (수정용) -->
        <div class="form-group">
            <label for="r_filename">이미지 변경</label>
            <input type="file" id="r_filename" name="r_filename" accept="image/*" />
            <small>이미지를 변경하지 않으면 기존 이미지가 유지됩니다.</small>
        </div>

        <!-- 공개 여부 -->
        <div class="form-group">
            <label for="r_secret">공개 여부</label>
            <select id="r_secret" name="r_secret">
                <option value="public" <c:if test="${review.r_secret == 'public'}">selected</c:if>>공개</option>
                <option value="private" <c:if test="${review.r_secret == 'private'}">selected</c:if>>비공개</option>
            </select>
        </div>

        <div class="submit-btn">
            <button type="submit">수정하기</button>
        </div>
    </form>
</div>
</body>
</html>
