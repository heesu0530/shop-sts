<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<c:if test="${apiResult.responseCode == '0000' }">
				<tr>
					<td>결과코드 : <input type="text" id="responseCode" name="responseCode"></td>
				</tr>
				<tr>
					<td>결과메시지 : <input type="text" id="responseMsg" name="responseMsg"></td>
				</tr>
				<tr>
					<td>암호화된 인증데이터 : <input type="text" id="transactionId" name="transactionId"></td>
				</tr>
				<tr>
					<td>암호화된 인증데이터 : <input type="text" id="orderNumber" name="orderNumber"></td>
				</tr>
				<tr>
					<td>인증데이터 : <input type="text" id="authDateTime" name="authDateTime"></td>
				</tr>
				<tr>
					<td>이메일 : <input type="text" id="authNumber" name="authNumber"></td>
				</tr>
				<tr>
					<td>고객아이디 : <input type="text" id="amount" name="amount"></td>
				</tr>
				<tr>
					<td>카드명 : <input type="text" id="cardName" name="cardName"></td>
				</tr>
				<tr>
					<td>카드번호 : <input type="text" id="cardNo" name="cardNo"></td>
				</tr>
				<tr>
					<td>할부개월 : <input type="text" id="quota" name="quota"></td>
				</tr>
			</c:if>
			<c:if test="${apiResult.responseCode != '0000' }">
				<tr>
					<td>결과코드 : <input type="text" id="responseCode" name="responseCode"></td>
				</tr>
				<tr>
					<td>결과메시지 : <input type="text" id="responseMsg" name="responseMsg"></td>
				</tr>
				<tr>
					<td>암호화된 인증데이터 : <input type="text" id="transactionId" name="transactionId"></td>
				</tr>
				<tr>
					<td>암호화된 인증데이터 : <input type="text" id="orderNumber" name="orderNumber"></td>
				</tr>
				<tr>
					<td>인증데이터 : <input type="text" id="authDateTime" name="authDateTime"></td>
				</tr>
				<tr>
					<td>이메일 : <input type="text" id="authNumber" name="authNumber"></td>
				</tr>
				<tr>
					<td>고객아이디 : <input type="text" id="amount" name="amount"></td>
				</tr>
				<tr>
					<td>카드명 : <input type="text" id="cardName" name="cardName"></td>
				</tr>
				<tr>
					<td>카드번호 : <input type="text" id="cardNo" name="cardNo"></td>
				</tr>
				<tr>
					<td>할부개월 : <input type="text" id="quota" name="quota"></td>
				</tr>
			</c:if>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
			</table>
		</div>
	</form>
</body>
</html>


