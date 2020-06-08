package poly.service;

import javax.servlet.http.HttpServletRequest;

import poly.dto.MailDTO;

public interface IMailService {
	
	// 메일 발송
	int doSendMail(MailDTO pDTO);
	
	// 회원가입 발송 이메일(인증키 발송) 
	void mailSendWithUserKey(String user_email, String user_id, HttpServletRequest request);

	// 회원가입 이메일 인증시 권한 y
	int alter_userKey_service(String user_id, String user_key);

	// 회원가입 패스워드 찾기
	void mailSendWithPassword(String user_id, String user_email, HttpServletRequest request);	
}
