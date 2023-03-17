package kr.or.ddit.project.kanban.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.project.work.service.WorkService;
import kr.or.ddit.project.work.vo.WorkVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/project")
public class KanbanController {
	
	@Inject
	private ProjectService service;
	
	@Inject
	private WorkService workService;
	
	@GetMapping("/project/kanban/{proCode}")
	public String projectKanban(
			@PathVariable String proCode
			, Model model
			) {
		ProjectVO project = service.retrieveProject(proCode);
		model.addAttribute("project", project);
		return "project/kanban/kanbanList";
	}
	
	//요청 파라미터 : {proCode:P202302150077,workNo:107}
	//응답 데이터 타입 : json
	@ResponseBody
	@PostMapping("/project/kanban/workDetail")
	public WorkVO projectWorkDetail(@RequestBody WorkVO workVO) {
		log.info("workVO : " + workVO);
		
		workVO = this.workService.retrieveWorkDetail(workVO);
		
		return workVO;
	}
	
	// 오늘 해야 할 작업 목록
	@ResponseBody
	@GetMapping("/project/todayWorkList/{proCode}")
	public List<WorkVO> projectTodatWorkList(
			@PathVariable String proCode
			) {
		List<WorkVO> workList = workService.retrieveTodayWorkList(proCode);
		log.info("workList23{}",workList);
		
		return workList;
	}
	
	// 칸반 작업 상태 변경
	@ResponseBody
	@PostMapping("/project/workStateCdUpdate")
	public String projectWorkStateCdUpdate(
			@RequestBody WorkVO workVO
			) {
		String result = "";
		int rowcnt = workService.modifyWorkStateCd(workVO);
		if(rowcnt > 0) {
			result = "1";
		}else {
			result = "0";
		}
		return result;
	}
}
