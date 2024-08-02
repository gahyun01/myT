$(document).ready(function(){
	//	가는 스케쥴, 오는 스케쥴, 편도/왕복(1/2) 변수
	var dept_no = 0;
	var arrv_no = 0;
	var trip = 2;

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

	//	선택된 로우 색상 바꾸고 가격 계산해서 예상 결제금액에 셋팅
	function setSelected(tr, btn){
        var td = tr.children();
        var tdArr = new Array();    // 배열 선언
            
        //tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        //console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
        
        //	비행기 정보 plane_seq 셋팅
        if(td.eq(13).text() == "1")	//	1 가는 편, 2 오는 편
        	dept_no = td.eq(12).text();
        else 
        	arrv_no = td.eq(12).text();

        //console.log("비행기정보 : " + td.eq(12).text());

        // 	td.eq(index)를 통해 값을 가져올 수도 있다
        //	index 10이 가격임
        var price = td.eq(10).text();

        //	가격에서 마지막 '원' 잘라버림
        price = price.substr(0, price.length-1);

        // 콤마 제거
		price = price.replace(",", "");
        //console.log("price : " + price);

        //	예상 결제가격 계산 : 성인은 가격 * 인원수, 소아는 가격 * 0.6 * 인원수
   		//	탑승객이 몇 명인지 확인 후 해당 숫자만큼 입력화면 생성
		var adult_num = Number($('#num_a').text());
		var child_num = Number($('#num_c').text());
       	//console.log("성인인원수 : " + adult_num + " 소아인원수 : " + child_num);

		var amount = (adult_num * price) + (child_num * 0.6 * price);
		
    	//	row를 선택해야 예상 결제가격과 버튼이 작동하게 함
     	btn.prop('disabled', false);

     	//	예상 결제금액에 셋팅
     	return amount.toLocaleString(amount);
	}


	//	편도 버튼을 누를 때
	$('.btn_trip2').click(function(){
		//	편도 버튼 파랗게 변경
		$('.btn_trip2').css({
			"color" : "white", 
			"font-weight": "bold",
			"background-color":"#5891BE", 
			"border": "1px solid #5891BE" 
		});

		//	왕복 버튼 하얗게 변경
		$('.btn_trip1').css({
			"color" : "black", 
			"font-weight": "normal",
			"background-color":"white", 
			"border": "1px solid lightgrey" 
		});

		//	~ (gap) 과 오는 날 안보이게 함
		$('#gap0').hide();
		$('#rtn_d').hide();

		//	만약 돌아오는 여정 스케쥴 리스트가 있다면 닫고 다음여정 버튼을 탑승객 정보입력으로 바꿈
		$('#rtn_list').hide();
		$('#btn_next').text("탑승객 정보 입력");

		$('.btn_trip0').attr('value', "1");
		trip = 1;
		console.log("편도 셋팅값 : " + $('.btn_trip0').attr('value') + " trip : " + trip);

	});


	//	왕복 버튼이 눌릴 때
	$('.btn_trip1').click(function(){
		//	왕복 버튼 파랗게 변경
		$('.btn_trip1').css({
			"color" : "white", 
			"font-weight": "bold",
			"background-color":"#5891BE", 
			"border": "1px solid #5891BE" 
		});

		//	편도 버튼 하얗게 변경
		$('.btn_trip2').css({
			"color" : "black", 
			"font-weight": "normal",
			"background-color":"white", 
			"border": "1px solid lightgrey" 
		});

		//	~ (gap) 과 오는 날 보이게 함
		$('#gap0').show();
		$('#rtn_d').show();

		//	만약 돌아오는 여정 스케쥴 리스트가 있다면 닫고 혹시 변경되었을 다음여정 버튼을 재세팅함
		$('#rtn_list').hide();
		$('#btn_next').text("다음여정 선택");

		$('.btn_trip0').attr('value', "2");
		trip = 2;
		console.log("편도 셋팅값 : " + $('.btn_trip0').attr('value') + " trip : " + trip);

	});

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
			minDate: 0, 		//	오늘 이후 날짜만 가능
			showMonthAfterYear:true, // 년 뒤에 월표시
			onClose: function( selectedDate ) {	
				// 가는 날(dept_d) datepicker가 닫힐때                       
				// 오는 날(rtn_d)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                       
				$("#rtn_d").datepicker( "option", "minDate", selectedDate );                                              
			}
		});
	});

	//	날짜 클릭시 기존의 열린 도시와 인원수 화면 닫기
	$('#dept_d, #rtn_d').click(function(){
		//	열린 화면 닫기
		//	혹시 도시 선택창이 열려있으면 먼저 닫고
		close_city_box();

		//	혹시 인원수 선택창이 열려있으면 먼저 닫고
		$('#btn_person').trigger("click");

	});


	//	인원수 버튼이 눌릴 때
	$('.air_person').click(function(){
		//	인원수 버튼 하늘색상으로 변경
		$(this).css({
			"background-color" : "#e7f4ff" 
		});

		//	혹시 도시 선택창이 열려있으면 먼저 닫고
		close_city_box();

		//	달력창이 열려있다면 먼저 닫고

		$('.sel_person').show();
	});

	//	인원수 선택 창의 확인이 눌릴 때 창 닫고 인원수 셋팅
	$('#btn_person').click(function(){

		$('.sel_person').hide();

		$('.air_person').css({	//	기본색으로 셋팅
			"background-color" : "#f5f5f5" 
		});

		//	화면에 입력한 인원수 셋팅하기
		console.log($('#adult').val() + " " + $('#child').val());
		$('#num_a').text($('#adult').val());
		$('#num_c').text($('#child').val());

		//	해당 value에 입력한 인원수 셋팅하기
		$('#num_a').attr('value', $('#adult').val());
		$('#num_c').attr('value', $('#child').val());

	});


	//	- 버튼 누룰 때
	$('#btn_minus_a').click(function(){
		//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
		var i = Number($('#adult').val());

		if(i > 1){
			$('#adult').val(Number(i-1));
		}
	});

	// + 버튼 누룰때
	$('#btn_plus_a').click(function(){
		//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
		var i = Number($('#adult').val());

		if(i < 9){
			$('#adult').val(Number(i+1));
		}
		else{
			alert("최대 9명까지만 예약 가능합니다");
		}
	});

	//	- 버튼 누룰 때
	$('#btn_minus_c').click(function(){
		//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
		var i = Number($('#child').val());

		if(i > 0){
			$('#child').val(Number(i-1));
		}
	});

	// + 버튼 누룰때
	$('#btn_plus_c').click(function(){
		//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
		var i = Number($('#child').val());

		if(i < 9){
			$('#child').val(Number(i+1));
		}
		else{
			alert("최대 9명까지만 예약 가능합니다");
		}
	});


	//	항공권 검색 버튼 클릭시
	$('#search_air').click(function(){	
		//	현재는 기본이 출발지가 아니라 서울/인천
		if($('#city_dept2').text() == "출발지"){
			alert("출발지를 선택하세요");
			
			//	출발지 클릭 이벤트 강제로 발생시킴
			$('#city_dept').trigger("click");
			return;
		}
		else if($('#city_arrv2').text() == "도착지"){
			alert("도착지를 선택하세요");
			
			//	도착지 클릭 이벤트 강제로 발생시킴
			$('#city_arrv').trigger("click");
			return;

		}
		else if($('#city_dept2').text() == $('#city_arrv2').text()){
			alert("출발지와 도착지가 동일합니다");
			
			//	출발지 클릭 이벤트 강제로 발생시킴
			$('#city_dept').trigger("click");
			return;
		}
		else if($('#dept_d').val() == "가는 날"){
			alert("가는 날을 선택하세요");
			
			//	가는 날 달력 강제로 발생시킴
			$('#dept_d').trigger("focus");
			return;
		}
		//	왕복 선택일 때
		else if( ($('#rtn_d').val() == "오는 날") || ($('#rtn_d').val() == "")) {
			var i = $('.btn_trip0').attr('value');

			if(i == '2'){
				console.log("i == 2~~");
				alert("오는 날을 선택하세요");
				
				//	오는 날 달력 강제로 발생시킴
				$('#rtn_d').trigger("focus");
				return;
			}
		}
		else if($('#dept_d').val() == $('#rtn_d').val()){
			alert("가는 날과 오는 날이 동일합니다");
			
			//	가는 날 달력 강제로 발생시킴
			$('#dept_d').trigger("focus");
			return;
		}
		
		//	기존에 열린 오는 일정, 탑승자 정보를 모두 닫고
		//	왕복/편도에 따라서 버튼 내용을 바꿔준다
		$('#rtn_list').hide();
		$('.sel_person').hide();
		
		//	airplane db 테이블 select
		var dept_city = $('#city_dept2').text();
		var arrv_city = $('#city_arrv2').text();
		var dept_date = $('#dept_d').val().replaceAll('-', '');
		var arrv_date = $('#rtn_d').val().replaceAll('-', '');
		
		//	왕복 편도 구분값
		var trip = $('.btn_trip0').attr('value');

		//	가는 일정 조회해서 화면을 보여줌
		var div_dept = document.getElementById("div_dept");

		$.ajax({ // key value 형식
			url : "air_resv_dept.myt?menu=air&gbn=4&dept_city=" + dept_city + "&arrv_city=" + arrv_city + "&dept_date=" + dept_date + "&arrv_date=" + arrv_date + "&trip=" + trip ,
			success : function(re){
				div_dept.innerHTML = re;
			}
		});
	});
	
	//	탑승자 정보 입력하는 화면으로
	function insert_person(){
		var adult_num = Number($('#num_a').text());
		var child_num = Number($('#num_c').text());

		var dept_date = $('#dept_d').val().replaceAll('-', '');
		var arrv_date = $('#rtn_d').val().replaceAll('-', '');

//		location.href = "air_resv_info.jsp?adult=" + adult_num + "&child=" + child_num + "&trip=" + trip + "&dept_no=" + dept_no + "&arrv_no=" + arrv_no + "&dept_date=" + dept_date + "&arrv_date=" + arrv_date ;
		location.href = "air_resv_info2.myt?menu=air&gbn=2&adult=" + adult_num + "&child=" + child_num + "&trip=" + trip + "&dept_no=" + dept_no + "&arrv_no=" + arrv_no + "&dept_date=" + dept_date + "&arrv_date=" + arrv_date ;
	}	

	//	다음 여정 버튼 누르면 다음 여정 화면(왕복)/탑승자 정보입력(편도) 보여주기
	$(document).on('click', '#btn_next', function(){ 
		//console.log("btn_next clicked : " + $('.btn_trip0').attr('value'));
		
		//	왕복이면 오는 스케쥴 보여줌
		if($('.btn_trip0').attr('value') == "2"){
			//	airplane db 테이블 select
			var dept_city = $('#city_dept2').text();
			var arrv_city = $('#city_arrv2').text();
			var dept_date = $('#dept_d').val().replaceAll('-', '');
			var arrv_date = $('#rtn_d').val().replaceAll('-', '');
			
			//	돌아오는 일정 조회해서 화면을 보여줌
			var div_arrv = document.getElementById("div_arrv");

			$.ajax({ // key value 형식
				url : "air_resv_arrv.myt?menu=air&gbn=5&dept_city=" + dept_city + "&arrv_city=" + arrv_city + "&dept_date=" + dept_date + "&arrv_date=" + arrv_date ,
				success : function(re){
					div_arrv.innerHTML = re;
				}
			});
			$('#rtn_list').slideDown("slow");
		}
		//	편도이면 탑승객 입력정보 버튼 누른 것과 같은 이벤트 발생
		else{
			//$('#btn_info').trigger("click");
			//	탑승자 정보 입력하는 화면으로
			insert_person();
		}
	});

	//	탑승객 정보 입력 버튼 누르면 탑승객 정보 입력 화면 보여주기
	$(document).on('click', '#btn_info', function(){ 
		//	탑승자 정보 입력하는 화면으로
		insert_person();
	});


	//	가는 날 체크박스 클릭시
	$(document).on('click', '.chk_choice', function(){ 
		//	체크박스 클릭시 무조건 전체 row를 화이트로 바꾸고
		//	선택된 row만 파랗게 색상 변경함
	   	$('#tbl_dept tr').css({				
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
			var amount = setSelected($(this).parent().parent(), $('#btn_next'));	
			$('#amount_dept').text(amount);
			
		}
		else{
		   	$('#tbl_dept tr').css({				
		   		"background-color" : "white"
			});
		   	
		   	//	셋팅했던 예상 금액 가격없애고 버튼 안보이게 함
		   	$('#amount_dept').text("");
	     	$('#btn_next').prop('disabled', true);
		}
	});
	
	//	오는 날 체크박스 클릭시
	// 리뷰 테이블의 Row 클릭시 값 가져오기 : 동적으로 만들어진 element에 js 적용하기 위해 
	$(document).on('click', '.chk_choice2', function(){ 
		console.log("chk_choice2 click");
		//	체크박스 클릭시 무조건 전체 row를 화이트로 바꾸고
		//	선택된 row만 파랗게 색상 변경함
	   	$('#tbl_arrv tr').css({				
	   		"background-color" : "white"
		});
	   	
		//	click 이벤트 발생했는지 체크
		//	체크박스를 라디오버튼처럼 1개만 선택하도록 변경
		if($(this).prop('checked')){
		
			//	checkbox 전체를 해제 후 click한 요소만 true로 지정
			$('.chk_choice2').prop('checked', false);
			$(this).prop('checked', true);

			$(this).parent().parent().css({
				"background-color" : "#e7f4ff"
		   	});
			
			//	예상 금액 가격 셋팅 및 버튼 보이게 함
			var amount = setSelected($(this).parent().parent(), $('#btn_info'));	
			$('#amount_arrv').text(amount);
		}
		else{
		   	$('#tbl_arrv tr').css({				
		   		"background-color" : "white"
			});
		   	
		   	//	셋팅했던 예상 금액 가격없애고 버튼 안보이게 함
		   	$('#amount_arrv').text("");
	     	$('#btn_info').prop('disabled', true);
		}
	});

});