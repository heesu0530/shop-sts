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
<!-- 관리자 -->
</head>
<body>
    </div>
  <!--/lft_wrapper-->

  <div class="rit_wrapper" id="qnas">
    <!--rit_wrapper-->
    <div class="rit_wrapper_w">

      <!--tit_location_section-->
      <div class="tit_location_section fix">
        <h3 class="sub_tit_h3">
          Q&A<img src="../images/sub_common/ico_dot2.png" class="title_top1" />
          &nbsp;&nbsp;
        </h3>
      </div>
      <!--/tit_location_section-->


      <!--컨텐츠 영역-->
      <div class="sub_contents_wrap">
        <!--sub_contents_area-->
        <div class="sub_contents_area">

          <!-- 검색 -->
          <form action="#">
            <fieldset>
              <legend>검색</legend>

              <div class="search_board_section">
                <div class="search_board_form">
                  <ul class="fix">
                    <li><strong>&middot; 유형</strong> <select
                      class="select_type1" name="crtif_kind" id="crtif_kind">
                        <option value="">전체</option>
                        <option value="1">기타</option>
                    </select></li>
                  </ul>
                  <input class="btn_search" type="image"
                    src="../images/sub_common/btn_search.png" alt="검색" />
                </div>
                <input type="hidden" id="search_view" value="Y" />
                <!-- <a href="#" class="btn_search_open"><img src="../images/sub_common/btn_open1.png" alt="" /></a> -->
              </div>
            </fieldset>
          </form>
          <!-- // 검색 -->

          <!--리스트 시작-->
          <div class="con_list_wrap">
            <div class="tit_area fix">
              <h6 class="sub_tit_h6 f_left">Q&A 목록</h6>
              <p class="tit_btn_area f_right">
                <a href="#" class="btn2_ty3">Q&A 개수: ${qanTot}</a>
              </p>
            </div>

            <div class="table-wrap">
              <table class="tbl_ty1" id="normal">
                <colgroup>
                  <col width="80px" />
                  <col width="" />
                  <col width="150px" />
                  <col width="150px" />
                  <col width="150px" />
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">조회수</th>
                    <th scope="col">작성일자</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${fn:length(qnaList)==0}">
                      <tr id="list_RT_tr_1">
                        <td colspan="5">등록된 문의글이 없습니다.</td>
                      </tr>
                    </c:when>
                    <c:when test="${fn:length(qnaList)>0}">
                      <c:forEach items="${qnaList}" var="qna">
                        <tr id="list_RT_tr_1">
                          <td>${qna.bno}</td>
                          <td><a href="/qnaDetail?bno=${qna.bno}">
                            ${qna.subject}</a></td>
                          <td>${qna.writer}</td>
                          <td>
                            <input type="text" style="all: unset"
                            value="${qna.readcount}" class="num" readonly="readonly">
                          </td>
                          <td>${qna.regdate}</td>
                      </c:forEach>
                    </c:when>
                  </c:choose>
                </tbody>
              </table>
            </div>

            <div class="btm_list_wrap">
              <div id="pageList">
                <c:if test="${pgvo.startPg>PBlock}">
                  <ul id="leftnav">
                    <li><a
                      href="/qnaList?curPg=${pgvo.startPg-PBlock}&curBl=${pgvo.curBl-1}">
                        <img src="../images/sub_common/btn_ppre.png" alt="처음 페이지" />
                    </a></li>
                  </ul>
                </c:if>
                <c:forEach var="pgno" begin="${pgvo.startPg}"
                  end="${pgvo.endPg}" step="1">
                  <c:set scope="page" var="list"
                    value="./qnaList?curPg=${pgno}&curBl=${pgvo.curBl}" />
                  <ol>
                    <li><a href="${list}"> <c:choose>
                          <c:when test="${pgvo.curPg==pgno}">
                            <strong>${pgno}</strong>
                          </c:when>
                          <c:otherwise>
                            ${pgno}
                          </c:otherwise>
                        </c:choose>
                    </a></li>
                  </ol>
                </c:forEach>
                <c:if test="${pgvo.endPg<pgvo.pgCnt}">
                  <ul id="rightnav">
                    <li><a
                      href="qnaList?curPg=${pgvo.startPg+PBlock}&curBl=${pgvo.curBl+1}">
                        <img src="../images/sub_common/btn_nnxt.png" alt="마지막 페이지" />
                    </a></li>
                  </ul>
                </c:if>
              </div>

              <p class="btn_section fix">
                <span class="rit_btn_section"> <a class="btn1_ty3"> <input
                    type="button" name="newForm" value="Q&A등록"
                    onclick="location.href='/admin/qnaWriteForm'" style="all: unset">
                </a>
                </span>
              </p>
            </div>
          </div>
          <!--/리스트 끝-->
          <c:import url="./footer.jsp" />
</body>
</html>