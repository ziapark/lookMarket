package com.lookmarket.member.service;

import org.springframework.http.HttpHeaders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lookmarket.member.dao.MemberDAO;
import com.lookmarket.member.vo.MemberVO;

@Service("naverLoginService")
public class NaverLoginServiceImpl implements NaverLoginService{
	@Autowired
	private MemberDAO memberDAO;
	
	private final String NAVER_CLIENT_ID = "0Kh9BAPo35nGcE_1Jbvx";
	private final String NAVER_CLIENT_SECRET = "LuaIR_wl_C";
	private final String NAVER_REDIRECT_URI = "http://localhost:8090/lookmarket/member/naverCallback.do";
	
	@Override
	public MemberVO getNaverUserInfo(String code, String state) throws Exception{
		String accessToken = getAccessToken(code, state);
		
		JsonNode profileJson = getUserProfile(accessToken);
		
		MemberVO memberVO = processNaverUser(profileJson);
		
		return memberVO;
	}
	
    private String getAccessToken(String code, String state) throws Exception {
        // HTTP Header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HTTP Body 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", NAVER_CLIENT_ID);
        params.add("client_secret", NAVER_CLIENT_SECRET);
        params.add("redirect_uri", NAVER_REDIRECT_URI);
        params.add("code", code);
        params.add("state", state);

        // HTTP 요청 보내기
        HttpEntity<MultiValueMap<String, String>> naverTokenRequest = new HttpEntity<>(params, headers);
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.exchange(
            "https://nid.naver.com/oauth2.0/token",
            HttpMethod.POST,
            naverTokenRequest,
            String.class
        );

        // JSON 응답에서 Access Token 파싱하기
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(response.getBody());
        return jsonNode.get("access_token").asText();
    }

    private JsonNode getUserProfile(String accessToken) throws Exception {
        // HTTP Header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HTTP 요청 보내기
        HttpEntity<MultiValueMap<String, String>> naverProfileRequest = new HttpEntity<>(headers);
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.exchange(
            "https://openapi.naver.com/v1/nid/me",
            HttpMethod.POST,
            naverProfileRequest,
            String.class
        );

        // JSON 응답에서 사용자 정보 파싱하기
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(response.getBody());
        return jsonNode.get("response");
    }

    private MemberVO processNaverUser(JsonNode profileJson) throws Exception {
        String email = profileJson.get("email").asText();
        
        // 5-1. 우리 DB에 이미 가입된 회원인지 확인
        MemberVO existingMember = memberDAO.selectMemberByEmail(email);
        
        if (existingMember != null) {
            // 5-2. 이미 가입된 회원이면, 해당 회원 정보 반환 (로그인 처리)
            System.out.println("기존 회원입니다. 로그인합니다: " + email);
            return existingMember;
        } else {
            // 5-3. 신규 회원이면, 자동 회원가입 처리
            System.out.println("신규 회원입니다. 자동 가입을 진행합니다: " + email);
            MemberVO newMember = new MemberVO();
            newMember.setM_email(email);
            newMember.setM_name(profileJson.get("name").asText());
            
            // 네이버는 아이디를 제공하지 않으므로, 이메일 앞부분을 아이디로 사용하거나 랜덤 아이디 생성
            String naverId = "naver_" + profileJson.get("id").asText();
            newMember.setM_id(naverId);
            
            // 비밀번호는 소셜 로그인 회원이므로, 랜덤 값으로 채워넣습니다.
            newMember.setM_pw("SOCIAL_LOGIN_USER_PASSWORD");
            
            // 나머지 필수 정보들을 기본값으로 채워줍니다.
            newMember.setM_gender(0); // 네이버 응답값(M/F)을 우리 DB(1/2)에 맞게 변환 필요
            newMember.setM_phone("01000000000"); // 휴대폰 번호는 추가 동의 필요
            
            // ... (그 외 DB의 NOT NULL 컬럼들을 기본값으로 채워줍니다) ...
            
            memberDAO.insertNewMember(newMember); // 회원 정보 INSERT
            return newMember;
        }
    }
}
