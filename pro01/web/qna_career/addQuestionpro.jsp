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
        String sql = "INSERT INTO qna_career(title, content, author, par) VALUES(?, ?, ?, ?) ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);
        pstmt.setInt(4, 0);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("질문 생성 완료");
        } else {
            System.out.println("질문 생성 실패");
        }
    } catch (SQLException e) {
        System.out.println("질문 생성: sql 에러");
    } catch (Exception e) {

    } finally {
        con.close(pstmt, conn); // db commit(저장)
    }

    // 질문 게시글에 저장을 한 후 qno를 뽑아서 par에 저장
    try {
        conn = con.connect();
        String sql = "update qna_career set par=qno where par=0 and lev=0";
        pstmt = conn.prepareStatement(sql);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("update 완료");
//            response.sendRedirect("qnaList.jsp");
            out.println("<script>alert('질문 추가 성공')</script>");
            out.println("<script>location.href='qnaList.jsp'</script>");
        } else {
            System.out.println("추가 실패");
            out.println("<script>alert('질문 추가 실패')</script>");
            out.println("<script>location.href='qnaList.jsp'</script>");
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        con.close(pstmt, conn); // db commit(저장)
    }

%>
