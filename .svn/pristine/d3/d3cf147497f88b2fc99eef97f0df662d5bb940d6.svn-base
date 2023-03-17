package kr.or.ddit.main.help.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.main.help.dao.FAQDAO;
import kr.or.ddit.main.help.vo.FAQVO;

/**
 * 자주묻는 질문 게시판 serviceImpl 
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

@Service
public class FAQServiceImpl implements FAQService{
	
	@Inject
	private FAQDAO faqDAO;

	@Override
	public List<FAQVO> retrieveFAQList() {
		List<FAQVO> faqList = faqDAO.selectFaqList();
		return faqList;
	}
	
	@Override
	public int createFaq(FAQVO faq) {
		int rowcnt = faqDAO.insertFaq(faq);
		return rowcnt;
	}

	@Override
	public int modifyFaq(FAQVO faq) {
		int rowcnt = faqDAO.updateFaq(faq);
		return rowcnt;
	}

	@Override
	public int deleteFaq(int faqNo) {
		int rowcnt = faqDAO.deleteFaq(faqNo);
		return rowcnt;
	}
	
	
}
