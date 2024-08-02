package green.myT.dto;

public class CarPickup {
//	 car_pickup;
//	 +--------------------+-------------+------+-----+---------+----------------+
//	 | Field              | Type        | Null | Key | Default | Extra          |
//	 +--------------------+-------------+------+-----+---------+----------------+
//	 | resv_no            | int(11)     | NO   | PRI | NULL    | auto_increment |
//	 | user_id            | varchar(15) | NO   |     | NULL    |                |
//	 | air_resv_detail_no | int(11)     | NO   |     | NULL    |                |
//	 | car_no             | varchar(10) | NO   |     | NULL    |                |
//	 | guest_num          | int(11)     | YES  |     | NULL    |                |
//	 | pick_date          | varchar(8)  | NO   |     | NULL    |                |
//	 | pick_time          | int(11)     | NO   |     | NULL    |                |
//	 | arrv_addr          | varchar(50) | NO   |     | NULL    |                |
//	 | pay_no             | varchar(8)  | YES  |     | NULL    |                |
//	 | resv_date          | datetime    | NO   |     | NULL    |                |
//	 +--------------------+-------------+------+-----+---------+----------------+
	
	private int resv_no;
	private String user_id;
	private int air_resv_detail_no;
	private String car_no;
	private int guest_num;
	private String pick_date;
	private int pick_time;
	private String arrv_addr;
	private String pay_no;
	private String resv_date;

	//	pick 신청 리스트를 위한 추가적인 필드
	private String city_knm;
	private int capacity;

	public String getCity_knm() {
		return city_knm;
	}
	public void setCity_knm(String city_knm) {
		this.city_knm = city_knm;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getResv_no() {
		return resv_no;
	}
	public void setResv_no(int resv_no) {
		this.resv_no = resv_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAir_resv_detail_no() {
		return air_resv_detail_no;
	}
	public void setAir_resv_detail_no(int air_resv_detail_no) {
		this.air_resv_detail_no = air_resv_detail_no;
	}
	public String getCar_no() {
		return car_no;
	}
	public void setCar_no(String car_no) {
		this.car_no = car_no;
	}
	public int getGuest_num() {
		return guest_num;
	}
	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
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
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public String getResv_date() {
		return resv_date;
	}
	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}
	

}
