<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="../admin/css/sub.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/qna.js"></script>
<title>쇼핑몰</title>
</head>
<body>
	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src="img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>문의글 수정 페이지</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li class="active">Wishlist</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->

	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table aa-wishlist-table">
							<form action="${pageContext.request.contextPath}/qnaUpdateProc"
								name="form1" method="post">
								<table summary="상품목록" class="tbl_ty2">
									<caption>문의글 수정</caption>
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<tr>
											<th>No.</th>
											<td colspan="3"><input type="text" class="input_text"
												style="width: calc(100% - 20px);" name="noti_no"
												value="${qvo.bno}" style="all: unset" readonly="readonly"></td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3"><input type="text" class="input_text"
												style="width: calc(100% - 20px);" name="subject"
												value="${qvo.subject}" style="all: unset"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td colspan="3"><textarea name="content">${qvo.content}</textarea>
											</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td colspan="3"><input type="text" name="writer"
												class="input_text" value="${ssKey.mem_name}" title="작성자"
												readonly="readonly"></td>
										</tr>
										<tr>
											<th>수정일자</th>
											<td><em> <input type="text" name="eval_exam_dd"
													id="eval_exam_dd" class="input_text inNum"
													value="${qvo.regdate}" readonly="readonly"
													style="width: calc(60% - 20px);"> <img
													src="../images/sub_common/ico_cal1.png" alt="">
											</em> <script>
                                  document.addEventListener('DOMContentLoaded', function() {
                                     var now = '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>';
                                    document.getElementById('eval_exam_dd').value = now;
                              });
                              </script></td>
											<th>비밀번호</th>
											<td><input type="password" name="passwd"
												class="input_text" title="비밀번호" placeholder="비밀번호 입력 필수"
												style="width: calc(100% - 20px);"></td>
										</tr>
										<tr>
											<th>IP</th>
											<td colspan="3"><input type="text" name="ip"
												class="input_text" title="ip"
												style="width: calc(100% - 20px);" readonly="readonly"
												value="${request.remoteAddr}"></td>
										</tr>
									</tbody>
								</table>
								<!-- 버튼 영역-->
								<p class="form-submit" align="center"
									style="padding: 8.3px 27px; margin-right: 15px;">
									<button type="button" class="aa-add-to-cart-btn"
										onclick="location.href='/qnaList'">
										<span class="fa"></span>목록
									</button>
									<button type="button" name="update"
										class="aa-browse-btn qnasubmit1">수정완료</button>
								</p>
								<!-- /버튼 영역-->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- / Cart view section -->

	<!-- / Cart view section -->
</body>
</html>