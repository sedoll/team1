<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="/encoding.jsp"%>

<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    int lev = Integer.parseInt(request.getParameter("lev"));

    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = con.connect();
        String sql = "delete from board where bno=?";
        if(lev == 0) {
            sql = "delete from board where par=?";
        }
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("글 삭제 완료");
            out.println("<script>alert('삭제 성공')</script>");
            out.println("<script>location.href='boardList.jsp'</script>");
        } else {
            System.out.println("글 삭제 실패");
            response.sendRedirect("getBoardTea.jsp?bno="+bno);
        }
    } catch (SQLException e) {
        System.out.println("글 삭제: sql 에러");
    } finally {
        con.close(pstmt, conn);
    }

%>
