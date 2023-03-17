package kr.or.ddit.project.issue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.project.issue.vo.IssChargerVO;
import kr.or.ddit.project.issue.vo.IssCommVO;
import kr.or.ddit.project.issue.vo.IssueVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface IssueDAO {
	
	public int insertIssue(IssueVO Issue);
	
	public List<IssueVO> selectIssueList(@Param("proCode") String proCode);
	
	public int selectTotalRecord(PagingVO<IssueVO> pagingVO);
	
	public IssueVO selectIssue(@Param("issNo") int issNo);
	
	public List<Map<String, String>> selectChargerMem(@Param("issNo") int issNo);
	
	// update
	public int updateIssue(IssueVO issue);
	public int updateIssCharher(IssChargerVO charge);
	
	// delete
	public int deleteIssue(int issNo);
	public int deleteIssCharger(int issNo);
	
	/**
	 * 댓글 추가하기
	 * @param IssCommVO
	 * @return 
	 */
	public int insertIssComm(IssCommVO IssComm);
	
	/**
	 * 댓글 목록 가져오기
	 * @param IssCommVO
	 * @return IssCommVO
	 */
	public List<IssCommVO> selectIssCommList(int issNo);
	
	/**
	 * 댓글 목록 가져오기
	 * @param issCommNo
	 * @return int
	 */
	public int deleteIssComm(int issCommNo);
	
	
}
