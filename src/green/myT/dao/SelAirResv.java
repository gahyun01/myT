package green.myT.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.Airplane;
import green.myT.dto.Parameter;

public class SelAirResv implements MapperInterface{
	static SelAirResv bb = new SelAirResv();
	
	public static SelAirResv getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		Parameter param = new Parameter();
		
		String dept_city = request.getParameter("dept_city");
		String arrv_city = request.getParameter("arrv_city");
		String dept_date = request.getParameter("dept_date");
		String trip = request.getParameter("trip");	//	편도: 1, 왕복: 2

		param.setDept_city(dept_city);
		param.setArrv_city(arrv_city);
		param.setDate(dept_date);

		SelAirplane2 cc = SelAirplane2.getThisClass();
		List<Airplane> list = cc.selectData(param);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", list);
		
		//	출발지, 도착지 한글 유니코드 문제로 
		String page = "air_resv_dept.jsp?trip=" + trip;
		
		return page;
	}
}
