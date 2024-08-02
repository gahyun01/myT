package green.myT.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.AirResvList;
import green.myT.dto.Parameter;

public class SelAirResvList implements MapperInterface{
	static SelAirResvList bb = new SelAirResvList();
	
	public static SelAirResvList getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		Parameter param = new Parameter();
		//	trip=" + trip + "&resv_no=" + resv_no + "&resv_no2=" + resv_no2		
		String trip = request.getParameter("trip");	//	편도: 1, 왕복: 2
		String resv_no = request.getParameter("resv_no");
		String resv_no2 = "";
		
		if(trip.equals("2"))
			resv_no2= request.getParameter("resv_no2");

		param.setDept_city(resv_no);
		param.setArrv_city(resv_no2);
		param.setDate(trip);

		//System.out.println("trip: " + param.getDate() + " resv_no: " + param.getDept_city() + " resv_no2: " + param.getArrv_city());


		SelAirResvList2 cc = SelAirResvList2.getThisClass();
		List<AirResvList> list = cc.selectData(param);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", list);
		
		//return "air_resv_ins.jsp";
		return "air_resv_final.jsp";
	}

}
