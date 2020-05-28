package poly.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.ITShopMapper;
import poly.service.ITShopService;

@Service("TShopService")
public class TShopService implements ITShopService {

	@Resource(name = "TShopMapper")
	private ITShopMapper tShopMapper;

	private Logger log = Logger.getLogger(this.getClass());

	// 일반 회원가입 성공시 1 실패 0
	@Override
	public int insertTSHOPUserReg(UserDTO pDTO) throws Exception {

		log.info(this.getClass().getName() + ".insertTSHOPUserReg start!");

		int result = 0;

		try {
			result = tShopMapper.insertTSHOPUserReg(pDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	// 회원가입시 아이디 중복체크 중복시 1 없으면 0
	@Override
	public int getTSHOPUserIdCheck(String user_id) throws Exception {

		log.info(this.getClass().getName() + ".getTSHOPUserIdCheck start!");

		int result = 0;

		try {
			result = tShopMapper.getTSHOPUserIdCheck(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 회원가입시 이메일 중복 체크 중복시 1 없으면 0
	@Override
	public int getTSHOPUserEmailCheck(String user_email) throws Exception {
		
		log.info(this.getClass().getName() + ".getTSHOPUserEmailCheck start!");

		int result = 0;

		try {
			result = tShopMapper.getTSHOPUserEmailCheck(user_email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
