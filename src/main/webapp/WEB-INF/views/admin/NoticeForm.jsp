<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/notice.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/notice.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>쇼핑몰</title>
</head>
<body>
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper" id="">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">
					공지사항등록<img src="../images/sub_common/ico_dot2.png"
						class="title_top1" />
				</h3>
			</div>
			<!--/tit_location_section-->

			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">
					<!--리스트 시작-->
					<div class="con_list_wrap">

						<form action="noticeProc" name="form1" method="post">
							<!-- 호텔 상품 등록 -->
							<div class="table-wrap">
								<table summary="상품등록" class="tbl_ty2">
									<caption>공지사항등록</caption>
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<tr>
											<th>제목</th>
											<td colspan="3"><input type="text" name="subject"
												class="input_text" title="제목" placeholder="공지사항 제목을 입력하시오."
												style="width: calc(100% - 20px);"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td colspan="3"><textarea name="content" title="공지사항 설명"
													placeholder="공지사항 내용을 입력하세요"></textarea></td>
										<tr>
											<th>작성자</th>
											<td colspan="3"><input type="text" name="writer"
												class="input_text" value="${ssKey.mem_name}" title="작성자"
												readonly="readonly"></td>
										</tr>
										<tr>
											<th>작성일자</th>
											<td><em> <input type="text" name="regdate"
													id="eval_exam_dd" class="input_text inNum"
													readonly="readonly" style="width: calc(60% - 20px);">
													<img src="../images/sub_common/ico_cal1.png" alt="">
											</em> <script>
                                  document.addEventListener('DOMContentLoaded', function() {
                                     var now = '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>';
                                    document.getElementById('eval_exam_dd').value = now;
                              });
                              </script></td>
											<th>공지종료일</th>
											<td><input type="date" name="vdate"
												class="input_text inNum" value="" title="공지종료일"
												style="width: calc(100% - 20px);"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- // 신청서 -->

							<!-- 버튼 영역-->
							<div class="btm_list_wrap">
								<p class="btn_section fix">
									<span class="rit_btn_section">
										<button type="button" name="insert"
											class="btn1_ty4 notisubmit">
											<em>저장</em>
										</button> <a class="btn1_ty5" onclick="location.href='/admin/notice'"><em>목록</em></a>
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