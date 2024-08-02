package green.myT.dto;

// festival 테이블과 festival_photo 테이블을 합친 dto.

public class Festival {
	int in_no;
	String city_no;
	String festv_name;
	String festv_ename;
	String festv_title;
	String festv_detail;
	String festv_start;
	String festv_end;
	String festv_place;
	int festv_cprice;
	int festv_aprice;
	int ex_no;
	String ex_detail;
	String ex_img;
		
	public int getIn_no() {
		return in_no;
	}
	public void setIn_no(int in_no) {
		this.in_no = in_no;
	}
	public String getCity_no() {
		return city_no;
	}
	public void setCity_no(String city_no) {
		this.city_no = city_no;
	}
	public String getFestv_name() {
		return festv_name;
	}
	public void setFestv_name(String festv_name) {
		this.festv_name = festv_name;
	}
	public String getFestv_ename() {
		return festv_ename;
	}
	public void setFestv_ename(String festv_ename) {
		this.festv_ename = festv_ename;
	}
	public String getFestv_title() {
		return festv_title;
	}
	public void setFestv_title(String festv_title) {
		this.festv_title = festv_title;
	}
	public String getFestv_detail() {
		return festv_detail;
	}
	public void setFestv_detail(String festv_detail) {
		this.festv_detail = festv_detail;
	}
	public String getFestv_start() {
		return festv_start;
	}
	public void setFestv_start(String festv_start) {
		this.festv_start = festv_start;
	}
	public String getFestv_end() {
		return festv_end;
	}
	public void setFestv_end(String festv_end) {
		this.festv_end = festv_end;
	}
	public String getFestv_place() {
		return festv_place;
	}
	public void setFestv_place(String festv_place) {
		this.festv_place = festv_place;
	}
	public int getFestv_cprice() {
		return festv_cprice;
	}
	public void setFestv_cprice(int festv_cprice) {
		this.festv_cprice = festv_cprice;
	}
	public int getFestv_aprice() {
		return festv_aprice;
	}
	public void setFestv_aprice(int festv_aprice) {
		this.festv_aprice = festv_aprice;
	}
	public int getEx_no() {
		return ex_no;
	}
	public void setEx_no(int ex_no) {
		this.ex_no = ex_no;
	}
	public String getEx_detail() {
		return ex_detail;
	}
	public void setEx_detail(String ex_detail) {
		this.ex_detail = ex_detail;
	}
	public String getEx_img() {
		return ex_img;
	}
	public void setEx_img(String ex_img) {
		this.ex_img = ex_img;
	}
}