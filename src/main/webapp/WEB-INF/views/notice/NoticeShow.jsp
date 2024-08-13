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
  <!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src="img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>공지사항 상세 페이지</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li class="active">Wishlist</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!-- / catg header banner section -->
	
	<!-- Cart view section -->
	<section id="cart-view">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table aa-wishlist-table">
							<form action="" name="form1" method="post">
             		<input type="hidden" name="noti_no" value="${notice.noti_no}" readonly="readonly">
								<div class="table-responsive">
									<div class="table-wrap">
		                <table summary="상품목록" class="tbl_ty2">
		                  <colgroup>
		                    <col width="15%">
		                    <col width="35%">
		                    <col width="15%">
		                    <col width="35%">
		                  </colgroup>
		                  <tbody>
		                    <tr>
		                      <th>공지사항 번호</th>
		                      <td colspan="">
		                        ${notice.noti_no}
		                      </td>
		                      <th>공지사항 제목</th>
		                      <td>${notice.subject}</td>
		                    </tr>
		
		                    <tr>
		                      <th>공지사항 내용</th>
		                      <td colspan="3">
		                        <textarea name="content" readonly="readonly">${notice.content}</textarea>
		                      </td>
		                    </tr>
		
		                    <tr>
		                      <th>작성자</th>
		                      <td colspan="3">
		                      ${notice.writer}</td>
		                    </tr>
		                    <tr>
		                      <th>작성일자</th>
		                      <td>${notice.regdate}</td>
		                      <th>공지 종료일</th>
		                      <td class="left" colspan="3">
		                        ${notice.vdate}
		                      </td>
		                    </tr>
		                  </tbody>
		                </table>
		              </div>
								</div>
							</form>
						</div>
					</div>
					<p class="form-submit" align="center">
           <button type="button" class="aa-browse-btn" onclick="location.href='/notice'">
             목록
           </button>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- / Cart view section -->
</body>
</html>
