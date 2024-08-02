package green.myT.dto;

public class Parameter {
	//	SQL문을 위한 Parameter를 담는 class
	private String dept_city;
	private String arrv_city;
	private String date;
	
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
