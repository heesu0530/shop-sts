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
		<img src="img/bannerdetail/002.jpg" >
	</section>
	<!-- / catg header banner section -->
	
	<!-- Cart view section -->
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table aa-wishlist-table">
							<form action="" name="cartForm">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>삭제</th>
												<th>이미지</th>
												<th>상품명</th>
												<th>가격</th>
												<th>수량</th>
												<th>결제금액</th>
												<th>결제/주문</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(hCartList)==0}">
													<tr>
														<td colspan="7">장바구니에 등록된 상품이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${fn:length(hCartList)>0 || fn:length(productList)>0}">
													<c:forEach var="order" items="${hCartList}">
														<tr>
															<td>
																<a class="remove" onclick="javaScript:cartUpdate('D', this)">
																	<fa class="fa fa-close"></fa>
																</a>
															</td>
															<td>
																<a href="#">
																	<img src="/upload/${order.value.image}">
																</a>
															</td>
															<td><!-- 상품명 -->
																<a class="aa-cart-title" onclick="javascript:location.href='productDetail?p_no=${order.value.p_no}'" value="상세">
																	<input type="hidden" name="mem_id" value="${order.value.mem_id}"> 
																	<input type="text" name="p_name" value=" ${order.value.p_name}" readonly="readonly" style="all: unset">
																</a>
															</td>
															<td><!-- 가격 -->
																<input type="text" name="price" value="${order.value.price}" class="num" readonly="readonly" style="all: unset">
															</td>
															<td><!-- 수량 -->
																<input type="text" name="quantity" value="${order.value.quantity}" class=" upQuantity num" onchange="javaScript:cartUpdate('U', this)">
																<input type="hidden" name="stock" value=" ${order.value.stock}">
															</td>
															<td><!-- 결제금액 -->
																<input type="text" name="amount" value="${order.value.quantity*order.value.price}" class="num" readonly="readonly" style="all: unset">
															</td>
															<td><a onclick="javascript:location.href='orderProc'" class="aa-add-to-cart-btn">주문하기</a></td>
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
</body>
</html>
