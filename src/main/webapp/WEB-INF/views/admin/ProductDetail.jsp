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
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper" id="productmgt">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">
					상품정보<img src="../images/sub_common/ico_dot2.png" class="title_top1" />
				</h3>
			</div>
			<!--/tit_location_section-->

			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">
					<!--리스트 시작-->
					<div class="con_list_wrap">

						<form action="" name="form1" method="post">
							<!-- 호텔 상품 등록 -->
							<div class="table-wrap">
								<table summary="상품목록" class="tbl_ty2">
									<caption>회원상세 정보</caption>
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<tr>
											<th>상품명</th>
											<td>
												${product.p_name}
												<input type="hidden" name="p_name" value="${product.p_name}">
												<input type="hidden" name="p_no" value="${product.p_no}">
											</td>
											<th>재고수량</th>
											<td>
												${product.stock}
												<input type="hidden" name="stock" title="재고수량" value="${product.stock}">
											</td>
										</tr>
										
										<tr>
											<th>상품단가</th>
											<td colspan="3">
												${product.price}
												<input type="hidden" name="price" title="상품단가" value="${product.price}">
											</td>
										</tr>

										<tr>
											<th>상품설명</th>
											<td>
												${product.detail}
												<input type="hidden" name="detail" title="상품설명" value="${product.detail}">
											</td>
										</tr>

										<tr>
											<th>상품이미지</th>
											<td class="left" colspan="3">
												<img alt="이미지" src="upload/${product.image}" height="250" width="250" alt="polo shirt img">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- // 신청서 -->

							<!-- 버튼 영역-->
							<div class="btm_list_wrap">
								<p class="btn_section fix">
									<span class="lft_btn_section">
										<button type="button" name="delete" class="btn1_ty6" value="삭제">
											<em>삭제</em>
										</button>
									</span>
									<span class="rit_btn_section">
										<button type="button" name="update" class="btn1_ty4" value="수정">
											<em>수정</em>
										</button>
										<a class="btn1_ty5" onclick="location.href='/productMgt'"><em>목록</em></a>
									</span>
								</p>
							</div>
							<!-- // 버튼 영역-->
						</form>

					</div>
					<!--/리스트 끝-->
					<c:import url="./footer.jsp" />
</body>
</html>