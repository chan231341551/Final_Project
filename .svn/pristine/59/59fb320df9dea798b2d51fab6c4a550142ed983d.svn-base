package kr.or.ddit.main.help.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.main.help.vo.NoticeVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 공지사항 게시판 DAO
 * @author 김경하
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 4.       PC-13       최초작성 
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Mapper
public interface NoticeDAO {
	
	public List<NoticeVO> selectNoticeList(PagingVO<NoticeVO> pagingVO);
	
	public int selectTotalRecord(PagingVO<NoticeVO> pagingVO);
	
	public int insertNotice(NoticeVO notice);
	
	public NoticeVO selectNotice(int noticeNo);
	
	public void incrementHit(int noticeNo);
	
	public int updateNotice(NoticeVO notice);
	
	public int deleteNotice(int noticeNo);
}
