package green.myT.dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dao.MapperInterface;
import green.myT.dto.CarResvDetail;

public class InsCarResvDetail implements MapperInterface{
	static InsCarResvDetail bb = new InsCarResvDetail();
	
	public static InsCarResvDetail getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
//		car_resv_detail;
//		+----------------+-------------+------+-----+---------+-------+
//		| Field          | Type        | Null | Key | Default | Extra |
//		+----------------+-------------+------+-----+---------+-------+
//		| resv_no        | varchar(20) | NO   |     | NULL    |       |
//		| resv_detail_no | int(11)     | NO   |     | NULL    |       |
//		| car_no         | varchar(10) | NO   |     | NULL    |       |
//		| capacity       | int(11)     | NO   |     | NULL    |       |
//		| pick_date      | varchar(8)  | NO   |     | NULL    |       |
//		| pick_time      | int(11)     | NO   |     | NULL    |       |
//		| arrv_addr      | varchar(50) | NO   |     | NULL    |       |
//		+----------------+-------------+------+-----+---------+-------+

		CarResvDetail data = new CarResvDetail();
		data.setResv_no("00000000000000000001");
		data.setCar_no("0000000001");
		data.setCapacity(Integer.parseInt(request.getParameter("capacity")));
		data.setPick_date(request.getParameter("pick_date"));
		data.setPick_time(Integer.parseInt(request.getParameter("pick_time")));
		data.setArrv_addr(request.getParameter("addr"));
		
		InsCarResvDetail2 cc = InsCarResvDetail2.getThisClass();
		int result = cc.InsertData(data);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", result);
		
		return "link_insert_1.jsp";
	}

	
	

}
