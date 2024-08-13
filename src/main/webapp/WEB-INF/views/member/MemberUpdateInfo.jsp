
<!-- 회원정보 업데이트 페이지구성-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information Update</title>
<!-- <link rel="stylesheet" type="text/css"  href="/css/member/memberInfo.css">
<link rel="stylesheet" type="text/css" href="/css/common.css"> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
<script src="/js/zipCheck.js"></script>
<link rel="stylesheet" type="text/css"  href="/css/member/signUp.css">
</head>
<body>
<!-- 회원가입 폼 -->
	<div align="center">
		<form action="" method="post" name="infoUpdateForm1">
			<table>
				<tr>
					<th>
						<input type="text" name="mem_id" class="chk inputCommon" title="아이디" id="idNm" 
						value="${mvo.mem_id}" readonly="readonly" style="margin-left: 131px; width: 60%; border-radius: 15px; margin-top: 30px;">
					</th>
				</tr>
				<tr>
					<th>
						<input type="text" name="mem_name" class="chk inputCommon" title="성명"
						value="${mvo.mem_name}" readonly="readonly" style="margin-left: 131px; width: 60%; border-radius: 15px;">
					</th>
				</tr>
				<tr>
					<th>
						<input type="text" name="mem_phone" class="chk inputCommon" title="핸드폰번호"
						placeholder="${mvo.mem_phone}" style="margin-left: 131px; width: 60%; border-radius: 15px;">
					</th>
				</tr>
				<tr>
					<th>
						<font size="2" class="warningPhoneNumber"></font>
					</th>
				</tr>
				<tr>
					<th>
						<input type="text" name="mem_email" class="chk inputCommon" title="이메일" id="emailNm"
						placeholder="${mvo.mem_email}" style="margin-left: 131px; width: 60%; border-radius: 15px;">
					</th>
				</tr>
				<tr>
					<th>
						<font size="2" class="warningEmail"></font>
					</th>
				</tr>
				<tr>
			       <th>
			        <input type="text" name="zipcode" id="sample6_postcode" class="chk postalCode" placeholder="Postal Code"  style="margin-left: 131px; width: 40%; border-radius: 15px;">
			       	<button class="chk btn btn-outline-info" id="zipCheckBtn" type="button" onclick="zipCheck()">우편번호찾기</button> 
			       </th>
				</tr>
				<tr>
					<th>
						<font size="2" class="warningPostalCode"></font>
					</th>
				</tr> 
				<tr>
					<th>
			          <input type="text" name="address" class="chk inputAddress" id="sample6_address"
			          placeholder="${mvo.address}" style="margin-left: 131px; width: 60%; border-radius: 15px;">
			          <input type="text" name="address2" class="chk inputAddress" id="sample6_detailAddress"
			          placeholder="${mvo.address2}" style="margin-left: 131px; width: 60%; border-radius: 15px; margin-bottom: 15px;">
			          <input type="hidden" id="sample6_extraAddress">
					</th>
			    </tr>
			    <tr>
					<th>
						<font size="2" class="warningDetailAddress"></font>
					</th>
				</tr>
			</table>
			<table>
				<tr>
					<th>
						<button type="button" id="cancelsubmit" name="cancel">취소</button>
						<button type="button" id="updatesubmit1" name="memUpdate">완료</button>
					</th>
				</tr>
			</table>
    </form>
	</div>
</body>
</html>