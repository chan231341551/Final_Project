package kr.or.ddit.main.help.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.main.help.service.FAQService;
import kr.or.ddit.main.help.vo.FAQVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/help")
public class FAQController {
	
	@Inject
	private FAQService service; 
	
	@GetMapping("/faqList")
	@ResponseBody
	public List faqList(Model model, FAQVO FAQVO) {
		List<FAQVO> faqList = service.retrieveFAQList();
		log.info("faqList : {} " , faqList);
		model.addAttribute("FAQVO", FAQVO);
		return faqList;
	}
	
	@PostMapping("/insertFAQ")
	@ResponseBody
	public void faqCreate(@RequestBody FAQVO faq) {
		service.createFaq(faq);
	}
	
	@PostMapping("/modifyFAQ")
	@ResponseBody
	public void faqModify(@RequestBody FAQVO faq) {
		service.modifyFaq(faq);
	}
	
	@PostMapping("/deleteFAQ")
	@ResponseBody
	public void faqDelete(@RequestParam("faqNo") int faqNo) {
		service.deleteFaq(faqNo);
	}
}
