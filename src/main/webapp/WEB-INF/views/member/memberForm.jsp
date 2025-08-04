<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<%
    String role = request.getParameter("role");
    if(role == null || (!role.equals("1") && !role.equals("2"))) {
        role = "1"; // 기본값 개인
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입창</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        $(document).ready(function(){
            // 기존 JS 코드 그대로...
        });

        function exeDaumPostCode() {
            daum.postcode.load(function() {
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
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        if(fullRoadAddr !== ''){
                            fullRoadAddr += extraRoadAddr;
                        }

                        document.getElementById('m_zipcode').value = data.zonecode;
                        document.getElementById('m_road_address').value = fullRoadAddr;
                        document.getElementById('m_jibun_address').value = data.jibunAddress;
                    }
                }).open();
            });
        }
    </script>
    <style>
        .fixed_join { width: 150px; font-weight: bold; vertical-align: top; }
        .dot_line { border-bottom: 1px dotted #aaa; }
    </style>
</head>
<body>
    <h3>회원가입</h3>
    <form action="${contextPath}/member/addMember.do" method="POST" id="form">
        <!-- 선택된 가입유형을 숨겨진 필드로 전달 -->
        <input type="hidden" name="m_role" value="<%= role %>" />

        <table>
            <tbody>
                <tr class="dot_line">
                    <td class="fixed_join">아이디</td>
                    <td>
                        <input type="text" name="_m_id" id="_m_id" size="20" />
                        <input type="hidden" name="m_id" id="m_id" />
                        <input type="button" id="btnOverlapped" value="중복체크" />
                    </td>
                </tr>
                <tr class="dot_line">
                    <td class="fixed_join">비밀번호</td>
                    <td><input type="password" name="m_pw" id="m_pw" size="20" /></td>
                </tr>
                <tr class="dot_line">
                    <td class="fixed_join">비밀번호 확인</td>
                    <td><input type="password" name="m_pw_confirm" id="m_pw_confirm" size="20" /></td>
                </tr>
                <tr class="dot_line">
                    <td class="fixed_join">이름</td>
                    <td><input type="text" name="m_name" size="20" /></td>
                </tr>

                <% if ("1".equals(role)) { %>
                    <!-- 개인 회원 폼 -->
                    <tr class="dot_line">
                        <td class="fixed_join">주민등록번호</td>
                        <td><input type="text" name="m_birth" size="20" /> - <input type="text" name="m_gender" size="1" />******</td>
                    </tr>
                <% } else if ("2".equals(role)) { %>
                    <!-- 사업자 회원 폼 -->
                    <tr class="dot_line">
                        <td class="fixed_join">상호명</td>
                        <td><input type="text" name="bm_name" size="20" /></td>
                    </tr>
                    <tr class="dot_line">
                        <td class="fixed_join">사업자등록번호</td>
                        <td><input type="text" name="bm_reg_num" size="20" placeholder="000-00-00000 형식" /></td>
                    </tr>
                    <tr class="dot_line">
                        <td class="fixed_join">업종</td>
                        <td>
                            <select name="bm_type" id="bm_type">
                                <option value="">선택하세요</option>
                                <option value="신선식품">신선식품</option>
                                <option value="가공식품">가공식품</option>
                                <option value="생활용품">생활용품</option>
                                <option value="패션잡화">패션잡화</option>
                                <option value="지역특산물">지역특산물</option>
                            </select>
                        </td>
                    </tr>
                <% } %>

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
                    <td><input type="text" name="m_phone" size="20" placeholder="번호만 입력" /></td>
                </tr>
                <tr class="dot_line">
                    <td class="fixed_join">이메일<br>(e-mail)</td>
                    <td>
                        <div class="form-group">
                            <div style="display: flex; align-items: center;">
                                <input type="text" id="m_email" name="m_email" class="form-control" placeholder="이메일을 입력하세요" required>
                                <button type="button" id="sendAuthCodeBtn" class="btn btn-secondary" style="margin-left: 10px; white-space: nowrap;">인증번호 발송</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div style="display: flex; align-items: center; margin-top: 5px;">
                                <input type="text" id="authCodeInput" class="form-control" placeholder="인증번호를 입력하세요" disabled>
                                <button type="button" id="verifyAuthCodeBtn" class="btn btn-primary" style="margin-left: 10px; white-space: nowrap;">인증번호 확인</button>
                            </div>
                            <p id="mailCheckResult" style="margin-top: 5px;"></p>
                        </div>
                    </td>
                </tr>
                <tr class="dot_line">
                    <td class="fixed_join">주소</td>
                    <td>
                        <input type="text" name="m_zipcode" id="m_zipcode" size="10"> <a href="javascript:exeDaumPostCode()">우편번호검색</a>
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

        <br>
        <input type="submit" value="회원가입">
        <input type="reset" value="취소">
    </form>
</body>
</html>
