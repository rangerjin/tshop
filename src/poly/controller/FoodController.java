package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.FoodUserDTO;
import poly.service.IFoodService;
import poly.service.impl.MailService;
import poly.util.CmmUtil;

@Controller
public class FoodController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "FoodService")
	private IFoodService foodService;

	@Resource(name = "MailService")
	private MailService mailService;
	
	@RequestMapping(value="test")
	public String test() throws Exception{
		return "index";
	}

	// 로그인 메인 화면
	@RequestMapping(value = "food/login")
	public String foodLoginMain2(HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + ".food/userLogin Page!");

		return "food/foodLogin";
	}

	// 회원가입
	@RequestMapping(value = "food/userReg")
	public String foodUserReg(FoodUserDTO pDTO, ModelMap model, HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("utf-8");

		log.info(this.getClass().getName() + ".foodUserReg ok!");

		int result = 0; // 회원가입시 1 실패시 0
		String msg = "";
		
		log.info("utf꺠짐현상 test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + pDTO.getUser_name());
		
		log.info("utf꺠짐현상 test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + request.getAttribute("user_name"));
		/*
		 * // 비밀번호는 절대로 복호화되지 않도록 해시 알고리즘으로 암호화함
		 * pDTO.setUser_pwd(EncryptUtil.encHashSHA256(pDTO.getUser_pwd()));
		 * 
		 * // 이메일 암호화128CBC이용하여 저장
		 * pDTO.setUser_email(EncryptUtil.encAES128CBC(pDTO.getUser_email()));
		 */
		try {
			result = foodService.insertUserReg(pDTO);
		} catch (Exception e) {
			e.toString();
		}

		if (result >= 1) {
			msg = "회원가입을 하셧습니다" + pDTO.getUser_id() + "님 이메일인증을 하셔야 로그인 하실수 있습니다.";
		} else {
			msg = "회원가입을 실패하였습니다.";
		}

		
		
		model.addAttribute("msg", msg);

		// 이메일 인증 코드 발송
		mailService.mailSendWithUserKey(pDTO.getUser_email(), pDTO.getUser_id(), request);

		return "/food/foodLogin";
	}

	// 회원가입폼
	@RequestMapping(value = "food/regTest")
	public String regTest() {
		return "food/regTest";
	}

	/**
	 * 아이디 중복체크
	 * 
	 * @param user_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/food/idCheck", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String foodIdCheck(HttpServletRequest request) throws Exception {

		String user_id = request.getParameter("user_id");

		int result = 0;

		try {
			result = foodService.getUserIdCheck(CmmUtil.nvl(user_id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 아이디 중복 1 미중복 0
		return Integer.toString(result);

	}

	/**
	 * 이메일 중복 체크 이메일 중복시 1 이메일 중복 아닐시 0
	 */
	@RequestMapping(value = "/food/emailCheck", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String foodEmailCheck(HttpServletRequest request) throws Exception {

		String user_email = request.getParameter("user_email");

		int result = 0;

		try {
			result = foodService.getUserEmailCheck(CmmUtil.nvl(user_email));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Integer.toString(result);

	}

	// 로그인 submit
	@RequestMapping(value = "/food/loginPost", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginPost(@RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd,
			HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

		log.info(getClass().getName() + ".loginPost start!!");

		FoodUserDTO rDTO = null;

		rDTO = foodService.getUserInfo(user_id, user_pwd);
		
		if(rDTO == null) {
			model.addAttribute("msg", "아이디 비밀번호가 맞지 않습니다.");

			return "food/foodLogin";
		}
		
		if(!rDTO.getUser_id().equals(user_id)) {
			model.addAttribute("msg", "아이디 존재 하지 않습니다.");

			return "food/foodLogin";
		}
		
		if(rDTO.getUser_id().equals(user_id) && !rDTO.getUser_pwd().equals(user_pwd)) {
			model.addAttribute("msg", "비밀번호가 일치 하지 않습니다.");

			return "food/foodLogin";
		}

		// 입력한 아이디와 비밀번호 값이 일치하고 user_code와 user_key 값에 따라 노말 로그인 ceo 로그인 나눈다
		if (user_id.equals(rDTO.getUser_id()) && user_pwd.equals(rDTO.getUser_pwd()) && rDTO.getUser_code().equals("n")
				&& rDTO.getUser_key().contentEquals("Y")) {
			session.setAttribute("user", rDTO);
			
			System.out.println("코드 확인!!!!!!!!!!!!"+rDTO.getUser_code());
			
			model.addAttribute("msg", "일반 회원 로그인 성공");

			return "main/mainTest";
		} else if (user_id.equals(rDTO.getUser_id()) && user_pwd.equals(rDTO.getUser_pwd())
				&& rDTO.getUser_code().equals("c") && rDTO.getUser_key().contentEquals("Y")) {
			session.setAttribute("user", rDTO);
			
			System.out.println("코드 확인!!!!!!!!!!!!"+rDTO.getUser_code());
			
			model.addAttribute("msg", "ceo 회원 로그인 성공");

			return "main/mainTest";
		} else if (!rDTO.getUser_key().contentEquals("Y")) {

			model.addAttribute("msg", "이메일 인증을 해주셔야 로그인할수 있습니다.");

			return "food/foodLogin";
		} else {
			model.addAttribute("msg", "로그인 실패");

			return "food/foodLogin";
		}

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, ModelMap model) throws Exception {

		session.removeAttribute("user");
		model.addAttribute("msg", "로그아웃 하셨습니다.");

		return "/food/foodLogin";
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "food/find_id_form")
	public String find_id_form() throws Exception {
		return "food/find_id_form";
	}

	@RequestMapping(value = "food/find_id")
	public String find_id(@RequestParam("user_email") String user_email, ModelMap model, HttpServletRequest request)
			throws Exception {

		// 받을 결과값 아이디
		String user_id = "";

		user_id = foodService.getUserIdFromEmail(user_email);

		model.addAttribute("user_id", user_id);

		return "food/foodLogin";
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "food/find_pw_form")
	public String find_pw_form() throws Exception {
		return "food/find_pw_form";
	}

	@RequestMapping(value = "food/find_pw")
	public String find_pw(HttpServletRequest request, ModelMap model) throws Exception {

		String user_email = "";
		String user_id = "";
		String user_pwd = "";

		user_email = request.getParameter("user_email");
		user_id = request.getParameter("user_id");
		user_pwd = foodService.getUserPwFromEmail(user_id, user_email);

		model.addAttribute("user_pwd", user_pwd);

		return "food/foodLogin";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="food/stop")
	public String stop(HttpSession session, ModelMap model) throws Exception{
		
		FoodUserDTO pDTO = null;
		
		pDTO = (FoodUserDTO)session.getAttribute("user");
		
		int result = 0;
		
		result = foodService.deleteStop(pDTO.getUser_id());
		
		if(result >= 1) {
			model.addAttribute("msg", "회원 탈퇴 되었습니다.");
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패하였습니다.");
		}
		
		return "food/foodLogin";
	}

}
