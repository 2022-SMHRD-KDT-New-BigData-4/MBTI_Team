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
        <!-- jquery 연결 -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script src="./js/main.js"></script>
        <!-- 파비콘 -->
<link rel="icon" href="./img/favicon.ico">
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
                    <li><a href="GoLoginForm.do"><img src="./img/util_login_i.png" alt=""> LOGIN</a></li>
                </ul>
            </nav>
        </header>
        <!-- 회원가입 성공-->
        <section class="join-success">
            <div>
                <span></span>
                <p>${MBTI} ${nickname}님</p>
                <p>MNM 회원가입을 축하드립니다!</p>
                <a href="GoLoginForm.do">로그인페이지로 이동</a>
            </div>
        </section>

    </body>

</html>