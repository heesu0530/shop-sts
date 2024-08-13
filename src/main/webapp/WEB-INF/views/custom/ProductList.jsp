<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/product.css"> 
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="/js/product.js"></script> 
<title>희수네 쇼핑몰</title>
</head>
<body>
  <div style="width:90%">
   <div id="product">
     <h3>상품목록</h3>
     <div style="text-align:right; margin-right:200px;">
       <button class="btn btn-secondary">상품수: ${pcnt}</button>
     </div>
     <table class="table table-hover text-center table-bordered">
       <thead>
         <tr>
            <th class = "pcol1 textBold alignCenter">상품번호</th>
		    <th class = "textBold alignCenter">상품명</th>
		    <th class = "pcol3 textBold alignCenter">상품가격</th>
		    <th class = "pcol4 textBold alignCenter">등록일</th>
		    <th class = "pcol5 textBold alignCenter">재고</th>
         </tr>
       </thead>
       <tbody>
        <c:choose>
          <c:when test="${fn:length(productList)==0}">
            <tr>
              <th colspan="5">등록된 상품이 없습니다.</th>
            </tr>
          </c:when>
          <c:when test="${fn:length(productList)>0}">
            <c:forEach var="product" items="${productList}">
             <tr>
                <th class = "pcol1">
                 <input type="text" name="p_no" value="${product.p_no}" 
                     class="form-control-plaintext textBold alignCenter">
                 </th>
			    <th class = "pcol2">
			     <input type="text" name="p_name" value=" ${product.p_name}" 
                     class="form-control-plaintext textBold pdetail">
                </th>
			    <th class = "pcol3" >
			     <input type="text" name="price" value="${product.price}" 
                     class="form-control-plaintext alignRight textBold num">
			   </th>
			    <th class = "pcol4">
			     <input type="text" name="pr_date" value=" ${product.pr_date}" 
                     class="form-control-plaintext textBold alignCenter">
			   </th>
			    <th class = "pcol5">
			     <input type="text" name="stock" value=" ${product.stock}" 
                     class="form-control-plaintext textBold alignRight num">
			    </th>
             </tr>
            </c:forEach>
          </c:when>
        </c:choose>
       </tbody>
     </table>
   </div>
  <div class="clear"></div>
  </div>
</body>
</html>
