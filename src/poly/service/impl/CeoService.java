package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.FoodStrDTO;
import poly.dto.MenuDTO;
import poly.persistance.mapper.ICeoMapper;
import poly.service.ICeoService;

@Service("CeoService")
public class CeoService implements ICeoService{

	@Resource(name="CeoMapper")
	private ICeoMapper ceoMapper;
	
	// 매장등록
	@Override
	public int insertStrReg(FoodStrDTO pDTO) throws Exception {
		System.out.println(".insertStrReg start!");
		
		int result = 0;
		
		try {
			result = ceoMapper.insertStrReg(pDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	// 매장 상세보기
	@Override
	public FoodStrDTO getStrInfo(String str_no) throws Exception {
		
		FoodStrDTO rDTO = null;
		
		rDTO = ceoMapper.getStrInfo(str_no);

		return rDTO;
	}

	// 매장 삭제
	@Override
	public int deleteStr(String str_no) throws Exception {
		
		return ceoMapper.deleteStr(str_no);
	}
	// 메뉴 등록
	@Override
	public int insertStrMenu(MenuDTO pDTO) throws Exception {
		return ceoMapper.insertStrMenu(pDTO);
	}

	// 매장 수정하기
	@Override
	public int updateStrReg(FoodStrDTO pDTO) throws Exception {
		
		return ceoMapper.updateStrReg(pDTO);
	}

	// 메뉴 수정
	@Override
	public int updateStrMenu(MenuDTO pDTO) throws Exception {
		
		return ceoMapper.updateStrMenu(pDTO);
	}
	// 메뉴 삭제하기
	@Override
	public int deleteStrMenu(String menu_no) throws Exception {
		return ceoMapper.deleteStrMenu(menu_no);
	}

	// 메뉴 정보 가져오기
	@Override
	public MenuDTO getMenuInfo(String menu_no) throws Exception {
		return ceoMapper.getMenuInfo(menu_no);
	}

}
