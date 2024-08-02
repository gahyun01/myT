package green.myT.dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DelCarPickup implements MapperInterface{
	static DelCarPickup bb = new DelCarPickup();
	
	public static DelCarPickup getThisClass() {
		return bb;
	}

	//	implements한 interfaceA 함수 override해서 ClassC에서 select한 데이타를 받아옴
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		int resv_no = Integer.parseInt(request.getParameter("resv_no"));
		String user_id = request.getParameter("id");
		
		System.out.println("resv_no : " + resv_no);
		System.out.println("user_id : " + user_id);

		DelCarPickup2 cc = DelCarPickup2.getThisClass();
		
		int result = cc.deleteData(resv_no);
		
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", result);
		
		//	삭제 후 리스트를 뿌려줌
		return "car_pickup_list.myt?menu=car&gbn=1&id=" + user_id;
	}
}
