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
				<a href="GoMainLogin.do"><img src="./img/logo.png" alt=""></a>
			</h1>
			<ul class="main-menu">
				<li><a href="GoMbtiMusicBox.do"> <span>MBTI 추천 음악</span>
				</a></li>
				<li><a href="#"> <span>My 리스트</span>
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

	<div class="container-sub other-mbti">
		<section class="sub-con">
			<ul class="other-list mbti-list">
				<li><a href="MbtiMusicService.do?mbti=ISTJ"> <img
						src="./img/thum_istj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ISTJ</span> <span class="thum-text">청렴결백
							논리주의자</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ISFJ"> <img
						src="./img/thum_isfj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ISFJ</span> <span class="thum-text">용감한
							수호자</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=INFJ"> <img
						src="./img/thum_infj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">INFJ</span> <span class="thum-text">선의의
							옹호자</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=INTJ"> <img
						src="./img/thum_intj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">INTJ</span> <span class="thum-text">용의주도한
							전략가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ISTP"> <img
						src="./img/thum_istp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ISTP</span> <span class="thum-text">만능
							재주꾼</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ISFP"> <img
						src="./img/thum_isfp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ISFP</span> <span class="thum-text">호기심
							많은 예술가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=INFP"> <img
						src="./img/thum_infp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">INFP</span> <span class="thum-text">열정적인
							중재자</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=INTP"> <img
						src="./img/thum_intp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">INTP</span> <span class="thum-text">논리적인
							사색가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ESTP"> <img
						src="./img/thum_estp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ESTP</span> <span class="thum-text">모험을
							즐기는 사업가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ESFP"> <img
						src="./img/thum_esfp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ESFP</span> <span class="thum-text">자유로운
							영혼의 연예인</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ENFP"> <img
						src="./img/thum_enfp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ENFP</span> <span class="thum-text">재기발랄한
							활동가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ENTP"> <img
						src="./img/thum_entp.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ENTP</span> <span class="thum-text">논쟁을
							즐기는 변론가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ESTJ"> <img
						src="./img/thum_estj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ESTJ</span> <span class="thum-text">엄격한
							관리자</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ESFJ"> <img
						src="./img/thum_esfj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ESFJ</span> <span class="thum-text">사교적인
							외교관</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ENFJ"> <img
						src="./img/thum_enfj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ENFJ</span> <span class="thum-text">정의로운
							사회운동가</span>
				</a></li>
				<li><a href="MbtiMusicService.do?mbti=ENTJ"> <img
						src="./img/thum_entj.png" alt=""> <span
						class="over-box"> <i></i>
					</span> <span class="thum-tit">ENTJ</span> <span class="thum-text">대담한
							통솔자</span>
				</a></li>

			</ul>
		</section>


		<script src="./js/popup.js"></script>
</body>
</html>