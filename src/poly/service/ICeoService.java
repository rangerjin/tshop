package poly.service;

import poly.dto.FoodStrDTO;
import poly.dto.MenuDTO;

public interface ICeoService {

	// 매장 등록 성공시 1
	int insertStrReg(FoodStrDTO pDTO) throws Exception;

	// 매장 정보 상세보기
	FoodStrDTO getStrInfo(String str_no) throws Exception;

	// 매장 삭제하기
	int deleteStr(String str_no) throws Exception;

	// 메뉴 등록하기
	int insertStrMenu(MenuDTO pDTO) throws Exception;

	// 매장 수정하기
	int updateStrReg(FoodStrDTO pDTO) throws Exception;

	// 메뉴 수정하기
	int updateStrMenu(MenuDTO pDTO) throws Exception;

	// 메뉴 삭제하기
	int deleteStrMenu(String menu_no) throws Exception;

	// 메뉴 정보 가져오기
	MenuDTO getMenuInfo(String menu_no) throws Exception;
	
}
