<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/product.css">
<script type="text/javascript" src="/js/product.js"></script>
</head>
<body>
	<div id="productDt">
		<form action="cartProc?flag=add" name="form1" method="post">
			<table class="outtbl">
				<tr>
					<td class="outcol alignRight"><a href="#"> <img alt="이미지" src="/upload/${order.image}" height="330" width="330">
					</a></td>
					<td>
						<table class="table table-hover">
							<tr>
								<th colspan="2" style="text-align: center">
									<h3>구매상품정보</h3>
								</th>
							</tr>
							<tr>
								<th class="col1 alignRight textBold">상품명</th>
								<th class="col2">
								<input type="text" name="p_name" class="form-control-plaintext" title="상품명" value="${order.p_name}" readonly="readonly">
								<input type="hidden" name="p_no" class="form-control-plaintext" value="${order.p_no }" readonly="readonly"></th>
							</tr>
							<tr>
								<th class="col1 alignRight textBold">상품단가</th>
								<th class="col2">
								<input type="text" name="price" class="form-control-plaintext num" title="상품단가" value="${order.price}" readonly="readonly"></th>
							</tr>
							<tr>
								<th class="col1 alignRight textBold">구매수량</th>
								<th class="col2">
								<input type="text" name="quantity" class="form-control-plaintext num" title="구매수량" value="${order.quantity}" readonly="readonly"></th>
							</tr>
							<tr>
								<th class="col1 alignRight textBold">결재금액</th>
								<th class="col2">
								<input type="text" name="amount" class="form-control-plaintext num" value="${order.amount}" readonly="readonly">
								</th>
							</tr>
							<tr>
								<td colspan="2" class="alignCenter">
									<button type="button" class="btn btn-outline-secondary" style="margin-left: 10px;" onclick="javascript:location.href='/orderList'">구매목록</button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>