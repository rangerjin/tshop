package poly.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import poly.dto.FoodStrDTO;
import poly.dto.FoodUserDTO;
import poly.dto.MenuDTO;
import poly.service.ICeoService;

@Controller
public class CeoController {
	private Logger log = Logger.getLogger(this.getClass());

	// 업로드 되는 파일이 저장되는 기본 폴더 설정(자바에서 경로는 /로 표현함)
	private static final String UPLOAD_PATH = "C:\\food24\\fileupload";

	// 업로드 되는 파일이 저장되는 기본 폴더 설정(자바에서 경로는 /로 표현함)
	final private String FILE_UPLOAD_SAVE_PATH = "c:\\upload";

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Resource(name = "imgUploadPath")
	private String imgUploadPath;

	@Resource(name = "CeoService")
	private ICeoService ceoService;

	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	private String imgUploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(imgUploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	@RequestMapping(value = "ceo/main")
	public String ceoLoginMain() throws Exception {
		log.info(this.getClass().getName() + "ceoLoginMainStart!!");
		return "ceo/ceoMain";
	}

	// 매장 등록페이지
	@RequestMapping(value = "ceo/regTest")
	public String ceoTest() throws Exception {
		log.info(this.getClass().getName() + "ceoLoginMainStart!!");
		return "ceo/regStr";
	}

	// 매장 등록
	@RequestMapping(value = "ceo/strReg")
	public String strReg(MultipartHttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "strReg start!!");

		FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");

		FoodStrDTO pDTO = new FoodStrDTO();
		pDTO.setStr_name(request.getParameter("str_name"));
		pDTO.setStr_loc(request.getParameter("str_loc"));
		pDTO.setStr_tel(request.getParameter("str_tel"));
		pDTO.setStr_time(request.getParameter("str_time"));
		pDTO.setUser_id(user.getUser_id());

		MultipartFile mf = request.getFile("str_img");

		String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());

		pDTO.setStr_img(savedName);

		int result = 0;

		String msg = "";

		try {
			result = ceoService.insertStrReg(pDTO);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "매장 등록 성공!!";
		} else {
			msg = "매장 등록 실패!!";
		}

		model.addAttribute(msg);
		
		user = null;

