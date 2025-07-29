<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>오늘의 시장 추천</title>
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;
            margin: 30px;
            background-color: #f0f8ff;
        }
        .recommend-form {
            max-width: 400px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            background-color: #0077cc;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #005fa3;
        }
    </style>
</head>
<body>

<h2>오늘의 시장 추천</h2>

<form id="recommendForm" action="recommendMarket.do" method="get">
    <div class="recommend-form">
        <label for="region">지역 선택</label>
        <select id="region" name="region" required>
            <option value="" disabled selected>지역을 선택하세요</option>
            <option value="seoul">서울</option>
            <option value="busan">부산</option>
            <option value="daegu">대구</option>
            <option value="incheon">인천</option>
            <option value="gwangju">광주</option>
            <option value="daejeon">대전</option>
            <option value="ulsan">울산</option>
            <option value="sejong">세종</option>
            <option value="gyeonggi">경기</option>
            <option value="gangwon">강원</option>
            <option value="chungbuk">충북</option>
            <option value="chungnam">충남</option>
            <option value="jeonbuk">전북</option>
            <option value="jeonnam">전남</option>
            <option value="gyeongbuk">경북</option>
            <option value="gyeongnam">경남</option>
            <option value="jeju">제주</option>
        </select>

        <button type="submit">추천 받기</button>
    </div>
</form>

</body>
</html>
