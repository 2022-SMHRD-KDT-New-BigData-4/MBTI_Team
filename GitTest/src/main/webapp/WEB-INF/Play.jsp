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
        <!-- jquery 연결 -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script src="./js/main.js"></script>

    </head>
    <body>
        <header>
            <nav>
                <h1>
                    <a href="#"><img src="./img/logo.png" alt=""></a>
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
                        <li>
                            <a href="JoinForm.html">JOIN</a>
                        </li>
                        <li>
                            <a href="LoginForm.html"><img src="./img/util_login_i.png" alt="">
                                LOGIN</a>
                        </li>
                    </ul>
            </ul>
            <div class="profile">
                <a href="#"><img src="./img/profile_icon.png" alt=""></a>
            </div>
        </nav>
    </header>


    <%
		List<MusicDTO> music_data = (List<MusicDTO>)session.getAttribute("music_data");
    	String videoUrl = request.getParameter("video_url");
	%>
    <section class="play-con">
        <div class="play-container">
            <div id="playView">
                <p class="tit">My list 제목1</p>
                <iframe id="video" src="<%= videoUrl%>">
                </iframe>
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
					for(int i = 0; i < music_data.size();i++){
						out.print("<tr class='trHover'>");
						out.print("<td>"+music_data.get(i).getSong_name()+"</td>");
						out.print("<td>"+music_data.get(i).getSinger()+"</td>");%>
						<td>
							<button class="downBtn item" data-src="<%=music_data.get(i).getVideo_src() %>" type="button">
								<img src="./img/play_off_i.png"
									onmouseover="this.src='./img/play_on_i.png'"
									onmouseout="this.src='./img/play_off_i.png'">
							</button>
						</td>
						<%	out.print("</tr>");
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

</body>
</html>