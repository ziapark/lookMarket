<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 정보</title>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<h3>내 상세 정보</h3>
	<form name="frm_mod_member">	
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td>
							<input name="member_id" type="text" size="20" value="${memberInfo.member_id }"  disabled/>
						</td>
						<td>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td>
					  		<input name="member_pw" type="password" size="20" value="${memberInfo.member_pw }" />
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('member_pw')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이름</td>
						<td>
					  		<input name="member_name" type="text" size="20" value="${memberInfo.member_name }"  disabled />
					 	</td>
					 	<td>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">성별</td>
						<td>
					  		<c:choose >
						    	<c:when test="${memberInfo.member_gender =='101' }">
						      		<input type="radio" name="member_gender" value="102" />
							  		여성 <span style="padding-left:30px"></span>
						   			<input type="radio" name="member_gender" value="101" checked />남성
						    	</c:when>
						    	<c:otherwise>
						      		<input type="radio" name="member_gender" value="102"  checked />
							   		여성 <span style="padding-left:30px"></span>
						      		<input type="radio" name="member_gender" value="101"  />남성
						   		</c:otherwise>
					   		</c:choose>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('member_gender')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">법정생년월일</td>
						<td>
					   		<select name="member_birth_y">
					     	<c:forEach var="i" begin="1" end="100">
						       		<c:choose>
						        		<c:when test="${memberInfo.member_birth_y==1920+i }">
								   			<option value="${ 1920+i}" selected>${ 1920+i} </option>
										</c:when>
										<c:otherwise>
								  			<option value="${ 1920+i}" >${ 1920+i} </option>
										</c:otherwise>
									</c:choose>
						   		</c:forEach>
							</select>년 
							<select name="member_birth_m" >
								<c:forEach var="i" begin="1" end="12">
							       	<c:choose>
							        	<c:when test="${memberInfo.member_birth_m==i }">
									   		<option value="${i }" selected>${i }</option>
										</c:when>
										<c:otherwise>
									  		<option value="${i }">${i }</option>
										</c:otherwise>
									</c:choose>
						   		</c:forEach>
							</select>월 
							<select name="member_birth_d">
								<c:forEach var="i" begin="1" end="31">
					       			<c:choose>
					         			<c:when test="${memberInfo.member_birth_d==i }">
							   				<option value="${i }" selected>${i }</option>
										</c:when>
										<c:otherwise>
							  				<option value="${i }">${i }</option>
										</c:otherwise>
									</c:choose>
					   			</c:forEach>
							</select>일 <span style="padding-left:50px"></span>
					   		<c:choose>
					    		<c:when test="${memberInfo.member_birth_gn=='2' }"> 
					  				<input type="radio" name="member_birth_gn" value="2" checked />양력
									<span style="padding-left:20px"></span> 
									<input type="radio"  name="member_birth_gn" value="1" />음력
								</c:when>
								<c:otherwise>
						  			<input type="radio" name="member_birth_gn" value="2" />양력
						  			<input type="radio"  name="member_birth_gn" value="1" checked  />음력
								</c:otherwise>
							</c:choose>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('member_birth')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">전화번호</td>
						<td>
					    	<select  name="tel1" id="tel1"  >
								<option value="00">없음</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
								<option value="0508">0508</option>
								<option value="070">070</option>
							</select> 
					    	- <input type="text" size=4  name="tel2" value="${memberInfo.tel2 }"> 
					    	- <input type="text" size=4  name="tel3" value="${memberInfo.tel3 }">
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('tel')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">휴대폰번호</td>
						<td>
					   		<select  name="hp1" id="hp1">
								<option>없음</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> 
					 		- <input type="text" name="hp2" size=4 value="${memberInfo.hp2 }"> 
					 		- <input type="text"name="hp3"  size=4 value="${memberInfo.hp3 }"><br> <br>
					 		<c:choose> 
					   			<c:when test="${memberInfo.smssts_yn=='true' }">
					     			<input type="checkbox"  name="smssts_yn" value="Y" checked /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
								</c:when>
								<c:otherwise>
						  			<input type="checkbox"  name="smssts_yn" value="N"  /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.
								</c:otherwise>
					 		</c:choose>	
				    	</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('hp')" />
						</td>	
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이메일<br>(e-mail)</td>
						<td>
					   		<input type="text" name="email1" size=10 value="${memberInfo.email1 }" /> @ <input type="text" size=10  name="email2" value="${memberInfo.email2 }" /> 
					   		<select name="select_email2" onChange=""  title="직접입력">
								<option value="non">직접입력</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="naver.com">naver.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="paran.com">paran.com</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="empal.com">empal.com</option>
								<option value="korea.com">korea.com</option>
								<option value="freechal.com">freechal.com</option>
							</select><br><br> 
							<c:choose> 
					   			<c:when test="${memberInfo.emailsts_yn=='true' }">
					     			<input type="checkbox" name="emailsts_yn"  value="Y" checked /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.
								</c:when>
								<c:otherwise>
						  			<input type="checkbox" name="emailsts_yn"  value="N"  /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.
								</c:otherwise>
					 		</c:choose>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('email')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td>
					   		<input type="text" id="zipcode" name="zipcode" size=5 value="${memberInfo.zipcode }" > <a href="javascript:execDaumPostcode()">우편번호검색</a>
					  		<br>
					  		<p> 
					   			지번 주소:<br><input type="text" id="roadAddress"  name="roadAddress" size="50" value="${memberInfo.roadAddress }"><br><br>
					  			도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50" value="${memberInfo.jibunAddress }"><br><br>
					  			나머지 주소: <input type="text"  name="namujiAddress" size="50" value="${memberInfo.namujiAddress }" />
					   		</p>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('address')" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="clear">
			<br><br>
			<table align=center>
				<tr>
					<td>
						<input type="hidden" name="command"  value="modify_my_info" /> 
						<input name="btn_cancel_member" type="button"  value="수정 취소">
					</td>
				</tr>
			</table>
		</div>
		<input  type="hidden" name="h_tel1" value="${memberInfo.tel1}" />
		<input  type="hidden" name="h_hp1" value="${memberInfo.hp1}" />		
	</form>	
</body>
</html>