package com.ecom6.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.dao.order.OrderMapper;
import com.ecom6.vo.order.OrderVo;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderDao;
	
	@Transactional
	@Override
	public int insertOrders(Hashtable<Integer, OrderVo> hCartList) {
		List<OrderVo> list 
		 = new ArrayList<OrderVo>(hCartList.keySet().size());
		for(int key : hCartList.keySet()) {
          list.add(hCartList.get(key));			
		}
		return orderDao.insertOrders(list);
	}
    @Transactional
	@Override
	public Map<String, Object> getOrders(OrderVo ovo, PageVo pgvo) {
    	Map<String, Object> reSet = new HashMap<>();
    	//total
    	int cnt = orderDao.getTotalOrders(ovo);
    	//페이지 계산
    	if(pgvo.getCurBl()<=0) pgvo.setCurBl(1);
		if(pgvo.getCurPg()<=0) pgvo.setCurPg(1);
		int start = (pgvo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgvo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgvo.getCurPg()*PageInfo.ROW_OF_PAGE;
		ovo.setStart(start);
		ovo.setEnd(end);
		//페이지 수 계산
		int pgCnt = (cnt%PageInfo.ROW_OF_PAGE==0)?
				     cnt/PageInfo.ROW_OF_PAGE:
					 cnt/PageInfo.ROW_OF_PAGE+1;
		pgvo.setPgCnt(pgCnt);
		
		//페이지 블록 계산
		int blockCnt = (pgCnt%PageInfo.PAGE_OF_BLOCK==0)?
				       pgCnt/PageInfo.PAGE_OF_BLOCK:
				       pgCnt/PageInfo.PAGE_OF_BLOCK+1;
		
		pgvo.setBlockCnt(blockCnt);
		//startPg
		int startPg = (pgvo.getCurBl()-1)*PageInfo.PAGE_OF_BLOCK+1;
		//endPg
		int endPg = pgvo.getCurBl()*PageInfo.PAGE_OF_BLOCK>pgCnt?
				    pgCnt:pgvo.getCurBl()*PageInfo.PAGE_OF_BLOCK;
		pgvo.setStartPg(startPg);
		pgvo.setEndPg(endPg);
		
    	// 리스트 구하는 거
    	List<OrderVo> orders = orderDao.getOrders(ovo);
    	reSet.put("orderTot", cnt);
		//페이지 저장
    	reSet.put("pgvo", pgvo);
    	reSet.put("orders", orders);
		return reSet;
	}
	@Override
	public OrderVo getOrder(OrderVo ovo) {
		List<OrderVo> list = orderDao.getOrders(ovo);
		if(list.size()>0) 
			return list.get(0);
		else return null;
	}
	@Override
	public Map<String, Object> getOrderList(OrderVo ovo, PageVo pgvo) {
		Map<String, Object> reSet = new HashMap<>();
		int cnt = orderDao.getTotalOrders(null);
		
		//페이지 계산
    	if(pgvo.getCurBl()<=0) pgvo.setCurBl(1);
		if(pgvo.getCurPg()<=0) pgvo.setCurPg(1);
		int start = (pgvo.getCurPg()-1)*PageInfo.ROW_OF_PAGE+1;
		int end = (pgvo.getCurPg()*PageInfo.ROW_OF_PAGE)>cnt?
				   cnt : pgvo.getCurPg()*PageInfo.ROW_OF_PAGE;
		ovo.setStart(start);
		ovo.setEnd(end);
		//페이지 수 계산
		int pgCnt = (cnt%PageInfo.ROW_OF_PAGE==0)?
				     cnt/PageInfo.ROW_OF_PAGE:
					 cnt/PageInfo.ROW_OF_PAGE+1;
		pgvo.setPgCnt(pgCnt);
		
		//페이지 블록 계산
		int blockCnt = (pgCnt%PageInfo.PAGE_OF_BLOCK==0)?
				       pgCnt/PageInfo.PAGE_OF_BLOCK:
				       pgCnt/PageInfo.PAGE_OF_BLOCK+1;
		
		pgvo.setBlockCnt(blockCnt);
		//startPg
		int startPg = (pgvo.getCurBl()-1)*PageInfo.PAGE_OF_BLOCK+1;
		//endPg
		int endPg = pgvo.getCurBl()*PageInfo.PAGE_OF_BLOCK>pgCnt?
				    pgCnt:pgvo.getCurBl()*PageInfo.PAGE_OF_BLOCK;
		pgvo.setStartPg(startPg);
		pgvo.setEndPg(endPg);
		
		List<OrderVo> orders = orderDao.getOrderList(ovo);
		reSet.put("orderTot", cnt);
		reSet.put("orders", orders);
		reSet.put("pgvo", pgvo);
		return reSet;
	}
	
	@Transactional
	@Override
	public void orderStateUpdate(ArrayList<String> tdArr) {
		List<OrderVo> list = new ArrayList<>();
		  for(int i=0; i<tdArr.size(); i+=4) {
			  OrderVo ovo = new OrderVo();
			  int n=0, no=0;
			  String mid = null;
			  //한개씩 꺼내서 담기
			  n=tdArr.get(i).indexOf(":");//첫번재 거 o_no
			  no = Integer.parseInt(tdArr.get(i).substring(n+1));
			  ovo.setO_no(no);
			  
			  n=tdArr.get(i+1).indexOf(":");//첫번재 거 o_no
			  no = Integer.parseInt(tdArr.get(i+1).substring(n+1));
			  ovo.setP_no(no);
			  
			  n=tdArr.get(i+2).indexOf(":");
			  mid = tdArr.get(i+2).substring(n+1);
			  ovo.setMem_id(mid);
			  
			  n=tdArr.get(i+3).indexOf(":");
			  no = Integer.parseInt(tdArr.get(i+3).substring(n+1));
			  ovo.setState(no);
			  //하나씩 저장된 OVO 수정하는 내용을 호출해도 됨
			  //orderDao.orderStateUpdate(ovo)
			  //리스트에 추가
			  list.add(ovo);
		  }
		  orderDao.orderStateUpdate(list);
 		//log.info("list==>"+list);
	}
	@Override
	public int updateState(OrderVo ovo) {
		return orderDao.updateState(ovo);
	}
	@Override
	public int deleteOrder(OrderVo ovo) {
		return orderDao.deleteOrder(ovo);
	}
}
