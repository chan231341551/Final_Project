package kr.or.ddit.project.issue.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.work.vo.WorkVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "issNo")
public class IssueVO {
	@NotNull
	private Integer issNo;
	@NotBlank
	private String issTitle;
	@NotBlank
	private String issCont;
	private String issRdate;
	private String issSdate;
	private String issEedate;
	private String issEdate;
	@NotBlank
	private String issEmerCd;
	@NotBlank
	private String issStatusCd;
	@NotBlank
	private String issLabelCd;
	
	
	private WorkVO work; // workTitle, workNo
	private MemberVO member; // memEmail, memName
	private List<IssChargerVO> issChargerList; // 이슈 담당자 has many
}
