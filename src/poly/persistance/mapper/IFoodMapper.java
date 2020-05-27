package poly.persistance.mapper;

import java.util.Map;

import config.Mapper;
import poly.dto.FoodUserDTO;

@Mapper("FoodMapper")
public interface IFoodMapper {
		
	// 회원가입시 DB에 있는 아이디 중복 체크
	int getUserIdCheck(String user_id)throws Exception;
	
	// 회원가입시 이메일체크 중복시 1 중복없을시 0
	int getUserEmailCheck(String user_email) throws Exception;

	// 회원가입시 1 return
	int insertUserReg(FoodUserDTO pDTO)throws Exception;
	
	// 회원가입시 이메일을 받아 db에 authkey 저장
	void updateAuthKey(Map<String, String> pMap) throws Exception;

	// 이메일을 받아 아이디 찾기
	String getSearchId(String user_email) throws Exception;
	
	// 노말 유저 로그인(usercode = n, userKey = Y 인 경우만)
	int getNormalLogin(FoodUserDTO pDTO) throws Exception;

	// 로그인창에서 아이디 비밀번호로 DTO 불러오기
	FoodUserDTO getUserInfo(Map<String, String> pMap) throws Exception;

	// 아이디 찾기
	String getUserIdFromEmail(String user_email) throws Exception;

	// 비밀번호 찾기
	String getUserPwFromEmail(Map<String, String> pMap) throws Exception;

	// 회원 탈퇴하기
	int deleteStop(String user_id) throws Exception;
	
}
