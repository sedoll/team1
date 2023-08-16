<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<!-- display none 스타일 -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>자격증 자료</title>
    <%@include file="../head.jsp"%>

    <!-- 제이쿼리 연결 -->
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
            margin: 0 auto;
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

        .exam { display: block; width: 300px; font-size: 24px; text-align: center;
            margin: 20px auto; }
        .exam:hover {color: red;}
    </style>
</head>

<body>
    <div class="wrap">
        <header class="hd">
            <%@include file="../header.jsp"%>
        </header>
        <%
            if(sid!=null) {
        %>
        <div class="contents">
            <div class="back_bread">
                <div class="breadcrumb">
                    <p><a href="">HOME</a> &gt; <a href="">자격증 자료</a></p>
                </div>
            </div>
            <div class="tab_box">
                <ul>
                    <li><label for="ipe">정보처리기사</label></li>
                    <li><label for="ipie">정보처리산업기사</label></li>
                    <li><label for="bda">빅데이터분석기사</label></li>
                    <!-- <li><label for="map1">오시는길</label></li> -->
                </ul>
            </div>

            <input type="radio" name="ra1" class="ra1" id="ipe" checked/>
            <section class="page" id="ipe">
                <div class="page_wrap">
                    <h2 class="page_tit">정보처리기사</h2>
                    <div class="com_content">
                    </div>
                </div>
            </section>
            <script>
                var content = document.getElementsByClassName('com_content')[0]
                var html = ''
                for(var i=1; i<12; i++) {
                    html += '<a class="exam" href="../file/ipe ('+i+').pdf" download>정보처리기사 기출문제 '+i+'</a>'
                }
                content.innerHTML = html
            </script>

            <input type="radio" name="ra1" class="ra1" id="ipie" />
            <section class="page" id="ipie">
                <div class="page_wrap">
                    <h2 class="page_tit">정보처리산업기사</h2>
                    <div class="com_content">
                    </div>
                </div>
            </section>
            <script>
                var content = document.getElementsByClassName('com_content')[1]
                var html = ''
                for(var i=1; i<12; i++) {
                    html += '<a class="exam" href="../file/ipie ('+i+').pdf" download>정보처리산업기사 기출문제 '+i+'</a>'
                }
                content.innerHTML = html
            </script>

            <input type="radio" name="ra1" class="ra1" id="bda" />
            <section class="page" id="bda">
                <div class="page_wrap">
                    <h2 class="page_tit">빅데이터분석기사</h2>
                    <div class="com_content">
                    </div>
                </div>
            </section>
            <script>
                var content = document.getElementsByClassName('com_content')[2]
                var html = ''
                for(var i=1; i<5; i++) {
                    html += '<a class="exam" href="../file/bda ('+i+').pdf" download>빅데이터분석기사 기출문제 '+i+'</a>'
                }
                content.innerHTML = html
            </script>

            <input type="radio" name="ra1" class="ra1" id="map1"/>
            <section class="page" id="map1">
                <div class="page_wrap">
                    <h2 class="page_tit">오시는길</h2>
                    
                </div>
            </section>
        </div>
        <%
        } else {
        %>
        <script>
            alert('로그인해야 사용할 수 있습니다.')
            location.href = '/'; // sendredirect를 쓰면 alert가 나오기전에 종료되므로 location.href를 사용했다.
        </script>
        <%
            }
        %>
        <footer class="ft">
            <%@include file="../footer.jsp"%>
        </footer>
    </div>

    <!-- 화면 보이기-->
    <script src="../js/load.js"></script>
</body>

</html>