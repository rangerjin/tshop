package poly.service;

import poly.dto.FoodUserDTO;


public interface IFoodService {
	
	// 회원가입시 아이디 중복체크
	public int getUserIdCheck(String user_id) throws Exception;
	
	// 일반 회원가입
	public int insertUserReg(FoodUserDTO pDTO) throws Exception;

	// 회원가입시 이메일 중복 체크
	public int getUserEmailCheck(String nvl) throws Exception;
	
	// 아이디 찾기
	public String getSearchId(String user_email) throws Exception;

	// 노말 유저 로그인(usercode = n, userKey = Y 인 경우만)
	public int getNormalLogin(FoodUserDTO pDTO) throws Exception;

	// 로그인창에서 아이디 비밀번호로 DTO 불러오기
	public FoodUserDTO getUserInfo(String user_id, String user_pwd) throws Exception;

	// 아이디찾기 폼에서 
	public String getUserIdFromEmail(String user_email) throws Exception;

	// 비밀번호 찾기 폼에서
	public String getUserPwFromEmail(String user_id, String user_email) throws Exception;

	// 회원 삭제
	public int deleteStop(String user_id) throws Exception;
		
}
