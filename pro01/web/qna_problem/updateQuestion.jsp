<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.Qna" %>
<%@ include file="/encoding.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 수정</title>
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
        .frm { clear:both; width:1200px; margin:0 auto;  }

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
            border-radius: 5px;
            padding: 5px 15px;
        }

        textarea {
            resize: none; /* 크기 조절 기능 제거 */
            width: 600px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size:16px;
        }
    </style>
</head>

<%
    Qna q = new Qna();
    int qno = Integer.parseInt(request.getParameter("qno"));

    DBC con = new MariaDBCon();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    conn = con.connect();
    if(conn != null) {
        System.out.println("DB 연결 성공");
    } else {
        System.out.println("DB 연결 실패");
    }

    try{
        String sql = "select * from qna_problem where qno=? and lev=0";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, qno);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            q.setTitle(rs.getString("title"));
            q.setAuthor(rs.getString("author"));
            q.setContent(rs.getString("content"));
        }
    } catch (SQLException e) {
        System.out.println("sql 연결 실패");
        e.printStackTrace();
    } catch (Exception e) {

    } finally {
        con.close(rs, pstmt, conn);
    }

%>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p>
                <a href="/">HOME</a> &gt; <a href="qnaList.jsp">QNA</a> &gt; <a href="getQna.jsp?qno=<%=qno%>">질문 상세</a>
                &gt; <a href="updateQuestion.jsp?qno=<%=qno%>">질문 수정</a>
            </p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 수정</h2>
                    <form action="updateQuestionpro.jsp" id="login_frm" class="frm">
                        <table class="tb1">
                            <tbody>
                                <tr>
                                    <td colspan="2"><input type="text" name="title" id="title" class="indata" value="<%=q.getTitle()%>" autofocus required></td>
                                    <input type="hidden" name="qno" value="<%=qno%>" readonly>
                                    <input type="hidden" name="lev" value="0" readonly>
                                </tr>
                                <tr>
                                    <td colspan="2"><textarea name="content" id="content" class="" cols="50" rows="15" maxlength="100" required><%=q.getContent()%></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" value="수정" class="inbtn">
                                        <input type="reset" value="취소" class="inbtn" onclick="window.history.back();">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>