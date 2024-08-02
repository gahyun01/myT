package myT;


public class CarReview {
//	car_review
//	+----------+-------------+------+-----+---------+----------------+
//	| Field    | Type        | Null | Key | Default | Extra          |
//	+----------+-------------+------+-----+---------+----------------+
//	| rv_no    | int(11)     | NO   | PRI | NULL    | auto_increment |
//	| city_knm | varchar(20) | NO   |     | NULL    |                |
//	| capacity | int(11)     | YES  |     | NULL    |                |
//	| title    | varchar(30) | NO   |     | NULL    |                |
//	| cont     | text        | NO   |     | NULL    |                |
//	| user_id  | varchar(15) | NO   |     | NULL    |                |
//	| reg_date | datetime    | NO   |     | NULL    |                |
//	+----------+-------------+------+-----+---------+----------------+
	
	private int rvNo;
	private String cityKnm;
	private int capacity;
	private String title;
	private String cont;
	private String userId;
	private String regDate;
	
	public int getRvNo() {
		return rvNo;
	}

	public String getCityKnm() {
		return cityKnm;
	}
	
	public int getCapacity() {
		return capacity;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getCont() {
		return cont;
	}

	public String getUserId() {
		return userId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public void setCityKnm(String cityKnm) {
		this.cityKnm = cityKnm;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


}
