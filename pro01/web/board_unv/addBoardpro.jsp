<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="/encoding.jsp"%>

<%
    String author = (String) session.getAttribute("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String link = request.getParameter("hl");
    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    // par 를 넣기전에 게시글을 db에 저장
    try {
        conn = con.connect();
        String sql = "INSERT INTO board_unv(title, content, author, link) VALUES(?, ?, ?, ?) ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);
        pstmt.setString(4, link);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("입시 정보글 생성 완료");
            out.println("<script>location.href='/pro01/board_unv/boardList.jsp'</script>");
        } else {
            System.out.println("입시 정보글 생성 실패");
        }
    } catch (SQLException e) {
        System.out.println("입시 정보글 생성: sql 에러");
    } catch (Exception e) {

    } finally {
        con.close(pstmt, conn); // db commit(저장)
    }

%>
