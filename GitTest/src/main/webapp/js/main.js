// 메인비주얼 영역 텍스트 흐름 효과
$(window).on('load', function() {
	setFlowBanner();
})

function setFlowBanner() {
	const $wrap = $('.flow_banner');
	const $list = $('.flow_banner .list');
	let wrapWidth = $wrap.width();
	let listWidth = $list.width();
	const speed = 92; //1초에 몇픽셀 이동하는지 설정

	//리스트 복제
	let $clone = $list.clone();
	$wrap.append($clone);
	flowBannerAct()

	//배너 실행 함수
	function flowBannerAct() {
		//무한 반복을 위해 리스트를 복제 후 배너에 추가
		if (listWidth < wrapWidth) {
			const listCount = Math.ceil(wrapWidth * 2 / listWidth);
			for (let i = 2; i < listCount; i++) {
				$clone = $clone.clone();
				$wrap.append($clone);
			}
		}
		$wrap
			.find('.list')
			.css({
				'animation': `${listWidth / speed}s linear infinite flowRolling`
			});
	}
}


// 헤더 스크롤시
$(document).ready(function() {
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		if (scroll > 1) {
			$("header").css("borderBottom", "1px solid #282828");
			$("header").css("background", "#020202");
		} else {
			$("header").css("borderBottom", "none");
			$("header").css("background", "none");
		}
	})
})

$(function() {

	$("#inputCol").focus(function() {
		$(this).css("color", "#fff");
	});
	$("#inputCol").blur(function() {
		$(this).css("color", "#666");
	});

});


// 회원가입 시('가입하기' 버튼 클릭 시) 무조건 들어오는 join_check 함수!
function join_check() {
	let id = document.getElementById("id")
	let pw = document.getElementById("pw");
	let pw_check = document.getElementById("pw_check");
	let nickname = document.getElementById("nickname");
	let mbti = document.getElementById("mbti");

	// 아이디 입력 안 했을 때
	if (id.value == "") {
		alert("아이디를 입력하세요.");
		return false; // 아무것도 반환하지 말아라, 아래 코드부터 아무것도 진행하지 마라
	}

	// 비번 입력 안 했을 때
	if (pw.value == "") {
		alert("비밀번호를 입력하세요.");
		return false;
	}

	// 비밀번호 영문+숫자+특수조합 정규식(8~25자리)
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,18}$/;

	// 비밀번호 영문+숫자+특수조합 아닐 시
	if (!pwdCheck.test(pw.value)) {
		alert("비밀번호는 영문, 숫자, 특수문자 조합 6~18자리로 사용해야 합니다.");
		return false;
	};

	// 비밀번호 != 비밀번호 확인
	if (pw.value != pw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	};

	// 닉네임 입력 안 했을 때
	if (nickname.value == "") {
		alert("닉네임을 입력하세요.");
		return false;
	}

	// 성별 미체크 시(둘 다 미체크 시)
	if (!F.checked && !M.checked) {
		alert("성별을 선택해주세요.");
		return false;
	}

	if (mbti.value == "") {
		alert("MBTI를 선택해주세요.");
		return false;
	}

	//입력 값 전송
	joinform.action = "JoinService.do";
	joinform.method = "post";
	joinform.submit();
}


// 로그인 시('로그인' 버튼 클릭 시) 무조건 들어오는 login_check 함수!
function login_check() {
	let id = document.getElementById("id");
	let pw = document.getElementById("pw");

	// 아이디 입력 안 했을 때
	if (id.value == "") {
		alert("아이디를 입력하세요.");
		return false; // 아무것도 반환하지 말아라, 아래 코드부터 아무것도 진행하지 마라
	}

	// 비번 입력 안 했을 때
	if (pw.value == "") {
		alert("비밀번호를 입력하세요.");
		return false;
	}

	//입력 값 전송
	loginform.action = "LoginService.do";
	loginform.method = "post";
	loginform.submit();

}


// 프로필 이미지 클릭시
function doDisplay() {
	let con = document.getElementById("profilePop");
	if (con.style.display == 'none') {
		con.style.display = 'block';
	} else {
		con.style.display = 'none';
	}
}

// 좋아요 버튼 클릭 시 데이터 저장
/*let song_seqlst = [];
$('.like-btn').change(function() {
	let song_seq = $(this).closest("tr").find("td:nth-child(4)").text();
	song_seqlst.push(song_seq);
	console.log(song_seqlst);
})*/

// main 페이지에서 하트 버튼 클릭 시 데이터 저장
$('.hi').click(function() {
	let song_seq =$(this).val()
	console.log(song_seq)
	$.ajax({
		url: "MainLikeService.do",
		type: 'get',
		dataType : "json",
		data: {"song_seq": song_seq},
		success: function(data){
		},
		error: function(error){	
		}
	})
	
})

/*
$('.next-btn').click(function() {
	$.ajax({
		url: 'JoinLikeService.do',
		type: 'post',
		dataType : "json",
		traditional : true,
		data: {"song_seqlst": song_seqlst},
		success: function(data) {
			alert("데이터전송 성공");
		},
		error: function(error) {
			alert("에러❤")
		}
	})
})
*/


