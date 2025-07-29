<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>전통시장 소식 - 예시</title>
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        .news-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .news-item {
            background-color: #fff;
            width: 260px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 5px #ccc;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .news-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .news-content {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .news-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            height: 48px; /* 3줄 정도 */
            overflow: hidden;
            line-height: 1.4em;
        }
        .news-date {
            font-size: 12px;
            color: #666;
            margin-bottom: 10px;
        }
        .btn-view {
            background-color: #0077cc;
            color: white;
            text-align: center;
            padding: 8px 0;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            display: block;
        }
        .btn-view:hover {
            background-color: #005fa3;
        }
    </style>
</head>
<body>

<h2>전통시장 소식</h2>

<div class="news-list">
    <div class="news-item">
        <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=260&q=80" alt="뉴스 이미지" class="news-image" />
        <div class="news-content">
            <div class="news-title">전통시장 신규 점포 오픈, 다양한 할인 행사 진행</div>
            <div class="news-date">2025-07-28</div>
            <a href="https://example.com/news1" class="btn-view">보기</a>
        </div>
    </div>

    <div class="news-item">
        <img src="default-image.png" alt="기본 이미지" class="news-image" />
        <div class="news-content">
            <div class="news-title">시장 내 청결 캠페인 실시, 주민 참여 활발</div>
            <div class="news-date">2025-07-27</div>
            <a href="https://example.com/news2" class="btn-view">보기</a>
        </div>
    </div>

    <div class="news-item">
        <img src="https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=260&q=80" alt="뉴스 이미지" class="news-image" />
        <div class="news-content">
            <div class="news-title">전통시장 축제 개최, 먹거리와 공연으로 가득</div>
            <div class="news-date">2025-07-25</div>
            <a href="https://example.com/news3" class="btn-view">보기</a>
        </div>
    </div>
</div>

</body>
</html>
