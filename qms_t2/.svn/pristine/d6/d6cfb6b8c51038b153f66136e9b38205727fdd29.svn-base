package com.qms.partner.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.excel.service.ExcelService;
import com.qms.partner.service.PartnerService;
import com.qms.partner.vo.PartnerVO;
import com.qms.table.vo.common.MessageVO;
import com.qms.table.vo.system.PartnerInfoVO;
import com.qms.user.vo.UserVO;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class PartnerController {

	@Autowired
	PartnerService service;
	
	@Autowired
    private ExcelService excelService;
	

	@RequestMapping("/partner/list")
	public String partnerlist() throws Exception{
		return "partner/pt01";
	}
	
	@RequestMapping("/partner/searchlist")
	@ResponseBody
	public PartnerVO searchlist(@ModelAttribute("PartnerVO") PartnerVO vo) throws Exception {
		/*List<String> comGrpCdList = Arrays.asList(Constant.ITEM_TYPE,Constant.UNIT_TYPE, Constant.PLANT_LINE, Constant.BOX_TYPE, Constant.LOCATION);
 		 vo.setComGrpCdList(comGrpCdList); 공통코드 */
		 
	    int totalPage = service.selectTotalPartnerCount(vo); 
	    List<PartnerInfoVO> list = service.selectPartnerList(vo);

	    vo.setPartnerlist(list);
	    vo.setTotal(totalPage);  // 총 데이터 수
	    vo.setStartPage(vo.getStartPage()); 
	    vo.setCurrentPage(vo.getCurrentPage());  // 현재 페이지

	    return vo;
	}
	
	@RequestMapping("/partner/getPartnerDtldata")
    @ResponseBody
    public PartnerVO getPartnerDtldata(@ModelAttribute("PartnerVO") PartnerVO vo) throws Exception {
		vo = service.selectPartnerDtldata(vo);
		
		return vo;
	}
	
	
	@RequestMapping("/partner/savePartner")
	@ResponseBody
	public MessageVO savePartner(@ModelAttribute("PartnerVO") PartnerVO vo, HttpServletRequest request)throws Exception {
		 HttpSession session  = request.getSession();
	     UserVO uservo = (UserVO) session.getAttribute("QMSUser");
	     vo.setRegUserId(uservo.getUserId());   
		
		int check = service.selectDuplicateCompCdCheck(vo);
		
		MessageVO msgvo = new MessageVO();
		if(check != 0) {
			msgvo.setMsg("등록실패 ( 중복된 거래처입니다.)");
		} else if( check == 0){
			int cnt = service.insertNewPartner(vo);
			if(cnt > 0) {
				msgvo.setMsg("등록성공");
			}else {
				msgvo.setMsg("등록실패");
			}
		}
		return msgvo;
	}
	
	
	@RequestMapping("/partner/updatePartner")
	@ResponseBody
	public MessageVO updatePartner(@ModelAttribute("PartnerVO") PartnerVO vo, HttpServletRequest request)throws Exception {
		 HttpSession session  = request.getSession();
	     UserVO uservo = (UserVO) session.getAttribute("QMSUser");
	     vo.setUpdUserId(uservo.getUserId());   
		
	     MessageVO msgvo = new MessageVO();
	     int cnt = service.updatePartnerData(vo);
		 if(cnt > 0) {
			 msgvo.setMsg("수정성공");
		 }else {
			 msgvo.setMsg("수정실패");
		 }
		 
		return msgvo;
	}
	
	@PostMapping("/partner/excelDownload")
	public ResponseEntity<byte[]> downloadExcel() throws Exception {
	    Map<String, Object> parameters = new HashMap<>();

	    List<Map<String, Object>> dataList = excelService.selectPartnerListTOexcel(parameters);

	    String[] headers = ExcelConstant.PARTNER_HEADER;
	    String[] columns = ExcelConstant.PARTNER_COLUMN;
	    String sheetName = "거래처 조회";
	    String filenName = "partner_data.xlsx";

	    return excelService.createExcelFile(dataList, columns, headers, filenName , sheetName);
	}

	
	
	
}
