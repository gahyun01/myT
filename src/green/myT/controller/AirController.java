package green.myT.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import green.myT.action.Action;
import green.myT.action.SelAirResvListAction;
import green.myT.dto.ActionForward;


public class AirController extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;

		System.out.println("command: " + command);
//		if(command.equals("/boardWriteForm.bo")){
//			forward=new ActionForward();
//			forward.setPath("/qna_board_write.jsp");
//		}
		if(command.equals("/air_resv_search.air")){
			
			action  = new SelAirResvListAction();
			
			try {
				forward = action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	

}
