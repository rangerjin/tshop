package poly.service;

import poly.dto.UserDTO;

public interface ITShopService {

	// 일반 회원가입
	public int insertTSHOPUserReg(UserDTO pDTO) throws Exception;

	// 회원가입시 아이디 중복체크
	public int getTSHOPUserIdCheck(String user_id) throws Exception;

	// 회원가입시 이메일 중복 체크
	public int getTSHOPUserEmailCheck(String user_email) throws Exception;
}
