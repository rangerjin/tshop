package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.FoodStrDTO;
import poly.dto.FoodUserDTO;
import poly.dto.MenuDTO;
import poly.dto.StrReviewDTO;

@Mapper("MainMapper")
public interface IMainMapper {

	// 마이페이지 수정
	int updateUserModify(FoodUserDTO pDTO) throws Exception;

	// 매장 리스트 출력
	List<FoodStrDTO> getStrList(String searchOption) throws Exception;

	// 매장 리스트 출력 검색 옵션이 없을떄
	List<FoodStrDTO> getEmptyStrList() throws Exception;

	// 매장 정보 출력
	FoodStrDTO getStrInfo(String str_no) throws Exception;

	// 댓글 리스트 출력
	List<StrReviewDTO> getReviewList(String str_no) throws Exception;

	// 댓글 정보 출력
	StrReviewDTO getReviewInfo(String review_no) throws Exception;

	// 댓글 정보 수정
	StrReviewDTO updateReviewInfo(StrReviewDTO pDTO) throws Exception;

	// 댓글 삭제
	int deleteReview(String review_no) throws Exception;
	
	// 댓글 등록
	int insertReview(StrReviewDTO pDTO) throws Exception;

	// 댓글 생성 ajax
	int addComment(StrReviewDTO strReviewDTO) throws Exception;

	// 댓글 리스트 출력 ajax
	List<StrReviewDTO> selectBoardCommentByCode(StrReviewDTO strReviewDTO) throws Exception;
	
	// 메뉴 리스트 출력 str_no에따른
	List<MenuDTO> getMenuList(String str_no) throws Exception;

	// noAjax 리뷰 등록
	void insertReviewNoAjax(StrReviewDTO pDTO) throws Exception;

	// noAjax 리뷰 삭제
	void deleteReviewNoAjax(String review_no) throws Exception;

	// noAjax 리뷰 수정
	void updateReviewNoAjax(StrReviewDTO pDTO) throws Exception;

}
