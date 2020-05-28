package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("TShopMapper")
public interface ITShopMapper {
	
	// 회원가입 성공시 1
	int insertTSHOPUserReg(UserDTO pDTO)throws Exception;

	// 회원가입시 DB에 있는 아이디 중복 체크
	int getTSHOPUserIdCheck(String user_id)throws Exception;
	
	// 회원가입시 이메일체크 중복시 1 중복없을시 0
	int getTSHOPUserEmailCheck(String user_email) throws Exception;

}
