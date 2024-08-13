<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/qna.js"></script>
<title>쇼핑몰</title>
</head>
<body>
  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
    <img src="img/bannerdetail/006.jpg" >
  </section>
  <!-- / catg header banner section -->

  <!-- Cart view section -->
  <section id="cart-view">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="cart-view-area">
            <div class="cart-view-table aa-wishlist-table">
              <form action="">
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일자</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${fn:length(qnaList)==0}">
                          <tr id="list_RT_tr_1">
                            <td colspan="5">등록된 공지사항이 없습니다.</td>
                          </tr>
                        </c:when>
                        <c:when test="${fn:length(qnaList)>0}">
                          <c:forEach items="${qnaList}" var="qna">
                            <tr id="list_RT_tr_1">
                              <td>${qna.bno}</td>
                              <td><a href="/qnaDetail?bno=${qna.bno}">${qna.subject}</a></td>
                              <td>${qna.writer}</td>
                              <td>
                                <input type="text" style="all: unset" value="${qna.readcount}" class="num" readonly="readonly"></td>
                              <td>${qna.regdate}</td>
                            </tr>
                          </c:forEach>
                        </c:when>
                      </c:choose>
                    </tbody>
                  </table>
                </div>
              </form>
            </div>
          </div>
          <div class="aa-product-catg-pagination" align="center" id="pageList">
            <nav>
              <ul class="pagination">
                <c:if test="${pgvo.startPg>PBlock}">
                  <li id="leftnav"><a href="/notice?curPg=${pgvo.startPg-PBlock}&curBl=${pgvo.curBl-1}" aria-label="Previous"> <span
                      aria-hidden="true">&laquo;</span>
                  </a></li>
                </c:if>
                <c:forEach var="pgno" begin="${pgvo.startPg}" end="${pgvo.endPg}" step="1">
                  <c:set scope="page" var="list" value="./notice?curPg=${pgno}&curBl=${pgvo.curBl}" />
                  <li>
                    <a href="${list}">
                      <c:choose>
                        <c:when test="${pgvo.curPg==pgno}">
                          ${pgno}
                        </c:when>
                      </c:choose>
                    </a>
                  </li>
                </c:forEach>
                <c:if test="${pgvo.endPg<pgvo.pgCnt}">
                  <li id="rightnav"><a href="notice?curPg=${pgvo.startPg+PBlock}&curBl=${pgvo.curBl+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>
                </c:if>
              </ul>
              <p class="form-submit" align="center">
                  <button type="button" class="aa-browse-btn" onclick="location.href='/qnaWriteForm'">
                     QNA 등록
                  </button>
                </p>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Cart view section -->
</body>
</html>
