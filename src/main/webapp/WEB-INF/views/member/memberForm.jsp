<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입창</title>
	<script src="http://dmap.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function exeDaumPostCode() {
			new daum.PostCode({
				oncomplete:function(data){
					var fullRoadAddr = data.roadAddress;
					var extraRoadAddr ='';
					
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);			
					}
					
					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					
					if(fullRoadAddr !== ''){
						fullRoadAddr += extraRoadAddr;
					}
					
				    document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
				    document.getElementById('m_road_address').value = fullRoadAddr;
				    document.getElementById('m_jibun_address').value = data.jibunAddress;
				}
			}).open();
		}
		
		function fn_overlapped(){
			var _m_id = $("#_m_id").val();
			
			if(_m_id ==''){
				alert("아이디를 입력하세요.");
				return ;
			}
			
			$.ajax({
				type="post",
				async:false,
				url:"${contextPath}/member/overlapped.do",
				dataType:"text",
				data:{m_id:_m_id},
				success:function(data, textStatus){
					if(data=='false'){
						alert("사용할 수 있는 아이디입니다.");
						$('#btnOverlapped').prop("disabled", true);
						$('#_m_id').prop("disabled", true);
						$('#m_id').val(_m_id);
					}else{
						alert("사용할 수 없는 아이디입니다.");
					}
				},
				error:function(data, textStatus){
					alert("에러가 발생했습니다.");
				}
			});
		}
	</script>
</head>
<body>
	<h3>필수입력사항</h3>
	<form action = "${contextPath}/member/addMember.do" method="POST">
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">가입유형</td>
						<td>
							<select name="m_role">
								<option value="1">개인</option>
								<option value="2">사업자</option>
							</select>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td>
							<input type="text" name="_m_id" id="_m_id" size="20" />
							<input type="hidden" name="m_id" id="m_id" />
							
							<input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td><input type="text" name="m_pw" size="20" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이름</td>
						<td><input type="text" name="m_name" size="20" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">주민등록번호</td>
						<td><input type="text" name="m_birth" size="20" /> - <input type="text" name="m_gender" size="1" />******</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">통신사</td>
						<td>
							<select name="m_phone_telecom">
								<option value="01">SKT</option>
								<option value="02">KT</option>
								<option value="03">LG U+</option>
								<option value="11">알뜰폰 SKT</option>
								<option value="12">알뜰폰 KT</option>
								<option value="13">알뜰폰 LG U+</option>
							</select>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">전화번호</td>
						<td><input type="text" name="m_phone" size="20" placeholder="번호만 입력"/></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이메일<br>(e-mail)</td>
						<td>
							<input type="text" name="m_email1" size="10px" /> @ 
							<input type="text" name="m_email2" size="10px" />
							<select name="email2" onChange="" title="직접입력">
								<option value="non">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td>
							<input type="text" name="m_zipcode" id="m_zipcode" size="10"> <a href="javascript:execDaumPostCode()">우편번호검색</a>
							<br>
							<p>
								도로명 주소:<br><input type="text" id="m_road_address" name="m_road_address" size="50"><br><br>
								지번 주소:<br><input type="text" id="m_jibun_address" name="m_jibun_address" size="50"><br><br>
								상세 주소:<br><input type="text" name="m_namuji_address" size="50"><br><br>
							</p>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">광고 수신 동의</td>
						<td>
							<input type="checkbox" name="m_phone_yn" value="1" checked /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.<br>
							<input type="checkbox" name="m_email_yn" value="1" checked /> 쇼핑몰에서 발송하는 이메일 소식을 수신합니다.
						</td>
					</tr>			
				</tbody>
			</table>
		</div>
		<div class="clear">
			<br><br>
			<table style="align:center">
				<tr>
					<td>
						<input type="submit" value="회원가입">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>