package com.qms.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.product.dao.ProductDao;
import com.qms.product.vo.ProductVO;
import com.qms.product.vo.ProVO;
import com.qms.table.vo.product.ProductInfoVO;

@Service
public class ProductService {

	@Autowired
	ProductDao dao;
	
	public List<ProVO> selectMonthProList(ProVO vo) throws Exception{
		return dao.selectMonthProList(vo);
	}
	public int selectTotalMonthProCount(ProVO vo) throws Exception{
		return dao.selectTotalMonthProCount(vo);
	}
	public List<ProductInfoVO> selectMonthlyProductList(ProductVO vo) throws Exception{
		return dao.selectMonthlyProductList(vo);
	}
	public int selectTotalMthProCount(ProductVO vo) throws Exception{
		return dao.selectTotalMthProCount(vo);
	}
}
	
	

	