package com.ecom6.service.product;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ecom6.common.vo.PageVo;
import com.ecom6.dao.product.ProductMapper;
import com.ecom6.vo.order.OrderVo;
import com.ecom6.vo.product.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {
     
	@Autowired
	ProductMapper productDao;
	
	@Override
	public Map<String, Object> getProductList(PageVo pgVo) {
		Map<String, Object> reSet 
		  = new HashMap<String, Object>();
		int cnt = productDao.getProductCnt();
		//페이지 계산로직
		List<ProductVo> productList = productDao.getProductList(pgVo);
		reSet.put("pcnt", cnt);
		reSet.put("productList", productList);
		return reSet;
	}

	@Override
	public int insertProduct(ProductVo pvo, MultipartFile file) {
		String originalFileName = file.getOriginalFilename();
		File destinationFile;
		if(originalFileName ==null || originalFileName.length()==0) {
			pvo.setImage("ready.gif");
		}else {
			pvo.setImage(originalFileName);
			destinationFile = new File(pvo.getPath()+originalFileName);
			//실제로 파일 전송
			try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return productDao.insertProduct(pvo);
	}

	@Override
	public ProductVo getProduct(ProductVo pvo) {
		return productDao.getProduct(pvo.getP_no());
	}

	@Override
	public void updateStocks(Hashtable<Integer, OrderVo> hCartList) {
		List<OrderVo> list 
		 = new ArrayList<OrderVo>(hCartList.keySet().size());
		for(int key : hCartList.keySet()) {
         list.add(hCartList.get(key));			
		}
		productDao.updateStocks(list);
	}

	@Override
	public int updateProduct(ProductVo pvo, MultipartFile file) {
		String originalFileName = file.getOriginalFilename();
		File destinationFile;
		if(pvo.getImage().equals("ready.gif") || pvo.getImage()==null) {
			if(originalFileName ==null || originalFileName.length()==0) 
				pvo.setImage("ready.gif");
		}else {
		 if(originalFileName !=null && originalFileName.length()>0) {
		  pvo.setImage(originalFileName);
		  destinationFile = new File(pvo.getPath()+originalFileName);
		   //실제로 파일 전송
		  try {
			file.transferTo(destinationFile);
		  } catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		  }
		 }
		}
		return productDao.updateProduct(pvo);
	}
	@Override
	public int deleteProduct(ProductVo pvo) throws Exception{
		int r = 0;
		try {
		    r = productDao.deleteProduct(pvo);
		} catch (Exception e) {
		    throw new Exception("데이터베이스 오류: " + e.getMessage(), e);
		}
		return r;
	}
	@Override
	public int updateStock(OrderVo ovo) {
		return productDao.updateStock(ovo);
	}
 }



