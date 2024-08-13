package com.ecom6.service.cart;

import java.util.Hashtable;
import com.ecom6.vo.order.OrderVo;

public interface CartService {

	void setCartList(Hashtable<Integer, OrderVo> hCartList);

	Hashtable<Integer, OrderVo> addCart(OrderVo ovo);

	Hashtable<Integer, OrderVo> updateCart(OrderVo ovo);

	Hashtable<Integer, OrderVo> deleteCart(OrderVo ovo);

	Hashtable<Integer, OrderVo> getCartList();
}
