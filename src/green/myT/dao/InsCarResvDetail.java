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
		
		CarResvDetail data = new CarResvDetail();
//		data.setUid(request.getParameter("uid"));
//		data.setUname(request.getParameter("uname"));
//		data.setUnum(Integer.parseInt(request.getParameter("unum")));
		
		InsCarResvDetail2 cc = InsCarResvDetail2.getThisClass();
		int result = cc.InsertData(data);
		
		//	받아온 list를 setAttribute 통해서 다음 페이지로 전달함
		//	key/value값으로 저장
		//	request에 셋팅하면 다음에 getAttribute로 받을 수 있음
		request.setAttribute("RESULT", result);
		
		return "link_insert_1.jsp";
	}

	
	

}
