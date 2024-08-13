package com.ecom6.web.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.service.cart.CartService;
import com.ecom6.service.order.OrderService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.order.OrderVo;
import com.ecom6.wrapper.order.OrderWrapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {
  // 1. 서비스에서 트랜잭션을 걸어야 한다.
  // 2. 서로 다른 업무에서 해당 업무이외의 업무를 호출하지 않는다.
  // 3. 타 업무가 필요할 때는 Wrapper 클래스를 만들어서 사용한다.
  
  @Autowired
  CartService cartService;
  
  @Autowired
  OrderWrapper orderWrapper;
  
  @Autowired
  OrderService orderService;
  
  /*
   * @GetMapping("/orderProc")
   * public String orderProc(HttpServletRequest request,
   * HttpServletResponse response,
   * OrderVo ovo,
   * Model model) {
   * HttpSession session = request.getSession();
   * String msg = null;
   * String url = null;
   * MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
   * Hashtable<Integer, OrderVo> hCartList =null;
   * if(ssKey!=null) {
   * hCartList = cartService.getCartList();
   * HashMap<String, Object> reMap =
   * orderWrapper.orderProc(ovo,hCartList);
   * msg = (String) reMap.get("msg");
   * url = (String) reMap.get("url");
   * }else {
   * msg="로그인이 필요합니다.";
   * url = "/login";
   * }
   * model.addAttribute("msg", msg);
   * model.addAttribute("url", url);
   * session.setAttribute("ssKey", ssKey);
   * session.setAttribute("hCartList", hCartList);
   * return "MsgPage";
   * }
   */
  
  @GetMapping ( "orderList" )
  public String orderList ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model,
  PageVo pgvo ) {
    String msg;
    String url;
    String page = "Main";
    HttpSession session = request.getSession ( );
    MemberVo ssKey = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( ssKey != null ) {
      // 데이터 받아서 저장
      ovo.setMem_id ( ssKey.getMem_id ( ) );
      ovo.setMem_role ( ssKey.getMem_role ( ) );
      Map< String, Object > reSet = orderService.getOrders ( ovo, pgvo );
      model.addAttribute ( "orders", reSet.get ( "orders" ) );
      model.addAttribute ( "orderTot", reSet.get ( "orderTot" ) );
      model.addAttribute ( "contentJsp", "custom/OrderList.jsp" );
      model.addAttribute ( "PBlock", PageInfo.PAGE_OF_BLOCK );
      model.addAttribute ( "pgvo", reSet.get ( "pgvo" ) );
      log.info("ovo=="+ovo);
    } else {
      msg  = "로그인이 필요합니다.";
      url  = "/login";
      page = "MsgPage";
      model.addAttribute ( "msg", msg );
      model.addAttribute ( "url", url );
    }
    session.setAttribute ( "ssKey", ssKey );
    return page;
  }
  
  @PostMapping ( "/custOrderDetail" )
  public String custOrderDetail ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model ) {
    String page = null;
    String msg;
    String url;
    HttpSession session = request.getSession ( );
    MemberVo ssKey = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( ssKey != null ) {
      // 데이터 받아서 저장
      OrderVo order = orderService.getOrder ( ovo );
      model.addAttribute ( "order", order );
      model.addAttribute ( "contentJsp", "custom/OrderDetail.jsp" );
      page = "Main";
    } else {
      msg  = "세션이 종료되었습니다. \\n 재로그인이 필요합니다.";
      url  = "/login";
      page = "MsgPage";
      model.addAttribute ( "msg", msg );
      model.addAttribute ( "url", url );
    }
    session.setAttribute ( "ssKey", ssKey );
    return page;
  }
  
  @GetMapping ( "/custOrderDetail" )
  public String getOrderDetail ( Model model ) {
    String page = null;
    String msg = "잘못된 접근입니다.";
    String url = "/login";
    page = "MsgPage";
    model.addAttribute ( "msg", msg );
    model.addAttribute ( "url", url );
    return page;
  }
  
  @GetMapping ( "/orderMgt" )
  public String orderMgt ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model,
  PageVo pgvo ) {
    String page = null;
    String msg = null;
    String url = null;
    HttpSession session = request.getSession ( );
    MemberVo ssKey = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( ssKey != null ) {
      if ( ssKey.getMem_role ( ).equals ( "admin" ) ) {
        log.info ( "==>" + ssKey );
        ovo.setMem_role ( ssKey.getMem_role ( ) );
        Map< String, Object > reSet = orderService.getOrderList ( ovo, pgvo );
        model.addAttribute ( "orders", reSet.get ( "orders" ) );
        model.addAttribute ( "orderTot", reSet.get ( "orderTot" ) );
        model.addAttribute ( "contentJsp", "./OrderList.jsp" );
        model.addAttribute ( "PBlock", PageInfo.PAGE_OF_BLOCK );
        model.addAttribute ( "pgvo", reSet.get ( "pgvo" ) );
        page = "admin/Main";
      } else {
        session.removeAttribute ( "ssKey" );
        session.invalidate ( );
        msg  = "접근이 올바르지 않습니다.";
        url  = "/login";
        page = "MsgPage";
        model.addAttribute ( "msg", msg );
        model.addAttribute ( "url", url );
      }
    } else {
      session.removeAttribute ( "ssKey" );
      session.invalidate ( );
      msg  = "세션이 종료되었습니다.\\n 재로그인 필요합니다.";
      url  = "/login";
      page = "MsgPage";
      model.addAttribute ( "msg", msg );
      model.addAttribute ( "url", url );
    }
    return page;
  }
  
  @PostMapping ( "orderMgtProc" )
  @ResponseBody
  public void orderMgtProc ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model,
  @RequestParam ( value = "tdArr[]" )
  ArrayList< String > tdArr ) {
    HttpSession session = request.getSession ( );
    MemberVo admin = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( admin != null && admin.getMem_role ( ).equals ( "admin" ) ) {
      try {
        log.info ( "tdArr==>" + tdArr );
        orderService.orderStateUpdate ( tdArr );
      } catch ( Exception e ) {
        log.info ( e.getMessage ( ) + ":" + e.getLocalizedMessage ( ) );
      }
    }
  }
  
  @PostMapping ( "/orDetailMgt" )
  public String orDetailMgt ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model ) {
    String page = "admin/Main";
    String msg = null;
    String url = null;
    HttpSession session = request.getSession ( );
    MemberVo ssKey = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( ssKey != null ) {
      if ( ssKey.getMem_role ( ).equals ( "admin" ) ) {
        ovo.setMem_role ( ssKey.getMem_role ( ) );
        OrderVo order = orderService.getOrder ( ovo );
        model.addAttribute ( "order", order );
        model.addAttribute ( "contentJsp", "./OrderDetail.jsp" );
      } else {
        session.removeAttribute ( "ssKey" );
        session.invalidate ( );
        msg  = "접근이 올바르지 않습니다.";
        url  = "/login";
        page = "MsgPage";
        model.addAttribute ( "msg", msg );
        model.addAttribute ( "url", url );
      }
    } else {
      session.removeAttribute ( "ssKey" );
      session.invalidate ( );
      msg  = "세션이 종료되었습니다.\\n 재로그인 필요합니다.";
      url  = "/login";
      page = "MsgPage";
      model.addAttribute ( "msg", msg );
      model.addAttribute ( "url", url );
    }
    return page;
  }
  
  @PostMapping ( "/orStateUpdate" )
  public String orStateUpdate ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model ) {
    String page = "MsgPage";
    String msg = null;
    String url = null;
    HttpSession session = request.getSession ( );
    MemberVo ssKey = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( ssKey != null ) {
      if ( ssKey.getMem_role ( ).equals ( "admin" ) ) {
        log.info ( "==>" + ovo );
        int r = orderService.updateState ( ovo );
        if ( r > 0 )
          msg = "주문상태 수정완료";
        else
          msg = "주문상태 수정실패";
        url = "/orderMgt";
      } else {
        session.removeAttribute ( "ssKey" );
        session.invalidate ( );
        msg = "접근이 올바르지 않습니다.";
        url = "/login";
      }
    } else {
      session.removeAttribute ( "ssKey" );
      session.invalidate ( );
      msg = "세션이 종료되었습니다.\\n 재로그인 필요합니다.";
      url = "/login";
    }
    model.addAttribute ( "msg", msg );
    model.addAttribute ( "url", url );
    return page;
  }
  
  @PostMapping ( "orderDelete" )
  public String orderDelete ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model ) {
    HttpSession session = request.getSession ( );
    String msg = null;
    String url = null;
    MemberVo ssKey = ( MemberVo ) session.getAttribute ( "ssKey" );
    if ( ssKey != null ) {
      if ( ssKey.getMem_role ( ).equals ( "admin" ) ) {
        Map< String, Object > reSet = orderWrapper.orderDelete ( ovo );
        msg = ( String ) reSet.get ( "msg" );
        url = "/orderMgt";
      } else {
        session.removeAttribute ( "ssKey" );
        session.invalidate ( );
        msg = "접근이 올바르지 않습니다.";
        url = "/login";
      }
    } else {
      session.removeAttribute ( "ssKey" );
      session.invalidate ( );
      msg = "세션이 종료되었습니다.\\n 재로그인 필요합니다.";
      url = "/login";
    }
    model.addAttribute ( "msg", msg );
    model.addAttribute ( "url", url );
    return "MsgPage";
  }
  
  @GetMapping ( "orderDelete" )
  public String getOrderDelete ( HttpServletRequest request,
  HttpServletResponse response,
  OrderVo ovo,
  Model model ) {
    return orderDelete ( request, response, ovo, model );
  }
}
