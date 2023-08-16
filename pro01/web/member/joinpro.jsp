<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ include file="/encoding.jsp"%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    int job = Integer.parseInt(request.getParameter("job"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "insert into member(id, pw, name, tel, email, job) values (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, tel);
        pstmt.setString(5, email);
        pstmt.setInt(6, job);
        cnt = pstmt.executeUpdate();
        if(cnt > 0){ // 회원가입 성공했을 경우 로그인 페이지로 이동
            response.sendRedirect("/member/login.jsp");
        } else { // 회원가입에 실패했을 경우 그대로
            response.sendRedirect("/member/join.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>