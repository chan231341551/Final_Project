package kr.or.ddit.main.pay.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.main.pay.service.PayService;
import kr.or.ddit.main.pay.vo.PayVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/service")
public class PayDetailController {
	
	@Inject
	private PayService service;
	
	@GetMapping("/payDetail")
	public String payDetail(){
		return "/service/payDetail";
	}
	
	@PostMapping(value="/kakaoPay", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String kakaoPay(PayVO pay, Principal principal){
		log.info("결제 ! : ", pay);
		String memEmail = principal.getName();
		pay.setMemEmail(memEmail);
		int rowcnt = service.createPay(pay);
		String message = "";
		if(rowcnt > 0) {
			message = "OK";
		}else {
			message = "FAIL";
		}
		return message;
	}
	
	@PostMapping("/payEDate")
	@ResponseBody
	public String payEdate(@RequestBody PayVO pay, Principal principal) {
		log.info("남은 날짜: ", pay);
		String memEmail = principal.getName();
		pay.setMemEmail(memEmail);
		String payEdate = service.payEdate(pay);
		log.info("체크:" + payEdate + "체크");
		
		if(payEdate == null) {
			return "NO";
		}
		return payEdate;
	}
	 
}
