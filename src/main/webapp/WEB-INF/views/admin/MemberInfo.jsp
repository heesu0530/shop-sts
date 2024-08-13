<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper" id="members">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">
					회원정보<img src="../images/sub_common/ico_dot2.png" class="title_top1" /> &nbsp;&nbsp;
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
											<th>아이디</th>
											<td colspan="">
												${mvo.mem_id}
											</td>
											<th>이름</th>
											<td>${mvo.mem_name}</td>
										</tr>

										<tr>
											<th>이메일</th>
											<td>${mvo.mem_email}</td>
											<th>전화번호</th>
											<td>${mvo.mem_phone}</td>
										</tr>

										<tr>
											<th>우편번호</th>
											<td>${mvo.zipcode}</td>
											<th>주소/상세주소</th>
											<td colspan="2">${mvo.address} </br>
																			${mvo.address2}
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
										<a class="btn1_ty1" href="#"><em>삭제</em></a>
									</span>
									<span class="rit_btn_section">
											<a class="btn1_ty5" onclick="location.href='/memberMgt'"><em>목록</em></a>
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