<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<script>
function setEmailDomain(value) {
    const domainInput = document.getElementById("m_email_domain");
    domainInput.value = value;
    if (value === "") {
        domainInput.removeAttribute("readonly");
        domainInput.focus();
    } else {
        domainInput.setAttribute("readonly", true);
    }
}

function enableAddressFields() {
    document.getElementById("m_jibun_address").disabled = false;
    document.getElementById("m_road_address").disabled = false;
    document.getElementById("m_namuji_address").disabled = false;
    document.getElementById("m_jibun_address").focus();
}
</script>

	<meta charset="UTF-8">
	<title>내정보</title>
</head>
<body>
	<h3>내 상세 정보</h3>
    <div id="messageBox" class="message-box"></div>
	<form name="frm_mod_member">	
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td>
							<input name="m_id" type="text" size="20" value="${myPageInfo.m_id }"  disabled/>
						</td>
						<td>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td>
					  		<input name="m_pw" type="password" size="20" placeholder="새 비밀번호 입력" />                    
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('m_pw')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이름</td>
						<td>
					  		<input name="m_name" type="text" size="20" value="${myPageInfo.m_name }"  disabled />
					 	</td>
					 	<td>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">성별</td>
						<td>
					  		<c:choose >
						    	<c:when test="${myPageInfo.m_gender =='101' }">
						      		<input type="radio" name="m_gender" value="102" />
							  		여성 <span style="padding-left:30px"></span>
						   			<input type="radio" name="m_gender" value="101" checked />남성
						    	</c:when>
						    	<c:otherwise>
						      		<input type="radio" name="m_gender" value="102"  checked />
							   		여성 <span style="padding-left:30px"></span>
						      		<input type="radio" name="m_gender" value="101"  />남성
						   		</c:otherwise>
					   		</c:choose>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('m_gender')" />
						</td>
					</tr>
					
					
					<tr class="dot_line">
						<td class="fixed_join">휴대폰번호</td>
						<td>
							<input type="text" name="m_phone" id="m_phone" size="20" value="${myPageInfo.m_phone }" placeholder="01012345678" />
       						 <br><br>
					   		<c:choose> 
					   			<c:when test="${myPageInfo.m_phone_yn==1 }">
					     			<input type="checkbox"  name="m_phone_yn" value="Y" checked /> 전통시장에서 발송하는 SMS 소식을 수신합니다.
								</c:when>
								<c:otherwise>
						  			<input type="checkbox"  name="m_phone_yn" value="N"  /> 전통시장에서 발송하는 SMS 소식을 수신합니다.
								</c:otherwise>
					 		</c:choose>	
				    	</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('m_phone')" />
						</td>	
					</tr>
					
					<tr class="dot_line">
						<td class="fixed_join">이메일<br>(e-mail)</td>
						<td>
					   		<input type="text" name="m_email_id" id="m_email_id" size="10" value="${fn:split(myPageInfo.m_email, '@')[0]}" /> @
        					<input type="text" name="m_email_domain" id="m_email_domain" size="15" value="${fn:split(myPageInfo.m_email, '@')[1]}" />
        					<select id="emailSelect" onchange="setEmailDomain(this.value)">
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
					   			<c:when test="${myPageInfo.m_email_yn==1 }">
					     			<input type="checkbox" name="m_email_yn"  value="Y" checked /> 전통시장에서 발송하는 e-mail을 수신합니다.
								</c:when>
								<c:otherwise>
						  			<input type="checkbox" name="m_email_yn"  value="N"  /> 전통시장에서 발송하는 e-mail을 수신합니다.
								</c:otherwise>
					 		</c:choose>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('m_email')" />
						</td>
					</tr>
					
					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td>
					   		<input type="text" id="m_zipcode" name="m_zipcode" size="5" value="${myPageInfo.m_zipcode }" readonly />
        					<a href="javascript:enableAddressFields()">우편번호검색</a>
					  		<br>
					  		<p> 
					   			지번 주소:<br><input type="text" id="m_jibun_address"  name="m_jibun_address" size="50" value="${myPageInfo.m_jibun_address }" disabled><br><br>
					  			도로명 주소: <input type="text" id="m_road_address" name="m_road_address" size="50" value="${myPageInfo.m_road_address }" disabled><br><br>
					  			나머지 주소: <input type="text"  name="m_namuji_address" size="50" value="${myPageInfo.m_namuji_address }" disabled />
					   		</p>
						</td>
						<td>
					  		<input type="button" value="수정하기" onClick="fn_modify_member_info('m_zipcode')" />
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
		
	</form>	
</body>
</html>