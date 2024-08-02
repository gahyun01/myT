<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  //	로그인한 user_id를 hidden_id에 셋팅하기 위한 작업
  String user_id = "";

String login = (String)session.getAttribute("LOGIN");

  //  session이 null이면 로그아웃 또는 로그인 전인 상태임
  if( login != null ){
    //  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
    if(login.equals("1")){
      //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
      user_id = (String)session.getAttribute("ID");
    }
  }
%>



<div class="ring_head">
   <div class="ring_title">공항픽업 신청 내역</div>
   <div class="close_box" id="close_ring"><img src="img/close.png"></div>
</div>

 
<%@ page import="java.util.*" %>
<%@ page import="green.myT.dto.CarPickup" %>

<%
	List<CarPickup> list = (List<CarPickup>)request.getAttribute("RESULT");
	
	//		검색된 내용이 1건도 없을 때
	if(list.size() == 0){
	 	out.println("<div class='ring_blank'>검색된 내용이 없습니다</div>");
	}
	else{
%>
  <div id='div_ring1'>
  	<div id='div_ring2'>
		<table border='0' cellspacing='0'>
		<tr>
		<td class='tbl_title' style='width: 40px; border-top-left-radius: 5px'>삭제</td>
		<td class='tbl_title' >픽업 번호</td>
		<td class='tbl_title'>항공권 번호</td>
		<td class='tbl_title' style='width: 110px;'>픽업 공항</td>
		<td class='tbl_title'>픽업 일자</td>
		<td class='tbl_title'>차량 종류</td>
		<!--td class='tbl_title'>픽업시간</td-->
		<td class='tbl_title' style='width: 215px; border-top-right-radius: 5px'>도착 주소</td>
		</tr>
	
<%
		for(int i = 0 ; i < list.size(); i++){
			CarPickup data = list.get(i);
	
%>
			<tr>
			<td class='ring_cont'><input type="radio" class='rad_del' name='rad_del' value=<%= data.getResv_no() %> style='height: 18px;' ></td>
			<td class='ring_cont'><%= String.format("%07d", data.getResv_no()) %></td>
		 	<td class='ring_cont'><%= String.format("%07d", data.getAir_resv_detail_no()) %></td>
		 	<td class='ring_cont'><%= data.getCity_knm() %></td>
		 	<td class='ring_cont'><%= data.getPick_date() %></td>
		 	<td class='ring_cont'><%= data.getCapacity() %>인승</td>
		 	<!--td class='ring_cont'><%= data.getPick_time() %></td-->
		 	
		 	<!-- arrv_addr은 15자리까지만 잘라서 검색해옴 -->
		 	<td class='ring_cont'><%= data.getArrv_addr() %></td>
		 	</tr>
<%
		}
%>
		</table>
	</div>
    <div  id='div_ring_btn' >
    <button  type="button" class="btn btn_ring" id="btn_ring_del" style='margin-left: 505px'>삭제</button>
    <button  type="button" class="btn_ring" id="btn_ring_close" style='font-weight: bold; border: none; cursor: pointer;'>닫기</button>
    </div>
  </div>
<%
	}
%>
  