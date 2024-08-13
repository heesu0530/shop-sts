package com.ecom6.service.main;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ecom6.vo.product.ProductVo;

@Service
public interface MainService {

	List<ProductVo> productList(ProductVo pvo);

}
