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
<title>쇼핑몰</title>
</head>
<body>
	<div style="width: 70%">
		<c:if test='${ssKey.mem_role=="admin"}'>
			<div id="noticies">
				<h3 class="text-center">공지사항등록</h3>
				<form action="noticeProc" name="form1" method="post">
					<table class="table table-hover  table-bordered">
						<tr>
							<th class="titlecol1 textBold text-center table-info">공지사항
								제목</th>
							<th><input type="text" name="subject" title="공지사항제목"
								class="form-control textBold chk"></th>
						</tr>
						<tr>
							<th class="titlecol1 textBold table-info">공지사항내용</th>
							<th><textarea rows="5" cols="70" title="공지사항내용"
									class="form-control textBold chk" name="content"></textarea></th>
						</tr>
						<tr>
							<th class="titlecol1 textBold table-info">작성자</th>
							<th><input type="text" name="writer"
								value="${ssKey.mem_name}" class="form-control textBold chk">
							</th>
						</tr>
						<tr>
							<td class="titlecol1 textBold table-info">작성일자</td>
							<td><em> <input type="text" name="regdate"
									id="eval_exam_dd" class="input_text inNum" readonly="readonly"
									style="width: calc(60% - 20px);"> <img
									src="../images/sub_common/ico_cal1.png" alt="">
							</em> <script>
                                  document.addEventListener('DOMContentLoaded', function() {
                                     var now = '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>';
                                    document.getElementById('eval_exam_dd').value = now;
                              });
                              </script></td>
						</tr>
						<tr>
							<td class="titlecol1 textBold table-info">공지종료일</td>
							<td><input type="date" name="vdate" title="공지종료일"
								class="form-control textBold chk"></td>
						</tr>
					</table>
					<c:if test="${ssKey.mem_role=='admin'}">
						<table class="text-center">
							<tr>
								<th><input name="newForm" type="button"
									class="btn btn-outline-success notisubmit" value="공지사항 등록">
									<input name="newForm" type="button"
									class="btn btn-outline-secondary" value="공지사항 목록"
									onclick="location.href='/admin/notice'"></th>
							</tr>
						</table>
					</c:if>
				</form>
			</div>
		</c:if>
	</div>
	<div class="clear"></div>
</body>
</html>