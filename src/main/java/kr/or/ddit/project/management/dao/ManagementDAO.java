package kr.or.ddit.project.management.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.project.home.vo.ParticipateVO;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.project.news.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface ManagementDAO {

	/**
	 * 프로젝트에 참여하는 멤버 목록 조회
	 * @param proCode
	 * @return O : List<ParticipateVO>
	 * 		   X : null
	 */	
	public List<ParticipateVO> selectParticipateList0(@Param("proCode") String proCode);
	/**
	 * 프로젝트에 참여하는 멤버 목록 조회
	 * @param proCode
	 * @return O : List<ParticipateVO>
	 * 		   X : null
	 */	
	public List<ParticipateVO> selectParticipateList1(@Param("proCode") String proCode);
	/**
	 * 프로젝트에 참여하는 멤버 목록 조회
	 * @param proCode
	 * @return O : List<ParticipateVO>
	 * 		   X : null
	 */	
	public List<ParticipateVO> selectParticipateList2(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트에 초대하기
	 * @param ParticipateVO
	 * @return O : 1
	 * 		   X : 0
	 */	
	public int insertParticipate(ParticipateVO participate);
	
	/**
	 * 프로젝트 초대,팀원 삭제하기
	 * @param ParticipateVO
	 * @return O : 1
	 * 		   X : 0
	 */	
	public int deleteParticipate(ParticipateVO participate);
	
	/**
	 * 프로젝트 초대 불가한지 확인하기
	 * @param ParticipateVO
	 * @return O : 
	 * 		   X : 
	 */	
	public int selectParticipateAlready(ParticipateVO participate);
	
	/**
	 * 프로젝트 다시 초대하기
	 * @param ParticipateVO
	 * @return O : 1
	 * 		   X : 0
	 */	
	public int updateParticipateAgain(ParticipateVO participate);
	
	/**
	 * 공지 작성 
	 * @param NewsVO
	 * @return
	 */
	public int insertNotice(NewsVO news);
	
	/**
	 * 공지 목록 조회
	 * @param NewsVO
	 * @return List<NewsVO>
	 */
	public List<NewsVO> selectNoticeList(NewsVO news);

}
