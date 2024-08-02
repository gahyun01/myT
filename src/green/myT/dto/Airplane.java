package green.myT.dto;

public class Airplane {
	
//	airplane;
//	+-------------+------------+------+-----+---------+----------------+
//	| Field       | Type       | Null | Key | Default | Extra          |
//	+-------------+------------+------+-----+---------+----------------+
//	| plane_seq   | int(11)    | NO   | PRI | NULL    | auto_increment |
//	| plane_no    | varchar(4) | NO   |     | NULL    |                |
//	| dept_time   | varchar(4) | NO   |     | NULL    |                |
//	| arrv_time   | varchar(4) | NO   |     | NULL    |                |
//	| hour        | varchar(10)| YES  |     | NULL    |                |
//	| dept_city   | varchar(20)| NO   |     | NULL    |                |
//	| arrv_city   | varchar(20)| NO   |     | NULL    |                |
//	| start_date  | varchar(8) | NO   |     | NULL    |                |
//	| end_date    | varchar(8) | NO   |     | NULL    |                |
//	| level       | varchar(5) | NO   |     | NULL    |                |
//	| price       | int(11)    | NO   |     | NULL    |                |
//	| seat_qntity | int(11)    | NO   |     | NULL    |                |
//	+-------------+------------+------+-----+---------+----------------+
	
	private String plane_seq;
	private String plane_no;
	private String dept_time;
	private String arrv_time;
	private String hour;
	private String dept_city;
	private String arrv_city;
	private String start_date;
	private String end_date;
	private String level ;
	private int price;
	private int seat_qntity;
	
	//	추가필드 탑승일자
	private String date;
	
	public String getPlane_seq() {
		return plane_seq;
	}
	public void setPlane_seq(String plane_seq) {
		this.plane_seq = plane_seq;
	}
	public String getPlane_no() {
		return plane_no;
	}
	public void setPlane_no(String plane_no) {
		this.plane_no = plane_no;
	}
	public String getDept_time() {
		return dept_time;
	}
	public void setDept_time(String dept_time) {
		this.dept_time = dept_time;
	}
	public String getArrv_time() {
		return arrv_time;
	}
	public void setArrv_time(String arrv_time) {
		this.arrv_time = arrv_time;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getDept_city() {
		return dept_city;
	}
	public void setDept_city(String dept_city) {
		this.dept_city = dept_city;
	}
	public String getArrv_city() {
		return arrv_city;
	}
	public void setArrv_city(String arrv_city) {
		this.arrv_city = arrv_city;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSeat_qntity() {
		return seat_qntity;
	}
	public void setSeat_qntity(int seat_qntity) {
		this.seat_qntity = seat_qntity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

}
