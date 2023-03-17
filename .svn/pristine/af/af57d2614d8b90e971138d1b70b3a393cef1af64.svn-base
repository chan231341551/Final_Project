package kr.or.ddit.project.attach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.project.attach.vo.AttatchVO;
import kr.or.ddit.project.file.vo.TreeVO;

@Mapper
public interface AttatchDAO {
	// public int insertAttatches(BoardVO board);
	// public List<AttatchVO> selectAttatchList(int boNo);
	// public AttatchVO selectAttatch(int attNo);
	// public int deleteAttatches(BoardVO board);
	
	public int selectAttNo();
	
	public int insertAttatch(AttatchVO attatch);
	public int deleteAttatches(AttatchVO attatch);
	public int deleteFile(int attNo);
	public List<AttatchVO> selectAttatchList(int attNo);
	public List<AttatchVO> selectProjectFileList(String attCtgry);
	public List<AttatchVO> selectProjectTextFileList(TreeVO tree);
	
}