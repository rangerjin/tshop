package poly.dto;

public class MenuDTO {

	private String menu_no; // 메뉴 번호
	private String menu_name; // 메뉴이름
	private String menu_exp; // 메뉴 설명
	private String menu_img; // 메뉴 이미지 파일저장
	private String menu_cost; // 메뉴 가격
	private String menu_str_no; // 매장번호 fk
	private String user_id; // ceo 작성자 아이디 fk
	private String menu_regdate; // 메뉴 작성일
	private String menu_update; // 메뉴 수정일
	
	public String getMenu_regdate() {
		return menu_regdate;
	}
	public void setMenu_regdate(String menu_regdate) {
		this.menu_regdate = menu_regdate;
	}
	public String getMenu_update() {
		return menu_update;
	}
	public void setMenu_update(String menu_update) {
		this.menu_update = menu_update;
	}
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_exp() {
		return menu_exp;
	}
	public void setMenu_exp(String menu_exp) {
		this.menu_exp = menu_exp;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	public String getMenu_cost() {
		return menu_cost;
	}
	public void setMenu_cost(String menu_cost) {
		this.menu_cost = menu_cost;
	}
	public String getMenu_str_no() {
		return menu_str_no;
	}
	public void setMenu_str_no(String menu_str_no) {
		this.menu_str_no = menu_str_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
