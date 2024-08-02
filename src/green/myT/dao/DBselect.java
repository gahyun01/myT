package green.myT.dao;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import green.myT.dto.Festival;

public class DBselect implements MapperInterface{
	static DBselect dbs = new DBselect();

	public static DBselect dbsmethod() {
		return dbs;
	}
	
	@Override
	public String mapping(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		int no = Integer.parseInt(request.getParameter("no"));
		String searchcont = request.getParameter("searchcont");
		
		System.out.println("DBselect searchcont=" + searchcont);
		
		DBselectPair dbsp = DBselectPair.dbspmethod();
		List<Festival> list = dbsp.function(no, searchcont);
		
		request.setAttribute("result", list);
		
		return "festvlist.jsp";
	}
}
