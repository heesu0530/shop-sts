<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>파일 업로드</title>
</head>
<body>
    <h2>파일 업로드 폼</h2>
    <form method="post" enctype="multipart/form-data" action="/uploadFiles">
        <label>파일 선택 (최대 5개):</label>
        <input type="file" name="files" multiple />
        <br/><br/>
        <input type="submit" value="업로드" />
    </form>
</body>
</html>