<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="/encoding.jsp"%>

<%
    String fileName = request.getParameter("file");

    String directory = application.getRealPath("/data/");

    File file = new File(directory + fileName);

    if (file.exists()) {
        file.delete();
        out.println("<script>alert('삭제 성공')</script>");
        out.println("<script>location.href='boardList.jsp'</script>");
    } else {
        System.out.println("삭제 실패");
    }

%>
