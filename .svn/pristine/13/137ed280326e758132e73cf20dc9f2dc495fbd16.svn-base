package kr.or.ddit.main.pay.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.pay.dao.PayDAO;
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

@Service
public class PayServiceImpl implements PayService{
	@Inject
	private PayDAO payDao;

	@Override
	public int createPay(PayVO pay) {
		int rowcnt = payDao.insertPay(pay);
		return rowcnt;
	}

	@Override
	public String payEdate(PayVO pay) {
		String payEdate = payDao.payEdate(pay);
		return payEdate;
	}
	
	
}
