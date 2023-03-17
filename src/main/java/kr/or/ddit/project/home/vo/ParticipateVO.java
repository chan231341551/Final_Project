package kr.or.ddit.project.home.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ParticipateVO implements Serializable{
	
	private String proCode;
	private String memEmail;

	private String proRoleCd;
		
	private String partDate;
	private String partYn;
	
	private String mcodeNm;
	private String memName;
	
	// 프로젝트 목록에서 프로젝트 참여 멤버 불러오기
	private String participateMemEmail;
	private String proFavorites;
	private String participateMemAttPath;
}
