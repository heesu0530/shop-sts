package com.ecom6.service.product;

import java.util.Hashtable;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ecom6.common.vo.PageVo;
import com.ecom6.vo.order.OrderVo;
import com.ecom6.vo.product.ProductVo;

public interface ProductService {

	Map<String, Object> getProductList(PageVo pgVo);

	int insertProduct(ProductVo pvo, MultipartFile file);

	ProductVo getProduct(ProductVo pvo);

	void updateStocks(Hashtable<Integer, OrderVo> hCartList);

	int updateProduct(ProductVo pvo, MultipartFile file);

	int deleteProduct(ProductVo pvo) throws Exception;

	int updateStock(OrderVo ovo);

}
