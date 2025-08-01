<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

//회원 정보 수정 처리
function fn_modify_member_info_all() {
  const form = document.forms['frm_mod_member'];
  const formData = new FormData(form);

  const email = formData.get("m_email_id") + "@" + formData.get("m_email_domain");
  formData.set("m_email", email);

  fetch('${contextPath}/mypage/updateMyInfo.do', {
    method: 'POST',
    body: formData
  })
  .then(res => res.json())
  .then(data => {
    if(data.result === 'success') {
      alert('회원 정보가 수정되었습니다.');
      location.reload();
    } else {
      alert('수정 실패: ' + data.message);
    }
  })
  .catch(error => {
    console.error('에러 발생:', error);
    alert('서버 오류가 발생했습니다.');
  });
}

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

function execDaumPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullRoadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                fullRoadAddr += ' (' + extraRoadAddr + ')';
            }

            document.getElementById('m_zipcode').value = data.zonecode;
            document.getElementById('m_road_address').value = fullRoadAddr;
            document.getElementById('m_jibun_address').value = data.jibunAddress;
        }
    }).open();
}

</script>

	<meta charset="UTF-8">
	<title>내정보</title>
</head>
<body>
<h3>내 상세 정보 수정</h3>
<form name="frm_mod_member" enctype="multipart/form-data">

<table>
  <tr>
    <td>아이디</td>
    <td><input type="text" name="m_id" value="${myPageInfo.m_id}" disabled /></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="m_pw" placeholder="새 비밀번호 입력" /></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input type="text" name="m_name" value="${myPageInfo.m_name}" disabled /></td>
  </tr>
  <tr>
    <td>성별</td>
    <td>
      <input type="radio" name="m_gender" value="101" <c:if test="${myPageInfo.m_gender == 101}">checked</c:if> /> 남성
      <input type="radio" name="m_gender" value="102" <c:if test="${myPageInfo.m_gender == 102}">checked</c:if> /> 여성
    </td>
  </tr>
  <tr>
    <td>휴대폰 번호</td>
    <td>
      <input type="text" name="m_phone" value="${myPageInfo.m_phone}" placeholder="01012345678" />
      <br/>
      <input type="checkbox" name="m_phone_yn" value="1" <c:if test="${myPageInfo.m_phone_yn == 1}">checked</c:if> /> SMS 수신 동의
    </td>
  </tr>
  <tr>
    <td>이메일</td>
    <td>
      <input type="text" name="m_email_id" value="${fn:split(myPageInfo.m_email,'@')[0]}" size="12" /> @
      <input type="text" name="m_email_domain" id="m_email_domain" value="${fn:split(myPageInfo.m_email,'@')[1]}" size="15" />
      <select onchange="setEmailDomain(this.value)">
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
      </select>
      <br/>
      <input type="checkbox" name="m_email_yn" value="1" <c:if test="${myPageInfo.m_email_yn == 1}">checked</c:if> /> 이메일 수신 동의
    </td>
  </tr>
  <tr>
    <td>주소</td>
    <td>
      <input type="text" name="m_zipcode" id="m_zipcode" value="${myPageInfo.m_zipcode}" readonly size="10" />
      <button type="button" onclick="execDaumPostCode()">우편번호 검색</button><br/>
      도로명 주소:<br/>
      <input type="text" name="m_road_address" id="m_road_address" value="${myPageInfo.m_road_address}" size="50" /><br/><br/>
      지번 주소:<br/>
      <input type="text" name="m_jibun_address" id="m_jibun_address" value="${myPageInfo.m_jibun_address}" size="50" /><br/><br/>
      상세 주소:<br/>
      <input type="text" name="m_namuji_address" value="${myPageInfo.m_namuji_address}" size="50" />
    </td>
  </tr>
</table>

<br/>
<button type="button" onclick="fn_modify_member_info_all()">수정 완료</button>

</form>
</body>
</html>