package com.qms.partner.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.qms.partner.vo.PartnerVO;
import com.qms.table.vo.item.ItemInfoVO;
import com.qms.table.vo.system.PartnerInfoVO;


@MapperScan(basePackages="com.qms.partner.dao")
public interface PartnerDao {
	
	public int selectTotalPartnerCount(PartnerVO vo) throws Exception;
	
	public List<PartnerInfoVO> selectPartnerList(PartnerInfoVO vo) throws Exception;
	
	
	//모달
	
	public PartnerVO selectPartnerDtldata(PartnerVO vo) throws Exception;
	
	public int insertNewPartner(PartnerVO vo) throws Exception;
	
	public int selectDuplicateCompCdCheck(PartnerVO vo) throws Exception;
	
	public int updatePartnerData(PartnerVO vo) throws Exception;

}
	