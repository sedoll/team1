<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/encoding.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>진로 상담</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

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
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tb1 { width:600px; margin:0 auto; font-size: 24px;}
        .tb1 th {line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td {line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}

        .tb1 .item1 { width: 10%;}
        .tb1 .item2 {width: 60%;}
        .tb1 .item3 {width: 10%;}
        .tb1 .item4 {width: 20%;}

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; float:right;
            cursor: pointer;}

        .inbtn:hover {
            background-color: #666666;
        }

        .btn_group { margin-top: 20px;}
    </style>
</head>

<%
    if(sid != null && ( !sid.equals("") || sid.equals("admin"))) {

    } else {
        out.println("<script>alert('해당 페이지는 회원만 접근 가능합니다.')</script>");
        out.println("<script>location.href='/index.jsp'</script>");
    }

    List<Qna> qnaList = new ArrayList<>();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    // 해당 회원의 정보를 db에서 가져옴
    try {
        String sql = "select * from qnalist where lev=0 order by par desc";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while(rs.next()){
            Qna q = new Qna();
            q.setPar(rs.getInt("par"));
            q.setTitle(rs.getString("title"));
            q.setAuthor(rs.getString("author"));
            q.setName(rs.getString("name"));
            q.setResdate(rs.getString("resdate"));
            qnaList.add(q);
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
            <p><a href="/">HOME</a> &gt; <a href="/qna_career/qnaList.jsp">진로상담</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">진로상담</h2>
                <table class="tb1" id="myTable">
                    <thead>
                        <tr>
                            <th class="item1">번호</th>
                            <th class="item2">제목</th>
                            <th class="item3">작성자</th>
                            <th class="item4">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        int tot = qnaList.size();
                        SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                        for(Qna arr:qnaList) {
                        Date d = ymd.parse(arr.getResdate());  //날짜데이터로 변경
                        String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1"><%=tot-- %></td>
                        <td class="item2"><a href="/qna_career/getQna.jsp?qno=<%=arr.getPar() %>"><%=arr.getTitle() %></a></td>
                        <td class="item3"><%=arr.getName().substring(0, 1) %>
                            <%
                                for(int i=0; i<arr.getName().length()-1; i++) {
                                    out.print("*");
                                }
                            %>
                        </td>
                        <td class="item4"><%=date %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                        });
                    } );
                </script>
                <div class="btn_group">
                    <% if (sid != null && (sjob.equals("1") || sid.equals("admin"))) { %>
                    <a href="addQuestion.jsp" class="inbtn"> 글 작성 </a>
                    <% } else {%>
                    <p>학생만 질문을 쓸 수 있습니다.</p>
                    <% } %>
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