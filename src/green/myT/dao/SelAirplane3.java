package green.myT.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.Airplane;
import green.myT.dto.Parameter;

//	항공기 오는 스케쥴 조회
public class SelAirplane3 {
	static SelAirplane3 bb = new SelAirplane3();
	
	public static SelAirplane3 getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		Parameter param = new Parameter();
		
		String dept_city = request.getParameter("dept_city");
		String arrv_city = request.getParameter("arrv_city");
		String arrv_date = request.getParameter("arrv_date");

		param.setDept_city(arrv_city);
		param.setArrv_city(dept_city);
		
		//	돌아오는 일정이므로 arrv_date값으로 넘어온 값을 date에 넣어준다
		param.setDate(arrv_date);

//		System.out.println("dept_city : " + param.getDept_city());
//		System.out.println("arrv_city : " + param.getArrv_city());
//		System.out.println("date : " + param.getDate());

		SelAirplane2 cc = SelAirplane2.getThisClass();
		List<Airplane> list = cc.selectData(param);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", list);
		
		return "air_resv_arrv.jsp";
	}}
