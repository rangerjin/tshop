package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IMailService;
import poly.service.ITShopService;
import poly.util.CmmUtil;

@Controller
public class TShopController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "TShopService")
	private ITShopService tshopService;
	
	@Resource(name = "MailService")
	private IMailService mailService;

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

		return "tshop/loginPage";
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
		
		// 이메일 인증 코드 발송
		try {
			mailService.mailSendWithUserKey(pDTO.getUser_email(), pDTO.getUser_id(), request);
		} catch (Exception e) {
			e.toString();
		}
		
		log.info(this.getClass().getName() + " 이메일 코드 발송 후!!");
		
		

		return "redirect:/tshop/login.do";
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
	
	

}
