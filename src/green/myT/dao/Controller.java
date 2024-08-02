package green.myT.dao;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

//	Servlet 화일
//	호출할 page를 관장함
public class Controller extends HttpServlet {
//	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
//
//	}

	//	form이 없이 url에서 바로 파라미터를 쓸 경우 get인지 post인지 알 수 없으므로 service()라는 메소드 호출함
	//	service는 doGet/doPost 호출 전에 호출되는 함수로 service 안에서  get인지 post인지를 나뉘게 됨
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//	.myt?p=1 -> parameter p 값으로 1을 넘김
		String menu = request.getParameter("menu");
		String gbn = request.getParameter("gbn");
//		System.out.println("menu : " + menu + " gbn : " + gbn);

		if(menu.equals("festv")) {
			String no = request.getParameter("no"); // 
			String searchcont = request.getParameter("searchcont"); // 
			
			if(gbn.equals("1")) {// festvlist.jsp?p=1
				System.out.println("Controller menu=" + menu);
				System.out.println("Controller gbn=" + gbn);
				System.out.println("Controller no=" + no);
				System.out.println("Controller searchcont=" + searchcont);
				
				DBselect dbs = DBselect.dbsmethod();
				String page = dbs.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			} else if(gbn.equals("2")) {
				DBselectd dbsd = DBselectd.dbsdmethod();
				String page = dbsd.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
		
		//	car : 차량
		else if(menu.equals("car")) {
		
			//	gbn 1: 공항픽업 신청된 리스트 조회, 2: 공항픽업 신청 저장, 3: 공항픽업 신청 삭제
			if(gbn.equals("1")) {
				SelCarPickup sel = SelCarPickup.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = sel.mapping(request, response);
				
				//	dispatcher를 이용해서 페이지 이동함
				//	response는 그냥 페이지만 이동 -> a href와 같은 동작임
				//	dispatcher로 넘겨야 request, response를 통해서 값을 넘길 수 있음
				request.getRequestDispatcher(page).forward(request, response);
			}
			else if(gbn.equals("2")) {
				InsCarPickup ins = InsCarPickup.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = ins.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
			else if(gbn.equals("3")) {
				DelCarPickup del = DelCarPickup.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = del.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
		//	air : 항공기
		else if(menu.equals("air")) {
			//	gbn 4: 항공기 예약내역 조회
			if(gbn.equals("1")) {
				SelAirResvList sel = SelAirResvList.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = sel.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
			//	항공기 air_resv 입력
			else if(gbn.equals("2")) {
				InsAirResv ins = InsAirResv.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = ins.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
			//	항공기 air_resv_info 입력
			else if(gbn.equals("3")) {
				InsAirResvInfo ins = InsAirResvInfo.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = ins.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
			//	항공기 가는 스케쥴 조회
			else if(gbn.equals("4")) {
				SelAirplane sel = SelAirplane.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = sel.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
			//	항공기 오는 스케쥴 조회
			else if(gbn.equals("5")) {
				SelAirplane3 sel = SelAirplane3.getThisClass();
				
				//	이동하는 위치를 받아옴
				String page = sel.mapping(request, response);
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
			
	}
}

