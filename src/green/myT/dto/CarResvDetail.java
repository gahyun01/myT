package green.myT.dto;

public class CarResvDetail {
//	car_resv_detail;
//	+----------------+-------------+------+-----+---------+-------+
//	| Field          | Type        | Null | Key | Default | Extra |
//	+----------------+-------------+------+-----+---------+-------+
//	| resv_no        | varchar(20) | NO   |     | NULL    |       |
//	| resv_detail_no | int(11)     | NO   |     | NULL    |       |
//	| car_no         | varchar(10) | NO   |     | NULL    |       |
//	| capacity       | int(11)     | NO   |     | NULL    |       |
//	| pick_date      | varchar(8)  | NO   |     | NULL    |       |
//	| pick_time      | int(11)     | NO   |     | NULL    |       |
//	| arrv_addr      | varchar(50) | NO   |     | NULL    |       |
//	+----------------+-------------+------+-----+---------+-------+
	
	private String resv_no;
	private int resv_detail_no;
	private String car_no;
	private int capacity;
	private String pick_date;
	private int pick_time;
	private String arrv_addr;
	
	public String getResv_no() {
		return resv_no;
	}
	public void setResv_no(String resv_no) {
		this.resv_no = resv_no;
	}
	public int getResv_detail_no() {
		return resv_detail_no;
	}
	public void setResv_detail_no(int resv_detail_no) {
		this.resv_detail_no = resv_detail_no;
	}
	public String getCar_no() {
		return car_no;
	}
	public void setCar_no(String car_no) {
		this.car_no = car_no;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getPick_date() {
		return pick_date;
	}
	public void setPick_date(String pick_date) {
		this.pick_date = pick_date;
	}
	public int getPick_time() {
		return pick_time;
	}
	public void setPick_time(int pick_time) {
		this.pick_time = pick_time;
	}
	public String getArrv_addr() {
		return arrv_addr;
	}
	public void setArrv_addr(String arrv_addr) {
		this.arrv_addr = arrv_addr;
	}
}
