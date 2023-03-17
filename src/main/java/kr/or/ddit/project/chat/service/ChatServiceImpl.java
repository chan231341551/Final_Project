package kr.or.ddit.project.chat.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.chat.dao.ChatDAO;
import kr.or.ddit.project.chat.vo.ChatVO;
import kr.or.ddit.project.home.vo.ProjectVO;

/**
 * 
 * 채팅 서비스Impl
 * @author 이찬영
 * @since 2023. 2. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 13.      PC-02       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class ChatServiceImpl implements ChatService {
	
	@Inject
	private ChatDAO chatDAO;
	
	@Override
	public List<ProjectVO> retrieveMyProjectListSearch(Map<String, Object> map) {
		List<ProjectVO> myProjectListSearch = chatDAO.selectProjectListSearch(map);
		return myProjectListSearch;
	}

	@Override
	public List<ProjectVO> retrieveMyProjectList(String memEmail) {
		List<ProjectVO> selectProjectList = chatDAO.selectProjectList(memEmail);
		return selectProjectList;
	}

	@Override
	public List<ChatVO> retrieveProjectChat(ChatVO chatVO) {
		List<ChatVO> projectChatRoom = chatDAO.selectProjectChatRoom(chatVO);
		return projectChatRoom;
	}

	@Override
	public int createChatRoom(ChatVO chatVO) {
		int rowcnt = chatDAO.insertChatRoom(chatVO);
		return rowcnt;
	}

	@Override
	public int removeChatRoom(int chatroomNo) {
		int rowcnt = chatDAO.deleteChatRoom(chatroomNo);
		return rowcnt;
	}

}
