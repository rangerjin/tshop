package poly.persistance.mapper;

import config.Mapper;
import poly.dto.FoodStrDTO;
import poly.dto.MenuDTO;

@Mapper("CeoMapper")
public interface ICeoMapper {
	// 매장 등록
	int insertStrReg(FoodStrDTO pDTO) throws Exception;
	// 매장 상세보기
	FoodStrDTO getStrInfo(String str_no) throws Exception;
	// 매장 삭제
	int deleteStr(String str_no) throws Exception;
	// 메뉴 등록
	int insertStrMenu(MenuDTO pDTO) throws Exception;
	// 매장 수정하기
	int updateStrReg(FoodStrDTO pDTO) throws Exception;
	// 메뉴 수정
	int updateStrMenu(MenuDTO pDTO) throws Exception;
	// 메뉴 삭제
	int deleteStrMenu(String menu_no) throws Exception;
	// 메뉴 정보 가져오기
	MenuDTO getMenuInfo(String menu_no) throws Exception;

}
