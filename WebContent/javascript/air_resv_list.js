$(document).ready(function(){
	var user_id = $('#hidden_id').val();
	
	if(user_id != ""){
		var div_air_list = document.getElementById("air_list");
	
		$.ajax({ // key value 형식
			url : "air_resv_search.air?resv_no=ALL&user_id=" + user_id , 
			success : function(re){
				div_air_list.innerHTML = re;
			}
		});
	}	

	//	도시 선택창 닫고 관련 셋팅하기
	function close_city_box(){
		//	도시 선택창 닫힘
		$('.sel_city').hide();

		//	반전된 출발지/도착지 버튼을 원색상으로 돌려놓음
		if($('.sel_city').attr("value") == "1"){	//	출발지 선택시
			//	출발지를 선택된 도시로 수정
			$('#city_dept').css({
				"background-color" : "#f5f5f5"
			});

		}else{	//	도착지 선택시
			$('#city_arrv').css({
				"background-color" : "#f5f5f5" 
			});
		}
	}

	//	출발지 버튼이 눌릴 때
	$('#city_dept').click(function(){

		//	혹시 인원수 선택창이 열려있으면 먼저 닫고
		$('#btn_person').trigger("click");

		//	출발지/도착지 버튼 하늘색상으로 변경
		$(this).css({
			"background-color" : "#e7f4ff" 
		});

		$('#city_arrv').css({	//	기본색으로 셋팅
			"background-color" : "#f5f5f5" 
		});
		
		//	출발 도시 선택창 뜸
		$('.city_title').text("출발도시/공항");
		$('.sel_city').css({
			"margin-left" : "0px" 
		});
		$('.sel_city').show();

		//	도착지라는 의미로 .sel_city value="1"를 셋팅
		$('.sel_city').attr("value", "1");

		console.log("출발지 선택 : " + $('.sel_city').attr("value"));

	});

	//	도착지 버튼이 눌릴 때
	$('#city_arrv').click(function(){

		//	혹시 인원수 선택창이 열려있으면 먼저 닫고
		$('#btn_person').trigger("click");

		//	도착지 버튼 색상 변경
		$(this).css({
			"background-color" : "#e7f4ff" 
		});

		$('#city_dept').css({	//	기본색으로 셋팅
			"background-color" : "#f5f5f5" 
		});

		//	도착 도시 선택창 뜸
		$('.city_title').text("도착도시/공항");

		$('.sel_city').css({
			"margin-left" : "275px" 
		});

		$('.sel_city').show();

		//	도착지라는 의미로 .sel_city value="2"를 셋팅
		$('.sel_city').attr("value", "2");
		console.log("도착지 선택 : " + $('.sel_city').attr("value"));

	});


	//	도시 선택 창의 클로즈 버튼이 눌릴 때
	$('#close_city').click(function(){
		close_city_box();
	});


	$('dd').click(function(){	

		//	console.log("부모의 value : " + $(this).parent().attr('value'));
		//	$(this).parent().attr('value') -> 부모의 value값으로 해당 도시가 어느 지역인지 확인함
		//	1: 국내, 2: 동남아, 3: 일본, 4: 유럽, 5: 미주, 6: 중국
		//	1-3 (국내의 인덱스 1은 부산임)
			console.log("부모의 value : " + $(this).parent().attr('value') + "도시 인덱스 : " + $(this).index());

		if($('.sel_city').attr("value") == "1"){
			//	출발지를 선택된 도시로 수정
			$('#city_dept2').text($(this).text());
			
			//	도시 선택창 닫고 관련 셋팅하기
			close_city_box();
		}else{
			//	도착지를 선택된 도시로 수정
			$('#city_arrv2').text($(this).text());
			
			close_city_box();
		}
	});


	//	날짜 클릭시 달력나옴
	$(function() {
		$(".datepicker").datepicker({
			dateFormat:'yy-mm-dd',
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth:true, // 월변경가능
			changeYear:true,  // 년변경가능
			showMonthAfterYear:true // 년 뒤에 월표시
	      });
		//초기값을 오늘 날짜로 설정해줘야 합니다.
	    $('.datepicker').datepicker('setDate', 'today');
     });

	//	날짜 클릭시 기존의 열린 도시와 인원수 화면 닫기
	$('#dept_d, #rtn_d').click(function(){
		//	열린 화면 닫기
		//	혹시 도시 선택창이 열려있으면 먼저 닫고
		close_city_box();
	});

	//	예약내역 검색 버튼 클릭시
	$('#search_air').click(function(){	
		console.log("검색 clicked");
		
		//	로그인 상태가 아니라면
		if( $('#hidden_id') == "" ){
			alert("로그인 상태가 아닙니다");
			location.href = "login.jsp";
		}
			
			
			
			
			
//		//	현재는 기본이 출발지가 아니라 서울/인천
//		if($('#city_dept2').text() == "출발지"){
//			alert("출발지를 선택하세요");
//			
//			//	출발지 클릭 이벤트 강제로 발생시킴
//			$('#city_dept').trigger("click");
//			return;
//		}
//		else if($('#city_arrv2').text() == "도착지"){
//			alert("도착지를 선택하세요");
//			
//			//	도착지 클릭 이벤트 강제로 발생시킴
//			$('#city_arrv').trigger("click");
//			return;
//
//		}
//		else if($('#city_dept2').text() == $('#city_arrv2').text()){
//			alert("출발지와 도착지가 동일합니다");
//			
//			//	출발지 클릭 이벤트 강제로 발생시킴
//			$('#city_dept').trigger("click");
//			return;
//		}
//		else if($('#dept_d').val() == "가는 날"){
//			alert("가는 날을 선택하세요");
//			
//			//	가는 날 달력 강제로 발생시킴
//			$('#dept_d').trigger("focus");
//			return;
//		}
//		//	왕복 선택일 때
//		else if( ($('#rtn_d').val() == "오는 날") || ($('#rtn_d').val() == "")) {
//			var i = $('.btn_trip0').attr('value');
//
//			if(i == '2'){
//				console.log("i == 2~~");
//				alert("오는 날을 선택하세요");
//				
//				//	오는 날 달력 강제로 발생시킴
//				$('#rtn_d').trigger("focus");
//				return;
//			}
//		}
//		else if($('#dept_d').val() == $('#rtn_d').val()){
//			alert("가는 날과 오는 날이 동일합니다");
//			
//			//	가는 날 달력 강제로 발생시킴
//			$('#dept_d').trigger("focus");
//			return;
//		}
//		
//		//	기존에 열린 오는 일정, 탑승자 정보를 모두 닫고
//		//	왕복/편도에 따라서 버튼 내용을 바꿔준다
//		$('#rtn_list').hide();
//		
//		//	airplane db 테이블 select
//		var dept_city = $('#city_dept2').text();
//		var arrv_city = $('#city_arrv2').text();
//		var dept_date = $('#dept_d').val().replaceAll('-', '');
//		var arrv_date = $('#rtn_d').val().replaceAll('-', '');
//		
//		//	왕복 편도 구분값
//		var trip = $('.btn_trip0').attr('value');
//
//		//	가는 일정 조회해서 화면을 보여줌
//		var div_dept = document.getElementById("div_dept");
//
//		$.ajax({ // key value 형식
//			url : "air_resv_dept.myt?menu=air&gbn=4&dept_city=" + dept_city + "&arrv_city=" + arrv_city + "&dept_date=" + dept_date + "&arrv_date=" + arrv_date + "&trip=" + trip ,
//			success : function(re){
//				div_dept.innerHTML = re;
//			}
//		});
	});
	
	//	radio box 클릭시
	$(document).on('click', '#rad_1', function(){ 
		$('#search12').show();
		$('#search22').hide();
		
	});
	
	$(document).on('click', '#rad_2', function(){ 
		$('#search22').show();
		$('#search12').hide();
		
	});
	
	
	//	select 선택시
	$(document).on('change', '#pick_air', function(){
		
		//	로그인 상태가 아니라면
		if( user_id == "" ){
			alert("로그인 상태가 아닙니다");
			location.href = "login.jsp";
		}

		var resv_no = $(this).val();
		console.log("changed: " + $(this).val() + " user_id=" + user_id);

		$.ajax({ // key value 형식
			url : "air_resv_search.air?user_id=" + user_id + "&resv_no=" + resv_no , 
			success : function(re){
				div_air_list.innerHTML = re;
			}
		});
	});

	//	취소 체크박스 클릭시
	$(document).on('click', '.chk_choice', function(){ 
		//	체크박스 클릭시 무조건 전체 row를 화이트로 바꾸고
		//	선택된 row만 파랗게 색상 변경함
	   	$('#resv_list tr').css({				
	   		"background-color" : "white"
		});
	   	
		//	click 이벤트 발생했는지 체크
		//	체크박스를 라디오버튼처럼 1개만 선택하도록 변경
		if($(this).prop('checked')){
			//	checkbox 전체를 해제 후 click한 요소만 true로 지정
			$('.chk_choice').prop('checked', false);
			$(this).prop('checked', true);

			$(this).parent().parent().css({
				"background-color" : "#e7f4ff"
		   	});
			
			//	예상 금액 가격 셋팅 및 버튼 보이게 함
//			var amount = setSelected($(this).parent().parent(), $('#btn_next'));	
//			$('#amount_dept').text(amount);
			
		}
		else{
		   	$('#resv_list tr').css({				
		   		"background-color" : "white"
			});
		   	
		   	//	셋팅했던 예상 금액 가격없애고 버튼 안보이게 함
//		   	$('#amount_dept').text("");
//	     	$('#btn_next').prop('disabled', true);
		}
	});

	
});