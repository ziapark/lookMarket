<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고충방 작성</title>

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
		<h2>고충방 작성</h2>
		<form action="${contextPath}/blackBoardListAction.do" method="post"
			enctype="multipart/form-data">
			
			<!-- 작성자 -->
			<div class="form-group">
				<label for="m_id">작성자 ID</label> <input type="text" id="m_id"
					name="m_id" value="${sessionScope.userId}" readonly />
			</div>

			<!-- 건의글 제목 -->
			<div class="form-group">
				<label for="b_title">건의글 제목</label> <input type="text" id="b_title"
					name="b_title" required />
			</div>

			<!-- 건의 내용 -->
			<div class="form-group">
				<label for="b_content">건의 내용</label>
				<textarea id="b_content" name="b_content" rows="5" required></textarea>
			</div>
			
			<!-- 작성일 -->
			<div class="form-group">
				<label for="b_date">작성일</label>
				<input id="b_date" name="b_date"></input>
			</div>			

			<!-- 공개 여부 -->
			<div class="form-group">
				<label for="b_secret">공개 여부</label> <select id="b_secret"
					name="b_secret">
					<option value="public">공개</option>
					<option value="private">비공개</option>
				</select>
			</div>

			<div class="submit-btn">
				<button type="submit">등록하기</button>
			</div>
		</form>
	</div>
</body>
</html>
