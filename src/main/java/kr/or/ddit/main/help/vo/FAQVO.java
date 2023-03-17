package kr.or.ddit.main.help.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 자주묻는 질문 게시판 DAO
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

@Data
@EqualsAndHashCode(of="faqNo")
@ToString
public class FAQVO {
	
	private int faqNo;
	private String faqAsk;
	private String faqAns;
	
}
