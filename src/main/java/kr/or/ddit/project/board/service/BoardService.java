package kr.or.ddit.project.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.board.vo.BoardCommVO;
import kr.or.ddit.project.board.vo.BoardVO;

/**
 * BoardService
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

//@Service : 서비스임을 알려주는 어노테이션
@Service
public interface BoardService { // service는 interface로 구현
	
	// insert -> create
	// select -> retreieve
	// update -> modify
	// delete -> remove
	/**
	 * 게시판 목록 조회 
	 * @param
	 * @return
	 */
	// (String proCode) : String 타입의 proCode를 (게시글은 proCode 기준으로 분류되어 있으므로)
	// List<BoardVO> retrieveBoardList : List 형식의 BoardVO에 retrieveBoardList 라는 이름에 담음 (목록이므로 List)
	public List<BoardVO> retrieveBoardList(String proCode);
	
	/**
	 * 게시판 상세 조회
	 * @param boardNo
	 * @return
	 */
	// (int boardNo) : int 타입의 boardNo를 (각 게시글은 boardNo(게시글 번호)로 구분 가능하므로)
	// BoardVO retrieveBoard : BoardVO 형식의 retrieveBoard 라는 이름에 담음
	public BoardVO retrieveBoard(int boardNo);
	
	/**
	 * 게시판 검색 조회
	 * @param map
	 * @return
	 */
	// ???????????
	public List<BoardVO> retrieveSearchBoard(Map<String, String> map);
	
	/**
	 * 게시글 작성
	 * @param boardNo
	 * @return
	 */
	// int : 반환값이 실패면 0,성공이면 1으로 표현되므로 숫자인 int(insert,update,delete만 해당)
	// (BoardVO boardVO) : BoardVO 타입의 boardVO를
	// int createBoard : int 타입의 createBoard 라는 이름에 담음
	public int createBoard(BoardVO boardVO);
	
	/**
	 * 게시글 수정
	 * @param boardNo
	 * @return
	 */
	// int : 반환값이 실패면 0,성공이면 1으로 표현되므로 숫자인 int(insert,update,delete만 해당)
	// (BoardVO boardVO) : BoardVO 타입의 boardVO를
	// int modifyBoard : int 타입의 modifyBoard 라는 이름에 담음
	public int modifyBoard(BoardVO boardVO);
	
	/**
	 * 게시글 삭제 
	 * @param boardNo
	 * @return
	 */
	// int : 반환값이 실패면 0,성공이면 1으로 표현되므로 숫자인 int(insert,update,delete만 해당)
	// (int boardNo) : int 타입의 boardNo를
	// int removeBoard : int 타입의 removeBoard 라는 이름에 담음
	public int removeBoard(int boardNo);
	
	/**
	 * 조회수 증가
	 * @param boardNo
	 */
//	public void incrementHit(int boardNo);
	
	/**
	 * 게시판 댓글 목록 조회
	 * @param boardCommVO
	 * @return
	 */
	// (int boardNo) : int 타입의 boardNo를
	// List형식의<BoardCommVO>에 retriveBoardCommList라는 이름으로 담음
	public List<BoardCommVO> retriveBoardCommList(int boardNo);
	
	/**
	 * 게시판 댓글 생성
	 * @param boardCommVO
	 * @return
	 */
	// int : 반환값이 실패면 0,성공이면 1으로 표현되므로 숫자인 int(insert,update,delete만 해당)
	// BoardCommVO 타입의 boardCommVO를
	// int 타입의 createBoardComm에 담음
	public int createBoardComm(BoardCommVO boardCommVO);
	
	/**
	 * 게시판 댓글 수정
	 * @param boardNo
	 * @return
	 */
	
	// int : 반환값이 실패면 0,성공이면 1으로 표현되므로 숫자인 int(insert,update,delete만 해당)
	// BoardCommVO 타입의 boardCommVO를
	// int 타입의 modifyBoardComm에 담음
	public int modifyBoardComm(BoardCommVO boardCommVO);
	
	/**
	 * 게시판 댓글 삭제 
	 * @param boardNo
	 * @return
	 */
	// int : 반환값이 실패면 0,성공이면 1으로 표현되므로 숫자인 int(insert,update,delete만 해당)
	// int 타입의 boardCommNo를
	// int 타입의 removeBoardComm에 담음
	public int removeBoardComm(int boardCommNo);
	

	
}