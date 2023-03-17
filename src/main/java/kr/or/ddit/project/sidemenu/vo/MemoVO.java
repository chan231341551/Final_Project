package kr.or.ddit.project.sidemenu.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 
 * 메모 VO 
 * @author 이찬영
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.      PC-02       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="memoNo")
@AllArgsConstructor
@NoArgsConstructor
public class MemoVO {
	
	private int rnum;
	private Integer memoNo;
	private String memEmail;
	private String memoTitle;
	private String memoCont;
	private String memoDate;
	
	private String memName;
	
}
