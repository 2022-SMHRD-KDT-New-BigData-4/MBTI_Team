<%@page import="MNM.model.MbtiDTO"%>
<%@page import="java.util.List"%>
<%@page import="MNM.model.MusicDTO"%>
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
			<%
			String play_check = request.getParameter("play_check");
			List<MusicDTO> music_data = null;
			if (play_check.equals("main")) {
				music_data = (List<MusicDTO>) session.getAttribute("music_data");
			} else if (play_check.equals("mbti")) {
				music_data = (List<MusicDTO>) session.getAttribute("mbti_songlst");
			}
			String song_name = request.getParameter("song_name");
			String videoUrl = request.getParameter("video_url");
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


	<section class="play-con">
		<div class="play-container">
			<div id="playView">
				<iframe id="video" src="<%=videoUrl%>"> </iframe>
			</div>
		</div>

		<div id="playList">
			<table class="music-list wrap play-list">
				<tr>
					<th col="col" width="45%">곡 정보</th>
					<th col="col" width="45%">아티스트명</th>
					<th>재생</th>
				</tr>
				<%
				for (int i = 0; i < music_data.size(); i++) {
					out.print("<tr class='trHover'>");
					out.print("<td>" + music_data.get(i).getSong_name() + "</td>");
					out.print("<td>" + music_data.get(i).getSinger() + "</td>");
				%>
				<td>
					<button class="downBtn item"
						data-src="<%=music_data.get(i).getVideo_src()%>" type="button">
						<img src="./img/play_off_i.png"
							onmouseover="this.src='./img/play_on_i.png'"
							onmouseout="this.src='./img/play_off_i.png'">
					</button>
				</td>
				<%
				out.print("</tr>");
				}
				%>
			</table>

		</div>

	</section>

	<script>
    	const buttons = document.querySelectorAll('.item');
    	const videoIframe = document.querySelector('#video')
    	
    	buttons.forEach(button => {
    		button.addEventListener('click',()=>{
    			const videoUrl = button.dataset.src;
    			videoIframe.src = videoUrl;
    		});
    	});
    </script>

	<script src="./js/popup.js"></script>
	<script src="./js/like.js"></script>

</body>
</html>