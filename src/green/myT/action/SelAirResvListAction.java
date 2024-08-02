package green.myT.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.dto.ActionForward;
import green.myT.dto.AirResvList;
import green.myT.dto.PageInfo;
import green.myT.svc.SelAirResvListSvc;


public class SelAirResvListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		String user_id = request.getParameter("user_id");
		String resv_no = request.getParameter("resv_no");
		
//		System.out.println("user_id:" + user_id + " resv_no:" + resv_no);
			
		 
		ArrayList<AirResvList> list = new ArrayList<AirResvList>();
	  	int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		SelAirResvListSvc airSvc = new SelAirResvListSvc();
		
		int listCount= airSvc.getListCount(user_id);

		list = airSvc.selectList(user_id, resv_no, page);
		
   		int maxPage = (int)((double)listCount/limit+0.95); 
  		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
  	    int endPage = startPage + 10 - 1;

  		if (endPage> maxPage) endPage= maxPage;

  		PageInfo pageInfo = new PageInfo();
  		pageInfo.setEndPage(endPage);
  		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		request.setAttribute("RESULT", list);
		
		ActionForward forward= new ActionForward();
		
  		forward.setPath("/air_resv_search.jsp");
  		
  		return forward;
  		
	 }
}