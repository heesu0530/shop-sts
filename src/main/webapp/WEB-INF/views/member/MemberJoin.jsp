<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>쇼핑몰</title>
</head>
<body>
<div style="width:90%">
<c:import url="../header.jsp"/>
<div class="clear"></div>
<div id="contents">
  <c:import url="Register.jsp"/>
</div>
<c:import url="../footer.jsp"/>
</div>
</body>
</html>