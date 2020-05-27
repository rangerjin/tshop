package poly.service;

import java.util.List;

import poly.dto.FoodStrDTO;
import poly.dto.FoodUserDTO;
import poly.dto.MenuDTO;
import poly.dto.StrReviewDTO;

public interface IMainService {

	// 유저 정보 수정
	int updateUserModify(FoodUserDTO pDTO) throws Exception;

	// 매장 리스트 검색 옵션이 있는경우
	List<FoodStrDTO> getStrList(String searchOption) throws Exception;
	// 매장 리스트 검색 옵션이 없는 경우
	List<FoodStrDTO> getStrList() throws Exception;

	// 매장 상세정보 매장 이름 클릭시
	FoodStrDTO getStrInfo(String str_name) throws Exception;

	// 리뷰 리스트 매장 넘버로
	List<StrReviewDTO> getReviewList(String str_no) throws Exception;

	// 리뷰 정보 읽기
	StrReviewDTO getReviewInfo(String review_no) throws Exception;

	// 리뷰 수정
	StrReviewDTO updateReviewInfo(StrReviewDTO pDTO) throws Exception;

	// 댓글 삭제
	int deleteReview(String review_no) throws Exception;
	
	// 댓글 생성
	int insertReview(StrReviewDTO pDTO) throws Exception;

	// 댓글 등록 ajax
	int addComment(StrReviewDTO strReviewDTO) throws Exception;
	// 댓글 리스트  ajax
	List<StrReviewDTO> selectBoardCommentByCode(StrReviewDTO strReviewDTO) throws Exception;
	
	// 메뉴리스트 출력 매장번호에따른
	List<MenuDTO> getMenuList(String str_no) throws Exception;

	// noAjax 리뷰 등록
	void insertReviewNoAjax(StrReviewDTO pDTO) throws Exception;

	// noAjax 리뷰 삭제
	void deleteReviewNoAjax(String review_no) throws Exception;

	// noAjax 리뷰 수정
	void updateReviewNoAjax(StrReviewDTO pDTO) throws Exception;

}
