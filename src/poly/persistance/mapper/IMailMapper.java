package poly.persistance.mapper;

import config.Mapper;

@Mapper("MailMapper")
public interface IMailMapper {
	// 이메일 인증을 완료하면 인증키를 'y'
	int insertUserKey(String user_id) throws Exception;
	
	// 유저 인증키 생성 메서드
	int getKey(String user_id, String user_key);
	
	// 유저 인증키 Y로 바꿔주는 메서드
	int updateUserKey(String user_id, String key);
}
