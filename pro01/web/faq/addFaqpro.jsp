<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="/encoding.jsp"%>

<%
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");
    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    // FNQ 게시글을 db에 저장
    try {
        conn = con.connect();
        String sql = "INSERT INTO faq(question, answer) VALUES(?, ?) ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, question);
        pstmt.setString(2, answer);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("FNQ 생성 완료");
            response.sendRedirect("faqList.jsp");
        } else {
            System.out.println("FNQ 생성 실패");
            response.sendRedirect("faqList.jsp");
        }
    } catch (SQLException e) {
        System.out.println("FNQ 생성: sql 에러");
    } catch (Exception e) {

    } finally {
        con.close(pstmt, conn); // db commit(저장)
    }

%>
