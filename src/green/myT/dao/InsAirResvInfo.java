package green.myT.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.AirResvInfo;

public class InsAirResvInfo implements MapperInterface{
	static InsAirResvInfo bb = new InsAirResvInfo();
	
	public static InsAirResvInfo getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
//		air_resv_info;
//		+--------------+-------------+------+-----+---------+----------------+
//		| Field        | Type        | Null | Key | Default | Extra          |
//		+--------------+-------------+------+-----+---------+----------------+
//		| resv_info_no | int(11)     | NO   | PRI | NULL    | auto_increment |
//		| resv_no      | int(11)     | NO   |     | NULL    |                |
//		| e_lastnm     | varchar(30) | NO   |     | NULL    |                |
//		| e_firstnm    | varchar(30) | NO   |     | NULL    |                |
//		| gender       | varchar(1)  | NO   |     | NULL    |                |
//		| birth        | varchar(8)  | NO   |     | NULL    |                |
//		| child        | varchar(1)  | NO   |     | NULL    |                |
//		| email        | varchar(15) | NO   |     | NULL    |                |
//		| email2       | varchar(15) | NO   |     | NULL    |                |
//		| phone        | varchar(11) | NO   |     | NULL    |                |
//		+--------------+-------------+------+-----+---------+----------------+

		int guest_num = Integer.parseInt(request.getParameter("hidden_cnt"));
		int trip = Integer.parseInt(request.getParameter("trip"));
		String dept_date = request.getParameter("hidden_dept_date");
		int resv_no = Integer.parseInt(request.getParameter("hidden_resv_no"));	//	오는 일정 예약번호
		int resv_no2 = 0;
		
		String email = request.getParameter("email");
		String email2 = request.getParameter("email2");
		String phone = request.getParameter("phone");

		List<AirResvInfo> list = new ArrayList<AirResvInfo>();
		
		//	오는 편 인원정보 셋팅
		for(int i = 1; i <= guest_num; i++) {
			AirResvInfo data = new AirResvInfo();
			
			data.setResv_no(resv_no);
			data.setE_lastnm( request.getParameter("last_nm_" + i) );
			data.setE_firstnm( request.getParameter("first_nm_" + i) );
			data.setGender( request.getParameter("gender_" + i) );
			data.setBirth( request.getParameter("birth_" + i) );
			data.setChild( data.checkChild( request.getParameter("birth_" + i), dept_date) );
			data.setEmail(email);
			data.setEmail2(email2);
			data.setPhone(phone);
			
			list.add(data);
		}

		//	trip이 1이면  편도, 2이면 왕복
		if(trip == 2) {
			resv_no2 = Integer.parseInt(request.getParameter("hidden_resv_no2"));	//	가는 일정 예약번호

			//	가는 편 인원정보 셋팅
			for(int i = 1; i <= guest_num; i++) {
				AirResvInfo data = new AirResvInfo();
				
				data.setResv_no(resv_no2);
				data.setE_lastnm( request.getParameter("last_nm_" + i) );
				data.setE_firstnm( request.getParameter("first_nm_" + i) );
				data.setGender( request.getParameter("gender_" + i) );
				data.setBirth( request.getParameter("birth_" + i) );
				data.setChild( data.checkChild( request.getParameter("birth_" + i), dept_date) );
				data.setEmail(email);
				data.setEmail2(email2);
				data.setPhone(phone);
				
				list.add(data);
			}
			
		}

		InsAirResvInfo2 cc = InsAirResvInfo2.getThisClass();
		int result = cc.InsertData(list);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", result);
		
		return "air_resv_ins.jsp?trip=" + trip + "&resv_no=" + resv_no + "&resv_no2=" + resv_no2;
//		return "air_resv_ins.myt?menu=air&gbn=1&trip=" + trip + "&resv_no=" + resv_no + "&resv_no2=" + resv_no2;
	}

}

