<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link type="text/css" rel="stylesheet" href="/admin/css/default.css" />
<title>WeProject</title>
<script type="text/javascript" src="/admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/admin/js/design.js"></script>
<script type="text/javascript" src="/admin/js/menu.js"></script>
<script type="text/javascript" src="/js/zipCheck.js"></script>
</head>
<body>

	<!--common_wrapper-->
	<div class="common_wrapper">

		<!--body_wrapper-->
		<div class="body_wrapper">
			<!--sub_wrapper-->
			<div class="sub_wrapper">

				<div class="sub_wrapper_form fix">

					<!--lft_wrapper-->
					<div class="lft_wrapper">
						<!-- 타이틀 -->
						<h1 class="tit_sub_h1">
							<c:choose>
								<c:when test="${ssKey!=null and ssKey.mem_role=='admin'}">
									<a href="/admin/">
										<span>WeProject : ${ssKey.mem_name}</span>
									</a>
								</c:when>
								<c:when test="${ssKey==null}">
									<a href="/admin/">
										<span>WeProject : </span>
									</a>
								</c:when>
							</c:choose>
							<input type="hidden" id="flag_view" value="Y" />
							<strong id="btn_close_menu" style="cursor: pointer;">
								<img src="../images/sub_common/btn_close.png" alt="" />
							</strong>
						</h1>
						<!-- 타이틀 -->
						<hr />

						<!--서브 메뉴-->
						<div class="lft_sub_menu_section">
							<ul class="lft_sub_menu_ul">
							<c:choose>
								<c:when test="${ssKey!=null and ssKey.mem_role=='admin'}">
									<li class="lv1_4"><a href="/logoutProc">LOGOUT</a></li>
								</c:when>
								<c:when test="${ssKey==null}">
									<li><a href="">Login</a></li>
								</c:when>
							</c:choose>
								<!-- Depth1 상품 등록 (productREG / fly, hotel, rentcar)-->
								<li class="lv1_1" >
									<a href="/productMgt">
										<strong>상품<br />등록
										</strong>
										<b><img src="../images/sub_common/ico_on.png" alt="" /></b>
									</a>
									<ul class="sec_ul">
										<li class="on">
											<a>상품 현황</a>
											<ul class="tir_ul">
												<li><a href="/productMgt">상품관리</a></li>
											</ul>
										</li>
									</ul>
								</li>

								<!-- Depth1 결제 (pay / fly, hotel, rentcar)-->
								<li class="lv1_2"><a href="/orderMgt">
									<strong>결제<br/>관리</strong>
									<b><img src="../images/sub_common/ico_on.png" alt="" /></b>
								</a>
									<ul class="sec_ul">
										<li class="on"><a>결제 현황</a>
											<ul class="tir_ul">
												<li><a href="/orderMgt">결제관리</a></li>
											</ul>
										</li>
									</ul>
								</li>

								<!-- Depth1 게시판 관리 (board / FAQ, notice)-->
								<li class="lv1_3">
									<a href="/notice">
										<strong>게시판<br/>관리</strong> 
									<b><img src="../images/sub_common/ico_on.png" alt="" /></b>
									</a>
									<ul class="sec_ul">
										<li class="on"><a>게시판 관리</a>
											<ul class="tir_ul">
												<li><a href="/notice">공지사항</a></li>
												<li><a href="/qnaList">Q & A</a></li>
											</ul>
										</li>
									</ul>
								</li>

								<!-- Depth1 고객 관리 (user)-->
								<li class="lv1_5">
									<a href="/memberMgt"> 
										<strong>회원<br />관리</strong>
										<b><img src="../images/sub_common/ico_on.png" alt="" /></b>
									</a>
									<ul class="sec_ul">
										<li class="on">
											<a href="/memberMgt">회원</a>
											<ul class="tir_ul">
												<li><a href="/memberMgt">회원관리</a></li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<!--/서브 메뉴-->
</body>


