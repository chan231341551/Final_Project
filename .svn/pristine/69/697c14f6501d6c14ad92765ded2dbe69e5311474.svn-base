package kr.or.ddit.project.alarm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.alarm.dao.AlarmDAO;
import kr.or.ddit.project.alarm.vo.AlarmVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AlarmServiceImpl implements AlarmService{
	@Inject
	private AlarmDAO alarmDAO;
	
	@Override
	public int createAlarm(AlarmVO alarm) {
		int rowcnt=0;
		AlarmVO alarms = new AlarmVO();
		alarms.setAlSender(alarm.getAlSender());
		alarms.setAlContCd(alarm.getAlContCd());
		
		for (String mail : alarm.getMemEmailList()) {
			alarms.setMemEmail(mail);
			rowcnt = alarmDAO.insertAlarm(alarms);
		}
		return rowcnt;
	}

	@Override
	public int count(String memEmail) {
		return alarmDAO.count(memEmail);
	}

	@Override
	public int modifyAlarm(int alNo) {
		int rowcnt =alarmDAO.updateAlarm(alNo);
		return rowcnt;
	}

	// 내 알람 목록 조회
	@Override
	public List<AlarmVO> retrieveAlarm(String memEmail) {
		List<AlarmVO> alarmList = alarmDAO.selelctAlarmList(memEmail);
		return alarmList;
	}
	
	// 읽음 처리할 알람 조회
	@Override
	public int retrieveAlarmNo() {
		int alNo = alarmDAO.selectAlarm();
		return alNo;
	}

}
