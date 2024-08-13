package com.ecom6.service.cart;

import java.util.Hashtable;

import org.springframework.stereotype.Service;

import com.ecom6.vo.order.OrderVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {

	//내부에 사용할 해시테이블
	private Hashtable<Integer, OrderVo> hCartList;

	@Override
	public void setCartList(Hashtable<Integer, OrderVo> hCartList) {
		this.hCartList = hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVo> addCart(OrderVo ovo) {
		//상품을 추가하는데 기존 장바구니에 있으면 수량을 추가
		int p_no = ovo.getP_no();
		int quantity = ovo.getQuantity();
		if(hCartList.containsKey(p_no)) {
			OrderVo temp = (OrderVo)hCartList.get(p_no);
			quantity+=temp.getQuantity();
			if(temp.getStock()<quantity) {
				//메시지 없이 최대 수량으로 수정
				temp.setQuantity(temp.getStock());
			}else {
				temp.setQuantity(quantity);
			}
			hCartList.put(p_no, temp);
		}else {
			hCartList.put(p_no, ovo);
		}
		log.info("hCartList==>"+hCartList);
		return hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVo> updateCart(OrderVo ovo) {
		int p_no = ovo.getP_no();
		int quantity = ovo.getQuantity();
		if(hCartList.containsKey(p_no)) {
			OrderVo temp = (OrderVo)hCartList.get(p_no);
			if(temp.getStock()<quantity) {
				temp.setQuantity(temp.getStock());
			}else {
				temp.setQuantity(quantity);
			}
			hCartList.put(p_no, temp);
		}
		return hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVo> deleteCart(OrderVo ovo) {
		hCartList.remove(ovo.getP_no());
		return hCartList;
		
	}

	@Override
	public Hashtable<Integer, OrderVo> getCartList() {
		return hCartList;
	}
	
}
