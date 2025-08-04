<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 유형 선택</title>
    <!-- 부트스트랩 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 50px 20px;
            background-color: #f8f9fa;
        }

        .card {
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s, border-color 0.2s;
            border: 2px solid #ddd;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            border-color: #4CAF50;
        }

        .card.selected {
            border-color: #4CAF50;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .card img {
            width: 80px;
            height: 80px;
            object-fit: contain;
            margin-bottom: 15px;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 16px;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #666;
        }

        .footer a {
            color: #333;
            text-decoration: none;
        }

        @media (max-width: 576px) {
            .col-md-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="text-center mb-3">회원가입 유형 선택</h1>
        <h4 class="text-center mb-5 text-secondary">시장봐조 통합회원 가입</h4>

        <form action="memberForm.jsp" method="get">

            <!-- 숨겨진 라디오 버튼 -->
            <input type="radio" name="role" value="1" id="personal" class="d-none" required>
            <input type="radio" name="role" value="2" id="business" class="d-none">

            <div class="row justify-content-center mb-4">
                <!-- 개인회원 카드 -->
                <div class="col-md-4 mb-3">
                    <label for="personal">
                        <div class="card p-4 text-center" id="label-personal">
                            <img src="${contextPath}/resources/image/개인회원가입.PNG" alt="개인회원" class="mx-auto">
                            <h5 class="mt-2 fw-bold">개인 회원 가입</h5>
                        </div>
                    </label>
                </div>

                <!-- 사업자회원 카드 -->
                <div class="col-md-4 mb-3">
                    <label for="business">
                        <div class="card p-4 text-center" id="label-business">
                            <img src="${contextPath}/resources/image/사업자회원가입.PNG" alt="사업자회원" class="mx-auto">
                            <h5 class="mt-2 fw-bold">사업자 회원 가입</h5>
                        </div>
                    </label>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-4">
                    <button type="submit" class="btn btn-primary">다음</button>
                </div>
            </div>

        </form>

    </div>

    <!-- 부트스트랩 JS (선택사항) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 카드 클릭시 selected 효과 추가 -->
    <script>
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => {
            card.addEventListener('click', () => {
                cards.forEach(c => c.classList.remove('selected'));
                card.classList.add('selected');
            });
        });
    </script>

</body>
</html>
