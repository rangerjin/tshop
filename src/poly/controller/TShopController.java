package poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import poly.dto.CategoryDTO;
import poly.dto.ProductDTO;
import poly.dto.UserDTO;
import poly.service.IMailService;
import poly.service.ITShopService;
import poly.util.CmmUtil;
import poly.util.Paging;

@Controller
public class TShopController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Resource(name = "TShopService")
	private ITShopService tshopService;

	@Resource(name = "MailService")
	private IMailService mailService;

	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	/*
	 * tshop 메인 페이지
	 */
	@RequestMapping(value = "tshop/test")
	public String tshopMain(HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + ".tShopMain Page Start!!");

		// return "tshop/tshopMain";

		return "tshop/tshopMain";
	}

	/*
	 * tshop 로그인 페이지
	 */
	@RequestMapping(value = "tshop/login")
	public String tshopLogin(HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".tshopLogin Page!!");

		return "tshop/loginTest";
	}

	/*
	 * tshop 회원가입 페이지
	 */
	@RequestMapping(value = "tshop/register")
	public String tshopRegister() throws Exception {
		log.info(this.getClass().getName() + ".tshopRegister Page!!");

		return "tshop/register";
	}

	/*
	 * 회원가입 실행
	 */
	@RequestMapping(value = "tshop/userReg")
	public String tshopUserReg(UserDTO pDTO, ModelMap model, HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("utf-8");

		log.info(this.getClass().getName() + ".tshopUserReg start!");

		request.setCharacterEncoding("utf-8");

		int result = 0; // 회원가입 성공시 1 실패시 0
		String msg = ""; // 회원가입 시 메시지 전송

		try {
			result = tshopService.insertTSHOPUserReg(pDTO);
		} catch (Exception e) {
			e.toString();
		}

		log.info(this.getClass().getName() + "회원가입 매서드 종료!!");

		if (result >= 1) {
			msg = "회원가입 성공!!" + pDTO.getUser_id() + "님 이메일 인증을 하셔야 로그인 할 수 있습니다.";
		} else {
			msg = "회원가입 실패!!";
		}

		// model.addAttribute(msg);
		// msg메시지 담아서 보내기
		request.setAttribute("msg", msg);

		log.info(this.getClass().getName() + ".tshopUserReg End!!");

		log.info(this.getClass().getName() + " 이메일 코드 발송 전!!");

		log.info(this.getClass().getName() + " 이메일 확인 : " + pDTO.getUser_email());

		// 이메일 인증시 발송된 user_key와 db의 user_key가 일치하면
		try {
			mailService.mailSendWithUserKey(pDTO.getUser_email().trim(), pDTO.getUser_id().trim(), request);
		} catch (Exception e) {
			e.toString();
		}

		log.info(this.getClass().getName() + " 이메일 코드 발송 후!!");

		return "tshop/loginTest";
	}

	/**
	 * 아이디 중복체크
	 * 
	 * @param user_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tshop/idCheck", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String tshopIdCheck(HttpServletRequest request) throws Exception {

		String user_id = request.getParameter("user_id");

		int result = 0;

		try {
			result = tshopService.getTSHOPUserIdCheck(CmmUtil.nvl(user_id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 아이디 중복 1 미중복 0
		return Integer.toString(result);

	}

	/**
	 * 이메일 중복 체크 이메일 중복시 1 이메일 중복 아닐시 0
	 */
	@RequestMapping(value = "/tshop/emailCheck", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String tshopEmailCheck(HttpServletRequest request) throws Exception {

		String user_email = request.getParameter("user_email");

		int result = 0;

		try {
			result = tshopService.getTSHOPUserEmailCheck(CmmUtil.nvl(user_email));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Integer.toString(result);

	}

	/*
	 * 로그인 submit
	 */
	@RequestMapping(value = "/tshop/loginPost", method = RequestMethod.POST)
	public String tshopLoginPost(@RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd,
			HttpServletRequest request, ModelMap model, HttpSession session) {

		log.info(this.getClass().getName() + ".tshopLoginPost start!!");

		UserDTO user = new UserDTO();

		try {
			user = tshopService.getTSHOPUserInfo(user_id, user_pwd);
		} catch (Exception e) {
			e.toString();
		}

		System.out.println(user.toString());

		/*
		 * if(user == null) { model.addAttribute("msg", "아이디 비밀번호가 맞지 않습니다.");
		 * 
		 * return "tshop/loginTest"; }
		 */

		if (!user.getUser_id().equals(user_id)) {
			model.addAttribute("msg", "아이디 존재 하지 않습니다.");

			return "tshop/loginTest";
		}

		if (user.getUser_id().equals(user_id) && !user.getUser_pwd().equals(user_pwd)) {
			model.addAttribute("msg", "비밀번호가 일치 하지 않습니다.");

			return "tshop/loginTest";
		}

		// 입력한 아이디와 비밀번호 값이 일치하고 user_code와 user_key 값에 따라 노말 로그인 ceo 로그인 나눈다
		if (user_id.equals(user.getUser_id()) && user_pwd.equals(user.getUser_pwd()) && user.getUser_code().equals("n")
				&& user.getUser_key().contentEquals("Y")) {
			session.setAttribute("user", user);

			System.out.println("코드 확인!!!!!!!!!!!!" + user.getUser_code());

			model.addAttribute("msg", "일반 회원 로그인 성공");

			return "tshop/tshopMain";
		} else if (user_id.equals(user.getUser_id()) && user_pwd.equals(user.getUser_pwd())
				&& user.getUser_code().equals("c") && user.getUser_key().contentEquals("Y")) {
			session.setAttribute("user", user);

			System.out.println("코드 확인!!!!!!!!!!!!" + user.getUser_code());

			model.addAttribute("msg", "판매자 회원 로그인 성공");

			return "tshop/tshopMain";
		} else if (!user.getUser_key().contentEquals("Y")) {

			model.addAttribute("msg", "이메일 인증을 해주셔야 로그인할수 있습니다.");

			return "tshop/loginTest";
		} else {
			model.addAttribute("msg", "로그인 실패");

			return "tshop/loginTest";
		}

	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/tshop/findId")
	public String tshopFindId() {

		return "tshop/findId";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "/tshop/findIdPost")
	public String tshopFindIdPost(@RequestParam("user_email") String user_email, ModelMap model,
			HttpServletRequest request) throws Exception {

		String user_id = "";

		user_id = tshopService.getTSHOPUserId(user_email);

		model.addAttribute("user_id", user_id);

		return "tshop/loginTest";
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/tshop/findPassword")
	public String tshopFindPassword() {

		return "tshop/findPassword";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "/tshop/findPasswordPost")
	public String tshopFindPasswordPost(HttpServletRequest request, ModelMap model) {

		String user_email = "";
		String user_id = "";
		String user_password = "";

		user_id = request.getParameter("user_id");
		user_email = request.getParameter("user_email");

		try {
			user_password = tshopService.getTSHOPUserPassword(user_id, user_email);
		} catch (Exception e) {
			e.toString();
		}

		model.addAttribute("user_password", user_password);

		return "tshop/loginTest";
	}

	// 상품 등록 폼
	@RequestMapping(value = "/tshop/regProductForm")
	public String tshopRegProductForm(HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + ".tshopRegProductForm Page!!");
//		
//		List<CategoryDTO> categoryList = new ArrayList<CategoryDTO>();
//		
//		// 카테고리 리스트 전체 가져오기
//		categoryList = tshopService.getTSHOPCategoryList();
//		
//		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ categoryList 확인 : ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
//		System.out.println(categoryList.toString());
//		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ categoryList 확인 : ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
//
//		
//		request.setAttribute("categoryList", categoryList);

		return "tshop/regProduct";
	}

	/*
	 * 상품 등록
	 */
	@RequestMapping(value = "/tshop/regProduct")
	public String regProduct(MultipartHttpServletRequest request, HttpSession session, ModelMap model)
			throws IOException, Exception {

		log.info(this.getClass().getName() + ".regProduct start!");

		UserDTO user = new UserDTO();
		user = (UserDTO) session.getAttribute("user");
		String user_id = user.getUser_id();

		ProductDTO pDTO = new ProductDTO();
		pDTO.setProduct_name(request.getParameter("product_name"));
		pDTO.setProduct_exp(request.getParameter("product_exp"));
		pDTO.setProduct_price(request.getParameter("product_price"));
		pDTO.setUser_id(user_id);

		MultipartFile mf = request.getFile("product_img");

		String savedName = uploadFile(mf.getOriginalFilename(), mf.getBytes());

		pDTO.setProduct_img(savedName);

		int result = 0;

		String msg = "";

		try {
			result = tshopService.insertRegProduct(pDTO);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "매장 등록 성공!!";
		} else {
			msg = "매장 등록 실패!!";
		}

		model.addAttribute("msg", msg);

		// 메모리 초기화
		pDTO = null;

		return "tshop/tshopMain";
	}

	/*
	 * 판매자의 상품 리스트 출력
	 */
	@RequestMapping(value = "/tshop/myProductList")
	public String getMyProductList(HttpSession session,
			@RequestParam(value = "nowPage", defaultValue = "1") String nowPage, ModelMap model) {

		log.info(this.getClass().getName() + ".getMyProductList start!!");

		UserDTO user = new UserDTO();

		user = (UserDTO) session.getAttribute("user");

		List<ProductDTO> productList = new ArrayList<ProductDTO>();

		log.info(this.getClass().getName() + "user.getUser_id() 확인 : " + user.getUser_id());

		try {

			productList = tshopService.getMyProductList(user.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.info(this.getClass().getName() + "productList 확인 : " + productList.toString());

		log.info(this.getClass().getName() + "productList 페이징 시작");

		// 페이징
		int page = 0;
		Paging paging = new Paging();
		if (nowPage != null) {
			page = new Integer(nowPage) - 1;
		}

		paging.setPageNo(page + 1);
		paging.setPageSize(6); // 한 페이지당 몇개 보여줄건지
		paging.setTotalCount(productList.size());
		int startIndex = 0 + (paging.getPageSize() * page);
		int endIndex = paging.getPageSize() + (paging.getPageSize() * page);
		if (endIndex > productList.size()) {
			endIndex = productList.size();
		}

		productList = productList.subList(startIndex, endIndex);

		log.info(this.getClass().getName() + "productList 페이징 끝");

		model.addAttribute("productList", productList);
		model.addAttribute("paging", paging);

		log.info(this.getClass().getName() + ".getMyProductList end!!");

		return "tshop/myProductList";
	}

	@RequestMapping(value = "/tshop/imageTest")
	public String imageTest(ModelMap model) {

		List<ProductDTO> productList = new ArrayList<ProductDTO>();

		try {

			productList = tshopService.getMyProductList("youngjinman3");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("productList", productList);

		return "tshop/imageTest";
	}
}
