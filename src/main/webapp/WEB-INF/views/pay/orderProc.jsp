<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="../admin/css/sub.css" />
<script src="/js/zipCheck.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<title>WeProject</title>

<!-- Font awesome -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- SmartMenus jQuery Bootstrap Addon CSS -->
<link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
<!-- Product view slider -->
<link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">
<!-- slick slider -->
<link rel="stylesheet" type="text/css" href="css/slick.css">
<!-- price picker slider -->
<link rel="stylesheet" type="text/css" href="css/nouislider.css">
<!-- Theme color -->
<link id="switcher" href="css/theme-color/default-theme.css"
	rel="stylesheet">
<!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
<!-- Top Slider CSS -->
<link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet"
	media="all">

<!-- Main style sheet -->
<link href="css/style.css" rel="stylesheet">

<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script type="text/javascript" src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"></script>
<script type="text/javascript">
	/****************************************************************/
	/* m_Completepayment 설명 */
	/****************************************************************/
	/* 인증완료시 재귀 함수 */
	/* 해당 함수명은 절대 변경하면 안됩니다. */
	/* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다. */
	/* Web 방식의 경우 리턴 값이 form 으로 넘어옴 */
	/****************************************************************/
	function m_Completepayment(FormOrJson, closeEvent) {
		var frm = document.kcp_order_info;
		/********************************************************************/
		/* FormOrJson은 가맹점 임의 활용 금지 */
		/* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다. */
		/********************************************************************/
		GetField(frm, FormOrJson);
		console.log(frm);

		alert("가맹점 승인코드는 '" + frm.res_cd.value + "'입니다. \n결제 승인되었습니다.");
		if (frm.res_cd.value == "0000") {
			/*
			[가맹점 리턴값 처리 영역] 
			인증이 완료되면 frm에 인증값이 들어갑니다. 해당 데이터를 가지고
			승인요청을 진행 해주시면 됩니다.
			 */

			//폼 id = kcp_order_info
			var form = document.getElementById("kcp_order_info");
			closeEvent();

			//
			frm.action = "/payProc2"
			frm.submit();

		} else {
			/*
			(인증실패) 인증 실패 처리 진행
			 */
			alert("[" + frm.res_cd.value + "] " + frm.res_msg.value);

			closeEvent();
		}
	}
	/* 이 함수를 실행하여 표준웹 실행 */
	function jsf__pay() {
		try {
			var form = document.kcp_order_info;
			KCP_Pay_Execute(form);
		} catch (e) {
			/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */
		}
	}
