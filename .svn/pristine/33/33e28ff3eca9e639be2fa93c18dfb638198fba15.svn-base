package kr.or.ddit.project.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.board.dao.BoardDao;
import kr.or.ddit.project.board.vo.BoardCommVO;
import kr.or.ddit.project.board.vo.BoardVO;

/**
 * BoardServiceImpl
 * @author 이수현
 * @since 2023. 3. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 3.       PC-       최초작성 
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Service
public class BoardServiceImpl implements BoardService { // BoardServiceImpl은 BoardService을 implements한다 

	// 의존성 주임
	@Inject
	BoardDao boardDao;

	
	// 게시판 목록 조회
	@Override
	public List<BoardVO> retrieveBoardList(String proCode) {
		return boardDao.selectBoardList(proCode);
	}

	// 게시글 조회
	@Override
	public BoardVO retrieveBoard(int boardNo) {
		BoardVO selectBoard = boardDao.selectBoard(boardNo);
		boardDao.incrementHit(boardNo);
		return selectBoard;
	}

	// 게시글 생성
	//Override 메소드 재정의
	@Override
	public int createBoard(BoardVO boardVO) {
		return boardDao.insertBoard(boardVO);
	}

	// 게시글 수정
	@Override
	public int modifyBoard(BoardVO boardVO) {
		return boardDao.updateBoard(boardVO);
	
	}

	
	// 게시글 삭제
	@Override
	public int removeBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}

	// 게시글 조회수 증가
//	@Override
//	public void incrementHit(int boardNo) {
//		boardDao.incrementHit(boardNo);
//	}
	
	// 게시판 댓글 조회
	@Override
	public List<BoardCommVO> retriveBoardCommList(int boardNo) {
		return boardDao.selectBoardCommList(boardNo);
	}

	// 게시판 댓글 생성
	@Override
	public int createBoardComm(BoardCommVO boardCommVO) {
		return boardDao.insertBoardComm(boardCommVO);
	}

	// 게시판 댓글 수정
	@Override
	public int modifyBoardComm(BoardCommVO boardCommVO) {
		return boardDao.updateBoardComm(boardCommVO);
	}

	// 게시판 댓글 삭제
	@Override
	public int removeBoardComm(int boardCommNo) {
		return boardDao.deleteBoardComm(boardCommNo);
	}

	// 게시판 검색 리스트
	@Override
	public List<BoardVO> retrieveSearchBoard(Map<String, String> map) {
		List<BoardVO> selectBoardSearchList = boardDao.selectBoardSearchList(map);
		return selectBoardSearchList;
	}



}
