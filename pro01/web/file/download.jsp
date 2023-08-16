<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h1>File Download Example</h1>

<%
    String directory = application.getRealPath("/data");
    String files[] = new File(directory).list();
    int tot = files.length;
    for(String file : files) {
        out.write("<a href=\""+request.getContextPath()+"downloadAction.jsp?file="+
            java.net.URLEncoder.encode(file, "UTF-8")+"\">"+file+"</a><br>");
    }
%>
</body>
</html>
