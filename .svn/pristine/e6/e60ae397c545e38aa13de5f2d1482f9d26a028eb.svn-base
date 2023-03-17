package kr.or.ddit.project.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data // lombok 적용
@EqualsAndHashCode(of="boardNo") // 기본키
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자 생성
@NoArgsConstructor // 파라미터가 없는 기본 생성자 생성
public class BoardVO {
	// number => integer 사용
	// 멤버변수(클래스 내에 선언됨)
	private Integer boardNo; // 게시글 번호
	private String memEmail; // 회원 이메일
	private String proCode;// 프로젝트 코드
	private String boardTitle; //게시글 제목
	private String boardCont; // 게시글 내용
	private String boardDate; //게시글 작성일자
	private Integer hit; // 조회수
	private Integer boardAttNo; // 첨부파일 번호
	
	private String memName; // 회원 이름

}
