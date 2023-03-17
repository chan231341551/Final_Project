package kr.or.ddit.project.sidemenu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.project.sidemenu.service.MemoService;
import kr.or.ddit.project.sidemenu.vo.MemoVO;
import kr.or.ddit.vo.PagingVO;
import lombok.RequiredArgsConstructor;

/**
 * 
 * 메모 컨트롤러
 * @author 이찬영
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.      PC-02       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/memo")
public class MemoController {
	
	
	
}
