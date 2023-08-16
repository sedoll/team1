<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
        .page_tit { font-size:48px; text-align: center; padding-top:0.7em; color:#fff;
            padding-bottom: 1.3em; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px;}
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 {
            width:600px;
            margin:0 auto;
            font-size: 20px;
            border-collapse: separate;
            border-spacing: 0 20px;
            background-color: #e1e1e1;
            border-radius: 14px;

        }
        .tb1 th {
            width:180px;
            line-height: 30px;

            padding-left: 70px;
            border-right: 2px solid #6b6b6b;

            box-sizing: border-box;
            text-align: left;
        }

        .tb1 .data {
            width:320px;
            line-height: 30px;
            padding-top:4px;
            padding-bottom:4px;
            /*border-bottom: 1px solid #333; */
            box-sizing: border-box;
            text-align: left;
            padding-left: 90px;
        }

        .tb2 {
            width: 600px;
            margin: 0 auto;
            margin-top: 50px;
        }

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
    </style>
</head>

<%
    Member mem = new Member();

    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");

    Connection conn = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    // 해당 회원의 정보를 db에서 가져옴
    try {
        String sql = "select * from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()){
            mem.setId(id);
            mem.setPw(rs.getString("pw"));
            mem.setName(name);
            mem.setTel(rs.getString("tel"));
            mem.setEmail(rs.getString("email"));
            mem.setPoint(rs.getInt("point"));
            mem.setJob(rs.getInt("job"));
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
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
            <p><a href="">HOME</a> &gt; <span>마이페이지</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">마이페이지</h2>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th>이름</th>
                        <td class="data"><%=mem.getName()%></td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td class="data"><%=mem.getId()%></td>
                    </tr>
                    <tr>
                        <th>직업</th>
                        <td class="data"><%=(mem.getJob() == 0 ? "관리자" : mem.getJob() == 1 ? "학생" : "선생님" )%></td>
                    </tr>

                    <tr>
                        <th>전화번호</th>
                        <td class="data"><%=mem.getTel()%></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td class="data"><%=mem.getEmail()%></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td class="data"><%=mem.getPoint()%></td>
                    </tr>
                    </tbody>
                </table>
                <table class="tb2">
                    <tr>
                        <td colspan="2">
                            <a href="./modify.jsp" class="inbtn">회원정보수정</a>
                            <a href="/" class="inbtn">메인화면</a>
                        </td>
                    </tr>
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