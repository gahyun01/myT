package green.myT.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import green.myT.svc.plannerMainListService;
import green.myT.dto.TravPl;
import green.myT.dto.Planner;
import green.myT.dto.ActionForward;
import green.myT.dto.PageInfo;

public class plannerMainListAction implements Action {
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
        
        ArrayList<PlannerMainList> plannerMainList = new ArrayList<PlannerMainList>();
        int page = 1;
        int limit = 9;

        if(request.getParameter("page") != null){
            page = Integer.parseInt(request.getParameter("page"));
        }

        plannerMainListService plannerMainListService = new plannerMainListService();
        int listCount = plannerMainListService.getListCount();
        plannerMainList = plannerMainListService.getPlannerMainList(page, limit);
        int maxPage = (int)((double)listCount / limit + 0.95);
        int startPage = (((int)((double)page / 9 + 0.9)) - 1) * 9 + 1;
        int endPage = startPage + 9 - 1;

        if(endPage > maxPage){
            endPage = maxPage;
        }

        PageInfo pageInfo = new PageInfo();
        pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("plannerMainList", plannerMainList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/qna_board_list.jsp");
   		return forward;
    }
}
