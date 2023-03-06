<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MBTI and Music</title>
<!-- css 초기화 연결-->
<link rel="stylesheet" href="./css/reset.css">
<!-- common 공통설정 -->
<link rel="stylesheet" href="./css/common.css">
<!--이 페이지 전용 css-->
<link rel="stylesheet" href="./css/style.css">
<!-- 파비콘 -->
<link rel="icon" href="./img/favicon.ico">
<!-- jquery 연결 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="./js/main.js"></script>

</head>

<body>
	<!-- header 태그-->
	<header>
		<nav>
			<h1>
				<a href="GoMain.do"><img src="./img/logo.png" alt=""></a>
			</h1>
			<ul class="util-menu">
				<li><a href="GoJoinForm.do">JOIN</a></li>
				<li><a href="GoLoginForm.do"><img
						src="./img/util_login_i.png" alt=""> LOGIN</a></li>
			</ul>
		</nav>
	</header>

	<!-- 회원가입 테이블 -->
	<section class="container-sub join-article">
		<div class="join-div">
			<form onsubmit="return false;" id="joinform" method="post">

				<p id="joinHeader">MNM 회원가입</p>
				<p id="joinHeaderSub">아이디와 MBTI 선택으로 간편하게 MNM을 시작하세요!</p>
				<table class="join-form">
					<tr>
						<td><input type="text" name="id" id="id" class="join-input"
							placeholder="아이디" autofocus></td>
					</tr>
					<tr>
						<td colspan="2">
							<li>영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</li>
						</td>
					</tr>
					<tr>
						<td><input type="password" name="pw" id="pw"
							class="join-input" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2">
							<li>영문, 숫자, 특수문자(~!@#$%^&*) 조합 6~18 자리</li>
						</td>
					</tr>
					<tr>
						<td><input type="password" id="pw_check" class="join-input"
							placeholder="비밀번호 확인"></td>
					</tr>
					<tr>
						<td><input type="text" name="nickname" id="nickname"
							class="join-input" placeholder="닉네임"></td>
					</tr>
					<tr>
						<td><span class="gender-check"> <span>성별</span> <input
								type="radio" class="gender" name="gender" id="F" value="F">
								여성 <input type="radio" class="gender" name="gender" id="M"
								value="M"> 남성
						</span></td>
					</tr>
					<tr>
						<td><span class="mbti-check">당신의 MBTI를 선택해주세요.</span></td>
					</tr>
					<tr>
						<td><select name="mbti" id="mbti">
								<option value="" disabled selected>MBTI 선택</option>
								<option value="INTJ">INTJ</option>
								<option value="INTP">INTP</option>
								<option value="ENTJ">ENTJ</option>
								<option value="ENTP">ENTP</option>
								<option value="INFJ">INFJ</option>
								<option value="INFP">INFP</option>
								<option value="ENFJ">ENFJ</option>
								<option value="ENFP">ENFP</option>
								<option value="ISTJ">ISTJ</option>
								<option value="ISFJ">ISFJ</option>
								<option value="ESTJ">ESTJ</option>
								<option value="ESFJ">ESFJ</option>
								<option value="ISTP">ISTP</option>
								<option value="ISFP">ISFP</option>
								<option value="ESTP">ESTP</option>
								<option value="ESFP">ESFP</option>
						</select></td>
					</tr>
					<tr>
						<td><input onclick="join_check()" type="button"
							id="joinSubmitBtn" value="가입하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script src="./js/popup.js"></script>
	<script src="./js/like.js"></script>

</body>

</html>