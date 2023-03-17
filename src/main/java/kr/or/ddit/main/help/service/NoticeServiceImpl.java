package kr.or.ddit.main.help.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.help.dao.NoticeDAO;
import kr.or.ddit.main.help.vo.NoticeVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 공지 게시판 서비스  인터페이스 구현 클래스
 * @author 김경하
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       PC-13       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDAO noticeDAO;

	@Override
	public void retrieveNoticeList(PagingVO<NoticeVO> pagingVO) {
		pagingVO.setTotalRecord(noticeDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(noticeDAO.selectNoticeList(pagingVO));
	}
	
	@Override
	public int createNotice(NoticeVO notice) {
		int rowcnt = noticeDAO.insertNotice(notice);
		return rowcnt;
}

	@Override
	public NoticeVO retriveNotice(int noticeNo) {
		NoticeVO notice = noticeDAO.selectNotice(noticeNo);
		noticeDAO.incrementHit(noticeNo);
		return notice;
	}

/*	@Override
	public void incrementHit(int noticeNo) {
		
	}*/

	@Override
	public int modifyNotice(NoticeVO notice) {
		int rowcnt = noticeDAO.updateNotice(notice);
		return rowcnt;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int rowcnt = noticeDAO.deleteNotice(noticeNo);
		return rowcnt;
	}

}
