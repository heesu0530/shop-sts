package com.ecom6.web.pay;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ecom6.service.cart.CartService;
import com.ecom6.service.pay.ApiService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.order.OrderVo;
import com.ecom6.wrapper.order.OrderWrapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PgController {
  
  @Autowired
  private OrderWrapper orderWrapper;
  
  @Autowired
  private ApiService apiService;
  
  @Autowired
  CartService cartService;
  
  @GetMapping("/payForm")
  public ModelAndView payForm () {
    
    ModelAndView mav = new ModelAndView ();
    
    mav.setViewName ("pay/payForm");
    
    return mav;
  }
  
  @PostMapping("/payProc")
  public ModelAndView payProc (@RequestParam HashMap< String, String > param,
  HttpServletRequest request, Model model) throws NoSuchAlgorithmException {
    
    ModelAndView mav = new ModelAndView ();
    log.info ("화면에서 받은 값 = " +param.toString ());// 전체 데이터 가져오기
    String                    url         = "https://api.testpayup.co.kr/v2/api/payment/himedia/keyin2";
    HashMap< String, String > apiMap      = new HashMap< String, String > ();                           // api
                                                                                                        // 사용
                                                                                                        // 파라미터
    Map< String, String >     apiResult   = new HashMap< String, String > ();
    String                    cardNo      = param.get ("cardNo");                                       // param.get("")->필요한
                                                                                                        // 데이터만
                                                                                                        // 가져옴
    String                    expireMonth = param.get ("expireMonth");
    String                    expireYear  = param.get ("expireYear");
    String                    cardPw      = param.get ("cardPw");
    String                    birthday    = param.get ("birthday");
    String                    amount      = param.get ("amount");
    String                    merchantId  = "himedia";
    String                    orderNumber = "TESTORDER1234";                                            // 유니크하게
                                                                                                        // 관리
    String                    apiCertKey  = "ac805b30517f4fd08e3e80490e559f8e";
    String                    timestamp   = "20240708000000";
    String                    quota       = "0";                                                        // 할부개월
    String                    itemName    = "상품명";
    String                    userName    = "구매자명";
    String                    signature   = "";                                                         // 아래서
                                                                                                        // 생성
    
    //
    apiMap.put ("orderNumber", orderNumber);
    apiMap.put ("cardNo", cardNo);
    apiMap.put ("expireMonth", expireMonth);
    apiMap.put ("expireYear", expireYear);
    apiMap.put ("birthday", birthday);
    apiMap.put ("cardPw", cardPw);
    apiMap.put ("amount", amount);
    apiMap.put ("quota", quota);
    apiMap.put ("itemName", itemName);
    apiMap.put ("userName", userName);
    apiMap.put ("timestamp", timestamp);
    signature = apiService
    .getSHA256Hash (merchantId +"|" +orderNumber +"|" +amount +"|" +apiCertKey +"|" +timestamp);
    apiMap.put ("signature", signature);
    
    apiResult = apiService.JsonApi (url, apiMap);
    log.info ("API 통신 값 = " +apiResult.toString ());
    // 화면구성 바꿀때
    // 1. 결과 페이지 하나만 쓸 경우
    mav.setViewName ("pay/payResult");// jsp 저아는거
    mav.addObject ("apiResult", apiResult);
    
    return mav;
  }
  
  @PostMapping("/cancelForm")
  public ModelAndView postCancelForm () {
    return cancelForm ();
  }
  
  @GetMapping("/cancelForm")
  public ModelAndView cancelForm () {
    ModelAndView mav = new ModelAndView ();
    mav.setViewName ("form/cancelForm");
    return mav;
  }
  
  @PostMapping("/cancelProc") // 전체 취소
  public ModelAndView cancelProc (@RequestParam HashMap< String, String > param)
  throws NoSuchAlgorithmException {
    
    ModelAndView mav = new ModelAndView ();
    // transactionId
    String                    url       = "https://api.testpayup.co.kr/v2/api/payment/himedia/cancel2";
    HashMap< String, String > apiMap    = new HashMap< String, String > ();                            // api
                                                                                                       // 사용
                                                                                                       // 파라미터
    Map< String, String >     apiResult = new HashMap< String, String > ();
    
    String transactionId = param.get ("transactionId");
    String apiCertKey    = "ac805b30517f4fd08e3e80490e559f8e";
    String signature     = "";
    String merchantId    = "himedia";
    
    apiMap.put ("transactionId", transactionId);
    apiMap.put ("merchantId", merchantId);
    signature = apiService.getSHA256Hash (merchantId +"|" +transactionId +"|" +apiCertKey);
    apiMap.put ("signature", signature);
    
    apiResult = apiService.JsonApi (url, apiMap);
    
    log.info ("API 통신 값 = " +apiResult.toString ());
    
    return mav;
    
  }
  
  @GetMapping("/orderForm")
  public String orderForm () {
    // userName
    // itemName
    // amount
    
    return "pay/orderForm";
  }
  
  @GetMapping("/orderFront")
  public ModelAndView orderFront () {
    
    ModelAndView mav = new ModelAndView ();
    
    mav.setViewName ("pay/orderProc");
    
    return mav;
  }
  
  @GetMapping("/orderProc")
  public String orderProc (HttpServletRequest request, Model model, OrderVo ovo)
  throws NoSuchAlgorithmException {
    HttpSession session = request.getSession ();
    String      page    = null;
    String      msg     = null;
    String      url     = null;
    log.info ("ovo==>" +ovo);
    MemberVo                      ssKey     = (MemberVo)session.getAttribute ("ssKey");
    HashMap< String, Object >     reMap     = new HashMap< String, Object > ();
    HashMap< String, String >     apiResult = null;
    Hashtable< Integer, OrderVo > hCartList = null;
    if (ssKey != null) {
      hCartList = cartService.getCartList ();
      String apiUrl = "https://api.testpayup.co.kr/ap/api/payment/himedia/order";
      ovo.setApiUrl (apiUrl);
      ovo.setMem_name (ssKey.getMem_name ());
      reMap     = orderWrapper.orderProc (ovo, hCartList);
      apiResult = (HashMap< String, String >)reMap.get ("apiResult");
      log.info ("API 통신 값 = " +apiResult.toString ());
      page = "pay/orderProc";
    } else {
      msg = "로그인이 필요합니다.";
      url = "/login";
      model.addAttribute ("msg", msg);
      model.addAttribute ("url", url);
      page = "MsgPage";
    }
    // 결과값을 화면으로 보내기
    model.addAttribute ("apiResult", apiResult);
    session.setAttribute ("ssKey", ssKey);
    session.setAttribute ("hCartList", hCartList);
    return page;
  }
  
  @GetMapping("/payProc2")
  public ModelAndView payProc2 (@RequestParam HashMap< String, String > param) {
    
    ModelAndView mav       = new ModelAndView ();
    String       ordr_idxx = param.get ("ordr_idxx");
    log.info ("화면에서 받은 값 = " +param.toString ());
    String                    url       = "https://api.testpayup.co.kr/ap/api/payment/" +ordr_idxx
    +"/pay";
    HashMap< String, String > apiMap    = new HashMap< String, String > ();
    Map< String, String >     apiResult = new HashMap< String, String > ();
    // 응답
    String res_cd    = param.get ("res_cd");
    String res_msg   = param.get ("res_msg");
    String enc_data  = param.get ("enc_data");
    String enc_info  = param.get ("enc_info");
    String tran_cd   = param.get ("tran_cd");
    String buyr_mail = param.get ("buyr_mail");
    
    apiMap.put ("res_cd", res_cd);
    apiMap.put ("res_msg", res_msg);
    apiMap.put ("enc_data", enc_data);
    apiMap.put ("enc_info", enc_info);
    apiMap.put ("tran_cd", tran_cd);
    apiMap.put ("buyr_mail", buyr_mail);
    
    apiResult = apiService.JsonApi (url, apiMap);
    log.info ("API 통신 값 = " +apiResult.toString ());
    
    mav.setViewName ("pay/payResult");
    mav.addObject ("apiResult", apiResult);
    
    // param안에 데이터 가져오기
    // 결제요청 api호출-결과확인
    // 결제완료 페이지 호출
    
    return mav;
  }
  
  @PostMapping("/payProc2")
  public ModelAndView payProc3 (@RequestParam HashMap< String, String > param) {
    return payProc2 (param);
  }
}
