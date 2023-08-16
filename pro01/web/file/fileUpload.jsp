<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae.util.*" %>
<%@ include file="/encoding.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h1>form</h1>
<form action="fileUpPro.jsp" enctype="multipart/form-data" method="post">
    파일 : <input type="file" name="upfile" accept=".jpg, .png, .pdf"><br/>
    <input type="submit" value="Upload">
</form>
</body>
</html>
