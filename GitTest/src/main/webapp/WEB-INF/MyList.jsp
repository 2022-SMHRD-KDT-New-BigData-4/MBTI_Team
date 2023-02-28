<%@page import="MNM.model.MbtiDTO"%>
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
</head>

<body>
	<header>
		<nav>
			<h1>
				<a href="GoMainLogin.do"><img src="./img/logo.png" alt=""></a>
			</h1>
			<ul class="main-menu">
				<li><a href="GoMbtiMusicBox.do"> <span>MBTI 추천 음악</span>
				</a></li>
				<li><a href="GoMyList.do"> <span>My 리스트</span>
				</a></li>
				<li><a href="#"> <span><img src="./img/search_i.png"
							alt=""> 검색</span>
				</a></li>
			</ul>
			<ul class="util-menu dis-non">
				<ul class="util-menu">
					<li><a href="GoJoinForm.do">JOIN</a></li>
					<li><a href="GoLoginForm.do"><img
							src="./img/util_login_i.png" alt=""> LOGIN</a></li>
				</ul>
			</ul>
			<%
			MbtiDTO mbti_data = (MbtiDTO) session.getAttribute("mbti_data");
			%>
			<!-- 프로필 클릭 시 -->
			<div id="profilePop" class="profile-wrap" style="display: none;">
				<ul class="profile-list">
					<li><%=mbti_data.getM_MBTI()%> ${member.m_Nick}님</li>
					<li><a href="LogoutService.do"><img
							src="./img/logout_i.png" alt=""> 로그아웃</a></li>
				</ul>
			</div>
			<!-- 프로필 -->
			<div id="profileClick" class="profile">
				<a href="javascript:doDisplay();"><img
					src="./img/profile_icon.png" alt=""></a>
			</div>
		</nav>
	</header>

	<!--my list-->
	<article class="container-sub">
		<div class="myList-div sub-con">
			<p class="page-tit">My 리스트</p>
			<ul class="myList-thum">
				<li><a href="#">
						<p>
							<img src="./img/mylist_thum01.png" alt="">
						</p>
						<ul class="myList-name">
							<li>My list 제목1</li>
							<li>2023.02.20</li>
						</ul>
				</a></li>
				<li><a href="#">
						<p>
							<img src="./img/mylist_thum02.png" alt="">
						</p>
						<ul class="myList-name">
							<li>My list 제목1</li>
							<li>2023.02.20</li>
						</ul>
				</a></li>
				<li><a href="#">
						<p>
							<img src="./img/mylist_thum03.png" alt="">
						</p>
						<ul class="myList-name">
							<li>My list 제목1</li>
							<li>2023.02.20</li>
						</ul>
				</a></li>
				<li><a href="#">
						<p>
							<img src="./img/mylist_thum04.png" alt="">
						</p>
						<ul class="myList-name">
							<li>My list 제목1</li>
							<li>2023.02.20</li>
						</ul>
				</a></li>
				<li><a href="#">
						<p>
							<img src="./img/mylist_thum04.png" alt="">
						</p>
						<ul class="myList-name">
							<li>My list 제목1</li>
							<li>2023.02.20</li>
						</ul>
				</a></li>
			</ul>
		</div>
	</article>
</body>

</html>