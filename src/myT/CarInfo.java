package myT;


public class CarInfo {
//	car_info
//	+----------+-------------+------+-----+---------+-------+
//	| Field    | Type        | Null | Key | Default | Extra |
//	+----------+-------------+------+-----+---------+-------+
//	| car_no   | varchar(10) | NO   | PRI | NULL    |       |
//	| capacity | int(11)     | YES  |     | NULL    |       |
//	| city_knm | varchar(20) | NO   |     | NULL    |       |
//	| price    | int(11)     | YES  |     | NULL    |       |
//	+----------+-------------+------+-----+---------+-------+
	
	private String carNo;
	private int capacity;
	private String cityKnm;
	private int price;
	
	public String getCarNo() {
		return carNo;
	}

	public int getCapacity() {
		return capacity;
	}

	public String getCityKnm() {
		return cityKnm;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	public void setCityKnm(String cityKnm) {
		this.cityKnm = cityKnm;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
