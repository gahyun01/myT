<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="css/air_resv.css" rel="stylesheet" type="text/css">

<%@ page import="java.util.*" %>
<%@ page import="green.myT.dto.Airplane" %>

<%
	List<Airplane> list = (List<Airplane>)request.getAttribute("RESULT");
	if(list == null)
		out.println("<div class='div_blank'>검색된 내용이 없습니다</div>");
	else
	{
		//		검색된 내용이 1건도 없을 때
		if(list.size() == 0)	 	
			out.println("<div class='div_blank'>검색된 내용이 없습니다</div>");
		else{
%>
      <div style="margin-top: 25px">
        <table class="air_list"  id="tbl_arrv" border="0" cellspacing="0">
          <tr>
           <td class="title_air" style="border-top-left-radius: 10px">비행기편명</td>
           <td class="title_air" colspan="3">출발지/도착지</td>
           <td class="title_air">비행일자</td>
           <td class="title_air" colspan="3">출발/도착시간</td>
           <td class="title_air"">소요시간</td>
           <td class="title_air">좌석등급</td>
           <td class="title_air">금액 (성인 1인)</td>
           <td class="title_air" style="border-top-right-radius: 10px">선택</td>
           <td class="title_air" style='display: none;' ></td>
           <td class="title_air" style='display: none;' ></td>
          </tr>
<%
		for(int i = 0 ; i < list.size(); i++){
			Airplane data = list.get(i);
			String tmp = data.getDate();
			String date = tmp.substring(4, 6) + "월 " + tmp.substring(6, 8) + "일";	
%>
          <tr>
            <td class="cont_resv">KE<%= data.getPlane_no() %></td>
            <td class="cont_resv"><%= data.getDept_city() %></td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv"><%= data.getArrv_city() %></td>
            <td class="cont_resv"><%= date %></td>
            <td class="cont_resv"><%= data.getDept_time() %></td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv"><%= data.getArrv_time() %></td>
            <td class="cont_resv"><%= data.getHour() %></td>
            <td class="cont_resv"><%= data.getLevel() %></td>
            <td class="cont_resv"><label class="money"><%= String.format("%,d", data.getPrice()) %></label> 원</td>
            <td class="cont_resv"><input type="checkbox" class="chk_choice2"></td>
            <td class="cont_resv"  style='display: none;' ><%= data.getPlane_seq() %></td>
            <td class="cont_resv"  style='display: none;' >2</td> <!-- 오는 편:2 -->
          </tr>
<% 
		}	//	for 구분
%>          
        </table>
      </div>
      <!-- 다음 페이지로 넘어가는 버튼-->
      <div class="div_btn">
        <button type="button" class="btn btn_air_list" id="btn_info" disabled>탑승객 정보 입력</button>
        <div class="div_amount"><div class="div_amount1">예상 결제금액</div><div class="div_amount2" id="amount_arrv"></div><div class="div_amount3">원</div></div>
      </div>
      <div class="line"></div>
      

<%
		}	//	list.size()가 0이 아닐 때
	}		//	list가 널이 아닐 때
%>      
