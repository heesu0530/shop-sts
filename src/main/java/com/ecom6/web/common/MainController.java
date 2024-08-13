package com.ecom6.web.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ecom6.service.main.MainService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.product.ProductVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@GetMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model, ProductVo pvo) {
	    MemberVo ssKey = null;
	    String page = null;
	    HttpSession session = request.getSession();
	    List<ProductVo> productList = mainService.productList(pvo);

	    if (session.getAttribute("ssKey") != null) {
	        ssKey = (MemberVo) session.getAttribute("ssKey");
	        if (ssKey.getMem_role().equals("admin")) {
	            page = "redirect:/admin/";
	        } else {
	            page = "index";
	        }
	    } else {
	        page = "index";
	    }

	    model.addAttribute("productList", productList); // 오타 수정
	    model.addAttribute("ssKey", ssKey); // 세션 정보도 전달
	    return page;
	}
   @GetMapping(value={"/admin/", "/admin"})
   public String indexAdmin(HttpServletRequest request, 
		   HttpServletResponse response) {
	   MemberVo ssKey=null;
	    String page=null;
		HttpSession session = request.getSession();
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVo) session.getAttribute("ssKey");
			if(ssKey.getMem_role().equals("admin")) {
				page="admin/index";
			}else {
				page="redirect:/";
			 }
		}else {
			page="redirect:/";
		}
	   return page;
   }
   
   @GetMapping("/pwCheck")
   public String pwCheck(HttpServletRequest request, 
		   HttpServletResponse response) {
	   return "popup/PwCheckPopup";
   }
}
