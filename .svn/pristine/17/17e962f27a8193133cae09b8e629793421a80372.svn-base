package kr.or.ddit.main.help.service;

import kr.or.ddit.main.help.vo.QNAVO;
import kr.or.ddit.vo.PagingVO;

/**
 * QNA service
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

public interface QNAService {
	
	/**
	 * 전체 QNA 리스트 조회
	 * @param pagingVO
	 */
	public void retrieveQNAList(PagingVO<QNAVO> pagingVO);
	
	/**
	 * 1:1문의 게시판 글 등록
	 * @param qna
	 * @return 등록된 행 수
	 */
	public int createQNA(QNAVO qna);
	
	/**
	 * 1:1문의 게시판 상세조회
	 * @param qnaNo
	 * @return
	 */
	public QNAVO retrieveQNA(int qnaNo);
	
	/**
	 * 1대1문의 답변 입력
	 * @param qna
	 * @return
	 */
	public int createAns(QNAVO qna);
	
	/**
	 * 1:1문의 게시판 글 삭제
	 * @param qnaNo
	 * @return
	 */
	public int deleteQNA(int qnaNo);
}
