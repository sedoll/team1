<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%
    String id = request.getParameter("id");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }
    try {
        String sql = "select * from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()){
            out.println("<p>사용 불가능한 아이디</p>");
            out.println("<a href='idcheck.jsp?id="+id+"'>아이디 중복 재시도</a>");
        } else {
            out.println("<p>사용 가능한 아이디</p>");
            out.println("<button type='button' onclick='fnc1(\""+id+"\")'>"+id+"</button>");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<script>
    function fnc1(cid){
        opener.document.frm1.id.value = cid;
        opener.document.frm1.ck_item.value = "yes";
        window.close();
    }
</script>