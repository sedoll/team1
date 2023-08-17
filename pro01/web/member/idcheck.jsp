<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 검사</title>
</head>
<body>
<%
    String id = request.getParameter("id");
%>
<div class="container">
    <form name="child" action="idload.jsp" method="post" onsubmit="return invalidCheck(this)">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="20글자 이내">
        <input type="submit" value="아이디 중복 검사">
    </form>
    <script src="/js/idcheck.js"></script>
</div>
</body>
</html>