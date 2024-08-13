<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link type="text/css" rel="stylesheet" href="/css/tossPay.css">
  <title>토스페이먼츠 샘플 프로젝트</title>
  <!-- SDK 추가 -->
  <script src="https://js.tosspayments.com/v2/standard"></script>
</head>
<body>
	<div class="wrapper">
		<div class="box_section" style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px; display: flex; flex-direction: column">
    	<button class="button" style="margin-top: 30px" onclick="requestPayment()">결제하기</button>
      <button class="button" style="margin-top: 30px" onclick="addPaymentMethod()">결제수단추가</button>
      <button class="button" style="margin-top: 30px" onclick="changeOneTouchPay()">원터치페이설정변경</button>
      <button class="button" style="margin-top: 30px" onclick="changePassword()">비밀번호변경</button>
      <button class="button" style="margin-top: 30px" onclick="isOneTouchPayEnabled()">원터치결제사용가능여부 조회</button>
      <button class="button" style="margin-top: 30px" onclick="openSettings()">브랜드페이 설정 열기</button>
    </div>
    </div>
    <script>
      // ------  SDK 초기화 ------
      // TODO: clientKey는 개발자센터의 API 개별 연동 키 > 연동에 사용할 브랜드페이가 계약된 MID > 클라이언트 키로 바꾸세요.
      // TODO: server.js 의 secretKey 또한 결제위젯 연동 키가 아닌 API 개별 연동 키의 시크릿 키로 변경해야 합니다.
      // TODO: 구매자의 고유 아이디를 불러와서 customerKey로 설정하세요. 이메일・전화번호와 같이 유추가 가능한 값은 안전하지 않습니다.
      // @docs https://docs.tosspayments.com/sdk/v2/js#토스페이먼츠-초기화
      const clientKey = "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq";
      const customerKey = generateRandomString();
      const tossPayments = TossPayments(clientKey);
      // 브랜드페이 객체 생성
      // @docs https://docs.tosspayments.com/sdk/v2/js#tosspaymentsbrandpay
      const brandpay = tossPayments.brandpay({
        customerKey,
        // TODO: 개발자센터의 브랜드페이 > Redirect URL 에 아래 URL 을 추가하세요.
        redirectUrl: "http://localhost:4000/callback-auth",
      });

      // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
      // @docs https://docs.tosspayments.com/sdk/v2/js#brandpayrequestpayment
      async function requestPayment() {
        // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
        // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
        await brandpay.requestPayment({
          amount: {
            currency: "KRW",
            value: 50000,
          },
          orderId: generateRandomString(), // 고유 주문번호
          orderName: "토스 티셔츠 외 2건",
          successUrl: window.location.origin + `/brandpay/success.html?customerKey=${customerKey}&`, // 결제 요청이 성공하면 리다이렉트되는 URL
          failUrl: window.location.origin + "/fail.jsp", // 결제 요청이 실패하면 리다이렉트되는 URL
          customerEmail: "customer123@gmail.com",
          customerName: "김토스",
        });
      }

      async function addPaymentMethod() {
        await brandpay.addPaymentMethod();
      }

      async function changeOneTouchPay() {
        await brandpay.changeOneTouchPay();
      }

      async function changePassword() {
        await brandpay.changePassword();
      }

      async function isOneTouchPayEnabled() {
        const result = await brandpay.isOneTouchPayEnabled();

        alert(result);
      }

      async function openSettings() {
        await brandpay.openSettings();
      }

      function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
      }
    </script>
</body>
</html>