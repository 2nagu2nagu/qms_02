package com.qms.product.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.qms.product.vo.ProductVO;
import com.qms.product.vo.ProVO;
import com.qms.table.vo.product.ProductInfoVO;

@MapperScan(basePackages="com.qms.product.dao")
public interface ProductDao {
	
	public List<ProVO> selectMonthProList(ProVO vo) throws Exception;
	public int selectTotalMonthProCount(ProVO vo) throws Exception;
	
	public List<ProductInfoVO> selectMonthlyProductList(ProductVO vo) throws Exception;
	public int selectTotalMthProCount(ProductVO vo) throws Exception;
	
}
