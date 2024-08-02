$(document).ready(function(){
	// 후기 보이기
	$('.table').on('click', '.title', function(){
		$(this).closest('tr').next().toggle();
	});
	
	
	// 티켓팅 팝업 보이기
	$('#ticketbtn').click(function(){
		$('.ticketingbg').show();
		$('.ticketing').show();
	});
	
	// 티켓팅 팝업 닫기
	$('.ticketingbg').click(function(){
		$('.ticketingbg').hide();
		$('.ticketing').hide();
	});
	
	// 티켓팅 달력
	$(function(){
		$('#datepicker').datepicker({
			dateFormat: 'yy-mm-dd',
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
	});
	

});