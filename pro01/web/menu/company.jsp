<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사소개</title>
    <%@include file="../head.jsp"%>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <link rel="stylesheet" href="../css/change_img.css">
    <link rel="stylesheet" href="../css/slidebox.css">

    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height: 100vh;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            clear: both;
            width: 100vw;
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            height: auto;
            margin: 0 auto;
        }

        .page_tit {
            font-size: 48px;
            text-align: center;
            padding-top: 1em;
            color: #333;
            padding-bottom: 2.4rem;
        }

        .back_bread {
            height: 100px;
            background-image: url("../img/login.jpg");
            background-repeat: no-repeat;
        }

        .breadcrumb {
            clear: both;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
            text-align: right;
            color: #fff;
            line-height: 60px;
        }

        .breadcrumb a {
            color: #fff;
        }

        .tab_box {
            clear: both;
            width: 1200px;
            height: 42px;
            margin: 0 auto;
            position: fixed;
            bottom: 0;
            left: 50%;
            margin-left: -600px;
            z-index: 99;
        }

        .tab_box li {
            width: 25%;
            height: 42px;
            line-height: 42px;
            float: left;
        }

        .tab_box li:hover {
            width: 25%;
            height: 42px;
            line-height: 42px;
            float: left;
        }

        .tab_box li label {
            display: block;
            width: 100%;
            text-align: center;
            background-color: rgba(136, 255, 0, 0.7);
        }

        .tab_box li label:hover {
            background-color: rgba(1, 95, 1, 0.9);
            color: white;
            font-size: 20px;
        }

        .com_content {
            width: 600px;
        }

        .con_tit {
            font-size: 48px;
            line-height: 1.3;
        }

        .cont {
            font-size: 24px;
            margin-top: 50px;
        }

        .com_img {
            width: 1000px;
            position: absolute;
            top: 300px;
            left: 1000px;
            float: right;
        }

        .ra1 {display: none;}
        .ra1:not(:checked) + .page {display: none;} /*버튼이 체크 되있지 않으면*/
        .ra1:checked + .page {display: block;}
        .ra1:checked #map {display: block;}
        /*.ra1:checked + #tab2 {height: 800px;} 버튼이 체크 되어 있으면*/

        /*.maparea { }*/
    </style>
</head>
<body>
    <div class="wrap">
        <header class="hd">
            <%@include file="../header.jsp"%>
        </header>
        <div class="contents">
            <div class="back_bread">
                <div class="breadcrumb">
                    <p><a href="">HOME</a> &gt; <a href="">회사소개</a></p>
                </div>
            </div>
            <div class="tab_box">
                <ul>
                    <li><label for="com">회사개요</label></li>
                    <li><label for="greet">인사말</label></li>
                    <li><label for="history">회사연혁</label></li>
                    <li><label for="map1">오시는길</label></li>
                </ul>
                <!-- <ul>
                    <li><a href="#com">회사개요</a></li>
                    <li><a href="#greet">인사말</a></li>
                    <li><a href="#history">회사연혁</a></li>
                    <li><a href="#map">오시는길</a></li>
                </ul> -->
            </div>

            <input type="radio" name="ra1" class="ra1" id="com" checked/>
            <section class="page" id="com">
                <div class="page_wrap">
                    <h2 class="page_tit">회사개요</h2>
                    <div class="com_content">
                        <h3 class="con_tit">대한민국 1위 교육·출판 전문 기업</h3>
                        <h3 class="con_tit">교육의 미래를 선도합니다.</h3>
                        <p class="cont">천재교육은 교과서와 학습 교재를 출간하는 교육·출판 전문 기업입니다. <br><br>

                            제5차 교육과정부터 국정·검정·인정 교과용 도서를 개발, 발행하고
                            연간 3,700여 종에 이르는 유아동·초·중·고등 학습 교재를 발간하고 있습니다. <br><br>

                            또한 미래 인재 육성을 위한 학원 프랜차이즈 사업과
                            4차 산업혁명 시대에 발맞춘 스마트러닝, 에듀테크 사업 등을 통해
                            대한민국 교육 트렌드를 주도하고 있습니다.</p>
                    </div>
                    <img src="../img/company1.jpg" alt="" class="com_img">
                </div>
            </section>

            <input type="radio" name="ra1" class="ra1" id="greet" />
            <section class="page" id="greet">
                <div class="page_wrap">
                    <h2 class="page_tit">인사말</h2>
                </div>
            </section>

            <input type="radio" name="ra1" class="ra1" id="history" />
            <section class="page" id="history">
                <div class="page_wrap">
                    <h2 class="page_tit">회사연혁</h2>
                </div>
            </section>

            <input type="radio" name="ra1" class="ra1" id="map1"/>
            <section class="page" id="map1">
                <div class="page_wrap">
                    <h2 class="page_tit">오시는길</h2>
                    <div class="maparea">
                        <div id="map" style="width:500px;height:400px;"></div>
                        <!-- 보안성을 위해 자바스크립트에서 실행후 불러옴-->
                        <script type="text/javascript" src="../api/kakaoMap.js"></script>
                    </div>
                </div>
            </section>
        </div>
        <footer class="ft">
            <%@include file="../footer.jsp"%>
        </footer>
    </div>
    <!-- 화면 보이기-->
    <script src="../js/load.js"></script>
</body>
</html>
