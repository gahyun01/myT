$(document).ready(function () {
  var timeoutId;
  

////////////////	mhwon 추가 start
	var login_id = $('#login_id').text().replaceAll('님', '');
	//console.log("('#login_id').text() :" + $('#login_id').text());
	console.log("login_id :" + login_id);
	
	$('#div_ring').hide();

	if(login_id == ""){
		$('#ring_img').hide();
		$('#div_ring').hide();
	}

	//	red bell click시
	$('#ring_img').click(function(){
		//console.log("ring bell click");
		//	팝업 화면이 열려있으면 닫고 닫혀 있으면 열기
		if($('#div_ring').is(":visible"))
			$('#div_ring').hide();
		else{
			var div_ring = document.getElementById("div_ring");
			
			$.ajax({ // key value 형식
				url : "car_pickup_list.myt?menu=car&gbn=1&id=" + login_id ,
				success : function(re){
					div_ring.innerHTML = re;
				}
			});
			
			$('#div_ring').show();
		}
		
	});
	
	//	팝업창 클로즈 버튼이 눌릴 때 -> ajax를 이용해서 동적으로 만들어진 것이라서
	//	$(document).on('click', '#close_ring', function(){ 으로 해야 함
	$(document).on('click', '#close_ring,  #btn_ring_close', function(){ 
		//console.log("close_ring");
		$('#div_ring').hide();
	});

	//	삭제 버튼을 클릭할때
	$(document).on('click', '#btn_ring_del', function(){ 
		//	선택된 내역이 있는지 확인 -> 라디오 버튼이 선택되었는지 확인
		var resv_no = $('input[name=rad_del]:checked').val();
		
		if(resv_no == null){
			alert("삭제할 내역을 선택하세요.");
		}else{
			console.log(resv_no);
			if(confirm("해당 내역을 삭제하시겠습니까?")){
				//	삭제로직
				var div_ring = document.getElementById("div_ring");
				$.ajax({ // key value 형식
					url : "car_pickup_del.myt?menu=car&gbn=3&id=" + login_id + "&resv_no=" + resv_no ,
					success : function(re){
						div_ring.innerHTML = re;
					}
				});
				alert("정상적으로 삭제되었습니다.");
			}	
		}
	});
	
	
	
	
	
 //////////////////	mhwon 추가 end
	
	
	
  $('body .top header .banner .btop a').mouseenter(function() {
      clearTimeout(timeoutId); // 기존에 예약된 setTimeout 제거
      timeoutId = setTimeout(function() {
          $('body .top header .banner .btop .sub, body .bnav').slideDown('slow');
          $('body .top').css('box-shadow', 'none');
      }, 100); // 300ms 후에 애니메이션 실행 (원하는 시간으로 조절 가능)
  });

  $('body .top header, body .bnav').mouseleave(function() {
    clearTimeout(timeoutId); // 기존에 예약된 setTimeout 제거
    timeoutId = setTimeout(function() {
        $('body .top header .banner .btop .sub, body .bnav').slideUp('slow', function() {
            // 애니메이션이 끝난 후 실행될 코드
            $('body .top').css('box-shadow', '0px 10px 10px 0px rgba(159, 159, 159, 0.2)');
        });
    }, 100); // 100ms 후에 애니메이션 실행 (원하는 시간으로 조절 가능)    
  });
});
