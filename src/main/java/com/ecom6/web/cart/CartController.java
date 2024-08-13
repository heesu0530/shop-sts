package com.ecom6.web.cart;

import java.util.Hashtable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.service.cart.CartService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.order.OrderVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@SuppressWarnings("unchecked")
	@PostMapping("/cartProc")
	public String cartProc(HttpServletRequest request,
						   HttpServletResponse response,
						   OrderVo ovo,
						   Model model) {
		String page="MsgPage";
		String msg = null;
		String url = null;
		log.info("ovo:"+ovo);
		HttpSession session = request.getSession();
		MemberVo ssKey = null;
		Hashtable<Integer, OrderVo> hCartList =null;
		if(session.getAttribute("hCartList")==null) {
			hCartList = new Hashtable<>();
		}else {
			hCartList= (Hashtable<Integer, OrderVo>) 
					session.getAttribute("hCartList");
		}
		String flag = request.getParameter("flag");
		log.info("flage:"+flag);
		//미리 세션여부에 따라 장바구니 삭제됨을 방지하기 위해 미리 저장
		cartService.setCartList(hCartList);
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVo) session.getAttribute("ssKey");
			//고객정보를 미리 저장해 둠
			ovo.setMem_id(ssKey.getMem_id());
			url="cartList";
		}else {
		  msg = "로그인 먼저 필요합니다.";
          url="/login";
		}
		switch (flag) {
		case "add":
			hCartList= cartService.addCart(ovo);
			msg="장바구니에 추가했습니다.";
			break;
		case "update":
			hCartList= cartService.updateCart(ovo);
			msg="장바구니를 수정했습니다.";
			break;
		case "delete":
			hCartList= cartService.deleteCart(ovo);
			msg="장바구니에서 삭제했습니다.";
			break;
		}
		 model.addAttribute("url", url);
	     model.addAttribute("msg", msg);
	  	 session.setAttribute("hCartList", hCartList);
	  	 session.setAttribute("ssKey", ssKey);
		return page;
	}
	
	@GetMapping("/cartProc")
	public String cartProcGet(HttpServletRequest request,
						   HttpServletResponse response,
						   OrderVo ovo,
						   Model model) {
		return cartProc(request,response,ovo,model);
	}
	@GetMapping("/cartList")
	public String cartList(HttpServletRequest request,
			HttpServletResponse response,
			OrderVo ovo,
			Model model) {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Hashtable<Integer, OrderVo> hCartlist=
		 (Hashtable<Integer, OrderVo>) session.getAttribute("hCartlist");
		String contentJsp = "custom/CartList.jsp";
		model.addAttribute("contentJsp", contentJsp);
		session.setAttribute("hCartlist", hCartlist);//???
		return "Main";
	}
}
