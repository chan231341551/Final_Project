/**
 * 
 */
package kr.or.ddit.main.help.service;

import java.util.List;

import kr.or.ddit.main.help.vo.FAQVO;

/**
 * 자주묻는 질문 게시판 Service
 * @author 김경하
 * @since 2023. 2. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 21.       PC-13       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

public interface FAQService {
	
	/**
	 * 자주묻는 질문 답변 리스트 조회
	 * @param faq
	 * @return faq 리스트
	 */
	public List<FAQVO> retrieveFAQList();
	
	/**
	 * 자주묻는 질문 답변 생성
	 * @param faq
	 * @return 수정행수
	 */
	public int createFaq(FAQVO faq);
	
	/**
	 * 자주묻는 질문 답변 수정
	 * @param faqNo
	 * @return FAQVO
	 */
	public int modifyFaq(FAQVO faq);
	
	/**
	 * 자주묻는 질문 답변 삭제
	 * @param faqNo
	 * @return
	 */
	public int deleteFaq(int faqNo);
	
}
