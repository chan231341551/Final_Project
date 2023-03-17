package kr.or.ddit.project.sidemenu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.project.sidemenu.vo.MemoVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 
 * 메모 DAO 인터페이스
 * @author 이찬영
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.      PC-02       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface MemoDAO {
	
	
	public List<MemoVO> selectMemoList(@Param("memEmail") String memEmail);
	
	/**
	 * 검색 조건에 맞는 레코드 수 반환
	 * @param pagingVO
	 * @return
	 */
	public int selelctTotalRecord(PagingVO<MemoVO> pagingVO);
	
	/**
	 * 검색 조건과 현재 페이지에 맞는 메모 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<MemoVO> selectMemoSearchList(Map<String, String> map);
	
	/**
	 * 선택한 메모 상세조회
	 * @param memoNo
	 * @return
	 */
	public MemoVO selectMemo(@Param("memoNo") int memoNo);
	
	/**
	 * 메모 등록
	 * @param memoVO
	 * @return
	 */
	public int insertMemo(MemoVO memoVO);
	
	/**
	 * 메모 삭제
	 * @param memoNo
	 * @return
	 */
	public int deleteMemo(@Param("memoNo") int memoNo);
	
	/**
	 * 메모 수정
	 * @param memoVO
	 * @return
	 */
	public int updateMmeo(MemoVO memoVO);
	
	
}
