////	탑승인원 + 버튼
//function limit_person(cnt){
//	var per_num = document.getElementById('per_num');
//	
//	//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
//	var i = Number(per_num.value);
//
//	//	5인승이면 기사 1명 제외하고 탑승할 수 있으므로 -1을 해줘야 함
//	var limit_cnt = cnt -1;
//
//	if(i < limit_cnt){
//		per_num.value = i + 1;
//	}
//	else{
//		alert( "기사 제외 최대 " + limit_cnt + "명까지만 탑승 가능합니다");
//	}
//}
//




//	삭제버튼
function deleterow(reno, input_id){
	
	var user_id = input_id.trim();
	var id = document.getElementById('hidden_id');
	var hidden_id = id.value; 

	//본인이 작성한 글인지 확인
	if(hidden_id != user_id){
		alert("본인이 작성한 글만 삭제가 가능합니다");
		return;
	}
	
	$.ajax({ // key value 형식
		url : "car_review_del.jsp?reno=" + reno,
		success : function(re){
			var tmp = re.substr(0, 1);
			if(tmp == "1"){	//	중복아이디 없음
				// 가장 윗로우만 가능하므로 alert으로 변경
				alert("삭제되었습니다.");
				
				//	삭제한 내용을 접고
				$('.review').hide();
				
				//	삭제한 내용을 리스트에서 안보이게 함
				var tbl_id = "tbl_" + reno;
				document.getElementById(tbl_id).style.display ='none'
				

			}else{			//	중복아이디 있음
				alert("삭제오류.");
			}
		}
	});
}

//저장버튼
function check_input(){

	var cont_title = document.getElementsByName('cont_title');
	console.log("cont_title:" + cont_title[0].value);

	var len = cont_title[0].value.length;

	if(len <= 5){
		cont_title[0].focus();
		alert("5자 이상의 제목을 입력하세요");
		return false;
	}
	
	tag = document.getElementById('textarea');
	len = tag.value.length;
	
	if(len <= 10){
		tag.focus();
		alert("10자 이상의 내용을 입력하세요");
		return false;
	}

	return true;
}



function search_review(){
	//alert("search_review:");
	//	선택한 도시, 차량종류, 작성자, 검색어로 검색함
	//	1:서울, 2:whistl76, 3:제목
	var tag = document.getElementsByTagName('input');

	var city = tag[1].value;
	console.log("city : " + city);
	
	var sel = document.getElementsByTagName('select');
	console.log("sel[0].value:" + sel[0].value);
	var capacity = sel[0].value;
	
	//	tag[2]는 hidden id이라서 스킵
	var id = tag[3].value;
	var text = tag[4].value;

	console.log("city:" + city);
	console.log("capacity:" + capacity);
	console.log("id:" + id);
	console.log("text:" + text);

	var div_car = document.getElementById("car");

	$.ajax({ // key value 형식
		url : "car_review_search.jsp?city=" + city + "&capacity=" + capacity + "&id=" + id + "&text=" + text ,
		success : function(re){
			div_car.innerHTML = re;
		}
	});
}

$(document).ready(function(){
	//	로그인 상태일 때만 글쓰기, 저장 버튼 활성화되게 함
	console.log("('#hidden_id').val() :" + $('#hidden_id').val());
	if($('#hidden_id').val() == ""){
		$('#btn_insert').hide();
		$('#btn_insert2').hide();
		
	}
	else{
		$('#btn_insert').show();
		$('#btn_insert2').show();
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

	// 리뷰 테이블의 Row 클릭시 값 가져오기 : 동적으로 만들어진 element에 js 적용하기 위해 
	$(document).on('click', '.review_list tr', function(){ 
     	//	tr의 자식 td 중 1번째를 찾아옴
     	var info = $(this).children('td:eq(0)').text();
    	
    	//	후기 창이 열려있으면 닫곤
     	if($('#review_' + info).is(":visible"))
     		$('#review_' + info).hide();
     	else{	//	닫혀 있으면 다른 열린 내용을 모두 닫고 해당 내용을연다
     		$('.review').hide();
     		$('#review_' + info).show();
     	}
    });  

    
	//	출발지 버튼이 눌릴 때
	$('#city_dept').click(function(){

		//	혹시 인원수 선택창이 열려있으면 먼저 닫고
		//$('#btn_person').trigger("click");

		//	출발지/도착지 버튼 하늘색상으로 변경
		$(this).css({
			"background-color" : "#e7f4ff" 
		});

		$('#city_arrv').css({	//	기본색으로 셋팅
			"background-color" : "#f5f5f5" 
		});
		
		//	출발 도시 선택창 뜸
		$('.city_title').text("도시/공항");
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

		//	도착지 버튼 색상 변경
		$(this).css({
			"background-color" : "#e7f4ff" 
		});

		$('#city_dept').css({	//	기본색으로 셋팅
			"background-color" : "#f5f5f5" 
		});

		//	도착 도시 선택창 뜸
		$('.city_title').text("도시/공항");

		$('.sel_city').css({
			"margin-top" : "140px", 
			"margin-left" : "460px" 
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

		//	상단 검색을 위한 도시 셋팅
		if($('.sel_city').attr("value") == "1"){
			//	출발지를 선택된 도시로 수정
			$('#city_dept2').text($(this).text());

			//	숨겨진 input text hidden_city 선택된 도시 셋팅하기
			$('#hidden_city').val($(this).text());

		//	하단 글쓰기를 위한 도시 셋팅
		}else{
			//	도착지를 선택된 도시로 수정
			$('#city_arrv2').text($(this).text());

			//	숨겨진 input text hidden_city 선택된 도시 셋팅하기
			$('#hidden_city2').val($(this).text());
		}
		//	도시 선택창 닫고 관련 셋팅하기
		close_city_box();
		

	});

	
	//	글쓰기 버튼 클릭 : 동적으로 만들어진 element에 js 적용하기 위해 
	//	$(document).on('click', '#btn_insert', function() 스타일로 변경함
	$(document).on('click', '#btn_insert', function(){ 
		//alert("글쓰기 이동");
		location.href = 'car_review_ins.jsp';
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
	$('#dept_d').click(function(){
		//	열린 화면 닫기
		//	혹시 도시 선택창이 열려있으면 먼저 닫고
		close_city_box();
	});
});