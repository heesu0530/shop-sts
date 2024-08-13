<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/product.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<title>쇼핑몰</title>
</head>
<body>
	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src="img/bannerdetail/003.jpg" >
	</section>
	<!-- / catg header banner section -->

	<!-- Cart view section -->
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table aa-wishlist-table">
							<form action="">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>상품명</th>
												<th>이미지</th>
												<th>주문수량</th>
												<th>결제금액</th>
												<th>결제일</th>
												<th>주문상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(orders)==0}">
													<tr>
														<td colspan="7">주문내역이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${fn:length(orders)>0}">
													<c:forEach items="${orders}" var="order">
														<tr>
															<td><!-- 상품명 -->
																<a class="remove">
																	<input value="${order.p_name}" onclick="javascript:orderDetail(this)" style="all: unset" readonly="readonly">
																	<input type="hidden" name="p_no" value="${order.p_no}">
																	<input type="hidden" name="o_no" value="${order.o_no}">
																	<input type="hidden" name="mem_id" value="${order.mem_id}">
																</a>
															</td>
															<td width="300px;"><img src="/upload/${order.image}"></td>
															<td><!-- 주문수량 -->
																<a class="aa-cart-title">
																	<input class="num" readonly="readonly" name="quantity" value="${order.quantity}" style="all: unset">
																</a>
															</td>
															<td><!-- 결제금액 -->
																<input class="num" readonly="readonly" name="price" value="${order.price}" style="all: unset">
															</td>
															<td><!-- 결제일 -->
																<input readonly="readonly" name="o_regdate" value="${order.o_regdate}" style="all: unset">
															</td>
															<td><!-- 주문상태 -->
																<c:choose>
																	<c:when test="${order.state==1}">결제완료</c:when>
																	<c:when test="${order.state==2}">배송준비</c:when>
																	<c:when test="${order.state==3}">배송중</c:when>
																	<c:when test="${order.state==4}">배송완료</c:when>
																	<c:when test="${order.state==5}">구매확정</c:when>
																</c:choose>
															</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / Cart view section -->
</html>
