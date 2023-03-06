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
	<!-- 좋아하는 노래 선택 -->
	<section class="container-sub">
		<div class="myList-div sub-con">
			<p class="page-tit">
				<span class="tit-i"></span><span>즐겨듣는 노래를 선택해 주세요!</span>
			</p>
			<form action="JoinLikeService.do">
				<div>
					<table class="music-list wrap">
						<tr class="trHover">
							<td col="col" width="45%">곡 정보</td>
							<td>아티스트명</td>
							<td col="col" width="10%">선택</td>
						</tr>
						<c:forEach items="${song_data}" var="music">
							<tr class="trHover">
								<td name="song" id="song">${music.song_name}</td>
								<td>${music.singer}</td>
								<td>
								<input 
								name="like_song" 
								type="checkbox" value="${music.song_seq}" class="like-btn">
								</td>
							</tr>
						</c:forEach>

					</table>
					<input type="submit" class="next-btn" value="완료">
				</div>
			</form>

		</div>
	</section>

	<script src="./js/popup.js"></script>
	<script src="./js/like.js"></script>
	

</body>

</html>