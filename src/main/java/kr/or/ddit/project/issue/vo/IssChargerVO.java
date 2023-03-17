package kr.or.ddit.project.issue.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "issNo")
public class IssChargerVO implements Serializable {
	private Integer issNo;
	private String memEmail;
	private String memName;
	private String issReadYn;
}
