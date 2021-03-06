package poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.CategoryDTO;
import poly.dto.ProductDTO;
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

	// 로그인창에서 user_id, user_pwd로 user 정보 불러오기
	@Override
	public UserDTO getTSHOPUserInfo(String user_id, String user_pwd) throws Exception {

		UserDTO user = null;

		Map<String, String> pMap = new HashMap<String, String>();

		pMap.put("user_id", user_id);
		pMap.put("user_pwd", user_pwd);

		try {
			user = tShopMapper.getTSHOPUserInfo(pMap);
		} catch (Exception e) {
			e.toString();
		}

		return user;
	}

	// 아이디 찾기
	@Override
	public String getTSHOPUserId(String user_email) throws Exception {

		String result = "";

		try {
			result = tShopMapper.getTSHOPUserId(user_email);
		} catch (Exception e) {
			e.toString();
		}

		return result;
	}

	// 비밀번호 찾기
	@Override
	public String getTSHOPUserPassword(String user_id, String user_email) throws Exception {

		Map<String, String> pMap = new HashMap<String, String>();

		pMap.put("user_id", user_id);
		pMap.put("user_email", user_email);

		String result = "";

		try {
			result = tShopMapper.getTSHOPUserPassword(pMap);
		} catch (Exception e) {
			e.toString();
		}

		return result;
	}

	// 판매자 나의 상품 리스트 찾기
	@Override
	public List<ProductDTO> getMyProductList(String user_id) throws Exception {
		log.info(this.getClass().getName() + ".getMyProductList service start!");

		return tShopMapper.getMyProductList(user_id);
	}

	// 상품 등록 성공시 1 실패시 0
	@Override
	public int insertRegProduct(ProductDTO pDTO) throws Exception {
		log.info(this.getClass().getName() + ".insertRegProduct start!");

		int result = 0;
		try {
			result = tShopMapper.insertRegProduct(pDTO);
		} catch (Exception e) {
			e.toString();
		}

		return result;
	}

	// 카테고리 리스트 전체 가져오기
	@Override
	public List<CategoryDTO> getTSHOPCategoryList() throws Exception {
		log.info(this.getClass().getName() + ".getTSHOPCategoryList start!");
		return tShopMapper.getTSHOPCategoryList();
	}

	
	// 상품 상세보기 product_no
	@Override
	public ProductDTO getProductInfo(String product_no) throws Exception {
		ProductDTO pDTO = null;
		
		pDTO = tShopMapper.getProductInfo(product_no);
		
		return pDTO;
	}

	// myProduct 상품 삭제
	@Override
	public int deleteProductInfo(String product_no) throws Exception {
		return tShopMapper.deleteProductInfo(product_no);
	}

	// myProduct 상품 업데이트
	@Override
	public int updateProductInfo(ProductDTO pDTO) throws Exception {
		return tShopMapper.updateProductInfo(pDTO);
	}

}
