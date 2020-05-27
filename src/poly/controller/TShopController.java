package poly.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TShopController {

	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * @RequestMapping(value = "tshop/main") public String
	 * tShopMain(HttpServletRequest request) throws Exception{
	 * 
	 * log.info(this.getClass().getName() + ".tShopMain Page Start!!");
	 * 
	 * return "tshop/tshopMain"; }
	 */
	
	@RequestMapping(value = "tshop/test")
	public String tshopMain(HttpServletRequest request) throws Exception{
		
		log.info(this.getClass().getName() + ".tShopMain Page Start!!");
		
		//return "tshop/tshopMain";
		
		return "tshop/tshopMain";
	}
	
}
