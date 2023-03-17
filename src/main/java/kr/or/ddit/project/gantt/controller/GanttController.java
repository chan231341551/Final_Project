package kr.or.ddit.project.gantt.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;

@Controller
@RequestMapping("/project")
public class GanttController {	
	
	@Inject
	private ProjectService service;
	
	@GetMapping("/project/gantt/{proCode}")
	public String projectGantt(
			@PathVariable String proCode
			, Model model
			) {
		ProjectVO project = service.retrieveProject(proCode);
		model.addAttribute("project", project);
		return "project/gantt/gantt";
	}
}