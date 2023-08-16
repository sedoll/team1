<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.Qna" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae.dto.Faq" %>
<%@ include file="/encoding.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA 상세보기</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
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
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { margin:0 auto; font-size: 24px;}
        .tb1 th {line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td {line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}

        .tb1 .item1 { width: 20%;}
        .tb1 .item2 {width: 55%;}
        .tb1 .item3 {width: 10%;}
        .tb1 .item4 {width: 15%;}

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; margin-right: 10px; margin-left: 10px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; float: right; cursor: pointer; }

        #delete_btn {
            background-color: red; color:#fff;
        }

        #delete_btn:hover {
            background-color: brown;
        }

        .inbtn:hover {
            background-color: #666666;
        }

        .inbtn2 { display:block;  border-radius:50px;
            min-width:50px; background-color: red; color:#fff; font-size: 13px; float: left; }

        .inbtn2:hover { background-color: brown;}

        .btn_group {margin-top: 50px;}

        p {display: inline-block;}
    </style>
</head>

<%
    int fno = Integer.parseInt(request.getParameter("fno"));

    DBC con = new MariaDBCon();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Faq faq = new Faq();

    try{
        // 조회수 갱신 코드
        conn = con.connect();
        String sql = "update faq set cnt=cnt+1 where fno=?";
        System.out.println(fno);
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, fno);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("조회수 갱신 완료");
        } else {
            System.out.println("조회수 갱신 실패");
        }

        // 해당 faq(fno) 번호를 갖는 게시물 내용, 댓글 불러오기
        String sql2 = "select answer, cnt from faq where fno=?";
        pstmt = conn.prepareStatement(sql2);
        pstmt.setInt(1, fno);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            faq.setAnswer(rs.getString("answer"));
            faq.setCnt(rs.getInt("cnt"));
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
            <p><a href="/">HOME</a> &gt; <a href="/faq/faqList.jsp">FAQ</a> &gt; <a href="/faq/faqList.jsp">FAQ 상세</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">FAQ 상세</h2>
                <table class="tb1" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1">조회수 : <%=faq.getCnt()%></th>
                        <th class="item2">내용</th>
                        <th class="item3">작성자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="item1"></td>
                        <td class="item2"><%=faq.getAnswer() %></td>
                        <td class="item3">admin</td>
                    </tr>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            // sorting 화살표 제거
                            "targets": 'no-sort',
                            "bSort": false,

                            // 3번째 컬럼을 기준으로 내림차순 정렬
                            order: [[3, 'asc']],
                        });
                    } );
                </script>
                <div class="btn_group">
                    <% if (sid != null && sid.equals("admin")) { %>
                    <a href="/faq/updatefaq.jsp?fno=<%=fno%>" class="inbtn"> 글 수정</a>
                    <a href="/faq/deletefaqpro.jsp?fno=<%=fno%>" class="inbtn"> 글 삭제</a>
                    <% } else {%>
                    <p>관리자만 수정이 가능합니다.</p>
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