<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String new_pw = request.getParameter("new_pw1");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    String apw = "";

    System.out.println(pw);
    System.out.println(new_pw);

    if(pw.equals(new_pw)) {
        apw = pw;
    } else {
        apw = new_pw;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "update member set pw=?, tel=?, email=? where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, apw);
        pstmt.setString(2, tel);
        pstmt.setString(3, email);
        pstmt.setString(4, id);
        cnt = pstmt.executeUpdate();
        if(cnt > 0){
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>