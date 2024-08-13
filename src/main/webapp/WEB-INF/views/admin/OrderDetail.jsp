<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/product.css"> 
<script type="text/javascript" src="/js/product.js"></script> 
</head>
<body>
    <div id="productDt">
     <form action="orStateUpdate" name="form1" method="post" >
     <table class="outtbl">
         <tr>
           <td class="outcol alignRight">
             <a href="#">
		     <img alt="이미지" src="upload/${order.image}" height="330" width="330">
		     </a>
           </td>
           <td>
             <table class="table table-hover">
		       <tr>
		         <th colspan="2" style="text-align: center"> <h3>주문상세정보</h3></th>
		       </tr>
		         <tr>
		           <th class = "col1 alignRight textBold">상품명</th>
			       <th class = "col2">
			         <input type="text" name="p_name" class="form-control-plaintext" 
			         title="상품명" value="${order.p_name}" readonly="readonly">
			         <input type="hidden" name="p_no" value="${order.p_no }">
			         <input type="hidden" name="o_no" value="${order.o_no }">
			       </th>
		          </tr>
		         <tr>
		           <th class = "col1 alignRight textBold">고객정보</th>
			       <th class = "col2">
			         <input type="text" name="mem_name" class="form-control-plaintext" 
			         value="${order.mem_name}(${order.mem_id})" readonly="readonly">
			         <input type="hidden" name="mem_id" value="${order.mem_id}">
			       </th>
		          </tr>
		         <tr>
		           <th class = "col1 alignRight textBold">상품단가</th>
			       <th class = "col2">
			         <input type="text" name="price" class="form-control-plaintext num" 
			         title="상품단가" value="${order.price}" readonly="readonly">
			       </th>
		          </tr>
		         <tr>
		           <th class = "col1 alignRight textBold">구매수량</th>
			       <th class = "col2">
			         <input type="text" name="quantity" class="form-control-plaintext num" 
			         title="구매수량" value="${order.quantity}" readonly="readonly">
			       </th>
		          </tr>
		         <tr>
		           <th class = "col1 alignRight textBold">결제금액</th>
			       <th class = "col2">
			         <input type="text" name="amount" class="form-control-plaintext num" 
			        value="${order.amount}" readonly="readonly">
			       </th>
		          </tr>
		         <tr>
		           <th class = "col1 ">주문상태</th>
			       <th class = "col2">
			         <select name="state" class="state${i.count} form-control-plaintext" >
                      <option value="1">결제중</option>
	                  <option value="2">배송준비</option>
	                  <option value="3">배송중</option>
	                  <option value="4">배송완료</option>
	                  <option value="5">구매확정</option>
	                </select>
	                <script type="text/javascript">
	               $(function(){
	            	   $(".state"+'${i.count}').val('${order.state}')
	               })
	              </script>
			       </th>
		          </tr>
		     </table>
           </td>
         </tr>
      </table>
     <div class="btnArea">
       <input name="stateUpdate" type="button"  class="btn btn-outline-success psubmit"
             value="상태수정"/><!-- xhmtl xml만큼 문법 강화된 html -->
       <input type="button"  name="orderDelete" 
         class="btn btn-outline-warning psubmit" value="주문삭제"/>
       <input type="button" class="btn btn-outline-secondary "
         onclick="javascript:location.href='/orderMgt'" value="주문목록"/>
     </div>
     </form>
    </div>
</body>
</html>