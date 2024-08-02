//	탑승인원 + 버튼
function limit_person(cnt){
	var per_num = document.getElementById('per_num_' + cnt);
	
	//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
	var i = Number(per_num.value);

	//	5인승이면 기사 1명 제외하고 탑승할 수 있으므로 -1을 해줘야 함
	var limit_cnt = cnt -1;

	if(i < limit_cnt){
		per_num.value = i + 1;
	}
	else{
		alert( "기사 제외 최대 " + limit_cnt + "명까지만 탑승 가능합니다");
	}
}


$(document).ready(function(){
	//	로그인 상태일 때만 글쓰기, 저장 버튼 활성화되게 함
	console.log("('#hidden_id').val() :" + $('#hidden_id').val());

	
	//	select 선택시
	$(document).on('change', '#pick_air', function(){ 
		console.log("changed: " + $(this).val());

		//	선택된 시간값
		var sel_text = $("#pick_air option:selected").text();
		//0000001 KE726	오사카 >> 서울/인천	2024-04-07	15:30 >> 17:15
		console.log("sel_text: " + sel_text);
		
		//	가장 처음부분 7자리가 항공예약번호임
		var air_no = sel_text.substr(0, 8);
		console.log("air_no: " + air_no);
			
		$("#hidden_resv").val(Number(air_no));
		
		//	뒤에서 5자리 잘라서 시간 가져옴 15:30
		var time = sel_text.slice(-5);
		console.log("time: " + time);
		
		//	일자 가져옴 2024-03-10
		var date = sel_text.slice(-25, -15);
		console.log("date: " + date);
		
		//	>> 문자열 찾음 -> 찾은 문자열 위치에서 4칸을 더 간 위치가 도시 위치임
		var idx = sel_text.indexOf(' >> ');
		console.log("idx: " + idx);
		
		//	서울/인천	2024-04-07	15:30 >> 17:15
		var tmp_city = sel_text.substr(idx + 4);
		console.log("tmp_city: " + tmp_city);
		
		//	2024-의 -위치를 찾아옴 -> space_idx -5를 해야 도착 도시명의 마지막 위치가 됨
		var end_idx = tmp_city.indexOf('-');
		console.log("end_idx: " + end_idx);
		
		end_idx = end_idx - 5;
		
		var city = sel_text.substr(idx + 4, end_idx);
		console.log("city: " + city);

		$('#hidden_city').val(city);
		$('#hidden_date').val(date);
		$('#hidden_time').val(time);

		$('#car_city').text(city);
		$('#car_date').text(date);
		$('#car_time').text(time);

		var div_car_list = document.getElementById("car_list");
		
		$.ajax({ // key value 형식
			url : "car_pickup_search.jsp?city=" + city , 
			success : function(re){
				div_car_list.innerHTML = re;
			}
		});
	});

	
	// 탑승인원 - 버튼 누룰 때
	$(document).on('click', '.btn_minus_p', function(){ 
		//	자신의 id값 가져오기
		var tagId = $(this).attr('id');
		
		//	5, 8, 12를 가져옴
		var capacity = tagId.substr(12, 2);
		console.log("-버튼:" + tagId + " capacity:" + capacity);
		
		//	Number로 숫자타입으로 바꾸지 않으면 숫자가 수정되는게 아니라 뒤에 추가가 됨
		var i = Number($('#per_num_' + capacity ).val());

		if(i > 1){
			$('#per_num_' + capacity ).val(Number(i-1));
		}
	});
	
	//	픽업신청 버튼 클릭시
	$(document).on('click', '.btn_pickup', function(){ 
		
		var tagId = $(this).attr('id');
		console.log("눌린 버튼은 " + tagId);
		
		//	btn_pickup_5
		var capacity = Number(tagId.substr(11, 2));
		console.log("눌리 capacity " + capacity);
		
		//	선택된 시간값
		var pick_time = $("#hidden_time").val();
		var city = $("#hidden_city").val();
		var id = $("#hidden_id").val();
		
		//	로그인 상태가 아니라면
		if(id == ""){
			alert("로그인 상태가 아닙니다. 로그인하세요.");
			location.href = "login.jsp";
		}
			
		
		var tmp = $("#hidden_date").val();
		var pick_date = tmp.replaceAll('-', '');
		
		
		console.log("pick_date :" + pick_date);
		console.log("city :" + city);
		console.log("pick_time :" + pick_time);
		
		//	인원수 input index : 5인승-> 7, 8인승-> 11, 12인승 ->15
		var guest_num = $('#per_num_' + capacity).val();

		//	주소 input index : 5인승-> 8, 8인승-> 12, 12인승 ->16
		var addr = $('#addr_' + capacity).val();

		//	주소 입력값 체크
		if(addr.length == 0){
			alert("도착 주소를 입력하세요");
			$('#addr_' + capacity).focus();
			return;
		}

		var car_no = $('#car_no_' + capacity).val();
		
		//	결제와 예약된 항공권 부분은 아직 안함
		var air_no = $("#hidden_resv").val();

		console.log("guest_num:" + guest_num);
		console.log("addr:" + addr);
		console.log("car_no:" + car_no);

		//	픽업 신청 jsp 호출 : car_pickup_ins.jsp
		var page = "car_pickup_ins.myt?menu=car&gbn=2&id=" + id + "&air_no=" + air_no + "&car_no=" + car_no + "&guest_num=" + guest_num + "&pick_date=" + pick_date + "&pick_time=" + pick_time + "&addr=" + addr ;
		//console.log(page);
		
		$.ajax({ // key value 형식
			url : page , 
			success : function(re){
				var tmp = re.substr(0, 1);
				if(tmp == "1"){	//	중복아이디 없음
					// 가장 윗로우만 가능하므로 alert으로 변경
					alert("공항픽업이 신청되었습니다.");
				}else{			//	중복아이디 있음
					alert("공항픽업 신청오류 " + tmp);
				}
			}
		});
	});
	
	
});