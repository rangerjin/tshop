package poly.dto;

public class UserDTO {
	
	private String user_no; // 유저테이블 primarykey  
	private String user_id; // 유저 테이블 id
	private String user_pwd; // 유저 테이블 비밀번호
	private String user_name; // 유저 테이블 이름
	private String user_tel; // 유저 테이블 전화번호
	private String user_loc; // 유저 테이블 주소1
	private String user_loc2; // 유저 테이블 주소2
	private String user_email; // 유저 테이블 이메일
	private String user_authkey; // 유저 테이블 이메일인증 코드 y 인증 n 미인증
	private String user_code; // 유저 테이블 일반사용자 n, 판매자 s
	private String user_key;
	private String user_regdate; // 유저 테이블 가입 날짜
	private String user_regno; // 유저 테이블 등록자 번호
	private String user_update; // 유저 테이블 수정 날짜
	private String user_updno; // 유저 테이블 수정자 번호
	
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_loc() {
		return user_loc;
	}
	public void setUser_loc(String user_loc) {
		this.user_loc = user_loc;
	}
	public String getUser_loc2() {
		return user_loc2;
	}
	public void setUser_loc2(String user_loc2) {
		this.user_loc2 = user_loc2;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_authkey() {
		return user_authkey;
	}
	public void setUser_authkey(String user_authkey) {
		this.user_authkey = user_authkey;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getUser_regno() {
		return user_regno;
	}
	public void setUser_regno(String user_regno) {
		this.user_regno = user_regno;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	public String getUser_updno() {
		return user_updno;
	}
	public void setUser_updno(String user_updno) {
		this.user_updno = user_updno;
	}
	
	@Override
	public String toString() {
		return "UserDTO [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", user_tel=" + user_tel + ", user_loc=" + user_loc + ", user_loc2=" + user_loc2
				+ ", user_email=" + user_email + ", user_authkey=" + user_authkey + ", user_code=" + user_code
				+ ", user_key=" + user_key + ", user_regdate=" + user_regdate + ", user_regno=" + user_regno
				+ ", user_update=" + user_update + ", user_updno=" + user_updno + "]";
	}
	
	
	
}
