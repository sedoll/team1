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
    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    // par 를 넣기전에 질문 게시글을 db에 저장
    try {
        conn = con.connect();
        String sql = "INSERT INTO notice(title, content, author) VALUES(?, ?, ?) ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("공지 생성 완료");
//            response.sendRedirect("qnaList.jsp");
            out.println("<script>alert('게시글 추가 성공')</script>");
            out.println("<script>location.href='help.jsp'</script>");
        } else {
            System.out.println("공지 생성 실패");
            out.println("<script>alert('게시글 추가 실패')</script>");
            out.println("<script>history.back()</script>");
        }
    } catch (SQLException e) {
        System.out.println("공지 생성: sql 에러");
    } catch (Exception e) {

    } finally {
        con.close(pstmt, conn); // db commit(저장)
    }

%>
