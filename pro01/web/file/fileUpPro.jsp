<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="/encoding.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String savePath = application.getRealPath("/data");
    // String file = "";
    // String oriFile = "";
    int sizeLimit = 5 * 1024 * 1024;
    System.out.println(savePath);

    File saveFolder = new File(savePath);
    if (!saveFolder.exists()) {
        saveFolder.mkdirs(); // 폴더가 없으면 생성
    }

    MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
    Enumeration files = multi.getFileNames();
    String name = (String) files.nextElement();

    // file = multi.getFilesystemName(name);
    // oriFile = multi.getOriginalFileName(name);

    response.sendRedirect("boardList.jsp");
%>
<%--
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h2>파일 업로드 성공</h2><br/>
파일 저장 위치 : <%= savePath%><br/>
파일 저장 이름 : <%= file%><br/>
파일 원본 이름 : <%= oriFile%>
<a href="download.jsp?filename=<%=file%>">파일 다운로드 페이지</a>
</body>
</html>
--%>
