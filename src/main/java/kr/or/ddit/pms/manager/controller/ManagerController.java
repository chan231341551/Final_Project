package kr.or.ddit.pms.manager.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ui.PaginationRenderer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pms")
public class ManagerController {

	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@GetMapping("/manager")
	public String proejctManagerPage() {
		return "pms/manager/manager";
	}
}
