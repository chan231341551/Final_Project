package kr.or.ddit.main.pay.service;

import kr.or.ddit.main.pay.vo.PayVO;

/**
 * @author 김경하
 * @since 2023. 3. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 2.       PC-13       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface PayService {
	
	/**
	 * 결제시 추가
	 * @param pay
	 * @return
	 */
	public int createPay(PayVO pay);
	
	/**
	 * 결제 만료일 조회(결제 한 사람)
	 * @param pay
	 * @return
	 */
	public String payEdate(PayVO pay);
}
