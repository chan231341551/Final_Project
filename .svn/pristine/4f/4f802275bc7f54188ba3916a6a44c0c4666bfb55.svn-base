package kr.or.ddit.project.alarm.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.alarm.service.AlarmService;
import kr.or.ddit.project.alarm.vo.AlarmVO;
import kr.or.ddit.project.issue.vo.IssueVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/project")
public class alarmController {
	
	@Inject
	private AlarmService service;

	@GetMapping("/alarm")
	public String myAlarm() {
		return "project/alarm/alarmRetrieve";
	}
	
	@GetMapping("/sendAlarm")
	public String sendAlarm() {
		return "includee/pms/headerMenu";
	}
	
	@ResponseBody
	@PostMapping("/alarmInsert")
	public int insertAlarm(
		@RequestBody AlarmVO alarm
		, Principal principal
		, Model model
	) {
		String memEmail = principal.getName();
		alarm.setAlSender(memEmail);
//		log.info("alarm : " + alarm);
		
		int rowcnt = service.createAlarm(alarm);
		if (rowcnt < 0) {
			model.addAttribute("message", "알람 전송 실패");
		}
		return rowcnt;
	}
	
	// 안읽은 알림 갯수 띄우기
	@ResponseBody
	@GetMapping("/count")
	public int count(Principal principal) {
		String memEmail = principal.getName();
		int count = service.count(memEmail);
		return count;
	}
	
	// 읽음 처리할 알람(select)
	@ResponseBody
	@GetMapping("/alarmNo")
	public int alarmNumber() {
		int alNo = service.retrieveAlarmNo();
		return alNo;
	}
	
	// 이슈 리스트(select)
	@ResponseBody
	@GetMapping("/alarmList")
	public List<AlarmVO> alarmList(
			Principal principal
			//, Errors errors
			) {
		String memEmail = principal.getName();
		List<AlarmVO> alarmList = service.retrieveAlarm(memEmail);
		return alarmList;
	}
	
	// 알람 수정(update)
	@ResponseBody
	@PostMapping("/alarmUpdate/{alNo}")
	public int alarmUpdate(
		@PathVariable Integer alNo
	) {
		log.info(" alNo {}", alNo);
		int rowcnt = service.modifyAlarm(alNo);
		return rowcnt;
	}
	
	
}
