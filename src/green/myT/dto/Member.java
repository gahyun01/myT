package green.myT.dto;

public class Member {
//	member;
//	+-----------+--------------+------+-----+---------+-------+
//	| Field     | Type         | Null | Key | Default | Extra |
//	+-----------+--------------+------+-----+---------+-------+
//	| user_id   | varchar(15)  | NO   | PRI | NULL    |       |
//	| pwd       | varchar(15)  | NO   |     | NULL    |       |
//	| k_lastnm  | varchar(30)  | NO   |     | NULL    |       |
//	| k_firstnm | varchar(30)  | NO   |     | NULL    |       |
//	| e_lastnm  | varchar(30)  | NO   |     | NULL    |       |
//	| e_firstnm | varchar(30)  | NO   |     | NULL    |       |
//	| gender    | varchar(1)   | NO   |     | NULL    |       |
//	| birth     | varchar(8)   | NO   |     | NULL    |       |
//	| email     | varchar(15)  | YES  |     | NULL    |       |
//	| email2    | varchar(15)  | YES  |     | NULL    |       |
//	| phone     | varchar(3)   | NO   |     | NULL    |       |
//	| phone1    | varchar(4)   | NO   |     | NULL    |       |
//	| phone2    | varchar(4)   | NO   |     | NULL    |       |
//	| post      | varchar(5)   | NO   |     | NULL    |       |
//	| addr      | varchar(100) | NO   |     | NULL    |       |
//	| reg_date  | datetime     | NO   |     | NULL    |       |
//	+-----------+--------------+------+-----+---------+-------+

	String user_id;
	String pwd;
	String k_lastnm;
	String k_firstnm;
	String e_lastnm;
	String e_firstnm;
	String gender;
	String birth;
	String email;
	String email2;
	String phone;
	String phone1;
	String phone2;
	String post;
	String addr;
	String reg_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getK_lastnm() {
		return k_lastnm;
	}
	public void setK_lastnm(String k_lastnm) {
		this.k_lastnm = k_lastnm;
	}
	public String getK_firstnm() {
		return k_firstnm;
	}
	public void setK_firstnm(String k_firstnm) {
		this.k_firstnm = k_firstnm;
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
