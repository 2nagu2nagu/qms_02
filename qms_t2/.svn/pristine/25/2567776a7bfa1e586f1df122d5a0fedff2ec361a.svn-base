package com.qms.item.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jmx.export.annotation.ManagedMetric;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qms.code.service.CodeService;
import com.qms.excel.service.ExcelService;
import com.qms.item.service.ItemService;
import com.qms.item.vo.ItemVO;
import com.qms.item.vo.ProductVO;
import com.qms.table.vo.common.ComCodeVO;
import com.qms.table.vo.common.MessageVO;
import com.qms.table.vo.item.ItemInfoVO;
import com.qms.user.vo.UserVO;
import com.qms.util.Constant;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class ItemController {

	@Autowired
	ItemService service;
	@Autowired
	CodeService codeService;
	@Autowired
    private ExcelService excelService;
	
	@RequestMapping("/item/list")
	public String productlist() throws Exception{
		return "item/item01";
	}

	@RequestMapping("/item/searchlist")
	@ResponseBody
	public ItemVO searchlist(@ModelAttribute("ItemVO") ItemVO vo) throws Exception {
		List<String> comGrpCdList = Arrays.asList(Constant.ITEM_TYPE,Constant.UNIT_TYPE, Constant.PLANT_LINE, Constant.BOX_TYPE, Constant.LOCATION);
	    vo.setComGrpCdList(comGrpCdList);  // comGrpCdList 설정

	    int totalPage = service.selectTotalItemCount(vo); 
	    List<ItemInfoVO> list = service.selectItemList(vo);

	    vo.setItemlist(list);
	    vo.setTotal(totalPage);  // 총 데이터 수
	    vo.setStartPage(vo.getStartPage()); 
	    vo.setCurrentPage(vo.getCurrentPage());  // 현재 페이지

	    return vo;
	}
	
	@RequestMapping("/item/selectGetData")
    @ResponseBody
    public ItemVO selectGetData() throws Exception {
        ComCodeVO vo = new ComCodeVO();
        
        vo.setComGrpCd(Constant.ITEM_TYPE);
        List<ComCodeVO> itemtypelist = codeService.selectGetdata(vo);
        
        vo.setComGrpCd(Constant.UNIT_TYPE);
        List<ComCodeVO> unitlist = codeService.selectGetdata(vo);
        
        vo.setComGrpCd(Constant.BOX_TYPE);
        List<ComCodeVO> boxlist = codeService.selectGetdata(vo);
        
        vo.setComGrpCd(Constant.PLANT_LINE);
        List<ComCodeVO> plantlist = codeService.selectGetdata(vo);
        
        vo.setComGrpCd(Constant.LOCATION);
        List<ComCodeVO> locationlist = codeService.selectGetdata(vo);
        
        ItemVO ivo = new ItemVO();
        ivo.setItemtypelist(itemtypelist);
        ivo.setUnitlist(unitlist);
        ivo.setBoxlist(boxlist);
        ivo.setPlantlist(plantlist);
        ivo.setLocationlist(locationlist);
        
        return ivo;
    }
	
	@RequestMapping("/item/getItemDtldata")
    @ResponseBody
    public ItemVO getItemDtldata(@ModelAttribute("ItemVO") ItemVO vo) throws Exception {
		vo = service.selectItemDtlData(vo);
		
		return vo;
	}
	
	
	@RequestMapping("/item/saveItem")
	@ResponseBody
	public MessageVO saveItem(@ModelAttribute("ItemVO") ItemVO vo, HttpServletRequest request)throws Exception {
		 HttpSession session  = request.getSession();
	     UserVO uservo = (UserVO) session.getAttribute("QMSUser");
	     vo.setRegUserId(uservo.getUserId());   
		
		int check = service.selectDuplicateItemCdCheck(vo);
		
		MessageVO msgvo = new MessageVO();
		if(check != 0) {
			msgvo.setMsg("등록실패 (아이템코드에 기존에 있습니다.)");
		} else if( check == 0){
			int cnt = service.insertNewItem(vo);
			if(cnt > 0) {
				msgvo.setMsg("등록성공");
			}else {
				msgvo.setMsg("등록실패");
			}
		}
		return msgvo;
	}
	
	
	@RequestMapping("/item/updateItem")
	@ResponseBody
	public MessageVO updateItem(@ModelAttribute("ItemVO") ItemVO vo, HttpServletRequest request)throws Exception {
		 HttpSession session  = request.getSession();
	     UserVO uservo = (UserVO) session.getAttribute("QMSUser");
	     vo.setUpdUserId(uservo.getUserId());   
		
	     MessageVO msgvo = new MessageVO();
	     int cnt = service.updateItemData(vo);
		 if(cnt > 0) {
			 msgvo.setMsg("수정성공");
		 }else {
			 msgvo.setMsg("수정실패");
		 }
		 
		return msgvo;
	}
	
	@PostMapping("/item/excelDownload")
	public ResponseEntity<byte[]> downloadExcel() throws Exception {
	    Map<String, Object> parameters = new HashMap<>();
	    
	    List<String> comGrpCdList = Arrays.asList(Constant.ITEM_TYPE, Constant.UNIT_TYPE, Constant.PLANT_LINE, Constant.BOX_TYPE, Constant.LOCATION);
	    parameters.put("comGrpCdList", comGrpCdList);

	    List<Map<String, Object>> dataList = excelService.selectItemListTOexcel(parameters);

	    String[] headers = ExcelConstant.ITEM_HEADER;
	    String[] columns = ExcelConstant.ITEM_COLUMN;
	    String sheetName = "재고 조회";
	    String filenName = "item_data.xlsx";

	    return excelService.createExcelFile(dataList, columns, headers, filenName , sheetName);
	}
	
	@PostMapping("/excelupload")
	@ResponseBody
    public int uploadExcelFile(@ModelAttribute("ItemVO") ItemVO vo, HttpServletRequest request) throws Exception {
		HttpSession session  = request.getSession();
	     UserVO uservo = (UserVO) session.getAttribute("QMSUser");
	     vo.setRegUserId(uservo.getUserId());   
		List<ProductVO> productVOList = service.parseExcelFile(vo.getExcelInput());
		for(ProductVO item : productVOList) {
			item.setRegUserId(uservo.getUserId());
		}
		int cnt = service.insertExcelFile(productVOList);
        return cnt;
    }
}


	
	
