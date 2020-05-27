package poly.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import poly.dto.FoodStrDTO;
import poly.dto.FoodUserDTO;
import poly.dto.MenuDTO;
import poly.dto.StrReviewDTO;
import poly.service.IMainService;
import poly.util.CmmUtil;
import poly.util.Paging;

@Controller
public class MainController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MainService")
	private IMainService mainService;

	// 로그인 메인 화면
	@RequestMapping(value = "food/main")
	public String foodLoginMain(HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + ".food/userLogin Page!");

		return "main/mainTest";
	}

	// 마이페이지 수정페이지
	@RequestMapping(value = "food/myPageForm")
	public String modifyForm(HttpSession session) throws Exception {

		log.info(this.getClass().getName() + ".food/modifyForm Page!");

		return "main/myPageForm";
	}

	// 마이페이지 정보가기
	@RequestMapping(value = "food/myPage")
	public String myPage(HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".food/myPage start!");

		FoodUserDTO pDTO = null;

		pDTO = (FoodUserDTO) session.getAttribute("user");

		model.addAttribute("pDTO", pDTO);

		return "main/myPageForm";
	}

	// 마이페이지 수정페이지로 가기
	@RequestMapping(value = "food/modifyForm")
	public String modifyForm(HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".food/myPage start!");

		FoodUserDTO pDTO = null;

		pDTO = (FoodUserDTO) session.getAttribute("user");

		model.addAttribute("pDTO", pDTO);

		return "main/modify";
	}

	// 마이페이지 수정페이지
	@RequestMapping(value = "food/modify", method=RequestMethod.POST)
	public String modify(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".food/modifyForm Page!");
		
		FoodUserDTO user = new FoodUserDTO();
		
		user = (FoodUserDTO) session.getAttribute("user");
		
		user.setUser_id(request.getParameter("user_id"));
		user.setUser_email(request.getParameter("user_email"));
		user.setUser_pwd(request.getParameter("user_pwd"));
		user.setUser_loc(request.getParameter("user_loc"));

		int result = 0;

		result = mainService.updateUserModify(user);

		if (result >= 1) {
			model.addAttribute("msg", "수정 성공!!");
		} else {
			model.addAttribute("msg", "수정 실패!!");
		}
		
		// 세션에 기존의 정보를 제거
		session.removeAttribute("user");
		
		// 세션에 업데이트된 유저 정보 기입
		session.setAttribute("user", user);

		// 수정후 정보페이지로 이동
		return "redirect:/food/myPage.do";
	}

	// 매장 리스트 출력
	@RequestMapping(value = "main/strList")
	public String getStrList(@RequestParam(value = "searchOption", defaultValue="") String searchOption, 
			@RequestParam(value="nowPage", defaultValue="1")String nowPage,
			ModelMap model, HttpSession session)
			throws Exception {
		
		List<FoodStrDTO> strList = new ArrayList<FoodStrDTO>();
		
		if(searchOption==null) {
			searchOption = "";
		}

		if (searchOption == "") {
			strList = mainService.getStrList();
		} else if (searchOption != null && searchOption != "") {
			strList = mainService.getStrList(searchOption);
		}
		
		
		// 페이징
		int page = 0;
		Paging paging = new Paging();
		if(nowPage !=null){
			page = new Integer(nowPage) -1; 
		}
			
		paging.setPageNo(page+1);
		paging.setPageSize(6); // 한 페이지당 몇개 보여줄건지
		paging.setTotalCount(strList.size());
		int startIndex = 0 + (paging.getPageSize()*page);
		int endIndex = paging.getPageSize() + (paging.getPageSize() * page);
		if(endIndex > strList.size()){
			endIndex = strList.size();
		}
		strList = strList.subList(startIndex, endIndex);
			
		model.addAttribute("strList", strList);
		model.addAttribute("paging", paging);
		session.setAttribute("searchOption", searchOption);

		return "main/strListPage";
	}

	// 매장 정보 읽기 댓글 리스트 출력 메뉴 리스트 출력
	@RequestMapping(value = "main/strInfo")
	public String getStrInfo(@RequestParam(value = "str_no") String str_no, ModelMap model,
			@RequestParam(value="menuNowPage", defaultValue="1")String menuNowPage,
			@RequestParam(value="reviewNowPage", defaultValue="1")String reviewNowPage
			) throws Exception {

		FoodStrDTO strInfo = new FoodStrDTO();
		strInfo = mainService.getStrInfo(str_no);

		List<StrReviewDTO> reviewList = new ArrayList<StrReviewDTO>();
		reviewList = mainService.getReviewList(strInfo.getStr_no());
		
		List<MenuDTO> menuList = new ArrayList<MenuDTO>();
		menuList = mainService.getMenuList(strInfo.getStr_no());
		
		// 메뉴 페이징
		int menuPage = 0;
		Paging menuPaging = new Paging();
		if(menuNowPage !=null){
			menuPage = new Integer(menuNowPage) -1; 
		}
					
		menuPaging.setPageNo(menuPage+1);
		menuPaging.setPageSize(4); // 한 페이지당 몇개 보여줄건지
		menuPaging.setTotalCount(menuList.size());
		int startIndex = 0 + (menuPaging.getPageSize()*menuPage);
		int endIndex = menuPaging.getPageSize() + (menuPaging.getPageSize() * menuPage);
		if(endIndex > menuList.size()){
			endIndex = menuList.size();
		}
		menuList = menuList.subList(startIndex, endIndex);
		
		// 페이징
		int reviewPage = 0;
		Paging reviewPaging = new Paging();
		if(reviewNowPage !=null){
			reviewPage = new Integer(reviewNowPage) -1; 
		}
			
		reviewPaging.setPageNo(reviewPage+1);
		reviewPaging.setPageSize(10); // 한 페이지당 몇개 보여줄건지
		reviewPaging.setTotalCount(reviewList.size());
		int rStartIndex = 0 + (reviewPaging.getPageSize()*reviewPage);
		int rEndIndex = reviewPaging.getPageSize() + (reviewPaging.getPageSize() * reviewPage);
		if(rEndIndex > reviewList.size()){
			rEndIndex = reviewList.size();
		}
		reviewList = reviewList.subList(rStartIndex, rEndIndex);
		

		model.addAttribute("strInfo", strInfo);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("str_no", str_no);
		model.addAttribute("menuPaging", menuPaging);
		model.addAttribute("reviewPaging", reviewPaging);
		model.addAttribute("menuNowPage", menuNowPage);
		model.addAttribute("reviewNowPage", reviewNowPage);

		return "main/strInfoPage";
	}

	// 댓글 정보 수정
	@RequestMapping(value = "main/updateReviewInfo")
	public String updateReviewInfo(StrReviewDTO pDTO, ModelMap model) throws Exception {

		pDTO = mainService.updateReviewInfo(pDTO);

		model.addAttribute("str", "댓글 정보 수정!!");

		return "redirect:/main/strInfoPage";
	}

	// 댓글 삭제
	@RequestMapping(value = "main/deleteReview")
	public String deleteReview(@RequestParam(value = "review_no") String review_no, ModelMap model) throws Exception {

		int result = 0;
		result = mainService.deleteReview(review_no);
		if (result >= 1) {
			model.addAttribute("msg", "댓글 삭제 성공");
		} else {
			model.addAttribute("msg", "댓글 삭제 실패");
		}
		return "redirect:/main/strInfoPage";
	}

	// 댓글 생성
	@RequestMapping(value = "main/insertReview")
	public String insertReview(StrReviewDTO pDTO, ModelMap model) throws Exception {

		int result = 0;
		result = mainService.insertReview(pDTO);
		if (result >= 1) {
			model.addAttribute("msg", "댓글 생성 성공");
		} else {
			model.addAttribute("msg", "댓글 생성 실패");
		}

		return "redirect:/main/strInfoPage";
	}

	// 댓글 리스트, 생성 테스트
	/**
	 * 댓글 등록(Ajax) 댓글 등록 성공시 sucess
	 * 
	 * @param boardVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/addComment.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String ajax_addComment(@ModelAttribute("StrReviewDTO") StrReviewDTO strReviewDTO, HttpServletRequest request, HttpSession session)
			throws Exception {
		System.out.println("ajax_addComment 시작!!");

		FoodUserDTO user = (FoodUserDTO) session.getAttribute("user");
		
		if (strReviewDTO == null) {
			strReviewDTO = new StrReviewDTO();
		}
		System.out.println("strReviewDTO 확안 : " + strReviewDTO.toString());
		
		String review_cont = (String) request.getAttribute("review_cont");
		String user_id = (String) request.getAttribute("user_id");
		String str_no = (String) request.getAttribute("str_no");

		System.out.println("세션 유저 아이디 확인!!" + user.getUser_id());
		System.out.println(review_cont);
		System.out.println(user_id);
		System.out.println(str_no);
		System.out.println("댓글 등록 시작, 리뷰 등록 정보 확인 !!!!!" + strReviewDTO);

		
		
		System.out.println("strReviewDTO 확인!!" + strReviewDTO);

		int result = 0;
		
		try {

			result = mainService.addComment(strReviewDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if(result >= 1) {
			return "success";
		}else {
			return "fail";
		}
	}

	/**
	 * 게시물 댓글 불러오기(Ajax)
	 * 
	 * @param boardVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/reviewList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity ajax_commentList(@ModelAttribute("strReviewDTO") StrReviewDTO strReviewDTO,
			HttpServletRequest request) throws Exception {
		
		System.out.println("ajax_commentList 시작");

		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		// 해당 게시물 댓글 리스트
		List<StrReviewDTO> reviewList = mainService.selectBoardCommentByCode(strReviewDTO);

		if (reviewList.size() > 0) {
			for (int i = 0; i < reviewList.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("review_no", reviewList.get(i).getReview_no()); // 리뷰 번호
				hm.put("review_cont", reviewList.get(i).getReview_cont()); // 리뷰 내용
				hm.put("user_id", reviewList.get(i).getUser_id()); // 리뷰 작성자

				hmlist.add(hm);
			}

		}

		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);

	}

	// 댓글 리스트, 생성 테스트
	
	// 댓글 등록 ajax
	/**
	 * 댓글 등록
	 * 
	 * @param review_cont, user_id, review_str_no
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main/insertReview", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String insertReview(HttpServletRequest request) throws Exception {

		String user_id = request.getParameter("user_id");
		String review_cont = request.getParameter("review_cont");
		String review_str_no = request.getParameter("review_str_no");
		
		StrReviewDTO pDTO = new StrReviewDTO();
		
		pDTO.setUser_id(user_id);
		pDTO.setReview_cont(review_cont);
		pDTO.setReview_str_no(review_str_no);
		
		int result = 0;

		try {
			result = mainService.insertReview(pDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result >=1) {
			return "success";
		}else {
			return "fail";
		}

	}
	
	// 댓글 리스트 ajax
	@RequestMapping(value="/main/selectReviewList", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public List<StrReviewDTO> selectReviewList(HttpServletRequest request) throws Exception{
		
		String review_str_no = request.getParameter("review_str_no");
		
		List<StrReviewDTO> reviewList = new ArrayList<StrReviewDTO>();
				
		reviewList = mainService.getReviewList(review_str_no);
		
		return reviewList;
		
		
	}
	
	// 리뷰 등록
	@RequestMapping(value="main/insertReviewNoAjax", method = RequestMethod.POST)
	public String insertReviewNoAjax(HttpServletRequest request) throws Exception {
		
		System.out.println("리뷰 등록 스타트!!!!!!!!!!!!!!!!!!");
		
		System.out.println(request.getParameter("review_cont"));
		System.out.println(request.getParameter("review_str_no"));
		System.out.println(request.getParameter("user_id"));
		
		StrReviewDTO pDTO = new StrReviewDTO();
		
		pDTO.setReview_cont(request.getParameter("review_cont"));
		pDTO.setReview_str_no(request.getParameter("review_str_no"));
		pDTO.setUser_id(request.getParameter("user_id"));
		
		// 댓글 등록
		mainService.insertReviewNoAjax(pDTO);
		
		return "redirect:/main/strInfo.do?str_no="+request.getParameter("review_str_no");
		
	}
	
	// 리뷰 삭제 noAjax
	@RequestMapping(value="main/deleteReviewNoAjax",method = RequestMethod.GET)
	public String deleteReviewNoAjax(HttpServletRequest request, @RequestParam(value="review_no")String review_no) throws Exception{
		
		System.out.println("review_no 확인 !! : " + review_no);

		// 리뷰 정보 찾기
		StrReviewDTO pDTO = new StrReviewDTO();
		pDTO = mainService.getReviewInfo(review_no);
		
		System.out.println(pDTO);
		
		String str_no = pDTO.getReview_str_no();
		
		System.out.println("리뷰 삭제전");
		// 리뷰 삭제
		mainService.deleteReviewNoAjax(review_no);
		System.out.println("리뷰 삭제후 ");
		
		return "redirect:/main/strInfo.do?str_no="+str_no;
		
	}
	
	// 리뷰 수정Form noAjax
	@RequestMapping(value="main/updateReviewFormNoAjax")
	public String updateReviewFormNoAjax(HttpServletRequest request, @RequestParam(value="review_no")String review_no, ModelMap model,
			@RequestParam(value="reviewNowPage", defaultValue="1")String reviewNowPage) throws Exception {
		
		StrReviewDTO rDTO = new StrReviewDTO();
		// 리뷰 정보 찾기
		rDTO = mainService.getReviewInfo(request.getParameter("review_no"));
		
		model.addAttribute("review", rDTO);
		model.addAttribute("reviewNowPage", reviewNowPage);
		
		return "main/updateReviewForm";
		
	}
	// 리뷰 수정 noAjax
	@RequestMapping(value="main/updateReviewNoAjax")
	public String updateReviewNoAjax(StrReviewDTO review,
			@RequestParam(value = "reviewNowPage", defaultValue = "1") String reviewNowPage, HttpServletRequest request) throws Exception {
		
		StrReviewDTO pDTO = new StrReviewDTO();
		
		pDTO.setReview_no(request.getParameter("review_no"));
		pDTO.setReview_cont(request.getParameter("review_cont"));
		pDTO.setUser_id(request.getParameter("user_id"));
		pDTO.setReview_str_no(request.getParameter("review_str_no"));
		
		String str_no = pDTO.getReview_str_no();
		
		mainService.updateReviewNoAjax(pDTO);
		
		return "redirect:/main/strInfo.do?str_no=" + request.getParameter("review_str_no") + "&reviewNowPage="
		+ reviewNowPage;
		
	}
	
}
