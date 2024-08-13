<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script src="/js/jquery.js"></script>
<script type="text/javascript">
  $().ready(function(){
	 var msg='${msg}'; 
	 alert(msg);
	  $(location).attr('href','${url}');
  });
</script>
</head>
<body>
</body>
</html>

