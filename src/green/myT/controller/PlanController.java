package green.myT.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import green.myT.action. Action;
import green.myT.action.plannerMainListAction;

import green.myT.dto.ActionForward;

@WebServlet("*.plann")
public class PlanController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 요청의 문자 인코딩을 UTF-8로 설정
		request.setCharacterEncoding("UTF-8");
		// 요청된 URI를 가져옴
		String RequestURI=request.getRequestURI();
		// 웹 애플리케이션의 컨텍스트 경로를 가져옴
		String contextPath=request.getContextPath();
		// 컨텍스트 경로를 제외한 요청된 URI에서 실제 명령어 부분을 추출
		String command=RequestURI.substring(contextPath.length());
		// 포워딩 정보를 저장할 객체 생성
		ActionForward forward=null;
		// 액션을 수행할 객체 선언
		Action action=null;

		// 명령어에 따라 액션을 선택하여 수행
		// plannerMainList == 플래너 메인에서 플랜 리스트들 보여주는 액션
		if(command.equals("/plannerMainList.plann")){
			action = new plannerMainListAction();
			try {
				forward=action.execute(request, response);
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