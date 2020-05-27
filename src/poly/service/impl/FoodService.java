package poly.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.FoodUserDTO;
import poly.persistance.mapper.IFoodMapper;
import poly.service.IFoodService;

@Service("FoodService")
public class FoodService implements IFoodService {
	
	@Resource(name="FoodMapper")
	private IFoodMapper foodMapper;
	
	private Logger log = Logger.getLogger(this.getClass());

	/**
	 * 회원가입시 아이디 중복체크 
	 * 중복된 아이디가 있으면 1 없으면 0
	 */
	@Override
	public int getUserIdCheck(String user_id) throws Exception {
		
		System.out.println(".idCheck start!");
		
		int result = 0;
		
		try {
			result = foodMapper.getUserIdCheck(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	// 회원가입시 성공 1 실패 0
	@Override
	public int insertUserReg(FoodUserDTO pDTO) throws Exception {
		
		log.info(this.getClass().getName() + "insertUserReg start!");
		
		int res = 0;
		
		if(pDTO == null) {
			pDTO = new FoodUserDTO();
		}
		
		try {
			res = foodMapper.insertUserReg(pDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	

	/*
	 * 회원가입시 이메일 중복체크
	 * 이메일 중복시 1 없을시 0
	 */
	@Override
	public int getUserEmailCheck(String user_email) throws Exception {
		
		System.out.println(".getUserEmailCheck start!");
		
		int result = 0;
		
		try {
			result = foodMapper.getUserEmailCheck(user_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 아이디 찾기 성공시 아이디 반환 실패시 ""
	@Override
	public String getSearchId(String user_email) throws Exception {
		System.out.println("getSearchId start!!");
		
		String result = "";
		
		try {
			result = foodMapper.getSearchId(user_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 노말 유저 로그인(usercode = n, userKey = Y 인 경우만)
	@Override
	public int getNormalLogin(FoodUserDTO pDTO) throws Exception {
		
		
		
		int result = 0;
		
		try {
			result = foodMapper.getNormalLogin(pDTO);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 로그인창에서 아이디 비밀번호로 DTO 불러오기
	@Override
	public FoodUserDTO getUserInfo(String user_id, String user_pwd) throws Exception {
		
		FoodUserDTO rDTO = null;
		
		Map<String, String> pMap = new HashMap<String, String>();
		
		pMap.put("user_id", user_id);
		pMap.put("user_pwd", user_pwd);
		
		try {
			rDTO = foodMapper.getUserInfo(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rDTO;
	}
	
	// 유저 아이디 찾기
	@Override
	public String getUserIdFromEmail(String user_email) throws Exception {
		return foodMapper.getUserIdFromEmail(user_email);
	}

	// 유저 비밀번호 찾기
	@Override
	public String getUserPwFromEmail(String user_id, String user_email) throws Exception {
		
		Map<String, String> pMap = new HashMap<String, String>();
		
		pMap.put("user_id", user_id);
		pMap.put("user_email", user_email);
		
		String result = "";
		
		try {
			result = foodMapper.getUserPwFromEmail(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 회원 탈퇴하기
	@Override
	public int deleteStop(String user_id) throws Exception {
		
		int result = 0;
		
		result = foodMapper.deleteStop(user_id);
		
		return result;
		
	}

}
