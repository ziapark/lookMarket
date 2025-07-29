<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div id="content" style="padding: 20px;">
    <h2>패션잡화</h2>
<p>멋과 실용을 갖춘 데일리 아이템!</p>
<div class="row row-cols-1 row-cols-md-3 g-4 mt-3">
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/cap.jpg" class="card-img-top" alt="모자">
            <div class="card-body">
                <h5 class="card-title">베이직 볼캡</h5>
                <p class="card-text">₩9,900</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/bag.jpg" class="card-img-top" alt="가방">
            <div class="card-body">
                <h5 class="card-title">미니 크로스백</h5>
                <p class="card-text">₩22,000</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="${contextPath}/resources/image/socks.jpg" class="card-img-top" alt="양말">
            <div class="card-body">
                <h5 class="card-title">베이직 양말 5족</h5>
                <p class="card-text">₩4,500</p>
            </div>
        </div>
    </div>
</div>

</div>