		return "main/mainTest";
	}

	// 매장 상세보기
	@RequestMapping(value = "ceo/getStr")
	public String strUpdate(@RequestParam(value = "str_no") String str_no, HttpServletRequest request, ModelMap model,
			HttpServletResponse response, @RequestParam(value = "str_img") MultipartFile str_img) throws Exception {
		log.info(this.getClass().getName() + "strReg start!!");

		FoodStrDTO rDTO = null;

		try {
			rDTO = ceoService.getStrInfo(str_no);
		} catch (Exception e) {
			e.toString();
		}

		model.addAttribute("strVO", rDTO);
		
		rDTO = null;

		return "ceo/strInfo";
	}

	// 매장 삭제
	@RequestMapping(value = "ceo/delStr")
	public String delStr(@RequestParam(value = "str_no") String str_no, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "strReg start!!");

		int result = 0;
		String msg = "";
		
		FoodStrDTO str = new FoodStrDTO();
		str = ceoService.getStrInfo(str_no);
		String str_name = str.getStr_name();

		try {
			result = ceoService.deleteStr(str_no);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = str_name + "매장 삭제 성공!!";
		} else {
			msg = str_name + "매장 삭제 실패!!";
		}

		model.addAttribute(msg);
		
		str = null;

		return "main/mainTest";
	}

	// 매장 수정 페이지
	@RequestMapping(value = "ceo/updateStrForm")
	public String updateStrForm(HttpServletRequest request, @RequestParam(value = "str_no") String str_no,
			ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "updateStrForm Start!!");

		FoodStrDTO str = new FoodStrDTO();

		// 매장수정페이지에 매장정보 기입
		str = ceoService.getStrInfo(str_no);

		System.out.println("str_no = " + str_no);

		model.addAttribute("strDTO", str);
		
		str = null;

		return "ceo/updateStrForm";
	}

	// 매장 수정
	@RequestMapping(value = "ceo/updateStr")
	public String strUpdate(MultipartHttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + "updateStr start!!");

		FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
		FoodStrDTO pDTO = new FoodStrDTO();

		pDTO.setStr_name(request.getParameter("str_name").trim());
		pDTO.setStr_loc(request.getParameter("str_loc").trim());
		pDTO.setStr_tel(request.getParameter("str_tel").trim());
		pDTO.setStr_time(request.getParameter("str_time").trim());
		pDTO.setStr_no(request.getParameter("str_no"));
		
		MultipartFile mf = request.getFile("new_file");

		if (mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {

			String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());

			pDTO.setStr_img(savedName);

			// 기존 파일을 삭제
			//new File(uploadPath + request.getParameter("str_img")).delete();

		} else {
			pDTO.setStr_img(request.getParameter("str_img"));
		}

		int result = 0;
		String msg = "";

		try {
			result = ceoService.updateStrReg(pDTO);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "매장 수정 성공!!";
		} else {
			msg = "매장 수정 실패!!";
		}

		System.out.println(msg);
		
		String str_no = request.getParameter("str_no");
		
		pDTO = null;
		user = null;

		return "redirect:/main/strInfo.do?str_no="+str_no;
	}

	// 메뉴 등록 폼
	@RequestMapping(value = "ceo/regMenuForm")
	public String regMenuForm(ModelMap model, HttpSession session, HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".regMenuForm page!!");
		
		String menu_str_no= request.getParameter("menu_str_no");
		
		String str_no = menu_str_no;
		
		FoodStrDTO str = new FoodStrDTO();
		
		str = ceoService.getStrInfo(str_no);
		
		model.addAttribute("menu_str_no", menu_str_no); // 가게 번호
		model.addAttribute("str_name", str.getStr_name()); // 가게 이름
		
		str = null;

		return "ceo/regMenu";
	}

	// 메뉴 등록
	@RequestMapping(value = "ceo/regMenuu")
	public String regMenu(MultipartHttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "regMenu start!!");
		
		FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
		String user_id = user.getUser_id();
		
		String menu_str_no = (String) request.getParameter("menu_str_no");

		MenuDTO mDTO = new MenuDTO();

		mDTO.setMenu_name(request.getParameter("menu_name"));
		mDTO.setMenu_exp(request.getParameter("menu_exp"));
		mDTO.setMenu_cost(request.getParameter("menu_cost"));
		mDTO.setMenu_str_no(menu_str_no);
		mDTO.setUser_id(user_id);

		MultipartFile mf = request.getFile("menu_img");

		String savedName = imgUploadFile(mf.getOriginalFilename(), mf.getBytes());

		System.out.println("이미지 등록 성공 !!");
		System.out.println("menu_img" + savedName);
		
		mDTO.setMenu_img(savedName);

		int result = 0;

		String msg = "";

		try {
			result = ceoService.insertStrMenu(mDTO);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "메뉴 등록 성공!!";
		} else {
			msg = "메뉴 등록 실패!!";
		}

		model.addAttribute("str_no", menu_str_no);
		
		user = null;
		mDTO = null;

		return "redirect:/main/strInfo.do";
	}

	// 메뉴 수정 페이지
	@RequestMapping(value = "ceo/updateMenuForm")
	public String updateMenuForm(HttpServletRequest request, @RequestParam(value = "menu_no") String menu_no, ModelMap model,
			@RequestParam(value="menuNowPage", defaultValue="1")String menuNowPage) throws Exception {
		log.info(this.getClass().getName() + "updateMenuForm Start!!");

		MenuDTO menu = new MenuDTO();

		// 메뉴 정보 가져오기
		menu = ceoService.getMenuInfo(menu_no);

		System.out.println("menu_no = " + menu_no);

		model.addAttribute("mDTO", menu);
		model.addAttribute("menuNowPage", menuNowPage);
		
		menu = null;

		return "ceo/updateMenuForm";
	}

	// 메뉴 수정
	@RequestMapping(value = "ceo/updateMenu")
	public String updateMenu(MultipartHttpServletRequest request, HttpSession session, ModelMap model,
			@RequestParam(value="menuNowPage", defaultValue="1")String menuNowPage,
			@RequestParam(value="reviewNowPage", defaultValue="1")String reviewNowPage)
			throws Exception {
		log.info(this.getClass().getName() + "updateMenu start!!");

		FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
		MenuDTO mDTO = new MenuDTO();

		mDTO.setMenu_name(request.getParameter("menu_name"));
		mDTO.setMenu_exp(request.getParameter("menu_exp"));
		mDTO.setMenu_cost(request.getParameter("menu_cost"));
		mDTO.setMenu_str_no(request.getParameter("menu_str_no"));
		mDTO.setMenu_no(request.getParameter("menu_no"));
		mDTO.setUser_id(request.getParameter("user_id"));

		MultipartFile mf = request.getFile("new_file");

		if (mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {

			String savedName = imgUploadFile(mf.getOriginalFilename(), mf.getBytes());

			mDTO.setMenu_img(savedName);

			// 기존 메뉴 이미지 파일을  프로젝트에서 삭제
			new File(imgUploadPath + request.getParameter("menu_img")).delete();

		} else {
			mDTO.setMenu_img(request.getParameter("menu_img"));
		}

		int result = 0;

		String msg = "";

		try {
			result = ceoService.updateStrMenu(mDTO);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "메뉴 수정 성공!!";
		} else {
			msg = "메뉴 수정 실패!!";
		}
		
		// model.addattribute("msg", msg)
		
		user = null;
		mDTO = null;

		return "redirect:/main/strInfo.do?str_no="+request.getParameter("menu_str_no")+"&menuNowPage="+menuNowPage+"&reviewNowPage="+reviewNowPage;
	}

	// 메뉴 삭제
	@RequestMapping(value = "ceo/deleteMenu")
	public String deletMenu(@RequestParam(value = "menu_no") String menu_no, ModelMap model,
			@RequestParam(value="menuNowPage", defaultValue="1")String menuNowPage) throws Exception {
		log.info(this.getClass().getName() + "deletMenu start!!");

		int result = 0;
		String msg = "";
		
		MenuDTO menu = ceoService.getMenuInfo(menu_no);
		
		String str_no = menu.getMenu_str_no();

		try {
			result = ceoService.deleteStrMenu(menu_no);
			// 메뉴 이미지 파일 프로젝트에서 삭제
			new File(imgUploadPath + menu.getMenu_img()).delete();
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "메뉴 삭제 성공!!";
		} else {
			msg = "메뉴 삭제 실패!!";
		}
		
		menu = null;

		return "redirect:/main/strInfo.do?str_no="+str_no+"&menuNowPage="+menuNowPage;
	}
}
