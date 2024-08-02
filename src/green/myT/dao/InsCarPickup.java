package green.myT.dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.*;

public class InsCarPickup implements MapperInterface{
	static InsCarPickup bb = new InsCarPickup();
	
	public static InsCarPickup getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
//		 car_pickup;
//		 +--------------------+-------------+------+-----+---------+----------------+
//		 | Field              | Type        | Null | Key | Default | Extra          |
//		 +--------------------+-------------+------+-----+---------+----------------+
//		 | resv_no            | int(11)     | NO   | PRI | NULL    | auto_increment |
//		 | user_id            | varchar(15) | NO   |     | NULL    |                |
//		 | air_resv_detail_no | int(11)     | NO   |     | NULL    |                |
//		 | car_no             | varchar(10) | NO   |     | NULL    |                |
//		 | guest_num          | int(11)     | YES  |     | NULL    |                |
//		 | pick_date          | varchar(8)  | NO   |     | NULL    |                |
//		 | pick_time          | int(11)     | NO   |     | NULL    |                |
//		 | arrv_addr          | varchar(50) | NO   |     | NULL    |                |
//		 | pay_no             | varchar(8)  | YES  |     | NULL    |                |
//		 | resv_date          | datetime    | NO   |     | NULL    |                |
//		 +--------------------+-------------+------+-----+---------+----------------+

		CarPickup data = new CarPickup();
		
		//	resv_no는 auto increment로 생성, resv_date는 sysdate()로 생성
		data.setUser_id(request.getParameter("id"));
		data.setAir_resv_detail_no(Integer.parseInt(request.getParameter("air_no")));
		data.setCar_no(request.getParameter("car_no"));
		data.setGuest_num(Integer.parseInt(request.getParameter("guest_num")));
		data.setPick_date(request.getParameter("pick_date"));
		
		//data.setPick_time(Integer.parseInt(request.getParameter("pick_time")));
		String tmp_time = request.getParameter("pick_time");	//	15:30
		tmp_time = tmp_time.substring(0, 2) + tmp_time.substring(3, 5);
		data.setPick_time( Integer.parseInt(tmp_time) );
		data.setArrv_addr(request.getParameter("addr"));

		//	임시로 데이타 넣지 않음
		data.setPay_no(request.getParameter("pay_no"));

		System.out.println("air_resv: " + data.getAir_resv_detail_no());
		System.out.println("car_no: " + data.getCar_no());
		System.out.println("guest_num : " + data.getGuest_num());
		System.out.println("pick_date : " + data.getPick_date());
		System.out.println("pick_time : " + data.getPick_time());
		System.out.println("addr : " + data.getArrv_addr());
		
		InsCarPickup2 cc = InsCarPickup2.getThisClass();
		int result = cc.InsertData(data);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", result);
		
		return "car_pickup_ins.jsp";
	}

}