</script>
<body>

	<!-- wpf loader Two -->
	<div id="wpf-loader-two">
		<div class="wpf-loader-two-inner">
			<span>Loading</span>
		</div>
	</div>
	<!-- / wpf loader Two -->
	<!-- SCROLL TOP BUTTON -->
	<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
	<!-- END SCROLL TOP BUTTON -->


	<!-- Start header section -->
	<header id="aa-header">
		<!-- start header top  -->
		<div class="aa-header-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="aa-header-top-area">
							<!-- start header top left -->
							<div class="aa-header-top-left">
								<!-- start language -->
								<div class="aa-language">
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="#" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true">
											<img src="img/flag/korea.png" alt="korea flag">KOREA
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li>
												<a href="#">
													<img src="img/flag/english.jpg" alt="english flag">ENGLISH
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/flag/french.jpg" alt="">FRENCH
												</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- / language -->

								<!-- start currency -->
								<div class="aa-currency">
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="#" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true">
											<i class="fa fa-won"></i>WON<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li><a href="#"><i class="fa fa-usd"></i>USD</a></li>
											<li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
										</ul>
									</div>
								</div>
								<!-- / currency -->
								<!-- start cellphone -->
								<div class="cellphone hidden-xs">
									<p>
										<span class="fa fa-phone"></span>010-1234-1234
									</p>
								</div>
								<!-- / cellphone -->
							</div>
							<!-- / header top left -->
							<div class="aa-header-top-right">
								<ul class="aa-head-top-nav-right">
									<c:choose>
										<c:when test="${ssKey!=null and ssKey.mem_role=='mem'}">
											<li class="hidden-xs"><a href="/info">My Account</a></li>
											<li class="hidden-xs"><a href="/wishlist">Wishlist</a></li>
											<li class="hidden-xs"><a href="/cartList">My Cart</a></li>
											<li class="hidden-xs"><a href="/orderList">Pay</a></li>
											<li class="hidden-xs"><a href="/logoutProc">LOGOUT</a></li>
											<li>${ssKey.mem_name}님반갑습니다.</li>
										</c:when>
										<c:when test="${ssKey==null}">
											<li><a href="/signup">Create Account</a></li>
											<li><a href="" data-toggle="modal"
												data-target="#login-modal">Login</a></li>
											<li><a href="/searchinfo">Find my ID / PW</a></li>
										</c:when>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- / header top  -->

		<!-- start header bottom  -->
		<div class="aa-header-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="aa-header-bottom-area">
							<!-- logo  -->
							<div class="aa-logo">
								<!-- Text based logo -->
								<a href="/"> <span class="fa fa-shopping-cart"></span>
									<p>
										We<strong>Project</strong> <span>Your Shopping Partner</span>
									</p>
								</a>
								<!-- img based logo -->
								<!-- <a href="index.html"><img src="img/logo.jpg" alt="logo img"></a> -->
							</div>
							<!-- / logo  -->
							<!-- cart box -->
							<div class="aa-cartbox">
								<a class="aa-cart-link" href="#"> <span
									class="fa fa-shopping-basket"></span> <span
									class="aa-cart-title">SHOPPING CART</span> <span
									class="aa-cart-notify">2</span>
								</a>
								<div class="aa-cartbox-summary">
									<ul>
										<li><a class="aa-cartbox-img" href="#"> <img
												src="img/woman-small-2.jpg" alt="img"></a>
											<div class="aa-cartbox-info">
												<h4>
													<a href="#">Product Name</a>
												</h4>
												<p>1 x $250</p>
											</div> <a class="aa-remove-product" href="#"> <span
												class="fa fa-times"></span>
										</a></li>
										<li><a class="aa-cartbox-img" href="#"> <img
												src="img/woman-small-1.jpg" alt="img"></a>
											<div class="aa-cartbox-info">
												<h4>
													<a href="#">Product Name</a>
												</h4>
												<p>1 x $250</p>
											</div> <a class="aa-remove-product" href="#"> <span
												class="fa fa-times"></span>
										</a></li>
										<li><span class="aa-cartbox-total-title"> Total </span> <span
											class="aa-cartbox-total-price"> $500 </span></li>
									</ul>
									<a class="aa-cartbox-checkout aa-primary-btn"
										href="checkout.html">Checkout</a>
								</div>
							</div>
							<!-- / cart box -->
							<!-- search box -->
							<div class="aa-search-box">
								<form action="">
									<input type="text" name="" id=""
										placeholder="Search here ex. 'man' ">
									<button type="submit">
										<span class="fa fa-search"></span>
									</button>
								</form>
							</div>
							<!-- / search box -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- / header bottom  -->
	</header>
	<!-- / header section -->
	<!-- menu -->
	<section id="menu">
		<div class="container">
			<div class="menu-area">
				<!-- Navbar -->
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse">
						<!-- Left nav -->
						<ul class="nav navbar-nav">
							<li>
								<a href="/productList">상품목록</a>
							</li>
							<li>
								<a href="/cartList">장바구니</a>
							</li>
							<li>
								<a href="/orderList">구매목록</a>
							</li>
							<li>
								<a href="/">커뮤니티<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/notice">공지사항</a></li>
									<li><a href="/qnaList">Q & A</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
	</section>
	<!-- / menu -->
	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src="img/bannerdetail/007.jpg" alt="fashion img">
		<div class="aa-catg-head-banner-area">
		</div>
	</section>
	<!-- / catg header banner section -->
	
	<!-- Cart view section -->
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table aa-wishlist-table" style="padding: 30px;">
							<form name="kcp_order_info" id="kcp_order_info" action="/authPay" method="post" accept-charset="euc-kr">
             		<input type="hidden" name="noti_no" value="${notice.noti_no}" readonly="readonly">
								<div class="table-responsive">
									<div class="table-wrap">
		                <table summary="상품목록" class="tbl_ty2">
		                  <colgroup>
		                    <col width="20%">
		                    <col width="35%">
		                    <col width="15%">
		                    <col width="35%">
		                  </colgroup>
		                  <tbody>
		                    <tr style="display: none;">
		                      <th>responseCode</th>
		                      <td colspan="3">
		                        ${apiResult.responseCode }
		                      </td>
		                    </tr>
		                    <tr style="display: none;">
		                      <th>responseMsg</th>
		                      <td colspan="3">${apiResult.responseMsg}</td>
		                    </tr>
		                    <tr>
		                      <th style="text-align: center; height: 70px">상품가격</th>
		                      <td colspan="3">${apiResult.good_mny}</td>
		                    </tr>
		                    <tr style="display: none;">
		                      <th>site_cd</th>
		                      <td colspan="3">${apiResult.site_cd}</td>
		                    </tr>

		                    <tr style="display: none;">
		                      <th>Ret_URL</th>
		                      <td colspan="3">${apiResult.Ret_URL}</td>
		                    </tr>
		                    <tr>
		                      <th style="text-align: center; height: 70px">이름</th>
		                      <td colspan="3">${apiResult.buyr_name}</td>
		                    </tr>
		                    <tr>
		                      <th style="text-align: center; height: 70px">결제 번호</th>
		                      <td colspan="3">${apiResult.ordr_idxx}</td>
		                    </tr>
		                    <tr>
		                      <th style="text-align: center; height: 70px">상품명</th>
		                      <td colspan="3">${apiResult.good_name}</td>
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
								</div>
									<input type="hidden" name="ordr_idxx" value="${apiResult.ordr_idxx }"> 
									<input type="hidden" name="good_name" value="${apiResult.good_name }">
									<input type="hidden" name="good_mny" value="${apiResult.good_mny }">
									<input type="hidden" name="buyr_name" value="${apiResult.buyr_name }">
									<input type="hidden" name="site_cd" value="${apiResult.site_cd }">
							
									<!-- 고정값 -->
									<input type="hidden" name="req_tx" value="pay"> 
									<input type="hidden" name="pay_method" value="100000000000">
									<input type="hidden" name="site_name" value="payup" />
							
									<!--
									 ※ 필 수
									 필수 항목 : 표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
									 값을 설정하지 마십시오
									-->
									<input type="hidden" name="res_cd" value="" />
									<input type="hidden" name="res_msg" value="" /> 
									<input type="hidden" name="enc_info" value="" />
									<input type="hidden" name="enc_data" value="" />
									<input type="hidden" name="ret_pay_method" value="" />
									<input type="hidden" name="tran_cd" value="" />
									<input type="hidden" name="use_pay_method" value="" />
									<input type="hidden" name="buyr_mail" value="">
									<input type="hidden" name="ordr_chk" value="" />
									<!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
									<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131) -->
									<input type="hidden" name="good_expr" value="0">
									<!-- 표준웹 설정 정보입니다(변경 불가) -->
									<input type="hidden" name="module_type" value="01" />
									<!-- 필수 항목 : 결제 금액/화폐단위 -->
									<input type="hidden" name="currency" value="WON" />
								</form>
						</div>
					</div>
					<p class="form-submit" align="center">
           	<button type="button" class="aa-browse-btn" onclick="javascript:jsf__pay();"  value="결제창 호출"
           	style="background-color: border: 1px solid #ff6666; margin: 30px 0px;">
           		결제창 호출
           	</button>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- / Cart view section -->
	<!-- footer -->
