<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="/encoding.jsp"%>
<%

    int bno = Integer.parseInt(request.getParameter("bno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String link = request.getParameter("hl");

    DBC con = new MariaDBCon();

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = con.connect();
        String sql = "update board_act set title=?, content=?, link=? where bno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, link);
        pstmt.setInt(4, bno);
        int cnt = pstmt.executeUpdate();
        if(cnt > 0) {
            System.out.println("게시글 수정 완료");
            out.println("<script>alert('게시글 수정 성공')</script>");
            out.println("<script>location.href='boardList.jsp'</script>");
//            response.sendRedirect("boardTeaList.jsp");
        } else {
            System.out.println("게시글 수정 실패");
//            response.sendRedirect("updateQuestion.jsp?bno="+bno);
            out.println("<script>alert('게시글 수정 실패')</script>");
            out.println("<script>location.href='boardList.jsp'</script>"); //location
        }
    } catch (SQLException e) {
        System.out.println("질문 수정: sql 에러");
    } finally {
        con.close(pstmt, conn);
    }

%>
