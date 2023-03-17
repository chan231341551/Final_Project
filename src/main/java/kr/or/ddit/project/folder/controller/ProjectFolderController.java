package kr.or.ddit.project.folder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectFolderController {
	@GetMapping("/projectFolder1")
	public String proejctFolder1List() {
		return "pms/projectfolder/projectFolderPC001";
	}
	@GetMapping("/projectFolder2")
	public String proejctFolder2List() {
		return "pms/projectfolder/projectFolderPC002";
	}
	@GetMapping("/projectFolder3")
	public String proejctFolder3List() {
		return "pms/projectfolder/projectFolderPC003";
	}
	@GetMapping("/projectFolder4")
	public String proejctFolder4List() {
		return "pms/projectfolder/projectFolderPC004";
	}
	@GetMapping("/projectFolder5")
	public String proejctFolder5List() {
		return "pms/projectfolder/projectFolderPC005";
	}
	@GetMapping("/projectFolder6")
	public String proejctFolder6List() {
		return "pms/projectfolder/projectFolderPC006";
	}
}
