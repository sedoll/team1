 <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="/encoding.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료 업로드</title>
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
        .contents { clear:both; min-height: 100vh; background-image: url("../img/login.jpg");
            background-repeat: no-repeat; background-position: center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center;  color:#fff;
            padding-bottom: 1.3em; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { width:600px; margin:0 auto; font-size: 24px;}
        .tb1 th { width: 200px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td { width: 400px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}

        .tb1 td:last-child { line-height: 48px; padding-top:24px; padding-bottom:24px; }


        .inbtn { display:block;
            border-radius:10px;
            min-width:120px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 38px;
            background-color: #333;
            color:#fff;
            font-size: 18px;
            cursor: pointer; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }

        .inbtn:hover {
            background-color: #666666;
        }
        .indata {
            display:inline-block;
            width: 590px;
            height: 32px;
            line-height: 32px;
            text-indent:10px;
            font-size:16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px 15px;
        }

        textarea {
            resize: none;
            width: 600px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size:16px;
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
            <p><a href="/">HOME</a> &gt; <a href="./boardList.jsp">자료실</a>
                &gt; <a href="./fileUpload.jsp">자료 업로드</a></p>
        </div>

        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">자료 업로드</h2>
                <form action="fileUpPro.jsp" enctype="multipart/form-data" method="post" id="login_frm" class="frm" onsubmit="return validateForm()">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <td>
                                파일 : <input type="file" name="upfile" accept=".pdf, .hwp, .hwpx, .doc, .docx" class="indata" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="업로드" class="inbtn">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                    function validateForm() {
                        var fileInput = document.querySelector('input[type="file"]');

                        // 파일이 선택되었는지 확인
                        if (fileInput.files.length === 0) {
                            alert("파일을 선택해주세요.");
                            return false; // 폼 제출을 막음
                        }

                        // 파일 확장자 확인 (확장자 리스트를 수정하거나 확장자 검증 방식을 변경할 수 있음)
                        var allowedExtensions = ["pdf", "hwp", "hwpx", "doc", "docx"];
                        var fileName = fileInput.files[0].name;
                        var fileExtension = fileName.split('.').pop().toLowerCase();

                        if (allowedExtensions.indexOf(fileExtension) === -1) {
                            alert("지원하지 않는 파일 형식입니다.");
                            return false; // 폼 제출을 막음
                        }

                        // 여기까지 왔다면 파일이 올바르게 첨부되었으므로 폼을 제출할 수 있도록 함
                        return true;
                    }
                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>
