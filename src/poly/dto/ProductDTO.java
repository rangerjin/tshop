package poly.dto;

public class ProductDTO {

	private String product_no; // 상품 번호
	private String product_name; // 상품 이름
	private String product_price; // 상품 가격
	private String product_exp; // 상품 설명
	private String product_img; // 상품 이미지 파일 이름
	private String user_id; // 상품 판매자 아이디
	private String product_regdate; // 상품 등록일
	private String product_update; // 상품 수정일
	private String product_views; // 상품 조회수
	
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_exp() {
		return product_exp;
	}
	public void setProduct_exp(String product_exp) {
		this.product_exp = product_exp;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_regdate() {
		return product_regdate;
	}
	public void setProduct_regdate(String product_regdate) {
		this.product_regdate = product_regdate;
	}
	public String getProduct_update() {
		return product_update;
	}
	public void setProduct_update(String product_update) {
		this.product_update = product_update;
	}
	public String getProduct_views() {
		return product_views;
	}
	public void setProduct_views(String product_views) {
		this.product_views = product_views;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_exp=" + product_exp + ", product_img=" + product_img + ", user_id="
				+ user_id + ", product_regdate=" + product_regdate + ", product_update=" + product_update
				+ ", product_views=" + product_views + "]";
	}
	
	
	
}
