package poly.service;

import java.util.List;

import poly.dto.CategoryDTO;
import poly.dto.ProductDTO;
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

	// 판매자 나의 상품 리스트
	public List<ProductDTO> getMyProductList(String user_id) throws Exception;

	// 상품 등록 성공시 1 실패시 0
	public int insertRegProduct(ProductDTO pDTO) throws Exception;

	// 카테고리 리스트 전체 가져오기
	public List<CategoryDTO> getTSHOPCategoryList() throws Exception;

	// product_no 로 상품 정보 가져오기
	public ProductDTO getProductInfo(String product_no) throws Exception;

	// myProduct 상품 삭제
	public int deleteProductInfo(String product_no) throws Exception;

	// myProduct 상품 업데이트
	public int updateProductInfo(ProductDTO pDTO) throws Exception;
	
}
