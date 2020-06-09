package poly.service;

import poly.dto.UserDTO;

public interface ITShopService {

	// 일반 회원가입
	public int insertTSHOPUserReg(UserDTO pDTO) throws Exception;

	// 회원가입시 아이디 중복체크
	public int getTSHOPUserIdCheck(String user_id) throws Exception;

	// 회원가입시 이메일 중복 체크
	public int getTSHOPUserEmailCheck(String user_email) throws Exception;

	// 로그인창에서 아이디 비밀번호로 DTO 불러오기 
	public UserDTO getTSHOPUserInfo(String user_id, String user_pwd) throws Exception;
	
	// 아이디 찾기
	public String getTSHOPUserId(String user_email) throws Exception;

	// 비밀번호 찾기
	public String getTSHOPUserPassword(String user_id, String user_email) throws Exception;
}
