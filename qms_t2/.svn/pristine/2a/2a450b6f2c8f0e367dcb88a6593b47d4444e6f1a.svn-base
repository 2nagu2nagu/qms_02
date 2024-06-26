package com.qms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.excel.service.ExcelService;
import com.qms.table.vo.user.UserInfoVO;
import com.qms.user.service.UserService;
import com.qms.user.vo.UserVO;
import com.qms.util.Constant;


@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@Autowired
    private ExcelService excelService;
	
	@RequestMapping("/user/searchlist")
	@ResponseBody
	public UserVO searchlist(@ModelAttribute("UserVO") UserVO vo) throws Exception {
		vo.setComGrpCd(Constant.POSITION_CD);
		int totalPage = service.selectTotalUserCount(vo); 

		List<UserInfoVO> list = service.selectUserList(vo);
		
		vo.setUserlist(list);
		vo.setTotal(totalPage); //총 데이터수.
		vo.setStartPage(vo.getStartPage()); 
		vo.setCurrentPage(vo.getCurrentPage());//현재페이지

		
		return vo;
				
	}
	
	/*@PostMapping("/excelDownload")
	public ResponseEntity<byte[]> downloadExcel() throws Exception {
	    Map<String, Object> parameters = new HashMap<>();
	    
	    parameters.put("comGrpCd", Constant.POSITION_CD);

	    List<Map<String, Object>> dataList = excelService.selectUserListTOexcel(parameters);

	    String[] headers = ExcelConstant.ITEM_HEADER;
	    String[] columns = ExcelConstant.ITEM_COLUMN;
	    String sheetName = "유저 조회";

	    return excelService.createExcelFile(dataList, columns, headers, "user_data.xlsx", sheetName);
	}USER EXCEL 생성시 사용*/
	
	

	
	
	
}
