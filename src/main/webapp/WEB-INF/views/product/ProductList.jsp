<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/js/product.js"></script> 
</head>
<body>
		<!-- catg header banner section -->
		<section id="aa-catg-head-banner">
			<img src="img/bannerdetail/001.jpg" >
		</section>
		<!-- / catg header banner section -->
		<!-- product category -->
		<section id="aa-product-category">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
						<div class="aa-product-catg-content">
							<div class="aa-product-catg-head">
								<div class="aa-product-catg-head-left">
									<label for="">상품수: ${pcnt}</label>
								</div>
								<div class="aa-product-catg-head-right">
									<a id="grid-catg" href="#"><span class="fa fa-th"></span></a> <a id="list-catg" href="#"><span
										class="fa fa-list"></span></a>
								</div>
							</div>
							<div class="aa-product-catg-body">
								<ul class="aa-product-catg">
									<c:choose>
										<c:when test="${fn:length(productList)==0}">
											<li>등록된 상품이 없습니다.</li>
										</c:when>
										<c:when test="${fn:length(productList)>0}">
											<c:forEach var="pList" items="${productList}">
												<!-- start single product item -->
												<li class="product-item" data-product-id="${pList.p_no}" data-product-name="${pList.p_name}" data-product-stock="${pList.stock}" data-product-price="${pList.price}" data-product-image="${pList.image}">
													<figure>
														<a class="aa-product-img" href="#">
															<img style="width: 250px;" src="upload/${pList.image}">
														</a>
														<a class="aa-add-card-btn cartAdd" href="#">
															<span class="fa fa-shopping-cart"></span>Add To Cart
														</a>
															<h4 class="aa-product-title">
																<a href="#" style="font-weight: bold;">${pList.p_name}</a>
															</h4>
															<span class="aa-product-price">${pList.price}</span>
															<p class="aa-product-descrip">${pList.detail}</p>
													</figure>
													<div class="aa-product-hvr-content">
														<a href="#" data-toggle2="tooltip" class="userdetail"
																			data-placement="top" title="Quick View" 
																			data-toggle="modal"
																			data-target="#quick-view-modal">
															<span class="fa fa-search"></span>
														</a>
													</div>
												</li>
											</c:forEach>
										</c:when>
									</c:choose>
								</ul>
								
								<!-- quick view modal -->
								<div class="modal fade" id="quick-view-modal" 
										 tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
										 aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<div class="row">
													<!-- Modal view slider -->
													<div class="col-md-6 col-sm-6 col-xs-12">
														<div class="aa-product-view-slider">
															<div class="simpleLens-gallery-container" id="demo-1">
																<div class="simpleLens-container">
																	<div class="simpleLens-big-image-container">
																		<a class="simpleLens-lens-image" data-lens-image="img/view-slider/large/polo-shirt-1.png">
																			<img style="width: 350px;"> <!-- 이미지 출력 태그 -->
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- Modal view content PopUp-->
													<div class="col-md-6 col-sm-6 col-xs-12">
														<div class="aa-product-view-content">
															<h3 id="modal-product-name"></h3>
															<div class="aa-price-block">
																<span class="aa-product-view-price" id="modal-product-price"></span>
																<p class="aa-product-avilability">
																	재고 : <span id="modal-product-stock"></span>
																</p>
															</div>
															<p id="modal-product-description"></p>
															<div class="aa-prod-quantity">
																	<input type="text" name="quantity" class="form-control inNum" title="구매수량" value="1">
															</div>
															<div class="aa-prod-view-bottom">
																<button type="button" class="aa-add-to-cart-btn cartAdd">
																	<span class="fa fa-shopping-cart"></span>Add To Cart
																</button>
																<a href="#" class="aa-add-to-cart-btn">View Details</a>
															</div>
														</div>
													</div>
													<!-- / Modal view content PopUp-->
												</div>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- / quick view modal -->
							</div>
							<div class="aa-product-catg-pagination">
								<nav>
									<ul class="pagination">
										<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
						<aside class="aa-sidebar">
							<!-- single sidebar -->
							<div class="aa-sidebar-widget">
								<h3>Category</h3>
								<ul class="aa-catg-nav">
									<li><a href="">가지</a></li>
									<li><a href="">오이</a></li>
									<li><a href="">토마토</a></li>
									<li><a href="">파프리카</a></li>
									<li><a href="">감자</a></li>
								</ul>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</section>
	<form action="cartProc?flag=add" name="form1" method="post">
      <input type="hidden" value="" name="p_no">
      <input type="hidden" value="" name="p_name">
      <input type="hidden" value="" name="quantity">
      <input type="hidden" value="" name="image">
      <input type="hidden" value="" name="price">
      <input type="hidden" value="" name="stock">
	</form>
</body>
</html>