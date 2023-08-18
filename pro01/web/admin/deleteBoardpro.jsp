<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="/encoding.jsp"%>

<%
    String id = request.getParameter("id");

    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = con.connect();
        String sql = "delete from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("회원 삭제 완료");
            out.println("<script>alert('삭제 성공')</script>");
            out.println("<script>location.href='boardList.jsp'</script>");
        } else {
            System.out.println("회원 삭제 실패");
            out.println("<script>location.href='boardList.jsp'</script>");
        }
    } catch (SQLException e) {
        System.out.println("회원 삭제: sql 에러");
    } finally {
        con.close(pstmt, conn);
    }

%>
