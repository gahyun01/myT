<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/air_resv_list.css" rel="stylesheet" type="text/css">

<%@ page import="java.util.*" %>
<%@ page import="green.myT.dto.AirResvList" %>
<%@page import="green.myT.dto.PageInfo"%>

<%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();

	//	예약된 내역 보여줌
	ArrayList<AirResvList> list = (ArrayList<AirResvList>)request.getAttribute("RESULT");
	if(list != null){
		//	조회된 내역이 없을 때
		if(list.size() == 0){
		 	out.println("<div class='div_blank'>검색된 내용이 없습니다</div>");
		}
		else{
%>		
			<table border="0" cellspacing="0" style='margin-top: -40px' id='resv_list' >
			<tr>
			<td class="title_air" style="border-top-left-radius: 10px">예약번호</td>
			<td class="title_air">비행기편명</td>
			<td class="title_air" colspan="3">출발지/도착지</td>
			<td class="title_air">비행일자</td>
			<td class="title_air" colspan="3">출발/도착시간</td>
			<td class="title_air">좌석등급</td>
			<td class="title_air"">탑승자명(영문)</td>
			<td class="title_air">성인/소아</td>
			<td class="title_air">금액</td>
			<td class="title_air">예약일자</td>
            <td class="title_air" style="border-top-right-radius: 10px;">취소</td>
<%       
			for(int i=0; i<list.size(); i++){
				AirResvList data = list.get(i);
			
				String date = data.getFlight_date().substring(4, 6) + "월 " + data.getFlight_date().substring(6, 8) + "일";
%>
		         <tr>
		           <td class="cont_resv" style='font-weight: bold'><%= String.format("%07d", data.getResv_no()) %></td>
		           <td class="cont_resv">KE<%= data.getPlane_no() %></td>
		           <td class="cont_resv" style='width: 120px'><%= data.getDept_city() %></td>
		           <td class="cont_resv1">-></td>
		           <td class="cont_resv" style='width: 120px'><%= data.getArrv_city() %></td>
		           <td class="cont_resv"><%= date %></td>
		           <td class="cont_resv"><%= data.getDept_time() %></td>
		           <td class="cont_resv1">-></td>
		           <td class="cont_resv"><%= data.getArrv_time() %></td>
		           <td class="cont_resv"><%= data.getLevel() %></td>
		           <td class="cont_resv" style='width: 200px' ><%= data.getE_lastnm() %>&nbsp;&nbsp;<%= data.getE_firstnm() %></td>
<%
				int price = data.getPrice();
				String child = data.getChild();
				String adult = "성인";
				
				//	소아일 경우 성인 금액에  0.6을  곱한다
				if(child.equals("1")){
					price = (int)(price * 0.6);
					adult = "소아";
				}
%>       
		           <td class="cont_resv"><%= adult %></td>
		           <td class="cont_resv" id='td_amount'  style='width: 110px'><label class="money"><%= String.format("%,d", price ) %></label> 원</td>
		           <td class="cont_resv"  style='width: 100px'><%= data.getResv_date() %></td>
		           <td class="cont_resv" style='width: 50px' ><input type="checkbox" class="chk_choice"></td>
		         </tr>
<%		
			}
%>
      	</table>
<%      	
		}
	}
%> 