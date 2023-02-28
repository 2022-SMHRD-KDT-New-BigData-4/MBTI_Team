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
            <h1><a href="GoMain.do"><img src="./img/logo.png" alt=""></a></h1>
            <ul class="util-menu">
                <li><a href="GoJoinForm.do">JOIN</a></li>
                <li><a href="GoLoginForm.do"><img src="./img/util_login_i.png" alt=""> LOGIN</a></li>
            </ul>
        </nav>
    </header>

    <!-- 로그인 테이블 -->

    <section class="login-wrap">
        <div class="login-div">
            
            <form action="LoginService.do" id="loginform" method="post">
                <p id="loginHeader">MNM 로그인</p>
                <p id="loginHeaderSub">서비스를 이용하시려면 로그인을 해주세요.</p>
                <table>
                    <tr>
                        <td colspan="2">
                            <input type="text" name="id" id="id" class="login-input" placeholder="아이디" autofocus>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="password" name="pw" id="pw" class="login-input" placeholder="비밀번호">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input onclick="login_check()" type="button" id="loginSubmitBtn" value="로그인">
                        </td>
                    </tr>
                    <tr>
                        <td class="account-check">
                            <span>아직 계정이 없으신가요?</span>
                        </td>
                        <td>
                            <a href="GoJoinForm.do" class="account-check" id="goJoin">회원가입하기</a>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </section>
</body>

</html>