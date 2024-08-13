<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>]
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/css/tossPay.css">
<title>tossPay</title>
</head>
<body>
	<div class="wrapper w-100">
  <div class="flex-column align-center w-100 max-w-540">
    <img src="https://static.toss.im/lotties/error-spot-no-loop-space-apng.png" width="160" height="160"></img>
    <h2 class="title">결제를 실패했어요</h2>
    <div class="response-section w-100">
      <div class="flex justify-between">
        <span class="response-label">code</span>
        <span id="error-code" class="response-text"></span>
      </div>
      <div class="flex justify-between">
        <span class="response-label">message</span>
        <span id="error-message" class="response-text"></span>
      </div>
    </div>
    <div class="w-100 button-group">
      <a class="btn" href="https://developers.tosspayments.com/sandbox">다시 테스트하기</a>
      <div class="flex" style="gap: 16px;">
        <a class="btn w-100" href="https://docs.tosspayments.com/reference/error-codes" target="_blank" rel="noreferrer noopener">에러코드 문서보기</a>
        <a class="btn w-100" href="https://techchat.tosspayments.com" target="_blank" rel="noreferrer noopener">실시간 문의하기</a>
      </div>
    </div>
  </div>
</div>
<script type="module" src="/js/toss/fail.js"></script>
</body>
</html>