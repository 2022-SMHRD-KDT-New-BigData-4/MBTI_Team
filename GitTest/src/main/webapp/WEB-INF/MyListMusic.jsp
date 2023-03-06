<%@page import="java.util.List"%>
<%@page import="MNM.model.MusicDTO"%>
<%@page import="MNM.model.MbtiDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MBTI and Music</title>
<!-- css 초기화 연결 -->
<link rel="stylesheet" href="./css/reset.css">
<!-- 공통 css 연결 -->
<link rel="stylesheet" href="./css/common.css">
<!-- css 연결 -->
<link rel="stylesheet" href="./css/style.css">
<!-- 파비콘 -->
<link rel="icon" href="./img/favicon.ico">
<!-- jquery 연결 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="./js/main.js"></script>

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
				<li><a href="MyListService.do"> <span>My 리스트</span>
				</a></li>
				<!-- 
				<li><a href="GoMyList.do"> <span>My 리스트</span>
				</a></li>
				<li><a href="GoPlay.do"> <span><img
							src="./img/search_i.png" alt=""> 검색</span>
				</a></li> -->
			</ul>
			<ul class="util-menu dis-non">
				<ul class="util-menu">
					<li><a href="GoJoinForm.do">JOIN</a></li>
					<li><a href="GoLoginForm.do"><img
							src="./img/util_login_i.png" alt=""> LOGIN</a></li>
				</ul>
			</ul>
			<!-- 프로필 클릭 시 -->
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
				<a onclick="doDisplay()"> <img src="./img/profile_icon.png"
					alt=""></a>
			</div>
		</nav>
	</header>

	<div class="container-sub">
		<section class="sub-con">

			<div>
				<p class="page-tit mt80 fadeInUp_obj2 ">내가 좋아하는 음악</p>
				<table class="music-list wrap">
					<tr>
						<td col="col" width="45%">곡 정보</td>
						<td col="col" width="45%">아티스트명</td>
						<td>재생</td>
					</tr>
					<c:forEach items="${myList_song}" var="song">
						<tr class="trHover">
							<td>${song.song_name}</td>
							<td>${song.singer}</td>
							<input type="hidden" name="play_check" value="main">
							<td>
								<button class="play-music" name="video_url"
									value="${song.video_src}" type="submit" alt="재생버튼">
									<img src="./img/play_off_i.png"
										onmouseover="this.src='./img/play_on_i.png'"
										onmouseout="this.src='./img/play_off_i.png'">
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</section>

	</div>

	<script src="./js/popup.js"></script>
	<script src="./js/like.js"></script>

</body>
</html>