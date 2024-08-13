package com.ecom6.dao.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.vo.order.OrderVo;

@Mapper
public interface OrderMapper {

	int insertOrders(List<OrderVo> list);

	int getTotalOrders(OrderVo ovo);

	List<OrderVo> getOrders(OrderVo ovo);

	List<OrderVo> getOrderList(OrderVo ovo);

	void orderStateUpdate(List<OrderVo> list);

	int updateState(OrderVo ovo);

	int deleteOrder(OrderVo ovo);
	
    int getOrderNo();
}
