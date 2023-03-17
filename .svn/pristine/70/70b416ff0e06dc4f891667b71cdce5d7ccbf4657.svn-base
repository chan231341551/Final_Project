package kr.or.ddit.project.file.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.attach.service.AttatchService;
import kr.or.ddit.project.attach.vo.AttatchVO;
import kr.or.ddit.project.file.service.TreeService;
import kr.or.ddit.project.file.vo.TreeVO;
import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/project")
public class FileController {
	
	@Inject
	private ProjectService proService;
	@Inject
	private TreeService service;
	@Inject
	private AttatchService attService;

	@GetMapping("/project/file/{proCode}")
	public String fileView(
			@PathVariable String proCode
			, Model model
			) {
		ProjectVO project = proService.retrieveProject(proCode);
		model.addAttribute("project", project);
		return "project/file/fileHome";

	}
	// 파일게시판 접속
	@GetMapping("/project/myFile")
	public String myFileList() {
		return "pms/myfile/fileList";
	}
	
	// 트리 리스트 로드
	@PostMapping("/project/fileTree")
	@ResponseBody
	public List<TreeVO> fileTree(@RequestBody String proCode) {
		log.info("프로코드 뭐지??{}",proCode);
		List<TreeVO> treeList = service.retrieveTreeList(proCode);
		return treeList;
	}
	// 파일 리스트 로드
	@ResponseBody
	@PostMapping("/project/fileList")
	public List<AttatchVO> fileList(
			@RequestBody String proCode
	) {
		List<AttatchVO> fileList = attService.retrieveProjectFileList(proCode);
		return fileList;
	}
	
	// 파일 텍스트 리스트 로드
	@ResponseBody
	@PostMapping("/project/fileTextList")
	public List<AttatchVO> fileTextList(@RequestBody TreeVO tree) {
		log.info("tree 뭐지??{}",tree);
		List<AttatchVO> fileList = attService.retrieveProjectTextFileList(tree);
		return fileList;
	}
	
	// 트리 생성
	@PostMapping("/project/treeInsert")
	@ResponseBody
	public int treeInsert(@RequestBody TreeVO tree) {
		log.info("tree 뭐지??{}",tree);
		int cnt = service.createTree(tree);
		return cnt;
	}
	
	// 트리 수정
	@PostMapping("/project/treeUpdate")
	@ResponseBody
	public int treeUpdate(@RequestBody TreeVO tree) {
		log.info("tree 뭐지??{}",tree);
		int cnt = service.modifyTree(tree);
		return cnt;
	}
	
	// 트리 삭제
	@PostMapping("/project/treeDelete")
	@ResponseBody
	public int treeDelete(@RequestBody TreeVO tree) {
		log.info("treeId 뭐지??{}",tree);
		int cnt = service.removeTree(tree);
		return cnt;
	}
	
	
	// 파일 업로드
	@ResponseBody
	@PostMapping("/project/fileUpload")
	public int fileUpload(
		@RequestPart("files") MultipartFile[] files
		, TreeVO tree
	) {
		log.info("tree 뭐지??{}",tree);
		log.info("파일받앙? 뭐지??{}",files);
		int fileAttNo = attService.createProjectFile(files, tree);
		return fileAttNo; 
	}
	
	@ResponseBody
	@PostMapping("/project/fileDelete")
	public int fileDelete(
			@RequestBody int attNo
			) {
		log.info("attNo 뭐지??{}",attNo);
		int cnt = attService.removeFile(attNo);
		return cnt; 
	}
}