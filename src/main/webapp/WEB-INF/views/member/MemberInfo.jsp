<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" E content="IE=edge">
<title>WeProject</title>
<link type="text/css" rel="stylesheet" href="../admin/css/default.css" />
<script type="text/javascript" src="../admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../admin/js/design.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/css/member/memberInfo.css">
</head>
<body
	style="background-image: url(../images/login/bg_search.jpg); background-repeat: no-repeat; background-position: center;">
	<form method="post" name="form1">
		<div class="m_center_wrap"
			style="margin-top: 370px; text-align: center;">
			<legend>로그인</legend>
			<div class="m_contents">
				<p class="m_con_p_02">
					<strong>Name</strong> <input type="text" name="mem_name"
						class="chk inputCommon" title="이름" id="mem_name"
						value="${mvo.mem_name}" readonly="readonly">
				</p>
				<p class="m_con_p_02">
					<strong>Mobile</strong> <input type="text" name="mem_phone"
						class="chk inputCommon" title="핸드폰번호" value="${mvo.mem_phone}"
						readonly="readonly">
				</p>
				<p class="m_con_p_02">
					<strong>Address</strong> <input type="text" name="address"
						class="chk inputAddress" id="sample6_address"
						value="${mvo.address}" readonly="readonly">
						<input type="hidden"  name="mem_passwd"   value="${mvo.mem_passwd}">
				</p>
			</div>
			<div style="margin: 15px;">
				<button type="button" name="memUpdate" class="memUpsubmit" >상세정보	수정</button>
				<button type="button" name="memDelete" class="memUpsubmit" id="memDeletesubmit">회원탈퇴</button>
			</div>
		</div>
	</form>
</body>
</html>