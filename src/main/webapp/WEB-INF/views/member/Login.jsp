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
</head>
<body
	style="background-image: url(../images/login/bg_login1.jpg); background-repeat: no-repeat; background-position: center;">


	<!--common_wrapper-->

	<!--body_wrapper-->
	<div class="body_wrapper">

		<!--login_wrapper-->
		<div class="login_wrapper">

			<div class="m_center_wrap"
				style="margin-top: 390px; text-align: center;">
				<form action="loginProc" method="post" name="loginForm">
					<fieldset>
						<legend>로그인</legend>
						<div class="m_contents">
							<p class="m_con_p_01">
								<strong>ID</strong> <input type="text" name="mem_id"
									class="chk id" title="아이디">
							</p>
							<p class="m_con_p_02">
								<strong>PASSWORD</strong> <input type="password"
									name="mem_passwd" class="chk pw" title="패스워드">
							</p>
							<p class="m_con_p_03" id="login_btn">
								<input type="submit" name="ctl00" value="로그인"
									class="btn_gongin_reg">
							</p>
						</div>

					</fieldset>
				</form>
			</div>



		</div>
		<!--/login_wrapper-->

	</div>
	<!--/body_wrapper-->

	<!--/common_wrapper-->

</body>
</html>