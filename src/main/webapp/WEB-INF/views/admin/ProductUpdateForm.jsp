<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<script type="text/javascript" src="/js/jquery.js"></script>
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
					상품수정<img src="../images/sub_common/ico_dot2.png" class="title_top1" />
				</h3>
			</div>
			<!--/tit_location_section-->

			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">
					<!--리스트 시작-->
					<div class="con_list_wrap">
						<form name="form1" method="post" enctype="multipart/form-data">
							<!--상품 수정 -->
							<div class="table-wrap">
								<table summary="상품수정" class="tbl_ty2">
									<caption>상품 수정</caption>
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<tr>
											<th>상품명</th>
											<td colspan="">
												<input type="text" name="p_name" class="input_text chk" title="상품명" value="${product.p_name}">
												<input type="hidden" name="p_no" title="이름" value="${product.p_no}">
											</td>
											<th>재고수량</th>
											<td><input type="text" name="stock"
												class="input_text inNum" title="재고수량"
												value="${product.stock}">
										</tr>

										<tr>
											<th>상품단가</th>
											<td colspan="3"><input type="text" name="price"
												class="input_text inNum" title="상품단가"
												value="${product.price}"></td>
										</tr>
										<tr>
											<th>상품설명</th>
											<td colspan="3">
												<textarea name="detail" title="상품설명">${product.detail}</textarea></td>
										</tr>

										<tr>
											<th>이미지 업로드</th>
											<td><a href="/upload/${product.image}"> 
											     <img alt="이미지" src="/upload/${product.image}" height="100" width="100">
											</a></td>
											<td class="left" colspan="3">
												<input type="file" name="image2" class="filename" title="이미지">
												<input type="hidden" name="image" value="${product.image}">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- // 신청서 -->
						</form>
							<!-- 버튼 영역-->
							<div class="btm_list_wrap">
								<p class="btn_section fix">
									<!-- <span class="lft_btn_section"> <a class="btn1_ty0" href="#"><em>삭제</em></a> -->
									<span class="rit_btn_section">
										<input type="button" name="update" class="btn1_ty4 psubmit" value="저장">   
										 <a class="btn1_ty5" onclick="javascript:location.href='/productMgt'"><em>목록</em></a>
									</span>
								</p>
							</div>
							<!-- // 버튼 영역-->

					</div>
					<!--/리스트 끝-->
					<c:import url="./footer.jsp" />
</body>

</html>