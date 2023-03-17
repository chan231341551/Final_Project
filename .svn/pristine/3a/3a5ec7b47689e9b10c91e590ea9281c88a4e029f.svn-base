package kr.or.ddit.project.management.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.project.home.vo.ParticipateVO;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.project.news.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

public interface ManagementService {
	
	/**
	 * 프로젝트에 참여하는 멤버 목록 조회
	 * @param proCode
	 * @return O : List<ParticipateVO>
	 * 		   X : null
	 */	
	public HashMap<String, Object> retrieveParticipateList(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트 초대
	 * @param ParticipateVO
	 * @return 성공(OK), 실패(FAIL)
	 */
	public ServiceResult createParticipate(ParticipateVO participate);
	
	/**
	 * 프로젝트 추방 및 초대 취소
	 * @param Map<String, Object> map
	 * @return 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removeParticipate(Map<String, Object> map);
	
	/**
	 * 프로젝트 다시 초대하기
	 * @param Map<String, Object> map
	 * @return 성공(OK), 실패(FAIL)
	 */
	public ServiceResult modifyParticipateAgain(Map<String, Object> map);
	
	/**
	 * 프로젝트 공지 게시글 등록
	 * @param NewsVO
	 * @return 성공(OK), 실패(FAIL)
	 */
	public ServiceResult createNotice(NewsVO news);
	
	/**
	 * 프로젝트 공지 리스트 조회
	 * @param 
	 */
	public List<NewsVO> retrieveNoticeList(NewsVO news);
	
	/**
	 * 프로젝트 공지 삭제
	 * @param newsNo
	 * @return
	 */
	public ServiceResult removeNotice(NewsVO news);
}
