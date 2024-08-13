<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/product.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/qna.js"></script>
</head>
<body>
	<!-- 관리자 -->
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper" id="">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">
					Q&A 수정<img src="../images/sub_common/ico_dot2.png"
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

						<!-- 리스트 -->
						<div class="table-wrap">
							<form action="qnaUpdateProc" name="form1" method="post">
								<input type="hidden" name="bno" value="${qvo.bno}">
								<table summary="상품목록" class="tbl_ty2">
									<caption>Q&A 내용 수정</caption>
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
													style="width: calc(45% - 20px);"> <img
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
							</form>
						</div>
						<!-- // 신청서 -->

						<!-- 버튼 영역-->
						<div class="btm_list_wrap">
							<p class="btn_section fix">
								<span class="lft_btn_section"> <a class="btn1_ty5"
									onclick="location.href='/admin/qnaList'"> <em>목록</em>
								</a>
								</span> <span class="rit_btn_section">
									<button type="button" name="update" class="btn1_ty4 qnasubmit1"
										value="수정완료">
										<em>수정완료</em>
									</button>
								</span>
							</p>
						</div>
						<!-- // 버튼 영역-->

					</div>
					<!--/리스트 끝-->
					<c:import url="./footer.jsp" />
</body>
</html>