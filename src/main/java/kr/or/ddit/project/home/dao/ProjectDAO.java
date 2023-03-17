package kr.or.ddit.project.home.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.home.vo.ParticipateVO;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface ProjectDAO {
	
	/**
	 * 총 프로젝트 갯수
	 * @param pagingVO
	 * @return O : int
	 * 		   x : null
	 */	
	public int selectTotalRecord(PagingVO<ProjectVO> pagingVO);
	
	/**
	 * 프로젝트 하나 조회
	 * @param proCode
	 * @return O : ProjectVO
	 * 		   x : null
	 */	
	public ProjectVO selectProject(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트 참여 회원목록 조회
	 * @param proCode
	 * @return O : ProjectVO
	 * 		   x : null
	 */	
	public List<ParticipateVO> selectProMemList(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트 전체 조회 (삭제 된 프로젝트 제외)
	 * @param 
	 * @return O : List<ProjectVO>
	 * 		   X : 
	 */
	public List<ProjectVO> selectProjectListAll(PagingVO<ProjectVO> pagingVO);
	
	/**
	 * 삭제된 프로젝트 전체 조회
	 * @param 
	 * @return O : List<ProjectVO>
	 * 		   X : 
	 */
	public List<ProjectVO> selectDeleteProjectListAll(PagingVO<ProjectVO> pagingVO);
	
	/**
	 * 내 프로젝트 전체 조회
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> selectMyProjectListAll(@Param("memEmail") String memEmail);
	
	/**
	 * 내 프로젝트 중에 즐겨찾기 한 프로젝트 목록 조회
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> selectMyProjectFavoritesListAll(@Param("memEmail") String memEmail);
	
	/**
	 * 내 프로젝트 선택 전체 조회
	 * @param memEmail, proSelect
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> selectMyProjectSelectList(@Param("memEmail") String memEmail, @Param("proSelect")Map<String, String> map);
	
	/**
	 * 프로젝트 생성
	 * @param ProjectVO
	 * @return 등록된 프로젝트 수
	 */
	public int insertProject(ProjectVO project);
	
	/**
	 * 프로젝트 참여 멤버 등록
	 * @param issChargerVO
	 * @return 
	 */
	public int insertProjectParticipate(ParticipateVO participate);
	
	/**
	 * 프로젝트 수정
	 * @param ProjectVO
	 * @return 수정된 프로젝트 수
	 */
	public int updateProject(ProjectVO project);
	
	/**
	 * 프로젝트 즐겨찾기 수정
	 * @param ProjectVO
	 * @return 
	 */
	public int updateProjectFavorites(ParticipateVO participate);
	
	/**
	 * 프로젝트 삭제
	 * @param ProjectVO
	 * @return 삭제된 프로젝트 수
	 */
	public int deleteProject(ProjectVO project);
	
	/**
	 * 삭제된 프로젝트 복구하기
	 * @param ProjectVO
	 * @return 복구된 프로젝트 수
	 */
	public int deleteRecoverProject(ProjectVO project);
	
	/**
	 * 초대받은 프로젝트 목록
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> selectProjectParticipateList(@Param("memEmail") String memEmail);
	
	/**
	 * 초대 거절한 프로젝트 목록
	 * @param memEmail
	 * @return O : List<ProjectVO>
	 * 		   X : null
	 */
	public List<ProjectVO> selectProjectRefuseList(@Param("memEmail") String memEmail);
	
	/**
	 * 초대받은 프로젝트 수락
	 * @param issChargerVO
	 * @return
	 */
	public int updateProjectParticipate(ParticipateVO participate);
	
	/**
	 * 프로젝트 프로필 업로드 시 attNo 등록
	 * @param attNo
	 * @return
	 */
	public int updateProAttNo(ProjectVO project);
	
}
