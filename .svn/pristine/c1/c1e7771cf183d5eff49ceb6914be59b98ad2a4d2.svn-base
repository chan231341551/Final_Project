package kr.or.ddit.project.sidemenu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.board.controller.BoardController;
import kr.or.ddit.project.sidemenu.dao.MemoDAO;
import kr.or.ddit.project.sidemenu.vo.MemoVO;
import kr.or.ddit.vo.PagingVO;
import lombok.RequiredArgsConstructor;

/**
 * 
 * 메모 ServiceImpl
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
@RequiredArgsConstructor
@Service
public class MemoServiceImpl implements MemoService {
	
	private final MemoDAO memoDAO;
	
	@Override
	public  List<MemoVO> retrieveMemoSelectList(Map<String, String> map) {
//		pagingVO.setTotalRecord(memoDAO.selelctTotalRecord(pagingVO));
		
		List<MemoVO> selectMemoList = memoDAO.selectMemoSearchList(map);
//		pagingVO.setDataList(memoList);
//		memoList.stream().forEach(System.out::println);
		return selectMemoList;
		
	}
	
	@Override
	public List<MemoVO> retrieveMemoList(String memEmail) {
		List<MemoVO> memoList = memoDAO.selectMemoList(memEmail);
		return memoList;
	}

	@Override
	public MemoVO retrieveMemo(int memoNo) {
		MemoVO selectMemo = memoDAO.selectMemo(memoNo);
		if(selectMemo == null) {
			throw new RuntimeException("선택한 메모장 없음");
		}
		return selectMemo;
	}

	@Override
	public int createMemo(MemoVO memoVO) {
		int rowcnt = memoDAO.insertMemo(memoVO);
		return rowcnt;
	}

	@Override
	public int removeMemo(int memoNo) {
		int rowcnt = memoDAO.deleteMemo(memoNo);
		return rowcnt;
	}

	@Override
	public int modifyMemo(MemoVO memoVO) {
		int rowcnt = memoDAO.updateMmeo(memoVO);
		return rowcnt;
	}


}
