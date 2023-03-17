package kr.or.ddit.project.chat.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.chat.service.ChatService;
import kr.or.ddit.project.chat.vo.ChatVO;
import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class MyChatController {
	
	@Inject
	private ChatService chatService;
	
	@GetMapping("/myChat")
	public String myChatDetail() {
		return "pms/mychat/chatDetail";
	}
	
	
	/**
	 * 프로젝트 채팅방 조회
	 * @param model
	 * @param chatVO
	 * @return
	 */
	@GetMapping("/projectChat/{proCode}")
	@ResponseBody
	public List<ChatVO> projectChat(
			Model model
			,@PathVariable String proCode
			,@ModelAttribute("chat") ChatVO chatVO
			,Principal principal) {
		chatVO.setProCode(proCode);
		chatVO.setMemEmail(principal.getName());
		List<ChatVO> projectChat = chatService.retrieveProjectChat(chatVO);
		log.info("projectChat : {}",projectChat);
		return projectChat;
	}
	
	/**
	 * 채팅방 생성
	 * @param chatVO
	 * @param model
	 * @return
	 */
	@PostMapping("/chatInsert")
	public String chatRoomInsert(
		@ModelAttribute("chat") ChatVO chatVO
		,Model model
		) {
		log.info("chatVO : "+chatVO);
		int rowcnt = chatService.createChatRoom(chatVO);
		String viewName = "";
		if(rowcnt > 0) {
			viewName = "redirect:/chat/projectChat/"+chatVO.getProCode();
		}
		else {
			model.addAttribute("message","채팅방 생성 실패");
			viewName = "pms/mychat/chatDetail";
		}
		return viewName;
		
	}
	
	/**
	 * 채팅방 삭제
	 * @param chatroomNo
	 * @param chatVO
	 * @param model
	 * @param map
	 * @return
	 */
	@PostMapping("/chatDelete/{chatroomNo}")
	@ResponseBody
	public Map<String, String> chatRoomDelete(
		@PathVariable int chatroomNo
		,ChatVO chatVO
		,Model model
		,Map<String, String> map
		){
		chatVO.setChatroomNo(chatroomNo);
		int rowcnt = chatService.removeChatRoom(chatroomNo);
		map = new HashMap<String, String>();
		if(rowcnt > 0) {
			map.put("result", rowcnt+"");
			return map;
		}
		else {
			model.addAttribute("message","서버오류 다시");
			map.put("result", model+"");
		}
		
		
		return map;
		
	}
}
