<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String fileName = request.getParameter("file");

    String directory = application.getRealPath("/data/");
    File file = new File(directory + File.separator + fileName);

    String mimeType = application.getMimeType(file.toString());
    if (mimeType == null) {
        response.setContentType("application/octet-stream");
    }

    String downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");

    response.setHeader("Content-Disposition", "attachment;filename=\"" +
            downloadName + "\"");

    FileInputStream fis = new FileInputStream(file);
    ServletOutputStream servletOutputStream = response.getOutputStream();

    byte b[] = new byte[1024];
    int data = 0;
    while ((data = (fis.read(b, 0, b.length))) != -1) {
        servletOutputStream.write(b, 0, data);
    }

    servletOutputStream.flush();
    servletOutputStream.close();
    fis.close();
%>
