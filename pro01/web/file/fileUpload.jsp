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
<form action="fileUpPro.jsp" enctype="multipart/form-data" method="post" onsubmit="return validateForm()">
    파일 : <input type="file" name="upfile" accept=".pdf, .hwp, .hwpx, .doc, .docx"><br/>
    <input type="submit" value="Upload">
</form>
<script>
    function validateForm() {
        var fileInput = document.querySelector('input[type="file"]');

        // 파일이 선택되었는지 확인
        if (fileInput.files.length === 0) {
            alert("파일을 선택해주세요.");
            return false; // 폼 제출을 막음
        }

        // 파일 확장자 확인 (확장자 리스트를 수정하거나 확장자 검증 방식을 변경할 수 있음)
        var allowedExtensions = ["pdf", "hwp", "hwpx", "doc", "docx"];
        var fileName = fileInput.files[0].name;
        var fileExtension = fileName.split('.').pop().toLowerCase();

        if (allowedExtensions.indexOf(fileExtension) === -1) {
            alert("지원하지 않는 파일 형식입니다.");
            return false; // 폼 제출을 막음
        }

        // 여기까지 왔다면 파일이 올바르게 첨부되었으므로 폼을 제출할 수 있도록 함
        return true;
    }
</script>
</body>
</html>
