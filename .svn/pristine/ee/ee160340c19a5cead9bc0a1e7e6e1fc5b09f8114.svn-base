package kr.or.ddit.main.help.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.main.help.vo.FAQVO;

/**
 * 자주 묻는 질문 FAQ DAO
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

@Mapper
public interface FAQDAO {
	
	public List<FAQVO> selectFaqList();
	
	public int insertFaq(FAQVO faq);
	
	public int updateFaq(FAQVO faq);
	
	public int deleteFaq(int faqNo);
}
