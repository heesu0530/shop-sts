<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<link type="text/css" rel="stylesheet" href="../admin/css/sub.css" />
<title>쇼핑몰</title>
</head>
<body>
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper" id="noticies">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">
					고객리스트<img src="../images/sub_common/ico_dot2.png" class="title_top1" /> &nbsp;&nbsp; 
				</h3>
			</div>
			<!--/tit_location_section-->


			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">

					<!-- 검색 -->
					<form action="#">
						<fieldset>
							<legend>검색</legend>

							<div class="search_board_section">
								<div class="search_board_form">
									<ul class="fix">
										<li><strong>&middot; 유형</strong> <select class="select_type1" name="crtif_kind" id="crtif_kind">
												<option value="">전체</option>
												<option value="1">기타</option>
										</select></li>
									</ul>
									<input class="btn_search" type="image" src="../images/sub_common/btn_search.png" alt="검색" />
								</div>
								<input type="hidden" id="search_view" value="Y" />
								<!-- <a href="#" class="btn_search_open"><img src="../images/sub_common/btn_open1.png" alt="" /></a> -->
							</div>
						</fieldset>
					</form>
					<!-- // 검색 -->

					<!--리스트 시작-->
					<div class="con_list_wrap">
						<div class="tit_area fix">
							<h6 class="sub_tit_h6 f_left">고객 목록</h6>
							<p class="tit_btn_area f_right">
								<a href="#" class="btn2_ty3">고객 수: ${memberTot}</a>
							</p>
						</div>
						
						<div class="table-wrap">
						<table cellpadding="0" cellspacing="0" border="0" class="tbl_ty1"
							id="normal">
							<colgroup>
								<col width="50px" />
								<col width="" />
								<col width="150px" />
								<col width="150px" />
								<col width="150px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">고객명(고객아이디)</th>
									<th scope="col">고객연락처</th>
									<th scope="col">고객이메일</th>
									<th scope="col">고객가입일</th>									
								</tr>
							</thead>
							<tbody>
								<c:choose>
								<c:when test="${fn:length(members)==0}">
									<tr id="list_RT_tr_1">
										<td colspan="5">등록된 고객이 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${fn:length(members)>0}">
									<c:forEach items="${members}" var="member">
										<tr id="list_RT_tr_1" class="mdetail">
											<td>${member.rn}</td>
											<td>
												<input type="text" class="mdetail" value="${member.mem_name}(${member.mem_id})"
												name="mem_name" style="all: unset" readonly="readonly"> 
												<input type="hidden" name="mem_id" value="${member.mem_id}">
											</td>
											<td>${member.mem_phone}</td>
											<td>${member.mem_email}</td>
											<td>
												${member.reg_date}
												<input type="hidden" name="zipcode" value="${member.zipcode}"> 
												<input type="hidden" name="address" value="${member.address}"> 
												<input type="hidden" name="address2" value="${member.address2}"> 
											</td>
										</tr>
									</c:forEach>
								</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
					
					<form name="form1" method="post" action="customInfo">
						<input type="hidden" name="mem_id" value=""> 
						<input type="hidden" name="mem_name" value=""> 
						<input type="hidden" name="zipcode" value=""> 
						<input type="hidden" name="address" value=""> 
						<input type="hidden" name="address2" value=""> 
						<input type="hidden" name="mem_phone" value=""> 
						<input type="hidden" name="mem_email" value="">
						<input type="hidden" name="reg_date" value="">
					</form>

						<div class="btm_list_wrap">
							<div id="pageList">
								<c:if test="${pgvo.startPg>PBlock}">
									<ul id="leftnav">
										<li>
											<a href="/notice?curPg=${pgvo.startPg-PBlock}&curBl=${pgvo.curBl-1}"> 
												<img src="../images/sub_common/btn_ppre.png" alt="처음 페이지" />
											</a>
										</li>
									</ul>
								</c:if>
								<c:forEach var="pgno" begin="${pgvo.startPg}" end="${pgvo.endPg}" step="1">
									<c:set scope="page" var="list" value="./orderMgt?curPg=${pgno}&curBl=${pgvo.curBl}" />
									<ol>
										<li>
											<a href="${list}">
												<c:choose>
													<c:when test="${pgvo.curPg==pgno}">
														<strong>${pgno}</strong>
													</c:when>
													<c:otherwise>
														${pgno}
													</c:otherwise>
												</c:choose>
											</a>
										</li>
									</ol>
								</c:forEach>
								<c:if test="${pgvo.endPg<pgvo.pgCnt}">
									<ul id="rightnav">
										<li>
											<a href="notice?curPg=${pgvo.startPg+PBlock}&curBl=${pgvo.curBl+1}">
												<img src="../images/sub_common/btn_nnxt.png" alt="마지막 페이지" />
											</a>
										</li>
									</ul>
								</c:if>
							</div>

							<!-- <p class="btn_section fix" >
								<span class="rit_btn_section">
									<a class="btn1_ty3">
										<input type="button" name="newForm" value="아이디 등록" onclick="location.href='/admin/noticeForm'" style="all: unset">
									</a> 
								</span>
							</p> -->

						</div>

					</div>
					<!--/리스트 끝-->
					<c:import url="./footer.jsp" />
</body>
</html>
