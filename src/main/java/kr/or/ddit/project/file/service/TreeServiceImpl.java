package kr.or.ddit.project.file.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.file.dao.TreeDAO;
import kr.or.ddit.project.file.vo.TreeVO;

@Service
public class TreeServiceImpl implements TreeService {
	@Inject
	private TreeDAO treeDao;
	
	@Override
	public List<TreeVO> retrieveTreeList(String proCode) {
		return treeDao.selectTreeList(proCode);
	}

	@Override
	public int createTree(TreeVO tree) {
		return treeDao.insertTree(tree);
	}

	@Override
	public int modifyTree(TreeVO tree) {
		return treeDao.updateTree(tree);
	}

	@Override
	public int removeTree(TreeVO tree) {
		return treeDao.deleteTree(tree);
	}
}