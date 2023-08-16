<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!-- display none 스타일 -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IT 교육</title>
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

        .card_lst li .thumb_box {background-image: url("../img/icon_py.png");}

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
        <%
            if(sid!=null) {
        %>
        <div class="contents">
            <div class="back_bread">
                <div class="breadcrumb">
                    <p><a href="">HOME</a> &gt; <a href="">IT교육</a></p>
                </div>
            </div>

            <!-- 네비게이션 바-->
            <div class="tab_box">
                <ul>
                    <li><label for="python">Python</label></li>
                    <li><label for="java">Java</label></li>
                    <li><label for="opencv">OpenCV</label></li>
                    <li><label for="jsp">JSP</label></li>
                </ul>
                <!-- <ul>
                    <li><a href="#com">회사개요</a></li>
                    <li><a href="#greet">인사말</a></li>
                    <li><a href="#history">회사연혁</a></li>
                    <li><a href="#map">오시는길</a></li>
                </ul> -->
            </div>

            <input type="radio" name="ra1" class="ra1" id="python" checked/>
            <section class="page" id="python">
                <div class="page_wrap">
                    <h2 class="page_tit">Python</h2>
                    <div class="sl-btn-box">
                        <button type="button" class="btn next">&gt;</button>
                        <button type="button" class="btn prev">&lt;</button>
                    </div>
                    <!-- div.slide_box>ul.card_lst>li.item$*7>a>div.thumb_box+p.thumb_tit{썸네일제목$}+(div.ico_box>span.ico_item+span{아이콘$}.thumb_date{2023-07-18}) -->
                    <div class="slide_box">
                        <ul class="card_lst">
                            <li class="item1">
                                <h3 class="cate_tit">파이썬의 개념</h3>
                                <ul class="cate_lst">
                                    <li >
                                        <a href="https://ko.wikipedia.org/wiki/%ED%8C%8C%EC%9D%B4%EC%8D%AC" title="자세히" target="_blank">
                                            <p class="bd_content">파이썬은 1991년 귀도 반 로섬이 발표한 고급 프로그래밍 언어로, 
                                                플랫폼에 독립적이며 인터프리터식, 객체지향적, 동적 타이핑 대화형 언어이다.</p>
                                            <p class="bd_date">2023-06-13</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <p class="bd_content">
                                                파이썬의 변수 선언 <br>
                                                4250.0 <br>
                                            </p>
                                            <p class="bd_date">2023-07-17</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item2">
                                <a href="https://blog.naver.com/tmvmffpsej/222679218621" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">가변 매개변수, 기본 매개변수, 키워드</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-15</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item3">
                                <a href="https://blog.naver.com/tmvmffpsej/222679221828" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">재귀 함수</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-18</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item4">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목4</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item5">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목5</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item6">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목6</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item7">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목7</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <input type="radio" name="ra1" class="ra1" id="java" />
            <section class="page" id="java">
                <div class="page_wrap">
                    <h2 class="page_tit">JAVA</h2>
                    <div class="sl-btn-box">
                        <button type="button" class="btn next">&gt;</button>
                        <button type="button" class="btn prev">&lt;</button>
                    </div>
                    <!-- div.slide_box>ul.card_lst>li.item$*7>a>div.thumb_box+p.thumb_tit{썸네일제목$}+(div.ico_box>span.ico_item+span{아이콘$}.thumb_date{2023-07-18}) -->
                    <div class="slide_box">
                        <ul class="card_lst">
                            <li class="item1">
                                <h3 class="cate_tit">자바의 개념</h3>
                                <ul class="cate_lst">
                                    <li >
                                        <a href="https://ko.wikipedia.org/wiki/%ED%8C%8C%EC%9D%B4%EC%8D%AC" title="자세히" target="_blank">
                                            <p class="bd_content">파이썬은 1991년 귀도 반 로섬이 발표한 고급 프로그래밍 언어로, 
                                                플랫폼에 독립적이며 인터프리터식, 객체지향적, 동적 타이핑 대화형 언어이다.</p>
                                            <p class="bd_date">2023-06-13</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <p class="bd_content">
                                                파이썬의 변수 선언 <br>
                                                4250.0 <br>
                                            </p>
                                            <p class="bd_date">2023-07-17</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item2">
                                <a href="https://blog.naver.com/tmvmffpsej/222679218621" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">가변 매개변수, 기본 매개변수, 키워드</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-15</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item3">
                                <a href="https://blog.naver.com/tmvmffpsej/222679221828" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">재귀 함수</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-18</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item4">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목4</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item5">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목5</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item6">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목6</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item7">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목7</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <input type="radio" name="ra1" class="ra1" id="opencv" />
            <section class="page" id="opencv">
                <div class="page_wrap">
                    <h2 class="page_tit">opencv</h2>
                    <div class="sl-btn-box">
                        <button type="button" class="btn next">&gt;</button>
                        <button type="button" class="btn prev">&lt;</button>
                    </div>
                    <!-- div.slide_box>ul.card_lst>li.item$*7>a>div.thumb_box+p.thumb_tit{썸네일제목$}+(div.ico_box>span.ico_item+span{아이콘$}.thumb_date{2023-07-18}) -->
                    <div class="slide_box">
                        <ul class="card_lst">
                            <li class="item1">
                                <h3 class="cate_tit">OpenCV의 개념</h3>
                                <ul class="cate_lst">
                                    <li >
                                        <a href="https://ko.wikipedia.org/wiki/%ED%8C%8C%EC%9D%B4%EC%8D%AC" title="자세히" target="_blank">
                                            <p class="bd_content">파이썬은 1991년 귀도 반 로섬이 발표한 고급 프로그래밍 언어로, 
                                                플랫폼에 독립적이며 인터프리터식, 객체지향적, 동적 타이핑 대화형 언어이다.</p>
                                            <p class="bd_date">2023-06-13</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <p class="bd_content">
                                                파이썬의 변수 선언 <br>
                                                &gt;&gt;&gt; price = 5000 <br>
                                                &gt;&gt;&gt; price *= 0.85 <br>
                                                &gt;&gt;&gt; price <br>
                                                4250.0 <br>
                                            </p>
                                            <p class="bd_date">2023-07-17</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item2">
                                <a href="https://blog.naver.com/tmvmffpsej/222679218621" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">가변 매개변수, 기본 매개변수, 키워드</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-15</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item3">
                                <a href="https://blog.naver.com/tmvmffpsej/222679221828" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">재귀 함수</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-18</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item4">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목4</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item5">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목5</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item6">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목6</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item7">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목7</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <input type="radio" name="ra1" class="ra1" id="jsp"/>
            <section class="page" id="jsp">
                <div class="page_wrap">
                    <h2 class="page_tit">JSP</h2>
                    <div class="sl-btn-box">
                        <button type="button" class="btn next">&gt;</button>
                        <button type="button" class="btn prev">&lt;</button>
                    </div>
                    <!-- div.slide_box>ul.card_lst>li.item$*7>a>div.thumb_box+p.thumb_tit{썸네일제목$}+(div.ico_box>span.ico_item+span{아이콘$}.thumb_date{2023-07-18}) -->
                    <div class="slide_box">
                        <ul class="card_lst">
                            <li class="item1">
                                <h3 class="cate_tit">JSP의 개념</h3>
                                <ul class="cate_lst">
                                    <li >
                                        <a href="https://ko.wikipedia.org/wiki/%ED%8C%8C%EC%9D%B4%EC%8D%AC" title="자세히" target="_blank">
                                            <p class="bd_content">파이썬은 1991년 귀도 반 로섬이 발표한 고급 프로그래밍 언어로, 
                                                플랫폼에 독립적이며 인터프리터식, 객체지향적, 동적 타이핑 대화형 언어이다.</p>
                                            <p class="bd_date">2023-06-13</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <p class="bd_content">
                                                파이썬의 변수 선언 <br>
                                            </p>
                                            <p class="bd_date">2023-07-17</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="item2">
                                <a href="https://blog.naver.com/tmvmffpsej/222679218621" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">가변 매개변수, 기본 매개변수, 키워드</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-15</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item3">
                                <a href="https://blog.naver.com/tmvmffpsej/222679221828" target="_blank">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">재귀 함수</p>
                                    <span class="thumb_date">오세훈 강사</span>
                                    <div class="ico_box">
                                        <span class="ico item1"></span>
                                        <span class="thumb_date">2023-07-18</span>
                                    </div>
                                </a>
                            </li>
                            <li class="item4">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목4</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item5">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목5</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item6">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목6</p>
                                    <div class="ico_box"><span class="ico item2"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                            <li class="item7">
                                <a href="">
                                    <div class="thumb_box"></div>
                                    <p class="thumb_tit">썸네일제목7</p>
                                    <div class="ico_box"><span class="ico item1"></span><span class="thumb_date">2023-07-18</span></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <script src="../js/slidebox.js"></script>
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
    <%--
    <!-- 문서 위로 이동 -->
    <a href="#" class="totop">↑</a>

    <!-- 화면 보이기-->
    <!-- <script>
        // URL의 해시 (hash)를 이용하여 해당 id에 해당하는 페이지를 보여주도록 합니다.
        window.onload = function () {
            var hash = window.location.hash;
            if (hash) {
              var targetRadio = document.getElementById(hash.substr(1));
              if (targetRadio) {
                targetRadio.checked = true;
              }
            }
          };
      </script> --> --%>

    <script src="../js/load.js"></script>
</body>

</html>