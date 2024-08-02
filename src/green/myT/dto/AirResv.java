package green.myT.dto;

public class AirResv {
//	air_resv;
//	+-------------+-------------+------+-----+---------+----------------+
//	| Field       | Type        | Null | Key | Default | Extra          |
//	+-------------+-------------+------+-----+---------+----------------+
//	| resv_no     | int(11)     | NO   | PRI | NULL    | auto_increment |
//	| user_id     | varchar(15) | NO   |     | NULL    |                |
//	| plane_seq   | int(11)     | NO   |     | NULL    |                |
//	| flight_date | varchar(8)  | NO   |     | NULL    |                |
//	| guest_num   | int(11)     | NO   |     | NULL    |                |
//	+-------------+-------------+------+-----+---------+----------------+
	
	int resv_no;
	String user_id;
	int plane_seq;
	String flight_date;
	int guest_num;
	
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
	public int getPlane_seq() {
		return plane_seq;
	}
	public void setPlane_seq(int plane_seq) {
		this.plane_seq = plane_seq;
	}
	public String getFlight_date() {
		return flight_date;
	}
	public void setFlight_date(String flight_date) {
		this.flight_date = flight_date;
	}
	public int getGuest_num() {
		return guest_num;
	}
	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}
}
