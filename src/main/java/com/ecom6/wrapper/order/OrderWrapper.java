package com.ecom6.wrapper.order;

import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.service.order.OrderService;
import com.ecom6.service.pay.ApiService;
import com.ecom6.service.product.ProductService;
import com.ecom6.vo.order.OrderVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("orderWrapper")
public class OrderWrapper {
	@Autowired
	private OrderService orderService;
	
    @Autowired
    private ProductService productService;
    
    @Autowired
    ApiService apiService;
    
    @Transactional
	public HashMap<String, Object> orderProc(OrderVo ovo, Hashtable<Integer, OrderVo> hCartList) {
		String url=ovo.getApiUrl();
		String msg=null;
		UUID u =  UUID.randomUUID();
		HashMap<String,String> apiMap = new HashMap<String,String>(); //api 사용 파라미터
		Map<String,String> apiResult = new HashMap<String,String>();
		Long amount = 0l;
		String itemName="";
		List<OrderVo> list 
		 = new ArrayList<OrderVo>(hCartList.keySet().size());
		for(int key : hCartList.keySet()) {
			amount+= hCartList.get(key).getPrice()*hCartList.get(key).getQuantity();
			itemName +=(hCartList.get(key).getP_name()+",");
         list.add(hCartList.get(key));			
		}
		
		SimpleDateFormat timestamp = new SimpleDateFormat("yyyyMMddHHmmss");
		apiMap.put("orderNumber", "shop"+u.toString());
		String apiCertKey = "ac805b30517f4fd08e3e80490e559f8e";
		apiMap.put("amount", amount.toString());
		apiMap.put("itemName", itemName);
		apiMap.put("userName", ovo.getMem_name());
		apiMap.put("userAgent", "WP");
		apiMap.put("returnUrl", "1234");
		 String t = timestamp.format(new Date());
		apiMap.put("timestamp",t);
		String signature=null;
		try {
			signature = apiService.getSHA256Hash("himedia"+"|"+ "shop"+u.toString()+"|"+amount.toString()+"|"+apiCertKey+"|"+t);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		apiMap.put("signature", signature);
		
		apiResult = apiService.JsonApi(url, apiMap);
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		int r =0;	
		log.info(apiResult.get("responseCode"));
		if(apiResult.get("responseCode").equals("0000")) {
			r=orderService.insertOrders(hCartList);
		}else {
			msg="주문을 실패했습니다.\\n 관리자에게 문의바랍니다.";
			url="cartList";
		}
		if(r>0) {
			productService.updateStocks(hCartList);
			msg="주문완료했습니다.";
			url = "orderList";
			reMap.put("url", url);		
			hCartList.clear();
		}else {
			msg="주문을 실패했습니다.\\n 관리자에게 문의바랍니다.";
			url="cartList";
			reMap.put("msg", msg);		
			reMap.put("url", url);		
		}
         reMap.put("hCartList", hCartList);		
         reMap.put("apiResult", apiResult);		
		return reMap;
	}

    @Transactional
	public Map<String, Object> orderDelete(OrderVo ovo) {
    	log.info("wrapper==>"+ovo);
    	Map<String, Object> reSet = new HashMap<>();
    	String msg=null;
    	// 삭제가 가능한지 확인(1,2) 나머지는 삭제가 불가능합니다. 반품로직으로 이동
    	switch (ovo.getState()) {
		case 1: 
		case 2: {
			// 삭제가 가능하면 상품 재고 추가하고
			int r= productService.updateStock(ovo);
			if(r>0) {
				int dr = orderService.deleteOrder(ovo);
				if(dr>0) {
					msg= "해당 주문 삭제하고 \\n 환불시스템으로 이동합니다";
				}else {
					msg = "주문 삭제 실패했습니다.\\n 해당주문이 없습니다.";
				}
			}else {
				/* throw new Exception("처리중 오류가 발생했습니다."); */
				msg = "처리중 오류가 발생했습니다.";
			}
			break;
		}
		default:
			//삭제불가
			msg="해당 주문은 삭제가 불가하므로 \\n 반품을 통해 처리해야합니다.";
		}
    	reSet.put("msg", msg);
		return reSet;
	}

}
