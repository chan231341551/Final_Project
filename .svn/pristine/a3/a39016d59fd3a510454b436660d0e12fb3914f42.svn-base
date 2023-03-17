package kr.or.ddit.main.help.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.main.help.service.NoticeService;
import kr.or.ddit.main.help.vo.NoticeVO;
import kr.or.ddit.project.attach.service.AttatchService;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/help")
public class NoticeController {
	@Inject
	private NoticeService service;
	@Inject
	private AttatchService attService;
	
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@Value("#{appInfo.imageFolder}")
	 private File imageFolder;
	   
	@Value("#{appInfo.imageFolder}")
	 private String imageFolderURL;
	   
	@PostConstruct
	 public void init() throws IOException {
	   log.info("이미지 저장 경로 : {}", imageFolder.getCanonicalPath());
	    if(!imageFolder.exists()) {
	       imageFolder.mkdirs();
	    }
	 }	
	
	@GetMapping("/noticeList")
	public String helpMain() {
		return "/help/noticeList";
	}
	
	@GetMapping("/noticeListIn")	
	public String noticeList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @ModelAttribute("simpleCondition") SearchVO searchVO
			, Model model
	) {
		log.info("-----------simpleCondition : {}" , searchVO);
		
		PagingVO<NoticeVO> pagingVO = new PagingVO<>(10,2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		service.retrieveNoticeList(pagingVO);
		model.addAttribute("pagingVO",pagingVO);
		if(!pagingVO.getDataList().isEmpty()) {
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		}
		return "jsonView";
		//return "/help/noticeList";
	}
	
	//url:"/help/noticeDetail",
	//let data = {"noticeNo":1392};
	//json이 들어올 때는 RequestBody로 받고
	//json으로 나갈 때는 ResponseBody로 내보냄
	@ResponseBody
	@GetMapping("/noticeDetail/{noticeNo}")
	public NoticeVO detail(@PathVariable int noticeNo, Model model) {
		log.info("상세조회");
		NoticeVO notice = service.retriveNotice(noticeNo);
		model.addAttribute("notice", notice);
		return notice;
	}
	
	
	// 입력폼 가져오기 get
	@GetMapping("/noticeForm")
	public String noticeForm() {
		log.info("공지폼 왔다");
		return "main/help/noticeForm";
	}
	
	// 입력 기능 수행 post
	@PostMapping("/insertNotice")
	public String noticeInsert(
		   NoticeVO notice,
		   Model model,
		   @RequestPart("files") MultipartFile[] files
	) {
		String viewName = null;
		log.info("notice: {}",notice);
		
		int noticeAttNo = attService.createAttatch(files, "noticeFiles");
		notice.setNoticeAttNo(noticeAttNo);
		int rowcnt = service.createNotice(notice);
		if(rowcnt > 0) {
			viewName = "redirect:/help/noticeListIn";
		}else {
			model.addAttribute("message", "다시 시도하세요.");
			viewName = "/help/noticeList";
		}
		return viewName;
	}
	
		
	// 수정기능 수행 
	@PostMapping("/modifyNotice")
	@ResponseBody
	public String modifyNotice(NoticeVO notice, @RequestPart("files") MultipartFile[] files) {
		log.info("수정 왔나,,");
		int noticeAttNo = attService.createAttatch(files, "noticeFiles");
		notice.setNoticeAttNo(noticeAttNo);
		int rowcnt = service.modifyNotice(notice);
		return Integer.toString(rowcnt);
	}
	
	// 삭제 기능 수행
	@PostMapping("/deleteNotice")
	@ResponseBody
	public String deleteNottice(@RequestParam("noticeNo") int noticeNo) {
		int rowcnt = service.deleteNotice(noticeNo);
		return Integer.toString(rowcnt);
	}
	
   @RequestMapping(value="/notice/noticeImage", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public Map<String, Object> uploadImage(@RequestPart MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException {
//	      1. 업로드 : binary data 저장
      String saveName = UUID.randomUUID().toString();
      upload.transferTo(new File(imageFolder, saveName));
//	      2. JSON 생성 (filename, uploaded, url)
      Map<String, Object> marshallingTarget = new HashMap<>();
      marshallingTarget.put("filename", upload.getOriginalFilename());
      marshallingTarget.put("uploaded", 1);
      String url = req.getContextPath() + imageFolderURL + "/" + saveName;
      marshallingTarget.put("url", url);
      return marshallingTarget;
   } 
}