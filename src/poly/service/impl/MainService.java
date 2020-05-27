package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.FoodStrDTO;
import poly.dto.FoodUserDTO;
import poly.dto.MenuDTO;
import poly.dto.StrReviewDTO;
import poly.persistance.mapper.IMainMapper;
import poly.service.IMainService;

@Service("MainService")
public class MainService implements IMainService{
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MainMapper")
	private IMainMapper mainMapper;

	// 마이페이지 수정
	@Override
	public int updateUserModify(FoodUserDTO pDTO) throws Exception {
		log.info(this.getClass().getName() + ".updateUserModify start");
		
		int result = 0;
		
		result = mainMapper.updateUserModify(pDTO);
		
		return result;
	}

	// 매장 리스트
	@Override
	public List<FoodStrDTO> getStrList(String searchOption) throws Exception {
		log.info(this.getClass().getName() + ".getStrList start");
		
		return mainMapper.getStrList(searchOption);
	}

	// 매장 리스트 검색옵션 없을떄
	@Override
	public List<FoodStrDTO> getStrList() throws Exception {
		return mainMapper.getEmptyStrList();
	}

	// 매장 정보
	@Override
	public FoodStrDTO getStrInfo(String str_no) throws Exception {
		return mainMapper.getStrInfo(str_no);
	}

	// 댓글 리스트
	@Override
	public List<StrReviewDTO> getReviewList(String str_no) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.getReviewList(str_no);
	}

	// 댓글 정보
	@Override
	public StrReviewDTO getReviewInfo(String review_no) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.getReviewInfo(review_no);
	}
	
	// 댓글 정보 수정
	@Override
	public StrReviewDTO updateReviewInfo(StrReviewDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.updateReviewInfo(pDTO);
	}

	// 댓글 삭제
	@Override
	public int deleteReview(String review_no) throws Exception {
		return mainMapper.deleteReview(review_no);
	}

	// 댓글 생성
	@Override
	public int insertReview(StrReviewDTO pDTO) throws Exception {
		return mainMapper.insertReview(pDTO);
	}

	// 댓글 리스트 생성 테스트

	// 댓글 생성 
	@Override
	public int addComment(StrReviewDTO strReviewDTO) throws Exception {
		return mainMapper.addComment(strReviewDTO);
		
	}
	
	// 댓글 리스트
	@Override
	public List<StrReviewDTO> selectBoardCommentByCode(StrReviewDTO strReviewDTO) throws Exception {
		return mainMapper.selectBoardCommentByCode(strReviewDTO); 
	}
	
	// 댓글 리스트 생성 테스트
	
	// 메뉴 리스트 출력
	@Override
	public List<MenuDTO> getMenuList(String str_no) throws Exception {
		return mainMapper.getMenuList(str_no);
	}
	
	// noAjax 리뷰 등록
	@Override
	public void insertReviewNoAjax(StrReviewDTO pDTO) throws Exception {
		mainMapper.insertReviewNoAjax(pDTO);
		
	}

	// noAjax 리뷰 삭제
	@Override
	public void deleteReviewNoAjax(String review_no) throws Exception {
		mainMapper.deleteReviewNoAjax(review_no);
	}

	// noAjax 리뷰 수정
	@Override
	public void updateReviewNoAjax(StrReviewDTO pDTO) throws Exception {
		mainMapper.updateReviewNoAjax(pDTO);
		
	}

}
