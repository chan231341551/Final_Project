package kr.or.ddit.project.statistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface StatisticDAO {
	
	public Map<String, Object> selectProjectStatistic(@Param("proCode") String proCode);
	
	public List<Map<String, Object>> selectProjectMemStatistic(@Param("proCode") String proCode);
}
