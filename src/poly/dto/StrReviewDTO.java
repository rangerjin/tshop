package poly.dto;

public class StrReviewDTO {

	private String review_no;
	private String review_cont;
	private String review_regdate;
	private String review_update;
	private String review_star;
	private String review_str_no;
	private String user_id;
	
	@Override
	public String toString() {
		return "StrReviewDTO [review_no=" + review_no + ", review_cont=" + review_cont + ", review_regdate="
				+ review_regdate + ", review_update=" + review_update + ", review_star=" + review_star
				+ ", review_str_no=" + review_str_no + ", user_id=" + user_id + "]";
	}
	public String getReview_no() {
		return review_no;
	}
	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	public String getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}
	public String getReview_update() {
		return review_update;
	}
	public void setReview_update(String review_update) {
		this.review_update = review_update;
	}
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public String getReview_str_no() {
		return review_str_no;
	}
	public void setReview_str_no(String review_str_no) {
		this.review_str_no = review_str_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	
	
}
