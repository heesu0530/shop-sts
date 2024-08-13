package com.ecom6.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom6.dao.product.ProductMapper;
import com.ecom6.vo.product.ProductVo;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	ProductMapper productDao;
	@Override
	public List<ProductVo> productList(ProductVo pvo) {
		return productDao.productList(pvo);
	}

}
