package com.ecom6.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ecom6.common.vo.PageVo;
import com.ecom6.service.product.ProductService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.product.ProductVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

//상품과 관련되 controller
@Slf4j
@Controller
public class ProductController {
  
  @Autowired
  ProductService productService;
  
  @Value("${resources.location}")
  String resourcesLocation;
  
  @GetMapping("/productMgt")
  public String productMgt (HttpServletRequest request,
                            HttpServletResponse response,
                            Model model,
                            PageVo pgVo) {
    String      page    = null;
    MemberVo    ssKey   = null;
    HttpSession session = request.getSession ();
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      // session이 있을 때 받아서 저장
      session.setAttribute ("ssKey", ssKey);
      if (ssKey.getMem_role ().equals ("admin")) {
        page = "admin/ProductMgt";
      } else {
        page = "redirect:/";// 최초화면으로 이동
      }
    } else {
      page = "redirect:/";
    }
    Map< String, Object > reSet = productService.getProductList (pgVo);
    model.addAttribute ("pcnt", reSet.get ("pcnt"));
    model.addAttribute ("productList", reSet.get ("productList"));
    model.addAttribute ("pgVo", pgVo);
    return page;
  }
  
  @GetMapping("/productList")
  public String productList (HttpServletRequest request,
                             HttpServletResponse response,
                             Model model,
                             ProductVo pvo,
                             PageVo pgVo) {
    // 고객용
    MemberVo    ssKey      = null;
    String      contentJsp = null;
    HttpSession session    = request.getSession ();
    ProductVo   product    = productService.getProduct (pvo);
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      session.setAttribute ("ssKey", ssKey);
    }
    Map< String, Object > reSet = productService.getProductList (pgVo);
    model.addAttribute ("pcnt", reSet.get ("pcnt"));
    contentJsp = "product/ProductList.jsp";
    model.addAttribute ("contentJsp", contentJsp);
    model.addAttribute ("productList", reSet.get ("productList"));
    model.addAttribute ("pgVo", pgVo);
    model.addAttribute ("product", product);
    log.info ("안녕!!!" + product);
    return "Main";
  }
  
  @GetMapping("/productInForm")
  public String productInForm (HttpServletRequest request,
  HttpServletResponse response,
  Model model,
  PageVo pgVo) {
    
    String      page    = null;
    MemberVo    ssKey   = null;
    HttpSession session = request.getSession ();
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      // session이 있을 때 받아서 저장
      session.setAttribute ("ssKey", ssKey);
      if (ssKey.getMem_role ().equals ("admin")) {
        model.addAttribute ("contentJsp", "ProductInForm.jsp");
        page = "admin/Main";
      } else {
        page = "redirect:/";// 최초화면으로 이동
      }
    } else {
      page = "redirect:/";
    }
    return page;
  }
  
  @PostMapping("productMgtProc")
  public String productMgtProc (HttpServletRequest request,
  HttpServletResponse response,
  Model model,
  ProductVo pvo,
  PageVo pgVo,
  @RequestParam("image2") MultipartFile file) {
    String      msg     = null;
    String      url     = null;
    MemberVo    ssKey   = null;
    HttpSession session = request.getSession ();
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      // 세션이 있다면 저장
      session.setAttribute ("ssKey", ssKey);
      if (ssKey.getMem_role ().equals ("admin")) {
        if (request.getParameter ("flag") != null) {
          String flag = request.getParameter ("flag");
          // 업로드를 위한 패스 저장
          pvo.setPath (resourcesLocation);
          if (flag.equals ("insert")) {
            // insert 호출
            int r = productService.insertProduct (pvo, file);
            if (r > 0) {
              msg = "상품 등록 성공!";
            } else {
              msg = "상품 등록 실패!";
            }
          } else if (flag.equals ("update")) {
            int r = productService.updateProduct (pvo, file);
            if (r > 0) {
              msg = "상품 수정 성공!";
            } else {
              msg = "상품 수정 실패!";
            }
          }
          url = "productMgt";
        }
      } else {
        url = "redirect:/";   // 최초화면으로 이동
        msg = "잘못된 경로 접근입니다.";
      }
    } else {
      url = "redirect:/";
      msg = "로그인정보가 없습니다.";
    }
    
    model.addAttribute ("msg", msg);
    model.addAttribute ("url", url);
    return "MsgPage";
  }
  
  @GetMapping("/productDetail")
  public String productDetail (HttpServletRequest request,
                               HttpServletResponse response,
                               Model model,
                               ProductVo pvo,
                               PageVo pgVo) {
    String      page       = null;
    MemberVo    ssKey      = null;
    String      contentJsp = null;
    HttpSession session    = request.getSession ();
    ProductVo   product    = productService.getProduct (pvo);
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      // session 저장
      session.setAttribute ("ssKey", ssKey);
      if (ssKey.getMem_role ().equals ("admin")) {
        // 데이터베이스에서 받아오기
        contentJsp = "ProductDetail.jsp";
        model.addAttribute ("contentJsp", contentJsp);
        page = "admin/Main";
      } else {
        model.addAttribute ("contentJsp", "custom/ProductDetail.jsp");
        page = "Main";
      }
    } else {
      //			 page="MsgPage";
      //			 model.addAttribute("url", "/login");
      //			 model.addAttribute("msg", "로그이 필요합니다.");
      model.addAttribute ("contentJsp", "custom/ProductDetail.jsp");
      page = "Main";
    }
    model.addAttribute ("product", product);
    log.info ("안녕!!!" + product);
    return page;
  }
  
  @GetMapping("productUpdateForm")
  public String productUpdateForm (HttpServletRequest request,
                                   HttpServletResponse response,
                                   Model model,
                                   ProductVo pvo,
                                   PageVo pgVo) {
    String      page       = null;
    MemberVo    ssKey      = null;
    String      contentJsp = null;
    String      msg        = null;
    String      url        = null;
    HttpSession session    = request.getSession ();
    ProductVo   product    = productService.getProduct (pvo);
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      // session 저장
      session.setAttribute ("ssKey", ssKey);
      if (ssKey.getMem_role ().equals ("admin")) {
        contentJsp = "ProductUpdateForm.jsp";
        model.addAttribute ("contentJsp", contentJsp);
        page = "admin/Main";
      } else {
        msg  = "잘못된 접근입니다.";
        url  = "/";
        page = "MsgPage";
        model.addAttribute ("msg", msg);
        model.addAttribute ("url", url);
      }
    } else {
      msg  = "세션이 종료되었습니다. \\n 재로그인이 필요합니다.";
      url  = "/login";
      page = "MsgPage";
      model.addAttribute ("msg", msg);
      model.addAttribute ("url", url);
    }
    model.addAttribute ("product", product);
    return page;
  }
  
  @GetMapping("/productDelete")
  public String productDelete (HttpServletRequest request,
  HttpServletResponse response,
  Model model, PageVo pgVo, ProductVo pvo) {
    String      page    = null;
    MemberVo    ssKey   = null;
    HttpSession session = request.getSession ();
    if (session.getAttribute ("ssKey") != null) {
      ssKey = (MemberVo)session.getAttribute ("ssKey");
      // session이 있을 때 받아서 저장
      session.setAttribute ("ssKey", ssKey);
      if (ssKey.getMem_role ().equals ("admin")) {
        // 삭제후
        int    r   = 0;
        String msg = null;
        try {
          r = productService.deleteProduct (pvo);
          if (r > 0)
            msg = "상품 삭제 성공";
          else
            msg = "등록된 상품이 없음";
        } catch (Exception e) {
          msg = "해당상품을 구매한 고객이 있습니다.";
        } finally {
          String url = "/productMgt";
          model.addAttribute ("msg", msg);
          model.addAttribute ("url", url);
        }
        page = "MsgPage";
      } else {
        page = "redirect:/";// 최초화면으로 이동
      }
    } else {
      page = "redirect:/";
    }
    return page;
  }
}
