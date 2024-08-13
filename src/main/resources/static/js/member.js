$(document).ready(function() {
	var idSubmitChk = 1;
	var pwcheck = false;

	// 현재 날짜를 최대 날짜로 설정하는 함수
	function setMaxDateForBirthInput() {
		const today = new Date();
		const year = today.getFullYear();
		const month = String(today.getMonth() + 1).padStart(2, '0');
		const day = String(today.getDate()).padStart(2, '0');
		const maxDate = `${year}-${month}-${day}`;

		const dateInput = document.getElementById('inputBirth');
		if (dateInput) {
			dateInput.setAttribute('max', maxDate);
		}
	}

	// 페이지가 로드되면 현재 날짜를 생년월일 입력 필드의 최대 날짜로 설정
	setMaxDateForBirthInput();

	$(document).ready(function() {
		// ID 중복 체크 버튼 클릭 시
		$('#idCheckButton').off('click').on('click', function() {
			var idCheckValue = $('#idCheck').val().trim();

			// Clear previous messages
			$('font[id=warning]').text('');
			$('font[id=pwCheck]').text('');

			// Check if the ID input is empty
			if (idCheckValue === "") {
				alert('사용하고자 하는 아이디를 입력해주세요.');
				$('#idCheck').focus();
				idSubmitChk = 1; // Submit not allowed
				return false;
			} else {
				$.ajax({
					async: true,
					type: 'post',
					url: '/idCheck',
					data: { 'mem_id': idCheckValue },
					dataType: 'json',
					success: function(data) {
						// Clear previous messages before updating
						$('font[id="warningId"]').text('');
						$('font[id=pwCheck]').text('');

						if (data > 0) { // ID already exists
							$('font[id=warning]').text('이미 존재하는 아이디 입니다.');
							$('font[id=pwCheck]').attr('color', '#505050');
							$('font[id="warningId"]').text('');
							$('#idCheck').focus();
							idSubmitChk = 1; // Submit not allowed
						} else { // ID is available
							$('font[id=warning]').text('사용 가능한 아이디 입니다 ✔');
							$('font[id=pwCheck]').attr('color', '#ff6666');
							$('font[id=warning]').css('text-align', 'left');
							$('font[id="warningId"]').text('');
							$('#idCheck').focus();
							idSubmitChk = 0; // Submit allowed
						}
					},
					error: function(xhr, status, error) {
						$('font[id=warning]').text('서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.');
						$('#idCheck').focus();
						idSubmitChk = 1; // Submit not allowed
					}
				});
			}
		});
	});

	// 비밀번호 확인 기능
	$('#check1, #check2').keyup(function() {
		var pw1 = $('#check1').val();
		var pw2 = $('#check2').val();

		if (pw1 !== pw2 || pw1 === "" || pw2 === "") {
			$('font[id=pwCheck]').attr('color', '#505050');
			$('font[id=pwCheck]').text('패스워드를 다시 한 번 확인해주세요.');
			$('#warningPw').text('');
			pwcheck = false;
		} else {
			$('font[id=pwCheck]').attr('color', '#ff6666');
			$('font[id=pwCheck]').text('패스워드가 일치합니다 ✔');
			$('#warningPw').text('');
			pwcheck = true;
		}
	});

	// 전체 동의 체크박스 클릭 시
	$('#checkAllRequiredTerms').on('change', function() {
		var isChecked = $(this).is(':checked');
		// 필수 약관 동의 체크박스들의 상태 변경
		$('.checkRequiredTerms').prop('checked', isChecked);
	});

	// 전체 선택 약관 동의 체크박스 클릭 시
	$('#checkAllChoiceTerms').on('change', function() {
		var isChecked = $(this).is(':checked');
		// 선택 약관 동의 체크박스들의 상태 변경
		$('.checkChoiceTerms').prop('checked', isChecked);
	});

	// 각 약관 체크박스 변경 시
	$('.checkRequiredTerms, .checkChoiceTerms').on('change', function() {
		var allRequiredChecked = true;
		var allChoiceChecked = true;

		// 필수 약관 동의 체크 여부 확인
		$('.checkRequiredTerms').each(function() {
			if (!$(this).is(':checked')) {
				allRequiredChecked = false;
				return false; // break each loop
			}
		});
		// 선택 약관 동의 체크 여부 확인
		$('.checkChoiceTerms').each(function() {
			if (!$(this).is(':checked')) {
				allChoiceChecked = false;
				return false; // break each loop
			}
		});

		// 전체 필수 약관 동의 체크박스 상태 변경
		$('#checkAllRequiredTerms').prop('checked', allRequiredChecked);
		// 전체 선택 약관 동의 체크박스 상태 변경
		$('#checkAllChoiceTerms').prop('checked', allChoiceChecked);
	});

	$('#signUpSubmit').off('click').on('click', function(event) {
		console.log('Sign Up Submit Clicked'); // 확인용 로그
		var isValid = true;
		var allRequiredChecked = true;

		$('.checkRequiredTerms').each(function() {
			if (!$(this).is(':checked')) {
				allRequiredChecked = false;
				return false; // 반복문 종료
			}
		});

		// 모든 필수 약관에 동의하지 않은 경우
		if (!allRequiredChecked) {
			alert('모든 필수항목 작성과 약관에 동의해야 가입할 수 있습니다.');
			event.preventDefault(); // 폼 제출 중지
		} else {
			// 모든 필수 약관에 동의한 경우, 폼을 제출합니다.
			$("form[name=signUpForm1]").submit();
		}

		if ($('.inputId').val().trim() === '') {
			$('#warningId').text('사용하고자 하는 아이디를 입력해주세요');
			isValid = false;
		} else {
			$('#warningId').text('');
			isValid = true;
		}

		if ($('.inputPassword').val().trim() === '') {
			$('#warningPw').text('패스워드를 입력해주세요');
			isValid = false;
		} else {
			$('#warningPw').text('');
		}

		// 이름 필드 체크
		if ($('.inputName').val().trim() === '') {
			$('.warningName').text('사용자분의 성함을 입력해주세요');
			isValid = false;
		} else {
			$('.warningName').text('');
		}

		// 생년월일 연도 필드 체크
		if ($('.inputBirth').val().trim() === '') {
			$('.warningBirth').text('생년월일을 입력해주세요');
			isValid = false;
		} else {
			$('.warningBirth').text('');
		}

		// 핸드폰 번호 필드 체크
		if ($('.inputCommon[name="mem_phone"]').val().trim() === '') {
			$('.warningPhoneNumber').text('핸드폰 번호를 입력해주세요');
			isValid = false;
		} else {
			var phoneNumber = $('.inputCommon[name="mem_phone"]').val().trim();
			var phonePattern = /^(010)?\d{4}?\d{4}$/;

			if (!phonePattern.test(phoneNumber)) {
				$('.warningPhoneNumber').text('올바른 핸드폰 번호 형식이 아닙니다 (01012345678)');
				isValid = false;
			} else {
				$('.warningPhoneNumber').text('');
			}
		}

		// 이메일 필드 체크
		if ($('.inputCommon[name="mem_email"]').val().trim() === '') {
			$('.warningEmail').text('이메일을 입력해주세요');
			isValid = false;
		} else {
			var email = $('.inputCommon[name="mem_email"]').val().trim();
			var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			if (!emailPattern.test(email)) {
				$('.warningEmail').text('올바른 이메일 형식이 아닙니다');
				isValid = false;
			} else {
				$('.warningEmail').text('');
			}
		}

		// 우편번호 필드 체크
		if ($('#sample6_postcode').val().trim() === '') {
			$('.warningPostalCode').text('우편번호를 선택해주세요');
			isValid = false;
		} else {
			$('.warningPostalCode').text('');
		}

		// 주소 라인 2 필드 체크
		if ($('.inputAddress[name="address2"]').val().trim() === '') {
			$('.warningDetailAddress').text('상세주소를 입력해주세요');
			isValid = false;
		} else {
			$('.warningDetailAddress').text('');
		}

		// 유효성 검사 통과 여부 확인 후 제출 처리
		if (isValid) {
			$("form[name=form1]").attr('action', '/views/member/signUpPage2.jsp');
			$("form[name=form1]").submit();
		}
	});

	/*아이디 비밀번호 찾기!!!*/
	$('.submit1').on('click', function() {
		var flen = $("form[name=tapForm1] .chk1").length;
		for (var i = 0; i < flen; i++) {
			if ($('.chk1').eq(i).val() == "" ||
				$('.chk1').eq(i).val() == null ||
				$('.chk1').eq(i).val().trim() == "") {
				alert($('.chk1').eq(i).attr('title') + '을(를) 입력해주세요 : )');
				$('.chk1').eq(i).focus();
				return false;
			}
		}
		$("form[name=tapForm1]").submit();
	});

	$('.submit2').on('click', function() {
		var flen = $("form[name=tapForm2] .chk2").length;
		for (var i = 0; i < flen; i++) {
			if ($('.chk2').eq(i).val() == "" ||
				$('.chk2').eq(i).val() == null ||
				$('.chk2').eq(i).val().trim() == "") {
				alert($('.chk2').eq(i).attr('title') + '을(를) 입력해주세요 : )');
				$('.chk2').eq(i).focus();
				return false;
			}
		}
		if (!pwcheck) {
			alert("비밀번호가 다릅니다.");
		} else {
			$("form[name=tapForm2]").submit();
		}

	});


	/* 회원정보 수정!*/

	$('#updatesubmit1').on('click', function() {
		// 핸드폰 번호 필드 체크
		if ($('.inputCommon[name="mem_phone"]').val().trim() === '') {
			$('.warningPhoneNumber').text('핸드폰 번호를 입력해주세요');
			isValid = false;
		} else {
			var isValid = true;
			var phoneNumber = $('.inputCommon[name="mem_phone"]').val().trim();
			// 휴대폰 번호의 패턴 정의 (ex: 01012345678)
			var phonePattern = /^(010)?\d{4}?\d{4}$/;

			// 정규표현식을 사용하여 패턴 검사
			if (!phonePattern.test(phoneNumber)) {
				$('.warningPhoneNumber').text('올바른 핸드폰 번호 형식이 아닙니다 (01012345678)');
				isValid = false;
			} else {
				$('.warningPhoneNumber').text('');
			}
		}

		// 이메일 필드 체크
		if ($('.inputCommon[name="mem_email"]').val().trim() === '') {
			$('.warningEmail').text('이메일을 입력해주세요');
			isValid = false;
		} else {
			var isValid = true;
			var email = $('.inputCommon[name="mem_email"]').val().trim();
			// 이메일 형식 검사를 위한 정규표현식
			var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			if (!emailPattern.test(email)) {
				$('.warningEmail').text('올바른 이메일 형식이 아닙니다');
				isValid = false;
			} else {
				$('.warningEmail').text('');
			}
		}


		// 우편번호 필드 체크
		if ($('#sample6_postcode').val().trim() === '') {
			$('.warningPostalCode').text('우편번호를 선택해주세요');
			isValid = false;
		} else {
			$('.warningPostalCode').text('');
		}

		// 주소 라인 2 필드 체크
		if ($('.inputAddress[name="address2"]').val().trim() === '') {
			$('.warningDetailAddress').text('상세주소를 입력해주세요');
			isValid = false;
		} else {
			$('.warningDetailAddress').text('');
		}

		// 유효성 검사 통과 여부 확인 후 제출 처리
		if (isValid) {
			$("form[name=infoUpdateForm1]").attr('action', 'memberUpdate');
			$("form[name=infoUpdateForm1]").submit();
		}
	});

	$('#cancelsubmit').on('click', function() {
		if (confirm('정말 취소하시겠습니까?')) {
			// Yes를 클릭한 경우, info 페이지로 이동
			window.location.href = '/';
		} else {
			// No를 클릭한 경우, 아무 동작 없이 팝업 창 닫기
		}
	});


	$('#deletesubmit').on('click', function() {
		var choice = this.name;
		// 팝업을 띄우고 비밀번호 확인하기
		var _left = Math.ceil((window.screen.width - 600) / 2);
		var _top = Math.ceil((window.screen.height - 200) / 2);
		if (choice == 'memUpdate') {
			$('form[name=form1]').attr('action', "memUpdateForm");
		} else if (choice == 'memDelete') {
			if (confirm('정말 탈퇴하십니까? \n모든 정보가 삭제 됩니다.')) {
				$('form[name=form1]').attr('action', "memDelete");
			} else {
				return false;
			}
		}
		openWin = window.open("/pwCheck", "pwCheck",
			"width=600,height=200,toolbar=no,menubar=no,left=" + _left
			+ ",top=" + _top + ",resizable=no,scrollbars=no,location=no,status=no")
	})



}) /* ready 끝! */

