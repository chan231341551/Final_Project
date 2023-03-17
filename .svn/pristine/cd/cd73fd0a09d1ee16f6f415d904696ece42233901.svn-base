package kr.or.ddit.project.management.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.project.home.vo.ParticipateVO;
import kr.or.ddit.project.management.dao.ManagementDAO;
import kr.or.ddit.project.news.dao.NewsDAO;
import kr.or.ddit.project.news.vo.NewsVO;

@Service
public class ManagementServiceImpl implements ManagementService {
	
	@Inject
	private NewsDAO newsDAO;
	
	@Inject
	private ManagementDAO managementDAO;
	
	@Override
	public HashMap<String, Object> retrieveParticipateList(String proCode) {
		List<ParticipateVO> list0 = managementDAO.selectParticipateList0(proCode);
		List<ParticipateVO> list1 = managementDAO.selectParticipateList1(proCode);
		List<ParticipateVO> list2 = managementDAO.selectParticipateList2(proCode);
		
		HashMap<String, Object> map= new HashMap<>();
		map.put("standBy", list0);
		map.put("yes", list1);
		map.put("no", list2);
		return map;
	}

	@Override
	public ServiceResult createParticipate(ParticipateVO participate) {
		int count = managementDAO.selectParticipateAlready(participate);
		ServiceResult result = null;
		if(count == 0) {
			int rowcnt = managementDAO.insertParticipate(participate);
			result = ServiceResult.OK;			
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult removeParticipate(Map<String, Object> map) {
		List<String> memEmails = (List<String>) map.get("memEmail");
		String proCode = (String) map.get("proCode");
		for (int i=0; i<memEmails.size(); i++) {
			ParticipateVO participate = new ParticipateVO();
			participate.setMemEmail(memEmails.get(i));
			participate.setProCode(proCode);
			managementDAO.deleteParticipate(participate);
		}
		ServiceResult result = ServiceResult.OK;	
		return result;
	}

	@Override
	public ServiceResult modifyParticipateAgain(Map<String, Object> map) {
		List<String> memEmails = (List<String>) map.get("memEmail");
		String proCode = (String) map.get("proCode");
		for (int i=0; i<memEmails.size(); i++) {
			ParticipateVO participate = new ParticipateVO();
			participate.setMemEmail(memEmails.get(i));
			participate.setProCode(proCode);
			managementDAO.updateParticipateAgain(participate);
		}
		ServiceResult result = ServiceResult.OK;	
		return result;
	}

	@Override
	public ServiceResult createNotice(NewsVO news) {
		int rowcnt = managementDAO.insertNotice(news);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL ;
	}

	@Override
	public List<NewsVO> retrieveNoticeList(NewsVO news) {
		List<NewsVO> newsList = managementDAO.selectNoticeList(news);
		return newsList;
	}

	@Override
	public ServiceResult removeNotice(NewsVO news) {
		int rowcnt = newsDAO.deleteNews(news);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL ;
	}

}
