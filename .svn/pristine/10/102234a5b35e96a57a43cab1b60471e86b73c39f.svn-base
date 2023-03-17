package kr.or.ddit.project.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.project.chat.vo.ChatVO;
import kr.or.ddit.project.home.vo.ProjectVO;

/**
 * 
 * 채팅 DAO 인터페이스
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
@Mapper
public interface ChatDAO {
	/**
	 * 멤버 프로젝트 리스트
	 * @param memEmail
	 * @param map
	 * @return
	 */
	public List<ProjectVO> selectProjectList(@Param("memEmail") String memEmail);
	/**
	 * 멤버 프로젝트 검색 리스트
	 * @param memEmail
	 * @param map
	 * @return
	 */
	public List<ProjectVO> selectProjectListSearch(Map<String, Object> map);
	/**
	 * 프로젝트 채팅방 
	 * @param chatVO
	 * @return
	 */
	public List<ChatVO> selectProjectChatRoom(ChatVO chatVO);
	
	/**
	 * 채팅방 생성
	 * @param chatVO
	 * @return
	 */
	public int insertChatRoom(ChatVO chatVO);
	
	/**
	 * 채팅방 삭제
	 * @param chatroomNo
	 * @return
	 */
	public int deleteChatRoom(@Param("chatroomNo") int chatroomNo);
}
