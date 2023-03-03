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
   <%
   MbtiDTO mbti_data = (MbtiDTO) request.getAttribute("mbti_data");
   
   List<MbtiDTO> mbti_songlst = (List<MbtiDTO>) session.getAttribute("mbti_songlst");
   %>
   <header>
      <nav>
         <h1>
            <a href="GoMainLogin.do"><img src="./img/logo.png" alt=""></a>
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
               <a href="javascript:;">확인</a> <a href="#" id="close">닫기</a>
            </div>
         </div>
      </div>

   </div>
   <!-- 팝업 끝 -->

   <div class="container-sub">
      <section class="sub-con">
         <div class="mbti-info">
            <div class="mbti-left fadeInUp_obj">
               <img src=<%=mbti_data.getMBTI_IMG()%> alt="ENFJ 이미지">
            </div>
            <div class="mbti-right fadeInUp_obj">
               <p class="tit <%=mbti_data.getM_MBTI()%>-tit"><%=mbti_data.getM_MBTI()%>
               <span class="sub-tit <%=mbti_data.getM_MBTI()%>-sub-tit"><%=mbti_data.getMBTI_REP()%></span>
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
                     <td col="col" width="10%">좋아요</td>
                  </tr>
                  <c:forEach items="${mbti_songlst}" var="song">
                     <tr class="trHover">
                        <td>${song.song_name}</td>
                        <td>${song.singer}</td>
                        <input type="hidden" name = "play_check" value ="mbti" style="display:none;">
                        <td>
                           <button class="play-music" name="video_url" value="${song.video_src}" type="submit" alt="재생버튼">
                              <img src="./img/play_off_i.png"
                                 onmouseover="this.src='./img/play_on_i.png'"
                                 onmouseout="this.src='./img/play_off_i.png'">
                           </button>
                        </td>
                        <td>
                           <input type="checkbox" class="like-btn" name="" value="">
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
            <li><a href="MbtiMusicService.do?mbti=<%=mbti_data.getGOOD_REL() %>"> <img src="./img/thum_<%=mbti_data.getGOOD_REL().toLowerCase() %>.png"
                  alt=""> <span class="over-box"> <i></i>
               </span> <span class="thum-tit"><%=mbti_data.getGOOD_REL() %></span> 
            </a></li>
            <li><a href="MbtiMusicService.do?mbti=<%=mbti_data.getGOOD_REL2() %>"> <img src="./img/thum_<%=mbti_data.getGOOD_REL2().toLowerCase() %>.png"
                  alt=""> <span class="over-box"> <i></i>
               </span> <span class="thum-tit"><%=mbti_data.getGOOD_REL2() %></span> 
            </a></li>
            <li><a href="MbtiMusicService.do?mbti=<%=mbti_data.getBAD_REL() %>"> <img src="./img/thum_<%=mbti_data.getBAD_REL().toLowerCase() %>.png"
                  alt=""> <span class="over-box"> <i></i>
               </span> <span class="thum-tit"><%=mbti_data.getBAD_REL() %></span> 
            </a></li>
            <li><a href="MbtiMusicService.do?mbti=<%=mbti_data.getBAD_REL2() %>"> <img src="./img/thum_<%=mbti_data.getBAD_REL2().toLowerCase() %>.png"
                  alt=""> <span class="over-box"> <i></i>
               </span> <span class="thum-tit"><%=mbti_data.getBAD_REL2() %></span> 
            </a></li>
         </ul>
      </section>

   </div>

   <script src="./js/popup.js"></script>

</body>
</html>