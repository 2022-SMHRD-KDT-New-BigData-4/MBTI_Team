<%@page import="MNM.model.MusicDTO"%>
<%@page import="java.util.List"%>
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
	<%
	MbtiDTO mbti_data = (MbtiDTO) session.getAttribute("mbti_data");

	List<MusicDTO> music_data = (List<MusicDTO>)session.getAttribute("music_data");
	%>
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
				<li><a href="GoPlay.do"> <span><img
							src="./img/search_i.png" alt=""> 검색</span>
				</a></li>
			</ul>
			<ul class="util-menu dis-non">
				<ul class="util-menu">
					<li><a href="GoJoinForm.do">JOIN</a></li>
					<li><a href="GoLoginForm.do"><img
							src="./img/util_login_i.png" alt=""> LOGIN</a></li>
				</ul>
			</ul>
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
					<a href="#" id="add_song">확인</a> <a href="#" id="close">닫기</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 팝업 끝 -->


	<div class="container-sub">
		<section class="sub-con">
			<div class="mbti-info">
				<div class="mbti-left fadeInUp_obj">
					<img src=<%=mbti_data.getMBTI_IMG()%> alt="MBTI 이미지">
				</div>
				<div class="mbti-right fadeInUp_obj">
					<p class="tit <%=mbti_data.getM_MBTI()%>-tit"><%=mbti_data.getM_MBTI()%><span
							class="sub-tit <%=mbti_data.getM_MBTI()%>-sub-tit"><%=mbti_data.getMBTI_REP()%></span>
					</p>
					<span class="tit-bar"></span>
					<ul class="mbti-tag">
						<li><%=mbti_data.getTAG1()%></li>
						<li><%=mbti_data.getTAG2()%></li>
						<li><%=mbti_data.getTAG3()%></li>
						<li><%=mbti_data.getTAG4()%></li>
					</ul>
					<p class="text"><%=mbti_data.getMBTI_LONGEXP()%></p>
					<p class="job-tit"><%=mbti_data.getM_MBTI()%>에게 어울리는 직업은?
					</p>
					<p class="job-text"><%=mbti_data.getMBTI_JOB()%></p>
				</div>
			</div>

			<div>
				<p class="page-tit mt80 fadeInUp_obj2 "><%=mbti_data.getM_MBTI()%>
					추천 음악
				</p>
				<form action="GoPlay.do">
					<table class="music-list wrap">
						<tr>
							<td col="col" width="45%">곡 정보</td>
							<td>아티스트명</td>
							<td col="col" width="10%">재생</td>
							<td col="col" width="10%">담기</td>
						</tr>
						<c:forEach items="${music_data}" var="music">
							<tr class="trHover">
								<td>${music.song_name}</td>
								<td>${music.singer}</td>
								<td>
									<button class="play-music" name="video_url" value="${music.video_src}" type="submit" alt="재생버튼">
										<img src="./img/play_off_i.png"
											onmouseover="this.src='./img/play_on_i.png'"
											onmouseout="this.src='./img/play_off_i.png'">
									</button>
								</td>
								<td>
									<button class="downBtn item" type="button" alt="담기버튼">
										<img src="./img/download_off_i.png"
											onmouseover="this.src='./img/download_on_i.png'"
											onmouseout="this.src='./img/download_off_i.png'">
									</button>
								</td>
							</tr>
						</c:forEach>


					</table>
				</form>
			</div>

		</section>

		<section class="other-mbti">
			<p class="page-tit mt80">다른 MBTI 추천 음악</p>
			<ul class="other-list list-mr">
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ISTJ</span> <span class="thum-text">청렴결백
							논리주의자</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ISFJ</span> <span class="thum-text">용감한
							수호자</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">INFJ</span> <span class="thum-text">선의의
							옹호자</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">INTJ</span> <span class="thum-text">용의주도한
							전략가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ISTP</span> <span class="thum-text">만능
							재주꾼</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ISFP</span> <span class="thum-text">호기심
							많은 예술가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">INFP</span> <span class="thum-text">열정적인
							중재자</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">INTP</span> <span class="thum-text">논리적인
							사색가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ESTP</span> <span class="thum-text">모험을
							즐기는 사업가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ESFP</span> <span class="thum-text">자유로운
							영혼의 연예인</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ENFP</span> <span class="thum-text">재기발랄한
							활동가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ENTP</span> <span class="thum-text">논쟁을
							즐기는 변론가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ESTJ</span> <span class="thum-text">엄격한
							관리자</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ESFJ</span> <span class="thum-text">사교적인
							외교관</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ENFJ</span> <span class="thum-text">정의로운
							사회운동가</span>
				</a></li>
				<li><a href="#"> <img src="./img/music_list_thum.png"
						alt=""> <span class="over-box"> <i></i>
					</span> <span class="thum-tit">ENTJ</span> <span class="thum-text">대담한
							통솔자</span>
				</a></li>

			</ul>
		</section>

	</div>

	<script src="./js/popup.js"></script>
</body>
</html>