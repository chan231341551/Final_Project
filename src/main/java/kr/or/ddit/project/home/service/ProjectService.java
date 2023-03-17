package kr.or.ddit.project.home.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.home.vo.ParticipateVO;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.vo.PagingVO;

public interface ProjectService {
	
	/**
	 * 프로젝트 프로필 사진 수정
	 * @param ProjectVO
	 * @return 
	 */	
	public int modifyProAttNo(ProjectVO project);
	
	/**
	 * 프로젝트 하나 조회
	 * @param proCode
	 * @return O : ProjectVO
	 * 		   x : null
	 */	
	public ProjectVO retrieveProject(String proCode);
	
	/**
	 * 프로젝트 참여 회원목록 조회
	 * @param proCode
	 * @return O : ProjectVO
	 * 		   x : null
	 */	
	public List<ParticipateVO> retrieveProMemList(String proCode);
	
	/**
	 * 프로젝트 전체 조회 ( 삭제된 프로젝트 제외 )
	 * @param List<ProjectVO>
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveProjectListAll(PagingVO<ProjectVO> pagingVO);
	
	/**
	 * 삭제된 프로젝트 전체 조회
	 * @param List<ProjectVO>
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveDeleteProjectListAll(PagingVO<ProjectVO> pagingVO);
	
	/**
	 * 내 프로젝트 전체 조회
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveMyProjectListAll(@Param("memEmail") String memEmail);

	/**
	 * 내 프로젝트 중에 즐겨찾기 한 프로젝트 전체 조회
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveMyProjectFavoritesListAll(@Param("memEmail") String memEmail);
	
	/**
	 * 내 프로젝트 선택 전체 조회
	 * @param memEmail, proSelect
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveMyProjectSelectList(@Param("memEmail") String memEmail, Map<String, String> map);
	
	/**
	 * 프로젝트 생성
	 * @param ProjectVO
	 * @return 성공(OK), 실패(FAIL)
	 */
	public ServiceResult createProject(ProjectVO project);
	
	/**
	 * 프로젝트 참여 멤버 등록
	 * @param issChargerVO
	 * @return 성공(OK), 실패(FAIL)
	 */
	public ServiceResult createProjectParticipate(ParticipateVO participate);
	
	/**
	 * 프로젝트 수정
	 * @param ProjectVO
	 * @return 존재 부(NOTEXIST), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult modifyProject(ProjectVO project);
	
	/**
	 * 프로젝트 즐겨찾기 수정
	 * @param ProjectVO
	 * @return 
	 */
	public ServiceResult modifyProjectFavorites(ParticipateVO participate );
	
	/**
	 * 프로젝트 삭제
	 * @param ProjectVO
	 * @return 존재 부(NOTEXIST), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removeProject(ProjectVO project);
	
	/**
	 * 삭제된 프로젝트 복구
	 * @param ProjectVO
	 * @return 존재 부(NOTEXIST), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removeRecoverProject(ProjectVO project);
	
	/**
	 * 초대받은 프로젝트 목록
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveProjectParticipateList(@Param("memEmail") String memEmail);
	
	/**
	 * 초대 거절한 프로젝트 목록
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> retrieveProjectRefuseList(@Param("memEmail") String memEmail);
	
	/**
	 * 초대받은 프로젝트 수락
	 * @param issChargerVO
	 * @return
	 */
	public ServiceResult modifyProjectParticipate(ParticipateVO participate);
	
}
