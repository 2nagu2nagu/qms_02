package com.qms.partner.service;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.partner.dao.PartnerDao;
import com.qms.partner.vo.PartnerVO;
import com.qms.table.vo.item.ItemInfoVO;
import com.qms.table.vo.system.PartnerInfoVO;

@Service
public class PartnerService {

	@Autowired
	PartnerDao dao;
	
	public int selectTotalPartnerCount(PartnerVO vo) throws Exception{
		return dao.selectTotalPartnerCount(vo);
	}
	
	public List<PartnerInfoVO> selectPartnerList(PartnerInfoVO vo) throws Exception{
		return dao.selectPartnerList(vo);
	}
	
	//모달
	
	public PartnerVO selectPartnerDtldata(PartnerVO vo) throws Exception{
		return dao.selectPartnerDtldata(vo);
	}
	
	public int insertNewPartner(PartnerVO vo) throws Exception{
		return dao.insertNewPartner(vo);
	}
	
	public int selectDuplicateCompCdCheck(PartnerVO vo) throws Exception{
		return dao.selectDuplicateCompCdCheck(vo);
	}

	public int updatePartnerData(PartnerVO vo) throws Exception{
		return dao.updatePartnerData(vo);
	}
	
	
		
}
