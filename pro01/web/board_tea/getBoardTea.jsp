<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.Qna" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ include file="/encoding.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생 게시판 상세</title>
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
        .contents { clear:both; min-height: 150vh; background-image: url("../img/login.jpg");
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
        .tb1 {width: 1200px; font-size: 17px; margin-bottom: 50px;}
        .tb1 th {line-height: 32px; padding-top:8px; padding-bottom:8px; font-size: 21px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td {line-height: 32px; padding-top:8px; padding-bottom:8px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: left;}

        .tb1 .item1 { width: 20%;}
        .tb1 .item2 {width: 55%;}
        .tb1 .item3 {width: 10%;}
        .tb1 .item4 {width: 15%;}

        .inbtn { display:inline-block;  border-radius:10px;
            width:30px; margin-right: 10px; margin-left: 10px; text-align: center;  background-color: #333; color:#fff; font-size: 15px; cursor: pointer; }

        .delete_btn {
            background-color: red; color:#fff;
        }

        .inbtn:hover {
            background-color: #666666;
        }

        .frm{margin-top: 50px;}
        .frm tr > *{margin-right: 10px;}
        .btn_group {margin-top: 50px;}
        #ans_btn {float: right; border-radius:10px;
            width:60px; padding: 10px;}
        p {display: inline-block;}
        textarea {resize: none;}
    </style>
</head>

<%
    List<Board> boardList = new ArrayList<>();
    int bno = Integer.parseInt(request.getParameter("bno"));

    DBC con = new MariaDBCon();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Date d;  //날짜데이터로 변경
    String date;
    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");

    try{
        // 조회수 갱신 코드
        conn = con.connect();
        String sql = "update board_tea set cnt=cnt+1 where par=? and lev=0";
        System.out.println(bno);
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("조회수 갱신 완료");
        } else {
            System.out.println("조회수 갱신 실패");
        }

        // 해당 qno(par) 번호를 갖는 게시물 내용, 댓글 불러오기
        String sql2 = "select * from board_tea where par=? order by lev";
        pstmt = conn.prepareStatement(sql2);
        pstmt.setInt(1, bno);
        rs = pstmt.executeQuery();
        while(rs.next()) {
            Board board = new Board();
            board.setBno(rs.getInt("bno"));
            board.setTitle(rs.getString("title"));
            board.setAuthor(rs.getString("author"));
            board.setContent(rs.getString("content"));
            board.setResdate(rs.getString("resdate"));
            board.setLev(rs.getInt("lev"));
            board.setCnt(rs.getInt("cnt"));
            boardList.add(board);
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
            <p><a href="/">HOME</a> &gt; <a href="/board_tea/boardTeaList.jsp">학생게시판</a> &gt; <a href="/board_tea/getBoardTea.jsp?bno=<%=bno%>">게시글</a></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">게시글</h2>
                <table class="tb1">
                    <%
                        String id2 = boardList.get(0).getAuthor();
                    %>
                    <thead>
                    <tr class="title">
                        <th colspan="5"><%=boardList.get(0).getTitle()%></th>
                    </tr>
                    <tr>
                        <th>
                            <% if (sid != null && sid.equals(id2)) { %>
                            <a href="/board_tea/updateBoardTea.jsp?bno=<%=bno%>&lev=0" class="inbtn">수정</a>
                            <% } %>
                        </th>
                        <th>
                            <% if (sid != null &&( sid.equals("admin") || sid.equals(id2))) { %>
                            <a href="/board_tea/deleteBoardTeapro.jsp?bno=<%=bno%>&lev=0" class="inbtn delete_btn" >삭제</a>
                            <% } %>
                        </th>
                        <th><%=boardList.get(0).getAuthor()%></th>
                        <th><%
                            d = ymd.parse(boardList.get(0).getResdate());  //날짜데이터로 변경
                            date = ymd.format(d);
                        %>
                            <%=date %>
                        </th>
                        <th>조회수 <%=boardList.get(0).getCnt()%></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="5" class="content">
                            <%=boardList.get(0).getContent()%>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="tb1" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1"></th>
                        <th class="item2">댓글</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(int i=1; i<boardList.size(); i++) {
                            d = ymd.parse(boardList.get(i).getResdate());  //날짜데이터로 변경
                            date = ymd.format(d);     //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1">
                            <% if (sid != null && sid.equals(id2)) { %>
                            <a href="/board_tea/updateAnsTea.jsp?bno=<%=boardList.get(i).getBno()%>&lev=1" class="inbtn">수정</a>
                            <% } %>
                            <% if(sid!=null && (sid.equals(boardList.get(i).getAuthor()) || sid.equals("admin")) && boardList.get(i).getLev() != 0) { %>
                            <a href="/board_tea/deleteBoardTeapro.jsp?bno=<%=boardList.get(i).getBno()%>&lev=1" class="inbtn delete_btn"> 삭제 </a>
                            <% } %>
                        </td>
                        <td class="item2"><%=boardList.get(i).getContent() %></td>
                        <td class="item3"><%=boardList.get(i).getAuthor()%></td>
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
                            // sorting 화살표 제거
                            "targets": 'no-sort',
                            "bSort": false,

                            // 3번째 컬럼을 기준으로 내림차순 정렬
                            order: [[3, 'asc']],
                        });
                    } );
                </script>
                <form action="addTeaAnspro.jsp" id="login_frm" class="frm">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><%=sid%></th>
                            <th><textarea name="content" id="content" cols="100" rows="5" placeholder="댓글 입력" required ></textarea></th>
                            <% if (sid != null) { %>
                            <th><input type="submit" value="글쓰기" class="inbtn" id="ans_btn"></th>
                            <input type="hidden" name="bno" value="<%=bno%>" readonly>
                            <input type="hidden" name="id" value="<%=sid%>" readonly>
                            <% } else {%>
                            <p>댓글을 작성하려면 로그인하세요</p>
                            <% } %>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>