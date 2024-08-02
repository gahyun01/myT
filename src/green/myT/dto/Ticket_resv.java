package green.myT.dto;

public class Ticket_resv {
	String resv_no;
	String user_id;
	String cl_no;
	String in_no;
	String visit_date;
	String leave_date;
	int tck_price;
	String pay_no;
	int tck_count;
	
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
	public String getCl_no() {
		return cl_no;
	}
	public void setCl_no(String cl_no) {
		this.cl_no = cl_no;
	}
	public String getIn_no() {
		return in_no;
	}
	public void setIn_no(String in_no) {
		this.in_no = in_no;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	public int getTck_price() {
		return tck_price;
	}
	public void setTck_price(int tck_price) {
		this.tck_price = tck_price;
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public int getTck_count() {
		return tck_count;
	}
	public void setTck_count(int tck_count) {
		this.tck_count = tck_count;
	}
}
