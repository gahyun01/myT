package green.myT.dto;

public class AirResvInfo {
//	air_resv_info;
//	+--------------+-------------+------+-----+---------+----------------+
//	| Field        | Type        | Null | Key | Default | Extra          |
//	+--------------+-------------+------+-----+---------+----------------+
//	| resv_info_no | int(11)     | NO   | PRI | NULL    | auto_increment |
//	| resv_no      | int(11)     | NO   |     | NULL    |                |
//	| e_lastnm     | varchar(30) | NO   |     | NULL    |                |
//	| e_firstnm    | varchar(30) | NO   |     | NULL    |                |
//	| gender       | varchar(1)  | NO   |     | NULL    |                |
//	| birth        | varchar(8)  | NO   |     | NULL    |                |
//	| child        | varchar(1)  | NO   |     | NULL    |                |
//	| email        | varchar(15) | NO   |     | NULL    |                |
//	| email2       | varchar(15) | NO   |     | NULL    |                |
//	| phone        | varchar(11) | NO   |     | NULL    |                |
//	| reg_date     | datetime    | YES  |     | NULL    |                |
//	+--------------+-------------+------+-----+---------+----------------+
	

	int resv_info_no;
	int resv_no;
	String e_lastnm;
	String e_firstnm;
	String gender;
	String birth;
	String child;
	String email;
	String email2;
	String phone;
	String reg_date;
	

	//	입력 받은 생년월일과 출발일로 소아 여부 확인하기 : 출발일 기준으로 만12세 생일부터 성인
	//	return 0 : 성인, 1: 소아
	public String checkChild(String birth_date, String dept_date) {
		int dept = Integer.parseInt(dept_date);
		int birth = Integer.parseInt(birth_date);
		
		int gap = dept - birth;
		//	만 12세 이상일 경우  성인이므로 0 return
		if( gap >= 120000 )
			return "0";
		else
			return "1";
	}
	
	public int getResv_info_no() {
		return resv_info_no;
	}
	public void setResv_info_no(int resv_info_no) {
		this.resv_info_no = resv_info_no;
	}
	public int getResv_no() {
		return resv_no;
	}
	public void setResv_no(int resv_no) {
		this.resv_no = resv_no;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getChild() {
		return child;
	}
	public void setChild(String child) {
		this.child = child;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
