package green.myT.dto;

public class AirResvList {
	int resv_no;		//	예약 번호
	int plane_seq;		//	비행기 번호
	String plane_no;	//	비행편명 정보
	String dept_city;
	String arrv_city;
	String flight_date;//	비행일자
	String dept_time;
	String arrv_time;
	String hour;
	String e_lastnm;	//	탑승자 영문 명
	String e_firstnm;	//	탑승자 영문 명
	String level;
	int price;
	String child;
	String resv_date;	//	예약 입력일자
	
	public int getResv_no() {
		return resv_no;
	}
	public void setResv_no(int resv_no) {
		this.resv_no = resv_no;
	}
	public int getPlane_seq() {
		return plane_seq;
	}
	public void setPlane_seq(int plane_seq) {
		this.plane_seq = plane_seq;
	}
	public String getPlane_no() {
		return plane_no;
	}
	public void setPlane_no(String plane_no) {
		this.plane_no = plane_no;
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
	public String getFlight_date() {
		return flight_date;
	}
	public void setFlight_date(String flight_date) {
		this.flight_date = flight_date;
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
	public String getE_lastnm() {
		return e_lastnm;
	}
	public void setE_lastnm(String e_lastnm) {
		this.e_lastnm = e_lastnm;
	}
	public String getE_firstnm() {
		return e_firstnm;
	}
	public void setE_firstnm(String e_firstnm) {
		this.e_firstnm = e_firstnm;
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
	public String getChild() {
		return child;
	}
	public void setChild(String child) {
		this.child = child;
	}

	public String getResv_date() {
		return resv_date;
	}
	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}
	
	
}
