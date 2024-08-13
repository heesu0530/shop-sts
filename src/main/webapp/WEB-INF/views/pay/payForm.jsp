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
 <h3>PAY FORM</h3>
 <form id="payForm" name="payForm" action="/payProc" method="post">
<div class="pay">
    <table>
        <tr>
            <td>카드번호 : <input type="text" id="cardNo" name="cardNo"></td>
        </tr>
        <tr>
            <td>유효기간(월) : <input type="text" id="expireMonth" name="expireMonth"></td>
        </tr>
        <tr>
            <td>유효기간(년) : <input type="text" id="expireYear" name="expireYear"></td>
        </tr>
        <tr>
            <td>비밀번호 앞 2자리 : <input type="text" id="cardPw" name="cardPw"></td>
        </tr>
        <tr>
            <td>생년원일(6자리) : <input type="text" id="birthday" name="birthday"></td>
        </tr>
        <tr>
            <td>금액 : <input type="text" id="amount" name="amount"></td>
        </tr>
        <tr>
        	<td><input type="submit" value="결제하기"></td>
        </tr>
    </table>
</div>
</form>
</body>
</html>


