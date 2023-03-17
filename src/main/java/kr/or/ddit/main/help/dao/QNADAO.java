package kr.or.ddit.main.help.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.main.help.vo.QNAVO;
import kr.or.ddit.vo.PagingVO;

/**
 * FAQ DAO 인터페이스
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

@Mapper
public interface QNADAO {
	
	public int selectTotalRecord(PagingVO<QNAVO> pagingVO);
	
	public List<QNAVO> selectQNAList(PagingVO<QNAVO> pagingVO);
	
	public int insertQNA(QNAVO qna);
	
	public QNAVO selectQNA(int qnaNo);
	
	public int insertAns(QNAVO qna);
	
	public int deleteQNA(int qnaNo);
}
