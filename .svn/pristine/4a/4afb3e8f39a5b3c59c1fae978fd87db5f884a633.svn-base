package kr.or.ddit.project.wiki.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.project.wiki.vo.WikiVO;

/**
 * 
 * WikiDAO interface
 * @author 전혜수
 * @since 2023. 2. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 20.      PC-21       최초작성
 * 
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */


@Mapper
public interface WikiDAO {
	
	/**
	 * 위키 목록 출력(최신순)
	 * @param proCode
	 * @return
	 */
	public List<WikiVO> selectWikiList(@Param("proCode") String proCode);
	
	

	/**
	 * 위키 목록 출력(종류별)
	 * @param proCode
	 * @return
	 */
	public List<WikiVO> selectWikiListSort(@Param("proCode") String proCode);
	
	public List<WikiVO> selectWikiListSort1(@Param("proCode") String proCode);
	
	public List<WikiVO> selectWikiListSort2(@Param("proCode") String proCode);
	
	public List<WikiVO> selectWikiListSort3(@Param("proCode") String proCode);
	
	
	/**
	 * 위키글 1건 검색 
	 * @param wikiNo
	 * @return
	 */
	public WikiVO selectWiki(WikiVO wiki);
	
	/**
	 * 위키 작성
	 * @param wikiVO
	 * @return
	 */
	public int insertWiki(WikiVO wikiVO);
	
	
	/**
	 * 위키 삭제 
	 * @param WikiNo
	 * @return
	 */
	public int deleteWiki(WikiVO wiki);
	
	
	/**
	 * 위키 수정
	 * @param wiki
	 * @return
	 */
	public int updateWiki(WikiVO wiki);
	
	
	/**
	 * 위키 답글 작성 
	 * @param wikiVo
	 * @return
	 */
	public int insertWikiComm(WikiVO wiki);
	
	
	

}
