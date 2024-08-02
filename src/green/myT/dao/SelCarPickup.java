package green.myT.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.*;

//	항공기 가는 스케쥴 조회
public class SelCarPickup implements MapperInterface{
	//	select 객체와 getSelectDB 함수 모두 static이므로
	//	해당 함수를 호출할 때마다 객체가 생성되는 것이 아니라
	//	1번 생성된 객체를 계속 재사용하게 됨
	//	해당 프로그램을 실행하는 동안 딱 1번의 객체 생성만 일어남
	static SelCarPickup bb = new SelCarPickup();
	
	public static SelCarPickup getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String user_id = request.getParameter("id");
		SelCarPickup2 cc = SelCarPickup2.getThisClass();
		List<CarPickup> list = cc.selectData(user_id);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", list);
		
		return "car_pickup_list.jsp";
	}
}
