<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WeProject</title>
</head>
<body>
  <c:import url="./header.jsp"/>
  <!-- Start slider -->
	<section id="aa-slider">
		<div class="aa-slider-area">
			<div id="sequence" class="seq">
				<div class="seq-screen">
					<ul class="seq-canvas">
						<!-- single slide item -->
						<li>
							<div class="seq-model">
								<img data-seq src="img/slider/1.png"/>
							</div>
							<div class="seq-title">
								<a data-seq href="/productList" class="aa-shop-now-btn aa-secondary-btn" style="margin-top: 330px;">SHOP NOW</a>
							</div>
						</li>
						<!-- single slide item -->
						<li>
							<div class="seq-model">
								<img data-seq src="img/slider/2.png">
							</div>
							<div class="seq-title">
								<a data-seq href="/productList" class="aa-shop-now-btn aa-secondary-btn" style="margin-top: 330px;">SHOP NOW</a>
							</div>
						</li>
						<!-- single slide item -->
						<li>
							<div class="seq-model">
								<img data-seq src="img/slider/3.png">
							</div>
							<div class="seq-title">
								<a data-seq href="/productList" class="aa-shop-now-btn aa-secondary-btn" style="margin-top: 330px;">SHOP NOW</a>
							</div>
						</li>
						<!-- single slide item -->
						<li>
							<div class="seq-model">
								<img data-seq src="img/slider/4.png">
							</div>
							<div class="seq-title">
								<a data-seq href="/productList" class="aa-shop-now-btn aa-secondary-btn" style="margin-top: 330px;">SHOP NOW</a>
							</div>
						</li>
						<!-- single slide item -->
						<li>
							<div class="seq-model">
								<img data-seq src="img/slider/5.png">
							</div>
							<div class="seq-title">
								<a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn" style="margin-top: 330px;">SHOP NOW</a>
							</div>
						</li>
					</ul>
				</div>
				<!-- slider navigation btn -->
				<fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
					<a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
					<a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
				</fieldset>
			</div>
		</div>
	</section>
	<!-- / slider -->

	<!-- Products section -->
	<section id="aa-product" style="margin-top: 100px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="aa-product-area">
							<div class="aa-product-inner">
								<!-- start prduct navigation -->
								<ul class="nav nav-tabs aa-products-tab">
								</ul>
								<!-- Tab panes -->
								<div class="tab-content" id="product">
									<!-- Start men product category -->
									<div class="tab-pane fade in active" id="vege"><!-- 채소 -->
										<ul class="aa-product-catg">
											<!-- start single product item -->
											<c:choose>
												<c:when test="${fn:length(productList)==0}">
												<li>등록된 상품이 없습니다.</li>
												</c:when>
												<c:when test="${fn:length(productList)>0}">
													<c:forEach var="product" items="${productList}">
														<li>
															<figure>
																<a class="aa-product-img" href="#">
																	<img src="upload/${product.image}" alt="polo shirt img">
																</a>
																<a class="aa-add-card-btn" href="#">
																	<span class="fa fa-shopping-cart"></span>Add To Cart
																</a>
																<figcaption>
																	<h4 class="aa-product-title">
																		<a href="#">${product.p_name}</a>
																	</h4>
																	<span class="aa-product-price">${ssKey.mem_id}</span>
																	<span class="aa-product-price">${product.price} 원</span>
																</figcaption>
															</figure>
															<div class="aa-product-hvr-content">
																<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist">
																<span class="fa fa-heart-o"></span></a> 
																<a href="#" data-toggle="tooltip" data-placement="top"
																	title="Compare"><span class="fa fa-exchange"></span></a>
																<a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
																	data-target="#quick-view-modal">
																	<span class="fa fa-search"></span></a>
															</div> <!-- product badge --> 
															<span class="aa-badge aa-sale" href="#">SALE!</span>
														</li>
														</c:forEach>
														</c:when>
											</c:choose>
											<!-- start single product item -->
											
											<!-- start single product item -->
										</ul>
										<div class="clear">
										</div>
									</div>
									<!-- / men product category -->
									<!-- start women product category -->
									<div class="tab-pane fade" id="fruit"><!-- 과일 -->
										<ul class="aa-product-catg">
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/women/girl-1.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">This is Title</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/women/girl-2.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-hot" href="#">HOT!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/women/girl-4.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/women/girl-1.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
											</li>
										</ul>
										<a class="aa-browse-btn" href="#">Browse all Product <span
											class="fa fa-long-arrow-right"></span></a>
									</div>
									<!-- / women product category -->
									<!-- start sports product category -->
									<div class="tab-pane fade" id="sports">
										<ul class="aa-product-catg">
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/sports/sport-1.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">This is Title</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/sports/sport-2.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/sports/sport-7.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/sports/sport-8.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
											</li>
										</ul>
									</div>
									<!-- / sports product category -->
									<!-- start electronic product category -->
									<div class="tab-pane fade" id="electronics">
										<ul class="aa-product-catg">
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/electronics/electronic-1.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">This is Title</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/electronics/electronic-2.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/electronics/electronic-3.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div>
											</li>
											<!-- start single product item -->
											<li>
												<figure>
													<a class="aa-product-img" href="#"><img src="img/electronics/electronic-4.png"
														alt="polo shirt img"></a>
													<a class="aa-add-card-btn" href="#"><span class="fa fa-shopping-cart"></span>Add To
														Cart</a>
													<figcaption>
														<h4 class="aa-product-title">
															<a href="#">Lorem ipsum doller</a>
														</h4>
														<span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
													</figcaption>
												</figure>
												<div class="aa-product-hvr-content">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span
														class="fa fa-heart-o"></span></a> <a href="#" data-toggle="tooltip" data-placement="top"
														title="Compare"><span class="fa fa-exchange"></span></a> <a href="#"
														data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
														data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
												</div> <!-- product badge --> <span class="aa-badge aa-hot" href="#">HOT!</span>
											</li>
										</ul>
										<a class="aa-browse-btn" href="#">Browse all Product <span
											class="fa fa-long-arrow-right"></span></a>
									</div>
									<!-- / electronic product category -->
								</div>
								<!-- quick view modal -->
								<div class="modal fade" id="quick-view-modal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
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
																		<a class="simpleLens-lens-image"
																			data-lens-image="img/view-slider/large/polo-shirt-1.png"> <img
																			src="img/view-slider/medium/polo-shirt-1.png" class="simpleLens-big-image">
																		</a>
																	</div>
																</div>
																<div class="simpleLens-thumbnails-container">
																	<a href="#" class="simpleLens-thumbnail-wrapper"
																		data-lens-image="img/view-slider/large/polo-shirt-1.png"
																		data-big-image="img/view-slider/medium/polo-shirt-1.png"> <img
																		src="img/view-slider/thumbnail/polo-shirt-1.png">
																	</a> <a href="#" class="simpleLens-thumbnail-wrapper"
																		data-lens-image="img/view-slider/large/polo-shirt-3.png"
																		data-big-image="img/view-slider/medium/polo-shirt-3.png"> <img
																		src="img/view-slider/thumbnail/polo-shirt-3.png">
																	</a> <a href="#" class="simpleLens-thumbnail-wrapper"
																		data-lens-image="img/view-slider/large/polo-shirt-4.png"
																		data-big-image="img/view-slider/medium/polo-shirt-4.png"> <img
																		src="img/view-slider/thumbnail/polo-shirt-4.png">
																	</a>
																</div>
															</div>
														</div>
													</div>
													<!-- Modal view content -->
													<div class="col-md-6 col-sm-6 col-xs-12">
														<div class="aa-product-view-content">
															<h3>T-Shirt</h3>
															<div class="aa-price-block">
																<span class="aa-product-view-price">$34.99</span>
																<p class="aa-product-avilability">
																	Avilability: <span>In stock</span>
																</p>
															</div>
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi,
																veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!</p>
															<h4>Size</h4>
															<div class="aa-prod-view-size">
																<a href="#">S</a> <a href="#">M</a> <a href="#">L</a> <a href="#">XL</a>
															</div>
															<div class="aa-prod-quantity">
																<form action="">
																	<select name="" id="">
																		<option value="0" selected="1">1</option>
																		<option value="1">2</option>
																		<option value="2">3</option>
																		<option value="3">4</option>
																		<option value="4">5</option>
																		<option value="5">6</option>
																	</select>
																</form>
																<p class="aa-prod-category">
																	Category: <a href="#">Polo T-Shirt</a>
																</p>
															</div>
															<div class="aa-prod-view-bottom">
																<a href="#" class="aa-add-to-cart-btn">
																	<span class="fa fa-shopping-cart"></span>Add To Cart
																</a> 
																<a href="#" class="aa-add-to-cart-btn">View Details</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- / quick view modal -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / Products section -->
	<!-- Support section -->
	<section id="aa-support">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-support-area">
						<!-- single support -->
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="aa-support-single">
								<span class="fa fa-truck"></span>
								<h4>FREE SHIPPING</h4>
								<P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
							</div>
						</div>
						<!-- single support -->
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="aa-support-single">
								<span class="fa fa-clock-o"></span>
								<h4>30 DAYS MONEY BACK</h4>
								<P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
							</div>
						</div>
						<!-- single support -->
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="aa-support-single">
								<span class="fa fa-phone"></span>
								<h4>SUPPORT 24/7</h4>
								<P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / Support section -->



  <c:import url="./footer.jsp"/>
</body>
</html>
