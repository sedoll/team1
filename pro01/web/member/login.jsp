<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="../css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>

        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height: 120vh;
            background-image: url("/img/login.jpg");
            background-repeat: no-repeat;
            background-position: center -250px;
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
            height: 100vh;
            position: relative;
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
            padding-top: 0.7em;
            color: #fff;
            padding-bottom: 1.3em;
        }

        .breadcrumb {
            clear: both;
            width: 1200px;
            margin: 0 auto;
            text-align: right;
            color: #fff;
            padding-top: 28px;
        }

        .breadcrumb a {
            color: #fff;
        }


        .login-form {
            /*margin-top: 50px;*/
            margin: 50px auto;
            width: 350px;
            height: 400px;
            border: 0;
            border-radius: 5px;
            background-color: #eaf4fa;
            padding: 30px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .login-form a {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 18px;
            /*margin-left: 130px;*/
        }
        .tb1 {
            margin-left: 22px;
        }

        .logo-wrap {
            margin: 0 auto;
            padding: 50px 10px 60px 20px;
        }

        .indata {
            font-size: 14px;
            box-sizing: border-box;
            margin-left: 15px;
            margin-bottom: 16px;
            border: none;
            border-radius: 5px;
            padding: 10px;
            width: 150%;
            height: 48px;
        }

        .inbtn {
            color: #EEEFF1;
            font-size: 14px;
            background-color: cornflowerblue;
            font-weight: bolder;
            font-size: 20px;
            margin: 5px 10px 15px 15px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            width: 150%;
            height: 48px;
        }




    </style>

</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>로그인</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">로그인</h2>


                <div class="login-form">
                    <div class="logo-wrap">
                        <img src="/img/teentalk_logo_300.png">
                    </div>
                    <form action="loginpro.jsp" id="login_frm" class="frm">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <td><input type="text" name="id" id="id" class="indata" placeholder="아이디 입력" autofocus
                                           required></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="pw" id="pw" class="indata" placeholder="패스워드 입력"
                                           required></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" value="로그인" class="inbtn">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <a href="/member/term.jsp"> 회원가입 </a>

                </div>

            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>