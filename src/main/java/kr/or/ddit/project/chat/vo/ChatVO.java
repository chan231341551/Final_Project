package kr.or.ddit.project.chat.vo;

import kr.or.ddit.project.sidemenu.vo.MemoVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


@Data
@EqualsAndHashCode(of="chatroomNo")
@AllArgsConstructor
@NoArgsConstructor
public class ChatVO {
	
	private Integer chatroomNo;
	private String chatroomTitle;
	private Integer chatroomClsNo;
	
	
	private String memEmail;
	private String memName;
	private String memRole;
	private String proCode;
	private String proTitle;
} 
