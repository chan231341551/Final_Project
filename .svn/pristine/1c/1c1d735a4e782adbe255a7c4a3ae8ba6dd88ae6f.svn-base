package kr.or.ddit.main.help.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.main.help.dao.QNADAO;
import kr.or.ddit.main.help.vo.QNAVO;
import kr.or.ddit.vo.PagingVO;

/**
 * QNA 게시판 서비스 Impl
 * @author 김경하
 * @since 2023. 2. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 14.       PC-13       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Service
public class QNAServiceImpl implements QNAService{
	
	@Inject
	private QNADAO qnaDAO; 
	
	@Override
	public void retrieveQNAList(PagingVO<QNAVO> pagingVO) {
		pagingVO.setTotalRecord(qnaDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(qnaDAO.selectQNAList(pagingVO));
	}

	@Override
	public int createQNA(QNAVO qna) {
		int rowcnt = qnaDAO.insertQNA(qna);
		return rowcnt;
	}

	@Override
	public QNAVO retrieveQNA(int qnaNo) {
		QNAVO qna = qnaDAO.selectQNA(qnaNo);
		return qna;
	}

	@Override
	public int deleteQNA(int qnaNo) {
		int rowcnt = qnaDAO.deleteQNA(qnaNo);
		return 0;
	}

	@Override
	public int createAns(QNAVO qna) {
		//QNAVO(rnum=0, qnaNo=35, memEmail=null, qnaTitle=null, qnaCont=null, qnaDate=null, qnaAttNo=null, qnaAns=<p>답변</p>, isAns=처리중)
		int rowcnt = qnaDAO.insertAns(qna);
		return rowcnt;
	}

	
}
