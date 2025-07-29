<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
</head>
<body>
	<table class="list_view">
		<tbody>
			<tr>
				<td class="fixed">구분</td>
				<td colspan=2 class="fixed"></td>
				<td>정가</td>
				<td>판매가</td>
				<td>수량</td>
				<td>합계</td>
				<td>주문</td>
			</tr>
			<c:choose>
				<c:when test="${empty myCartList}">
					<tr>
						<td colspan=8 class="fixed">
							<strong>장바구니에 상품이 없습니다.</strong>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<form name="form_order_all_cart">
							<c:forEach var="item" items="${myCartList}" varStatus="cnt">
								<c:set var="c_qty" value="${myCartList[cnt.count-1].c_qty}" />
								<c:set var="c_id" value="${myCartList[cnt.count-1].c_id}" />
								<td><input type="checkbox" name="checked_goods" checked value="${item.goods_id}" onClick="calGoodsPrice(${item.goods_sales_price}, this)"></td>
								<td class="goods_image">
									<a href="${contextPath}/goods/goodsDetail.do?g_id=${item.g_id}" >
										<img width="75" alt="상품이미지" src="${contextPath}/thumbnails.do?g_id=${item.g_id}&fileName=${item.g_fileName}" />
									</a>
								</td>
								<td>
									<h2>
										<a href="${contextPath}/goods/goodsDetail.do?g_id=${item.g_id} ">${item.g_name}</a>
									</h2>
								</td>
								<td class="price"><span>${item.g_price}원</span></td>
								<td>
									<strong>
										<fmt:formatNumber value="${item.g_sale_price*0.9*c_qty}" type="number" var="total_sales_price" />
										${total_sales_price}원
									</strong>
								</td>
								<td>
									<a href="javascript:fn_order_each_goods('${item.g_id}', '${item.g_name}', '${item.g_sale_price}', '${item.g_fileName}');" >
										<img width="75" alt="주문하기" src="${contextPath}/resources/image/btn_order.jpg">
									</a><br>
									<a href="#"> 
					 	   				<img width="75" alt="" src="${contextPath}/resources/image/btn_order_later.jpg">
									</a><br> 
									<a href="#"> 
						   				<img width="75" alt="" src="${contextPath}/resources/image/btn_add_list.jpg">
									</a><br> 
									<a href="javascript:delete_cart_goods('${c_id}');"> 
						   				<img width="75" alt="" src="${contextPath}/resources/image/btn_delete.jpg">
					   				</a>
					   			</td>
					   			<tr>
					   				<c:set var="totalGoodsPrice" value="${totalGoodsPrice+item.g_sale_price*0.9+c_qty}" />
					   				<c:set var="totalGoodsNum value="${totalGoodsNum+1}" />
							</c:forEach>
						</tbody>
					</table>
					<div class="clear"></div>						
				</c:otherwise>
			</c:choose><br><br>
			<table class="list_view">
				<tbody>
					<tr class="fixed">
						<td class="fixed">총 상품수</td>
						<td></td>
						<td>총 배송비</td>
						<td></td>
						<td>총 할인 금액</td>
						<td></td>
						<td>최종 결제금액</td>
					</tr>
					<tr>
						<td>
							<p id="p_totalGoodsNum">${totalGoodsNum}개</p>
							<input id="h_totalGoodsNum" type="hidden" value="${totalGoodsNum}" />
						</td>
						<td>
	         				<p id="p_totalGoodsPrice">
	          					<fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
	          					${total_goods_price}원
	          				</p>
	          				<input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />
	       				</td>
				       	<td> 
				          	<img width="25" alt="" src="${contextPath}/resources/image/plus.jpg">  
				       	</td>
				        <td>
				        	<p id="p_totalDeliveryPrice">${totalDeliveryPrice }원  </p>
				         	<input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
				       	</td>
				       	<td> 
				         	<img width="25" alt="" src="${contextPath}/resources/image/minus.jpg"> 
				       	</td>
				       	<td>  
				         	<p id="p_totalSalesPrice"> 
							${totalDiscountedPrice}원
				         	</p>
				         	<input id="h_totalSalesPrice"type="hidden" value="${totalSalesPrice}" />
				       	</td>
				       	<td>  
				         	<img width="25" alt="" src="${contextPath}/resources/image/equal.jpg">
				       	</td>
				       	<td>
				          	<p id="p_final_totalPrice">
				          	<fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
				            ${total_price}원
				          	</p>
				         	<input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
				       	</td>
					</tr>
				</tbody>
			</table><br><br>
			<a href="javascript:fn_order_all_cart_goods()">
		 		<img width="75" alt="" src="${contextPath}/resources/image/btn_order_final.jpg">
		 	</a>
		 	<a href="#">
		 		<img width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		 	</a>
		</form>
	</body>
</html>