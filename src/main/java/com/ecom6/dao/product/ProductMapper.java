package com.ecom6.dao.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom6.common.vo.PageVo;
import com.ecom6.vo.order.OrderVo;
import com.ecom6.vo.product.ProductVo;

@Mapper
public interface ProductMapper {

	int getProductCnt();

	List<ProductVo> getProductList(PageVo pgVo);

	int insertProduct(ProductVo pvo);

	ProductVo getProduct(int p_no);

	void updateStocks(List<OrderVo> list);

	int updateProduct(ProductVo pvo);

	int deleteProduct(ProductVo pvo);

	int updateStock(OrderVo ovo);

	List<ProductVo> productList(ProductVo pvo);

}