<footer id="aa-footer">
	<!-- footer bottom -->
	<div class="aa-footer-top">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-footer-top-area">
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="aa-footer-widget">
									<h3>Main Menu</h3>
									<ul class="aa-footer-nav">
										<li><a href="#">Home</a></li>
										<li><a href="#">Our Services</a></li>
										<li><a href="#">Our Products</a></li>
										<li><a href="#">About Us</a></li>
										<li><a href="#">Contact Us</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>Knowledge Base</h3>
										<ul class="aa-footer-nav">
											<li><a href="#">Delivery</a></li>
											<li><a href="#">Returns</a></li>
											<li><a href="#">Services</a></li>
											<li><a href="#">Discount</a></li>
											<li><a href="#">Special Offer</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>Useful Links</h3>
										<ul class="aa-footer-nav">
											<li><a href="#">Site Map</a></li>
											<li><a href="#">Search</a></li>
											<li><a href="#">Advanced Search</a></li>
											<li><a href="#">Suppliers</a></li>
											<li><a href="#">FAQ</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>Contact Us</h3>
										<address>
											<p>25 Astor Pl, NY 10003, USA</p>
											<p>
												<span class="fa fa-phone"></span>+1 212-982-4589
											</p>
											<p>
												<span class="fa fa-envelope"></span>dailyshop@gmail.com
											</p>
										</address>
										<div class="aa-footer-social">
											<a href="#"><span class="fa fa-facebook"></span></a> <a href="#"><span
												class="fa fa-twitter"></span></a> <a href="#"><span class="fa fa-google-plus"></span></a> <a
												href="#"><span class="fa fa-youtube"></span></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer-bottom -->
	<div class="aa-footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-footer-bottom-area">
						<p>
							Designed by <a href="http://www.markups.io/">MarkUps.io</a>
						</p>
						<div class="aa-footer-payment">
							<span class="fa fa-cc-mastercard"></span> <span class="fa fa-cc-visa"></span> <span
								class="fa fa-paypal"></span> <span class="fa fa-cc-discover"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- / footer -->

