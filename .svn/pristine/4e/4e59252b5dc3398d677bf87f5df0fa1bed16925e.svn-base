package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 회원관리(CRUD)를 위한 Business Logic Layer
 */
public interface MemberService {

	/**
	 * 회원 가입
	 * @param member
	 * @return 아이디 중복으로 인한 실패(PKDUPLICATED), 가입 성공(OK), 가입 실패(FAIL)
	 * @throws MessagingException 
	 * @throws Exception 
	 */
	public ServiceResult createMember(MemberVO member) throws MessagingException, Exception;
	
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> pagingVO);
	/**
	 * 회원 정보 상세 조회
	 * @param memEmail
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 */
	public MemberVO retrieveMember(String memEmail);
	public MemberVO retrieveProjectMember(Map<String, String> proMap);
	/**
	 * 회원 수정
	 * @param member
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult modifyMember(MemberVO member);
	/**
	 * @param member
	 * @return
	 */
	public ServiceResult modifySomeThing(MemberVO member);
	/**
	 * 회원 탈퇴
	 * @param member
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removeMember(MemberVO member);
	
	
	/**
	 * 이메일 인증을 위한 업데이트문
	 */
	public int updateMailKey(MemberVO member) throws Exception;
	public int updateMailAuth(MemberVO member) throws Exception;

	/**
	 * 이메일 중복 확인 
	 * @param memEamil
	 * @return cnt = 1  이메일 중복 , cnt = 0 사용 가능 
	 */
	public int emailCheck(String memEmail);
	
	public int modifyMemAttNo(MemberVO member);

	public Integer emailAuth(String memEmail);

}

