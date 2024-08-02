package green.myT.dto;

public class CarResv {
//	car_resv;
//	+-----------+-------------+------+-----+---------+-------+
//	| Field     | Type        | Null | Key | Default | Extra |
//	+-----------+-------------+------+-----+---------+-------+
//	| resv_no   | varchar(20) | NO   | PRI | NULL    |       |
//	| user_id   | varchar(15) | NO   |     | NULL    |       |
//	| pay_no    | varchar(8)  | NO   |     | NULL    |       |
//	| resv_date | datetime    | NO   |     | NULL    |       |
//	+-----------+-------------+------+-----+---------+-------+

	private String resv_no;
	private String user_id;
	private int pay_no;
	private String resv_date;
	
	public String getResv_no() {
		return resv_no;
	}
	public void setResv_no(String resv_no) {
		this.resv_no = resv_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getResv_date() {
		return resv_date;
	}
	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}

	
}
