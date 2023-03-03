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
				<a href="GoMain.do"><img src="./img/logo.png" alt=""></a>
			</h1>
			<ul class="main-menu">
				<li><a href="GoMbtiMusicBox.do"> <span>MBTI 추천 음악</span>
				</a></li>
				<li><a href="GoMyListMusic.do"> <span>My 리스트</span>
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

	<!-- 팝업 -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-wrap">
			<span class="modal-icon"></span>
			<div class="modal-content">

				<p class="modal-tit">My list 만들기</p>
				<span class="modal-bar"></span>
				<p class="modal-text">나만의 음악 리스트를 만들어 자주 듣는 음악을 담아 보세요!</p>
				<input type="text" id="inputCol" placeholder="폴더명을 입력해 주세요."
					style="color: #555">
				<div class="btn-wrap">
					<a href="javascript:;">확인</a> <a href="#" id="close">닫기</a>
				</div>
			</div>
		</div>

	</div>
	<!-- 팝업 끝 -->

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
					<c:forEach items="${music_data}" var="music">
						<tr class="trHover">
							<td>${music.song_name}</td>
							<td>${music.singer}</td>
							<td>
								<button class="play-music" name="video_url"
									value="${music.video_src}" type="submit" alt="재생버튼">
									<img src="./img/play_off_i.png"
										onmouseover="this.src='./img/play_on_i.png'"
										onmouseout="this.src='./img/play_off_i.png'">
								</button>
							</td>
							<td><input type="checkbox" class="like-btn" name="" value="">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</section>

	</div>

	<script src="./js/popup.js"></script>

</body>
</html>