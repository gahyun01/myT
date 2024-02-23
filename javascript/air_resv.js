$(document).ready(function(){
	console.log("처음 왕복/편도 셋팅값 : " + $('.btn_trip0').attr('value'));

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

	function search_flight(){
		$('#lbl_dept').text($('#city_dept2').text());
		$('#lbl_arrv').text($('#city_arrv2').text());
	}

	//	선택된 로우 색상 바꾸고 가격 계산해서 예상 결제금액에 셋팅
	function setColor(tr){
	   	tr.parent().children().css({				
	   		"background-color" : "white"
		});

		tr.css({
				"background-color" : "#e7f4ff"
		});

        var td = tr.children();
        var tdArr = new Array();    // 배열 선언
            
        //tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        //console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
            
        //console.log("배열에 담긴 값 : "+tdArr);
            
        // 	td.eq(index)를 통해 값을 가져올 수도 있다
        //	index 9가 가격임
        var price = td.eq(9).text();

        //	가격에서 마지막 '원' 잘라버림
        price = price.substr(0, price.length-1);

        // 콤마 제거
		price = price.replace(",", "");
        console.log("price : " + price);

        //	예상 결제가격 계산 : 성인은 가격 * 인원수, 유아는 가격 * 0.6 * 인원수
   		//	탑승객이 몇 명인지 확인 후 해당 숫자만큼 입력화면 생성
		var adult_num = Number($('#num_a').val());
		var child_num = Number($('#num_c').val());
       	console.log("성인인원수 : " + adult_num + " 유아인원수 : " + child_num);

		var amount = (adult_num * price) + (child_num * 0.6 * price);

		//	예상 결제금액에 셋팅
		$('#amount_arrv').text(amount.toLocaleString(amount));
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

		$('.btn_trip0').attr('value', "1");
		console.log("편도 셋팅값 : " + $('.btn_trip0').attr('value'));

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

		$('.btn_trip0').attr('value', "2");
		console.log("편도 셋팅값 : " + $('.btn_trip0').attr('value'));

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
			showMonthAfterYear:true // 년 뒤에 월표시
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
		else if($('#rtn_d').val() == "오는 날") {
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

		alert("항공권 검색 시작");
		search_flight();
	});

	//	다음 여정 버튼 누르면 다음 여정 화면 보여주기
	$('#btn_next').click(function(){
		$('#rtn_list').slideDown("slow");
	});

	//	탑승객 정보 입력 버튼 누르면 탑승객 정보 입력 화면 보여주기
	$('#per_info').click(function(){
		console.log("성인 : " + $('#num_a').val());
		console.log("유아 : " + $('#num_c').val());

		//	탑승객이 몇 명인지 확인 후 해당 숫자만큼 입력화면 생성
		var per_num = Number($('#num_a').val()) + Number($('#num_c').val());
		console.log("인원수 : " + per_num);

		$('#per_list').slideDown("slow");
		//$('#per_list').show();

		$('#per_info1').show();
		$('#per_info2').show();
		// //	탑승자가 2명 이상일 경우
		// if(per_num >= 2){
		// 	for(var i = 2; i <= 2 ; i++){
		// 		var per_info = '#per_info' + i;
		// 		$(per_info).show();
		// 	}
		// }
	});


	//	탑승객 정보 남성/여성 선택
	$('#male, #female').click(function(){
		//	눌린 버튼의 테두리 색상 변경 후 value="1" 셋팅
		$(this).css({
			"border" : "1px solid lightgrey", 
			"background-color" : "lightgrey" 
		});

		$(this).val("1");

		//	눌린 버튼이 남성이라면
		if($(this)[0] == $('#male')[0])
			var sel = '#female';
		else
			var sel = '#male';

		$(sel).css({
			"border" : "1px solid lightgrey", 
			"background-color" : "#f5f5f5" 
		});
		$(sel).val("0");
		console.log("남성 : " + $('#male').val() + " 여성 : " + $('#female').val());
	});

	//	탑승객 영문 성/이름에 영문만 들어가도록 변경
	//	소문자도 가능하므로 소문자는 모두 대문자로 변경해서 저장해줘야 함
	$('.person2').keyup(function(){
		$(this).val($(this).val().replace(/[^a-zA-Z]/g,''));

		console.log($(this).val());
	});

	//	탑승객 생년월일에 숫자만 들어가도록 셋팅
	$('.birth').keyup(function(){
		$(this).val($(this).val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));

		console.log($(this).val());
	});

	//	체크박스를 라디오버튼처럼 1개만 선택하도록 변경
	$('.chk_choice2').click(function(){
		//	click 이벤트 발생했는지 체크
		if($(this).prop('checked')){
			//	checkbox 전체를 해제 후 click한 요소만 true로 지정
			$('.chk_choice2').prop('checked', false);
			$(this).prop('checked', true);
		}
	});

	function setCheckBox(myThis){
		//	click 이벤트 발생했는지 체크
		console.log(myThis);
		if(myThis.prop('checked')){
			//	checkbox 전체를 해제 후 click한 요소만 true로 지정
			$('.chk_choice').prop('checked', false);
			myThis.prop('checked', true);
		}

		//	click 이벤트 발생했는지 체크
		if(myThis.prop('checked')){
			//	checkbox 전체를 해제 후 click한 요소만 true로 지정
			$('.chk_choice').prop('checked', false);
			myThis.prop('checked', true);
		}
	}

	// 테이블의 Row 클릭시 값 가져오기
    $("#tbl_dept tr").click(function(){    

      	setColor($(this));

    });    

});