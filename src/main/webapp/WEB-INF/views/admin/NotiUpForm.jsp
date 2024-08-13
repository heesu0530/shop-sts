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
<script type="text/javascript" src="/js/notice.js"></script>
<title>쇼핑몰</title>
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
					공지사항 수정<img src="../images/sub_common/ico_dot2.png"
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
							<form action="notiUpProc" name="form1" method="post">
								<input type="hidden" name="noti_no" value="${notice.noti_no}">
								<table summary="상품목록" class="tbl_ty2">
									<caption>공지사항 수정</caption>
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<tr>
											<th>공지사항 번호</th>
											<td colspan="3"><input type="text" class="input_text"
												style="width: calc(100% - 20px);" name="noti_no"
												value="${notice.noti_no}" style="all: unset"
												readonly="readonly"></td>
										</tr>
										<tr>
											<th>공지사항 제목</th>
											<td colspan="3"><input type="text" class="input_text"
												style="width: calc(100% - 20px);" name="subject"
												value="${notice.subject}" style="all: unset"></td>
										</tr>
										<tr>
											<th>공지사항 내용</th>
											<td colspan="3"><textarea name="content">${notice.content}</textarea>
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
											<td><em> <input type="text" name="regdate"
													value="${notice.regdate}" id="eval_exam_dd"
													class="input_text inNum" readonly="readonly"
													style="width: calc(60% - 20px);"> <img
													src="../images/sub_common/ico_cal1.png" alt="">
											</em> <script>
                                  document.addEventListener('DOMContentLoaded', function() {
                                     var now = '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>';
                                    document.getElementById('eval_exam_dd').value = now;
                              });
                              </script></td>
											<th>공지 종료일</th>
											<td><input type="date" name="vdate"
												class="input_text inNum" value="${notice.vdate}"
												style="width: calc(100% - 20px);"></td>
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
									onclick="location.href='/admin/notice'"> <em>목록</em>
								</a>
								</span> <span class="rit_btn_section">
									<button type="button" name="update" class="btn1_ty4 notisubmit"
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