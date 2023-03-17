package kr.or.ddit.project.alarm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.project.alarm.vo.AlarmVO;

@Mapper
public interface AlarmDAO {
	public int insertAlarm(AlarmVO alarm);
	
	public int count(String memEmail);

	public int updateAlarm(int alNo);
	
	public int selectAlarm();
	
	public List<AlarmVO> selelctAlarmList(String memEmail);
}
