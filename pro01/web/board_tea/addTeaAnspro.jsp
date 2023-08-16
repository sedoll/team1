<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="/encoding.jsp"%>

<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    String author = (String) session.getAttribute("id");
    String title = "댓글";
    String content = request.getParameter("content");
    int lev = 1;

    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = con.connect();
        String sql = "INSERT INTO board_tea(title, content, author, lev, par) VALUES(?, ?, ?, ?, ?) ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);
        pstmt.setInt(4, lev);
        pstmt.setInt(5, bno);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("댓글 생성 완료");
            out.println("<script>alert('댓글 추가 성공')</script>");
            out.println("<script>location.href='getBoardTea.jsp?bno="+ bno +"'</script>");
        } else {
            System.out.println("댓글 생성 실패");
//            response.sendRedirect("addTeaAns.jsp");
            out.println("<script>alert('댓글 추가 실패')</script>");
            out.println("<script>location.href='addTeaAns.jsp?bno="+ bno +"'</script>");
        }
    } catch (SQLException e) {
        System.out.println("댓글 생성: sql 에러");
    } finally {
        con.close(pstmt, conn);
    }

%>