function chkValidate(forNm) {
	var flen = $("form[name=" + forNm + "] .chk").length;
	for (var i = 0; i < flen; i++) {
		if ($("form[name=" + forNm + "] .chk").eq(i).val() == ""
			|| $("form[name=" + forNm + "] .chk").eq(i).val() == null
			|| $("form[name=" + forNm + "] .chk").eq(i).val().trim() == "") {
			alert($("form[name=" + forNm + "] .chk").eq(i).attr('title') + '는 필수입력입니다.');
			$("form[name=" + forNm + "] .chk").eq(i).focus();
			return false;
		}
	}
	if (forNm == 'form1') {
		var str = $('input[name="mem_email"]').val();
		var atPos = str.indexOf('@');
		var atLastPos = str.lastIndexOf('@');
		var dotPos = str.indexOf('.');
		var spacePos = str.indexOf(' ')
		var commaPos = str.indexOf(',')
		var eMailSize = str.length;
		if (!(atPos > 1 && atPos == atLastPos &&
			dotPos > 3 && spacePos == -1 && commaPos == -1 &&
			atPos + 1 < dotPos && dotPos + 1 < eMailSize)) {
			//alert('Email 주소 형식이 잘못되었습니다.\\n 다시 입력해 주시오.')
			$('font[class=emailNm]').text('');
			$('font[class=emailNm]').attr('color', 'red');
			$('font[class=emailNm]').text('Email 주소 형식이 잘못되었습니다.');
			document.form1.mem_email.focus();
			return false;
		}
	}
	return true;

}