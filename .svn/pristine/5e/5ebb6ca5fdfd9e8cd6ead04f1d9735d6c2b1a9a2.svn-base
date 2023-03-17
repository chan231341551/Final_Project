package kr.or.ddit.project.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.chat.vo.ChatVO;
import kr.or.ddit.project.home.vo.ProjectVO;

/**
 * 
 * 채팅 Service 인터페이스
 * @author 이찬영
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.      PC-02       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface ChatService {
	/**
	 * 프로젝트 리스트 조회
	 * @param memEmail
	 * @return
	 */
	public List<ProjectVO> retrieveMyProjectList(String memEmail);
	/**
	 * 프로젝트 리스트 검색 조회
	 * @param map
	 * @return
	 */
	public List<ProjectVO> retrieveMyProjectListSearch(Map<String, Object> map);
	/**
	 * 프로젝트 채팅방 조회
	 * @return
	 */
	public List<ChatVO> retrieveProjectChat(ChatVO chatVO);
	
	/**
	 * 채팅방 생성
	 * @param chatVO
	 * @return
	 */
	public int createChatRoom(ChatVO chatVO);
	
	public int removeChatRoom(int chatroomNo);
	
}
