<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="content" style="padding: 20px;">
   <h2>지역특산물</h2>
<p>전통과 정성이 담긴 전국 특산품!</p>
<div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/jeonju_bibim.jpg" class="card-img-top" alt="비빔밥">
            <div class="card-body">
                <h5 class="card-title">전주 비빔밥 세트</h5>
                <p class="card-text">₩11,000</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/andong_gangjeong.jpg" class="card-img-top" alt="강정">
            <div class="card-body">
                <h5 class="card-title">안동 찹쌀강정</h5>
                <p class="card-text">₩7,500</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/boseong_tea.jpg" class="card-img-top" alt="녹차">
            <div class="card-body">
                <h5 class="card-title">보성 녹차 선물세트</h5>
                <p class="card-text">₩18,000</p>
            </div>
        </div>
    </div>
</div>

</div>

