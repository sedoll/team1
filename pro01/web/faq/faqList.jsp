<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.chunjae.dto.Faq" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA</title>
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

        .btn_group2 {display: none; margin-top: 5px;}

        .inbtn2 {background-color: #333; color: white; border-radius: 5px; padding: 5px; margin-right: 30px;}
        .inbtn2:hover {
            background-color: #666666;
        }

        #delete_btn {background-color: red;}
        #delete_btn:hover {background-color: brown;}

        .ans {display: none;}

        .faqlist {font-size: 20px; }

        .que {cursor: pointer;}

        .pagination { font-size: 18px; text-align: center; }

        .paging {margin-right: 10px; margin-bottom: 10px;}
    </style>
</head>

<%
    request.setCharacterEncoding("utf8");
    response.setContentType("text/html;charset=UTF-8");
    response.setCharacterEncoding("utf8");

    int itemsPerPage = 10; // 한 페이지에 보여줄 아이템 수
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    // faqList 전체 데이터와 총 개수를 가정하고 나눠주는 로직
    List<Faq> faqList = new ArrayList<>(); // faqList는 예시를 위한 가상의 데이터라 가정합니다.

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
        String sql = "select * from faq order by fno desc";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while(rs.next()){
            Faq faq = new Faq();
            faq.setFno(rs.getInt("fno"));
            faq.setQuestion(rs.getString("question"));
            faq.setAnswer(rs.getString("answer"));
            faq.setCnt(rs.getInt("cnt"));
            faqList.add(faq);
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
            <p><a href="/">HOME</a> &gt; <a href="/qna/qnaList.jsp">FAQ</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">FAQ<%=" p-"+currentPage%></h2>
                <ul class="faqlist">
                    <%-- 페이징 처리된 faq 출력 --%>
                    <%
                        int totalItems = faqList.size();
                        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

                        int startItem = (currentPage - 1) * itemsPerPage;
                        int endItem = Math.min(startItem + itemsPerPage, totalItems);

                        for (int i = startItem; i < endItem; i++) {
                            Faq f = faqList.get(i);
                            System.out.println(faqList.get(i));
                    %>
                    <li>
                        <div class="que"><%= f.getQuestion() %></div>
                        <br>
                        <div class="ans"><%= f.getAnswer() %></div>
                        <div class="btn_group2">
                            <% if (sid != null && sid.equals("admin")) { %>
                            <a href="/faq/updatefaq.jsp?fno=<%= f.getFno() %>&page=<%= currentPage %>" class="inbtn2"> 글 수정</a>
                            <a href="/faq/deletefaqpro.jsp?fno=<%= f.getFno() %>&page=<%= currentPage %>" class="inbtn2" id="delete_btn"> 글 삭제</a>
                            <% } %>
                        </div>
                    </li>
                    <hr>
                    <%
                        }
                    %>
                </ul>
                <%-- 페이지 네비게이션 --%>
                <div class="pagination">
                    <% if (currentPage > 1) { %>
                    <a class="paging" href="?page=<%= currentPage - 1 %>">Previous</a>
                    <% } %>

                    <% for (int i = 1; i <= totalPages; i++) { %>
                    <a class="paging" href="?page=<%= i %>"><%= i %></a>
                    <% } %>

                    <% if (currentPage < totalPages) { %>
                    <a class="paging" href="?page=<%= currentPage + 1 %>">Next</a>
                    <% } %>
                </div>

                <%-- 제이쿼리를 이용하여 FAQ 게시판 만들기,
                    .faglist 내의 li 태그를 누를 경우 해당 질문이 보이게 된다. --%>
                <script>
                    $(document).ready(function() {
                        $(".faqlist li").click(function() {
                            $(this).find(".ans").slideToggle(500);
                            $(this).find(".btn_group2").slideToggle(500);
                        });
                    });
                </script>

                <div class="btn_group">
                    <% if (sid != null && sid.equals("admin")) { %>
                    <a href="/faq/addFaq.jsp" class="inbtn"> faq 작성 </a>
                    <% } else {%>
                    <p class="exp">관리자만 댓글을 작성 할 수 있습니다.</p>
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