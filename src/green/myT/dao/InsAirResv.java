package green.myT.dao;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import green.myT.dto.AirResv;


public class InsAirResv implements MapperInterface{
	static InsAirResv bb = new InsAirResv();
	
	public static InsAirResv getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		HttpSession session = request.getSession();

		String login = (String)session.getAttribute("LOGIN");
		String user_id = (String)session.getAttribute("ID");

		//  로그인 상태가 아닐 경우 로그인 화면으로 이동
		if( (login == null) || !login.equals("1") ){
			request.setAttribute("RESULT", 99);
			return "air_resv_info2.jsp";
		}
		
		int adult = Integer.parseInt(request.getParameter("adult"));
		int child = Integer.parseInt(request.getParameter("child"));
		String dept_no = request.getParameter("dept_no");
		String arrv_no = request.getParameter("arrv_no");
		String trip = request.getParameter("trip");
		String dept_date = request.getParameter("dept_date");
		String arrv_date = request.getParameter("arrv_date");

//		air_resv;
//		+-------------+-------------+------+-----+---------+----------------+
//		| Field       | Type        | Null | Key | Default | Extra          |
//		+-------------+-------------+------+-----+---------+----------------+
//		| resv_no     | int(11)     | NO   | PRI | NULL    | auto_increment |
//		| user_id     | varchar(15) | NO   |     | NULL    |                |
//		| plane_seq   | int(11)     | NO   |     | NULL    |                |
//		| flight_date | varchar(8)  | NO   |     | NULL    |                |
//		| guest_num   | int(11)     | NO   |     | NULL    |                |
//		+-------------+-------------+------+-----+---------+----------------+

		
		List<AirResv> list = new ArrayList<AirResv>();

		//	trip이 1이면  편도, 2이면 왕복
		AirResv dept = new AirResv();

		//	resv_no는 auto increment로 생성, resv_date는 sysdate()로 생성
		dept.setUser_id(user_id);
		dept.setPlane_seq(Integer.parseInt(dept_no));
		dept.setFlight_date(dept_date);
		dept.setGuest_num( adult + child );
		
		list.add(dept);
		
		//	왕복일 경우
		if(trip.contentEquals("2")) {
			AirResv arrv = new AirResv();

			//	resv_no는 auto increment로 생성, resv_date는 sysdate()로 생성
			arrv.setUser_id(user_id);
			arrv.setPlane_seq(Integer.parseInt(arrv_no));
			arrv.setFlight_date(arrv_date);
			arrv.setGuest_num( adult + child );
			
			list.add(arrv);
		}

		InsAirResv2 cc = InsAirResv2.getThisClass();
		int result = cc.InsertData(list);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", result);
		
		return "air_resv_info2.jsp?adult=" + adult + "&child=" + child + "&trip=" + trip + "&dept_no=" + dept_no + "&arrv_no=" + arrv_no + "&dept_date=" + dept_date + "&arrv_date=" + arrv_date ;
	}

}
