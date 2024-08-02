package green.myT.dao;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import green.myT.dto.Festival;

public class DBselectd implements MapperInterface{
	static DBselectd dbsd = new DBselectd();

	public static DBselectd dbsdmethod() {
		return dbsd;
	}
	
	@Override
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("DBselectd no=" + no);
		
		DBselectdPair dbsdp = DBselectdPair.dbsdpmethod();
		List<Festival> list = dbsdp.function(no);
		
		request.setAttribute("result", list);
		
		return "festvdetail.jsp";
	}
}
