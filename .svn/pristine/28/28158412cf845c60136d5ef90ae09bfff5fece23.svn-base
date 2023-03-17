package kr.or.ddit.project.issue.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.project.issue.service.IssueService;
import kr.or.ddit.project.issue.vo.IssCommVO;
import kr.or.ddit.project.issue.vo.IssueVO;
import kr.or.ddit.project.work.vo.WorkCommVO;
import kr.or.ddit.project.work.vo.WorkVO;
import kr.or.ddit.validate.InsertGroup;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/project")
public class IssueController {
	@Inject
	private ProjectService proService;
	@Inject
	private IssueService service;
	
	@Value("#{appInfo.imageFolder}")
	 private File imageFolder;
	   
	@Value("#{appInfo.imageFolder}")
	 private String imageFolderURL;
	
	// mention
	@GetMapping("/mention/{proCode}")
	public String mention(
		 @PathVariable String proCode	
		, Model model
	) {
		model.addAttribute("proCode", proCode);
		return "project/mention/mention";
	}
	
	// 이슈  매인으로 페이지 이동
	@GetMapping("/project/issueList/{proCode}")
	public String issueList(
		@PathVariable String proCode
		,Model model
	) {
		ProjectVO project = proService.retrieveProject(proCode);
		model.addAttribute("project", project);
		return "project/issue/issueRetrieve";
	}
	
//	 이슈목록 데이터 호출(SELECT LIST)
	@GetMapping("/project/issue/{proCode}")
	public String issue(
		  Model model
		, @PathVariable String proCode
	) {
		List<IssueVO> issueList = service.retrieveIssueList(proCode);
		model.addAttribute("issueList", issueList);
		log.info("issueList : {}",issueList);
		return "jsonView";
	}
	
	// 작업목록 호출
	@GetMapping("/issueWork/{proCode}")
	@ResponseBody
	public List<WorkVO> issueWork(
		@PathVariable String proCode
		,Model model
	) {
		List<WorkVO> workList = service.retrieveWork(proCode);
		return workList;
	} 
	
	// 담당자 목록 호출
//	@ResponseBody -> List<MemberVO>
	@GetMapping("/issueMemList")
	public String issueForm(
			  MemberVO member
			, WorkVO work
			, Model model
	) {
		List<MemberVO> memList = service.retrieveMember(work.getWorkNo());
		log.info("memList:", memList);
		model.addAttribute("memList", memList);
		
//		return memList;
		return "jsonView";
	}
	
	// INSERT
//	@ResponseBody
	@PostMapping("/issueInsert")
	public String issueInsert(
			@RequestBody IssueVO issue
			, Errors errors
			, Model model
			, Principal principal
	) {
		log.info("Issue 1 : " + issue);
		String memEmail = principal.getName();
		MemberVO member = new MemberVO();
		member.setMemEmail(memEmail);
		issue.setMember(member);
		log.info("Issue 2 : " + issue);
	
		int rowcnt = service.createIssue(issue);
		log.info("Issue 3 : " + issue);
		if (rowcnt < 0) {
			model.addAttribute("message", "이슈 만들기 실패");
		}
		return "jsonView";
	}
	
	// 이슈 수정(update)
	@ResponseBody
	@PostMapping("/issueUpdate")
	public int issueUpdate(
		@RequestBody IssueVO issue
	) {
		log.info("Issue : " + issue);
		
		int rowcnt = service.modifyIssue(issue);
		return rowcnt;
	}
	
	// 이슈 상세조회(select)
	@ResponseBody
	@PostMapping("/issueDetail/{issNo}")
	public Map<String, Object> issueDetail(
		@PathVariable int issNo
	) {
		log.info("issNo"+issNo);
		IssueVO issue = service.retrieveIssue(issNo);
		List<Map<String, String>> member = service.retrieveChargerMem(issNo);
		
		
		Map<String, Object> issData = new HashMap<String, Object>();
		issData.put("issue", issue);
		issData.put("member",member);
		
		return issData;
	}
	
	// 이슈 삭제
	@ResponseBody
	@PostMapping("/issueDelete/{issNo}")
	public int issueDelete(
		@PathVariable int issNo
	) {
		int rowcnt = service.removeIssue(issNo);
		return rowcnt;
	}

	// 댓글 등록
	@ResponseBody
	@PostMapping("/IssCommInsert")
	public int IssCommInsert(
		@RequestBody IssCommVO issComm
		, Principal principal
	) {
//		Integer issNo = issComm.getIssNo();
		
		String memEmail = principal.getName();
		issComm.setMemEmail(memEmail);
		
		int cnt= service.createIssComm(issComm);
		return cnt;
	}
	
	// 댓글 목록
	@ResponseBody
	@GetMapping("/IssCommList/{issNo}")
	public List<IssCommVO> IssCommList(
		@PathVariable int issNo
	) {
		List<IssCommVO> IssCommList = service.retrieveIssCommList(issNo);
		return IssCommList;
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping("/IssCommDelete/{issCommNo}")
	public int IssCommDelete(
			@PathVariable int issCommNo
	) {
		int cnt= service.removeIssComm(issCommNo);
		return cnt;
	}
	
	@RequestMapping(value="/issImage", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> uploadImage(@RequestPart MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException {
//		      1. 업로드 : binary data 저장
      String saveName = UUID.randomUUID().toString();
      upload.transferTo(new File(imageFolder, saveName));
//		      2. JSON 생성 (filename, uploaded, url)
      Map<String, Object> marshallingTarget = new HashMap<>();
      marshallingTarget.put("filename", upload.getOriginalFilename());
      marshallingTarget.put("uploaded", 1);
      String url = req.getContextPath() + imageFolderURL + "/" + saveName;
      marshallingTarget.put("url", url);
      return marshallingTarget;
   }
}