<!-- Login Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4>Login</h4>
				<form class="aa-login-form" action="loginProc" method="post" name="loginForm">
					<label for="">아이디<span>*</span></label> 
					<input type="text" name="mem_id" class="chk id" title="아이디" placeholder="아이디를 입력해주세요.">
						<label for="">패스워드<span>*</span></label>
						<input type="password" name="mem_passwd" class="chk pw" title="패스워드" placeholder="비밀번호를 입력해주세요.">
					<button class="aa-browse-btn" type="submit">Login</button>
					<label for="rememberme" class="rememberme">
						<input type="checkbox" id="rememberme"> 아이디 기억하기 
					</label>
					<p class="aa-lost-password">
						<a href="/searchinfo">비밀번호를 잊어버리셨나요?</a>
					</p>
					<div class="aa-register-now">
						회원가입하시겠어요?<a href="/signup">회원가입하기</a>
					</div>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>
	<!-- SmartMenus jQuery plugin -->
	<script type="text/javascript" src="js/jquery.smartmenus.js"></script>
	<!-- SmartMenus jQuery Bootstrap Addon -->
	<script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>
	<!-- To Slider JS -->
	<script src="js/sequence.js"></script>
	<script src="js/sequence-theme.modern-slide-in.js"></script>
	<!-- Product view slider -->
	<script type="text/javascript" src="js/jquery.simpleGallery.js"></script>
	<script type="text/javascript" src="js/jquery.simpleLens.js"></script>
	<!-- slick slider -->
	<script type="text/javascript" src="js/slick.js"></script>
	<!-- Price picker slider -->
	<script type="text/javascript" src="js/nouislider.js"></script>
	<!-- Custom js -->
	<script src="js/custom.js"></script>
	<!-- Member js -->
	<script src="js/member.js"></script>
	
	<!-- Address js -->

</body>
</html>


