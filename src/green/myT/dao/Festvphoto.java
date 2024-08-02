package green.myT.dao;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import green.myT.dto.Festival_photo;

public class Festvphoto implements MapperInterface{
	static Festvphoto fp = new Festvphoto();

	public static Festvphoto fpmethod() {
		return fp;
	}
	
	@Override
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("Festvphoto no= " + no);
		
		FestvphotoPair fpp = FestvphotoPair.fppmethod();
		List<Festival_photo> list = fpp.function(no);
		
		request.setAttribute("photoresult", list);
		
		return "festvdetail.jsp";
	}
}
