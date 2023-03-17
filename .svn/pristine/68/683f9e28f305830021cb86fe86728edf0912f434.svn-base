package kr.or.ddit.project.calendar.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.project.work.service.WorkService;
import kr.or.ddit.project.work.vo.WorkVO;

@Controller
@RequestMapping("/project")
public class CalendarController {	
	
	@Inject
	private ProjectService service;
	@Inject
	private WorkService workService;
	
	@GetMapping("/project/calendar2/{proCode}")
	public String projectCalendar2(
			@PathVariable String proCode
			, Model model
			) {
		ProjectVO project = service.retrieveProject(proCode);
		model.addAttribute("project", project);
		return "project/calendar/calendar2";
	}
	
	// 작업 날짜 수정하기
	@ResponseBody
	@PostMapping("/project/calendar/workDateUpdate")
	public String projectWorkDateUpdate(
			@RequestBody WorkVO work
			) {
		String resultStr = "";
		ServiceResult result = workService.modifyWorkDate(work);
		switch(result) {
		case OK:
			resultStr = "1";
			break;
		case FAIL:
			resultStr = "0";
			break;
		}
		return resultStr;
	}
	
	

}
