package kr.or.ddit.project.news.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.project.news.vo.NewsCommVO;
import kr.or.ddit.project.news.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 뉴스 게시판 DAO
 * @author 전혜수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       PC-21       최초작성 
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Mapper
public interface NewsDAO {
	
	/**
	 * 뉴스 목록 조회 
	 * @param pagingVO
	 * @return
	 */
	public List<NewsVO> selectNewsList(PagingVO<NewsVO> pagingVO);
	
	/**
	 * 검색 조건에 맞는 레코드 수 반환 	  
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<NewsVO> pagingVO);
	
	
	/**
	 * 프로젝트에 해당하는 뉴스 리스트 조회
	 * @param memEmail
	 * @return
	 */
	public List<NewsVO> selectMyNewsList(@Param("proCode") String proCode);
	
	/**
	 * 선택한 뉴스 상세조회 
	 * @param newsNo
	 * @return
	 */
	public NewsVO selectNews(@Param("newsNo") int newsNo);
	
	/**
	 * 조회수
	 * @param newsNo
	 */
	public void incrementHit(int newsNo);
	
	/**
	 * 뉴스 작성 
	 * @param news
	 * @return
	 */
	public int insertNews(NewsVO news);

	/**
	 * 뉴스 수정
	 * @param news
	 * @return
	 */
	public int updateNews(NewsVO news);
	
	/**
	 * 뉴스 삭제 
	 * @param newsNo
	 * @return
	 */
	public int deleteNews(NewsVO news);
	
	
	/**
	 * 뉴스 댓글 작성 
	 * @param newscommVO
	 * @return
	 */
	public int insertNewsComm(NewsCommVO newscommVo); 
	
	/**
	 * 뉴스 댓글 목록 출력
	 * @param newscommVo
	 * @return
	 */
	public List<NewsCommVO> selectNewsCommList(NewsCommVO newscommVo);
	
	

}
