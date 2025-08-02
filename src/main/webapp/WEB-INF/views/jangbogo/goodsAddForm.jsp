<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="content" style="padding: 20px;">
	<h2>상품 등록</h2>
	<form action="${contextPath}/goodsAdd.do" method="post"
		enctype="multipart/form-data">
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th>상품명</th>
				<td><input type="text" name="g_name" required /></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="g_price" required /></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="g_category" required /></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="g_description" rows="4" cols="50" required></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="i_filename" accept="image/*" /></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="등록하기" /> 
		<input type="reset" value="초기화" />
	</form>
</div>
