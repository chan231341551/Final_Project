package kr.or.ddit.project.alarm.service;

import java.util.List;

import kr.or.ddit.project.alarm.vo.AlarmVO;

public interface AlarmService {
	
	/**
	 * 알람 생성
	 * @param alCode
	 * @return 존재여부(NotExistBoardException)
	 */
	public int createAlarm(AlarmVO alarm);

	// 읽음 처리할 알람 조회
	public int retrieveAlarmNo();
	
	// 읽음 처리
	public int modifyAlarm(int alNo);
	
	// 안읽은 알람 갯수
	public int count(String memEmail);
	
	// 내 알람 목록
	public List<AlarmVO> retrieveAlarm(String memEmail);
}
