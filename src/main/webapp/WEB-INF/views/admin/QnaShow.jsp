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

  <div class="rit_wrapper" id="notices">
    <!--rit_wrapper-->
    <div class="rit_wrapper_w">

      <!--tit_location_section-->
      <div class="tit_location_section fix">
        <h3 class="sub_tit_h3">
          Q&A 내용<img src="../images/sub_common/ico_dot2.png" class="title_top1" /> &nbsp;&nbsp;
        </h3>
      </div>
      <!--/tit_location_section-->

      <!--컨텐츠 영역-->
      <div class="sub_contents_wrap">
        <!--sub_contents_area-->
        <div class="sub_contents_area">
          <!--리스트 시작-->
          <div class="con_list_wrap">

            <form action="/qnaDelete" name="form1" method="post">
    <input type="hidden" name="bno" value="${qnaList.bno}">
              <!-- 호텔 상품 등록 -->
              <div class="table-wrap">
                <table summary="상품목록" class="tbl_ty2">
                  <caption>Q&A 상세 정보</caption>
                  <colgroup>
                    <col width="15%">
                    <col width="35%">
                    <col width="15%">
                    <col width="35%">
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>No.</th>
                      <td colspan="3">${qnaList.bno}</td>
                    </tr>
                    <tr>
                      <th>제목</th>
                      <td colspan="3">${qnaList.subject}</td>
                    </tr>

                    <tr>
                      <th>내용</th>
                      <td colspan="3">
                        <textarea name="content" readonly="readonly">${qnaList.content}</textarea>
                      </td>
                    </tr>

                    <tr>
                      <th>작성자</th>
                      <td colspan="3">
                      ${ssKey.mem_name}</td>
                    </tr>
                    <tr>
                      <th>작성일자</th>
                      <td>${qnaList.regdate}</td>
                      <th>IP</th>
                      <td class="left" colspan="3">
                        ${qnaList.ip}
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
                    <button type="button" name="delete" class="btn1_ty6 qnaupdate" value="삭제">
                      <em>삭제</em>
                    </button>
                  </span>
                  <span class="rit_btn_section">
                    <button type="button" name="update" class="btn1_ty4 qnaupdate" value="수정">
                      <em>수정</em>
                    </button>
                    <a class="btn1_ty5" onclick="location.href='/admin/qnaList'">
                      <em>목록</em>
                    </a>
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