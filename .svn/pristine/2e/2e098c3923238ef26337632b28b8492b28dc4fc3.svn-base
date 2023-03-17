package kr.or.ddit.main.help.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.main.help.service.QNAService;
import kr.or.ddit.main.help.vo.QNAVO;
import kr.or.ddit.project.attach.service.AttatchService;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/help")
public class QNAController {
	
	@Inject
	private QNAService service;
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
	
	@GetMapping("/qnaList")
	public String qnaList(
			@RequestParam(value="page", required=false, defaultValue="1")int currentPage,
			@ModelAttribute("simpleCondition") SearchVO searchVO,
			Model model, Principal principal
	){
		String memEmail = "";
		
		if(principal!=null) {
			memEmail = principal.getName();
		}
		
		log.info("memEmail : " + memEmail);
		
		QNAVO qnaVO = new QNAVO();
		qnaVO.setMemEmail(memEmail);	
		
		PagingVO<QNAVO> pagingVO = new PagingVO<>(5,2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setDetailCondition(qnaVO);
		service.retrieveQNAList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		if(!pagingVO.getDataList().isEmpty()) {
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		}
		return "jsonView";
	}
	
	@PostMapping(value="/insertQNA", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String qnaInsert(QNAVO qna, Principal principal, @RequestPart("files") MultipartFile[] files) {
		
		log.info("qna 생성" + qna);
		String memEmail = principal.getName();
		qna.setMemEmail(memEmail);
		int qnaAttNo = attService.createAttatch(files, "qnaFiles");
		qna.setQnaAttNo(qnaAttNo);
		int rowcnt = service.createQNA(qna);
		String message = "";
		if(rowcnt > 0) {
			message = "OK";
		}else {
			message = "FAIL";
		}
		return message;
	}
	
	@GetMapping("/qnaDetail")
	@ResponseBody
	public QNAVO detail(@RequestParam int qnaNo, Model model) {
		QNAVO qna = service.retrieveQNA(qnaNo);
		//qna : QNAVO(rnum=0, qnaNo=35, memEmail=kkh@a.com, qnaTitle=답변등록 중, qnaCont=처리중인 문의사항 입니다., qnaDate=2023-02-20 17:18, qnaAttNo=null, qnaAns=<p>ㅁㄴㅇㄹ</p>
		log.info("qna : " + qna);
		
		model.addAttribute("qna", qna);
		return qna;
	}
	
	@PostMapping(value="/createAns", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String createAns(QNAVO qna, Principal principal, MultipartFile[] files) {
		//QNAVO(rnum=0, qnaNo=35, memEmail=null, qnaTitle=null, qnaCont=null, qnaDate=null, qnaAttNo=null, qnaAns=<p>답변</p>, isAns=처리중)
		log.info("답변입력왔낭(qna) : " + qna);
		int ansAttNo = attService.createAttatch(files, "qnaFiles");
		qna.setAnsAttNo(ansAttNo);
		int rowcnt = service.createAns(qna);
		String message = "";
		if(rowcnt > 0) {
			message = "OK";
		}else {
			message = "FAIL";
		}
		return message;
	}
	
	@PostMapping("/deleteQna")
	@ResponseBody
	public int qnaDelete(@RequestParam("qnaNo") int qnaNo) {
		log.info("삭제체크 : {} ", qnaNo);
		int rowcnt = service.deleteQNA(qnaNo);
		return rowcnt;
	}
	
	@RequestMapping(value="/qna/qnaImage", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
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
