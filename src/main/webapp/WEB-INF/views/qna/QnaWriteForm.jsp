<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <h2>문의글 등록 페이지</h2>
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
              <form action="qnaProc" name="form1" method="post">
                <div class="table-responsive">
                  <table summary="상품등록" class="tbl_ty2">
                    <caption>문의글 작성</caption>
                    <colgroup>
                      <col width="15%">
                      <col width="35%">
                      <col width="15%">
                      <col width="35%">
                    </colgroup>
                    <tbody>
                      <tr>
                        <th>제목</th>
                        <td colspan="3">
                          <input type="text" name="subject" class="input_text chk" title="제목" placeholder="문의글 제목을 입력하시오." style="width: calc(100% - 20px);">
                        </td>
                      </tr>
                      <tr>
                        <th>내용</th>
                        <td colspan="3">
                          <textarea name="content" class="chk" title="내용" placeholder="문의글 내용을 입력하세요"></textarea>
                        </td>
                      </tr>
                      <tr>
                        <th>작성자</th>
                        <td colspan="3">
                          <input type="text" name="writer" class="input_text chk" value="${ssKey.mem_name}" title="작성자" readonly="readonly">
                        </td>
                      </tr>
                      <tr>
                        <th>작성일자</th>
                        <td>
                              <em class="input_text_em"> 
                                <input type="text" name="eval_exam_dd" id="eval_exam_dd" class="input_text1" readonly="readonly"style="width: calc(100% - 20px);">
                                <img src="../images/sub_common/ico_cal1.png" alt="">
                              </em>
                              <script>
                                  document.addEventListener('DOMContentLoaded', function() {
                                     var now = '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>';
                                    document.getElementById('eval_exam_dd').value = now;
                              });
                              </script>
                            </td>
                        <th>비밀번호</th>
                        <td>
                          <input type="password" name="passwd" class="input_text chk" title="비밀번호" placeholder="비밀번호 입력 필수" style="width: calc(100% - 20px);">
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </form>
            </div>
          </div>
          <p class="form-submit" align="center">
            <button type="button" class="aa-add-to-cart-btn" onclick="location.href='/qnaList'" style="margin-right: 15px;">
              <span class="fa"></span>목록
            </button>
            <button type="button" name="insert" style="padding: 8.3px 27px;" class="aa-browse-btn qnasubmit1">
              등록
            </button>
          </p>
        </div>
      </div>
    </div>
  </section>
  <!-- / Cart view section -->
</body>
</html>
