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
    <!--slick 연결-->
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <!-- <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/> -->
    <!-- 파비콘 -->
<link rel="icon" href="./img/favicon.ico">

    <!-- jquery 연결 -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script type="text/javascript" src="slick/slick.min.js"></script>
    <script src="js/main.js"></script>
    
</head>

<body>
    <div class="main-wrap">
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
        <main class="main-container mv-back" role="main">
            <div class="container-wrap">
                <div class="left-wrap">
                    <div class="main-left">
                        <p><img src="./img/main_typo.png" alt="혹시 MBTI가 어떻게 되세요?"></p>
                        <div class="main-typo">
                            <p>
                                MBTI로 추천받는</p>
                            <p>성향별 뮤직 리스트</p>
                        </div>
    
                        <a href="GoLoginForm.do">지금 바로 플레이 해보세요!</a>
                    </div>
                </div>
              
                <div id="slideShow" class="main-right">
                    <ul class="slides">
                        <li><img src="./img/mv01.png" alt=""></li>
                        <!-- <li><img src="./img/mv01.png" alt=""></li> <li><img src="./img/mv01.png"
                            alt=""></li> <li><img src="./img/mv01.png" alt=""></li> <li><img
                            src="./img/mv01.png" alt=""></li> -->
                        <li><img src="./img/mv02.png" alt=""></li>
                        <li><img src="./img/mv03.png" alt=""></li>
                        <li><img src="./img/mv04.png" alt=""></li>
                        <li><img src="./img/mv05.png" alt=""></li>
                    </ul>
                    <ul class="slides-thum">
                        <li><img src="./img/mv_thum01.png" alt=""></li>
                        <!-- <li><img src="./img/mv-thum01.png" alt=""></li> <li><img
                            src="./img/mv-thum01.png" alt=""></li> <li><img src="./img/mv-thum01.png"
                            alt=""></li> <li><img src="./img/mv-thum01.png" alt=""></li> -->
                    </ul>
                </div>
            </div>
        </main>
        
        <div class="flow_banner">
            <ul class="list">
                <li><img src="./img/mv_back.png" alt=""></li>
                <li><img src="./img/mv_back.png" alt=""></li>
                <li><img src="./img/mv_back.png" alt=""></li>
                <li><img src="./img/mv_back.png" alt=""></li>
                <li><img src="./img/mv_back.png" alt=""></li>
            </ul>
        </div>
    </div>
    <script>

        $('.slides').slick({
            infinite: true,
            speed: 500,
            fade: true,
            cssEase: 'linear',
            autoplay: true,
            auseOnHover: true,
            autoplaySpeed: 2000,
            prevArrow: '<button class="slick-prev" id="prev" aria-label="Previous" type="button"><img src="./img/prev_btn.png" alt=""></button>',
            nextArrow: '<button class="slick-next" id="next" aria-label="Next" type="button"><img src="./img/next_btn.png" alt=""></button>',
   
        });


    </script>
 
</body>
</html>