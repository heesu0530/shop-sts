
<!-- Find ID / PW의 기능구성-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find my ID / PW</title>
<!-- <link rel="stylesheet" type="text/css" href="/css/member/searchInfo.css">
<link rel="stylesheet" type="text/css" href="/css/common.css"> -->
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/member/searchInfo.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
</head>
<body onload="document.getElementById('t1').click();">
	<div class="signInTab">
		<div class="tabmenu">
			<ul>
				<li id="tab1" class="btnCon"><a class="btn first" href="#tab1"
					id="t1">Find ID</a>
					<div class="tabCon">
						<div class="large_login_box">
							<form action="searchProc" method="post" name="tapForm1">
								<table>
									<tr>
										<td><input type="text" name="mem_name" class="chk1"
											title="이름" placeholder="사용자분의 성함을 입력해주세요"> <br>
											<input type="text" name="mem_phone" class="chk1" title="핸드폰 번호"
											placeholder="핸드폰 번호를 입력해주세요"></td>
									</tr>
								</table>
								<div class="submit1">
									<button type="button" id="findId">Find My ID</button>
								</div>
							</form>
						</div>
					</div></li>
				<li id="tab2" class="btnCon"><a class="btn first" href="#tab2">Find
						PW</a>
					<div class="tabCon">
						<div class="large_login_box">
							<form action="searchProc" method="post" name="tapForm2">
								<table>
									<tr>
										<td class="Searchinput">
										<input type="text" name="mem_id" class="chk2"
											title="아이디" placeholder="아이디를 입력해주세요"> <br> <input
											type="password" name="mem_passwd" class="chk2" title="비밀번호"
											placeholder="새로운 패스워드를 입력해주세요" id="check1"> <br>
										<input type="password" name="mem_passwd2" class="chk2"
											title="비밀번호확인" placeholder="새로운 패스워드를 다시 한 번 입력해주세요"
											id="check2"> <br> <font id="check" size="2"
											color="green"></font>
										</td>
									</tr>
								</table>
								<div class="submit2">
									<button type="button" id="setNewPw">Set New PassWord</button>
								</div>
							</form>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</body>
</html>