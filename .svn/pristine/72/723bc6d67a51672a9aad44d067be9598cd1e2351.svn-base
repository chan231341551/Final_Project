package kr.or.ddit.project.attach.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.project.attach.vo.AttatchVO;
import kr.or.ddit.project.file.vo.TreeVO;

public interface AttatchService {
	public int createProjectFile(MultipartFile[] files, TreeVO tree);
	public int createAttatch(MultipartFile[] files, String attCtgry);
	public List<AttatchVO> retrieveAttatchList(int attNo);
	public List<AttatchVO> retrieveProjectFileList(String attCtgry);
	public List<AttatchVO> retrieveProjectTextFileList(TreeVO tree);
	public int removeFile(int attNo);
}