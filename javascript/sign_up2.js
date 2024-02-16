
	// 글자수나 선택여부확인, 선택한 내용 모두 alert로 보여줘야함 
	function checkAll(){
		var str;
		var len;
		var ok = true;
		var warning = "";

		var tag = document.getElementsByTagName('input');
		var label = document.getElementsByTagName('label');		
		var i;

		for(i=1 ; i <= 7 ; i++){	//	영문이름까지
			str = tag[i].value;
			len = tag[i].value.length;

			if(len == 0){
				ok = false;
				warning = label[i-1].innerText + " 값을 입력하세요";

			}else{
				if((tag[i].name == "user_id") && (len < 6 || len > 15 )){
					ok = false;
					warning = "6~15자리의 아이디로 입력하세요";
				}else if((tag[i].name == "pwd") || (tag[i].name == "pwd2")){
					if(len < 8 || len > 15 ){
						ok = false;
						warning = "8~15자리의 비밀번호로 입력하세요";
					}
				}else if((tag[i].name == "e_lastnm") || (tag[i].name == "e_firstnm")){
					if(len < 2 || len > 30){
						ok = false;
						warning = "2~30자리의 영문으로 입력하세요";
					}
				}
			}

			if(!ok){
				alert(warning);
				tag[i].focus();
				tag[i].select();
				return;
			}				
			warning = warning + str + "\n";
		}

		// 성별  
		if(tag[8].checked){
			warning = warning + "남성\n";
		}
		else{
			warning = warning + "여성\n";
		}

		// 생년월일
		var select = document.getElementsByTagName('select');
		for(i=0 ; i < select.length ; i++){	//	생년월일 3개 + 이메일 도메인1개 + 연락처 1개 -> 총5개
			str = select[i].value;
		
			//	중간의 이메일 주소 입력창 확인
			//	select[3] 이메일 도메인 선택창임
			if(i == 3){
				str = tag[10].value;	//	중간의 이메일 주소 입력창 확인
				len = tag[10].value.length;

				if(len == 0){
					ok = false;
					warning = "이메일 주소를 입력하세요";
				}else if(len < 6 || len > 15 ){
					ok = false;
					warning = "6~15자리 이메일 주소로 입력하세요";
				}

				if(!ok){
					alert(warning);
					tag[10].focus();	//	중간의 이메일 주소 입력창 확인
					tag[10].select();
					return;
				}
				warning = warning + str + "\n";

				str = tag[11].value;	//	중간의 이메일 주소 입력창 확인
				len = tag[11].value.length;

				//	이메일 도메인 칸이 비었거나 최소 5자리 미만일 경우
				if(len == 0 || len < 5){
					ok = false;
					warning = "최소 5자리 이상의 이메일 도메인을 입력하세요";

					alert(warning);

					//	value == 1이면 직접입력이므로 tag[11]에 포커스가 가야 함
					if(select[i].value == 0)
						select[i].focus();
					else if(select[i].value == 1)
						tag[11].focus();

					return;
				}
			}

			if(str == "선택"){	//	특정값 선택전인 상태
				ok = false;
				if(i < 3)
					warning = label[8].innerText + "을 선택하세요";	//	label[8] 부터 시작 : 생년월일
				else 
					warning = label[i+6].innerText + "를 선택하세요";	//	[9]이메일 주소 [10]연락처
			}

			if(!ok){
				alert(warning);
				select[i].focus();
				return;
			}				
			warning = warning + str + "\n";
		}

		//	연락처1 선택 후 4자리 연락처 넣으라고 한 후 포커스가 연락처2로 안감
		//	tag[12] 연락처2, tag[13] 연락처3
		for(i=12 ; i < 14 ; i++){	//	연락처2, 연락처3
			str = tag[i].value;
			len = tag[i].value.length;

			if(len != 4){
				ok = false;
				warning = "4자리의 연락처로 입력하세요";
			}

			if(!ok){
				alert(warning);
				tag[i].focus();
				tag[i].select();
				return;
			}
			warning = warning + str + "\n";
		}

		// 주소의 우편번호 
		str = tag[14].value;
		len = tag[14].value.length;

		if(len != 5){
			ok = false;
			warning = "5자리의 우편번호를 입력하세요";
		}

		if(!ok){
			alert(warning);
			tag[14].focus();
			tag[14].select();
			return;
		}			
		warning = warning + str;

		alert(warning);
	}

	/* 아이디 창 clear */
	function clearText(myEle){
		myEle.value = "";
	}

	/* 비밀번호 창에  있는 안내문구 지우고 *로 입력되게 함 정리 */
	function clearPasswd(myEle){
		myEle.value = "";
		myEle.type = "Password";
	}

	//	비밀번호 확인
	function checkPasswd(btn){
		var p = document.getElementsByName('pwd');
		var p2 = document.getElementsByName('pwd2');
		pwd = p[0].value;
		pwd2 = p2[0].value;

		var msg = document.querySelector('#msg');		/* 선택자를 통해서 1개만 */

		if(pwd != pwd2){
			//alert("비밀번호가 서로 다릅니다. 다시 입력해주세요.");
			msg.textContent = "※ 비밀번호가 서로 다릅니다. 다시 입력해주세요.";
			p[0].focus();
			p[0].select();
			p2[0].value ="";
		}else{	//	확인되었다는 알람과 함께 국문 성으로 포커스 옮김
			var msg = document.querySelector('#msg');		/* 선택자를 통해서 1개만 */
			msg.textContent = "※ 비밀번호가 동일한 것으로 확인되었습니다";

			var k_nm = document.getElementsByName('k_lastnm');
			k_nm[0].focus();
		}
	}

	function returnText(){
		var msg = document.querySelector('#msg');		/* 선택자를 통해서 1개만 */
		msg.textContent = "※ 국영문 성함은 반드시 본인의 실명을 입력해주시기 바랍니다.(추후 변경 불가)";
	}


	function setEmail(value){
		var email1 = document.getElementsByName('email1');

		if(value == "0"){		//	선택
			email1[0].value = "";
			email1[0].disabled = true;
		}
		else if(value == "1"){	//	직접입력
			email1[0].value = "";
			email1[0].disabled = false;
		}
		else{					//	나머지 도메인
			email1[0].value = value;
			email1[0].disabled = true;

		}
	}

