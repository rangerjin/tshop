package poly.dto;

public class CategoryDTO {

	private String category_no; // 카테고리 번호
	private String category_name; // 카테고리 이름 // ex) 드라마, 영화, 예능
	private String category_program; // 카테고르 프로그램 이름

	public String getCategory_no() {
		return category_no;
	}

	public void setCategory_no(String category_no) {
		this.category_no = category_no;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getCategory_program() {
		return category_program;
	}

	public void setCategory_program(String category_program) {
		this.category_program = category_program;
	}

	@Override
	public String toString() {
		return "CategoryDTO [category_no=" + category_no + ", category_name=" + category_name + ", category_program="
				+ category_program + "]";
	}
	
	


}
