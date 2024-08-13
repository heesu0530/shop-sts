<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<link type="text/css" rel="stylesheet" href="../admin/css/sub.css" />
<title>쇼핑몰</title>
</head>
<body>
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper" id="product">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">
					상품등록<img src="../images/sub_common/ico_dot2.png" class="title_top1" /> &nbsp;&nbsp; 상품리스트
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
							<h6 class="sub_tit_h6 f_left">상품 주문 목록</h6>
							<p class="tit_btn_area f_right">
								<a href="#" class="btn2_ty3">주문건: ${orderTot}</a>
							</p>
						</div>

						<div class="table-wrap">
							<table cellpadding="0" cellspacing="0" border="0" class="tbl_ty1" id="normal">
								<colgroup>
									<col width="50px" />
									<col width="50px" />
									<col width="" />
									<col width="130px" />
									<col width="80px" />
									<col width="120px" />
									<col width="120px" />
									<col width="120px" />
									<col width="150px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<input type="checkbox" id="checkAll" name="all">
										</th>
										<th scope="col">번호</th>
										<th scope="col">상품명</th>
										<th scope="col">고객명<br>(고객아이디)</th>
										<th scope="col">주문<br>수량</th>
										<th scope="col">단가</th>
										<th scope="col">결제금액</th>
										<th scope="col">결제일</th>
										<th scope="col">주문상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(orders)==0}">
											<tr id="list_RT_tr_1">
												<td colspan="8">등록된 상품이 없습니다.</td>
											</tr>
										</c:when>
										<c:when test="${fn:length(orders)>0}">
											<c:forEach items="${orders}" var="order" varStatus="i">
												<tr id="list_RT_tr_1">
													<td>
														<input type="checkbox" name="ck" value="${i.index}">
													</td>
													<td>${order.rn}</td>
													<td>
														${order.p_name}
														<input type="hidden" name="p_no" value="${order.p_no}"> 
														<input type="hidden" name="o_no" value="${order.o_no}">
													</td>
													<td>
														${order.mem_name}(${order.mem_id})
														<input type="hidden" name="mem_id" value="${order.mem_id}">
													</td>
													<td>${order.quantity}</td>
													<td>${order.price}</td>
													<td>${order.amount}</td>
													<td>${order.o_regdate}</td>
													<td>
														<select class="select_type1 state${i.count}" id="searchfield" name="state" style="width:130px">
															<option value="1">결재중</option>
															<option value="2">배송준비</option>
															<option value="3">배송중</option>
															<option value="4">배송완료</option>
															<option value="5">구매확정</option>
														</select>
														<script type="text/javascript">
															$(function() {
																$(".state" + '${i.count}').val(
																		'${order.state}')
															})
														</script>
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>
						</div>

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

							<p class="btn_section fix" >
								<span class="rit_btn_section">
									<a class="btn1_ty3">
										<input type="button" name="s" class="orderChange" value="상태수정" style="all: unset">
									</a> 
								</span>
							</p>

						</div>

					</div>
					<!--/리스트 끝-->
					<c:import url="./footer.jsp" />
</body>
</html>
