package com.ecom6.service.order;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;

import com.ecom6.common.vo.PageVo;
import com.ecom6.vo.order.OrderVo;

public interface OrderService {

	int insertOrders(Hashtable<Integer, OrderVo> hCartList);
	
	Map<String, Object> getOrders(OrderVo ovo, PageVo pgvo);
	
	OrderVo getOrder(OrderVo ovo);
	
	Map<String, Object> getOrderList(OrderVo ovo, PageVo pgvo);
	
	void orderStateUpdate(ArrayList<String> tdArr);
	
	int updateState(OrderVo ovo);
	
	int deleteOrder(OrderVo ovo);

}
