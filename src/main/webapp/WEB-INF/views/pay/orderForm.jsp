<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:,">
</head>
<body>
 <h3>ORDER FORM</h3>
<form id="payForm" name="payForm" action="/orderProc" method="get">
<div class="container">
    <table class="table table-hover table table-striped">
        <tr>
        	<input name="userName" value="c">
        	<input name="amount" value="5000">
        	<input name="itemName" value="1999">
        	<td><input type="submit" value="주문하기">
        //userName
		//itemName
		//amount
        	</td>
        </tr>
    </table>
</div>
</form>
</body>
</html>


