package kr.or.ddit.main.help.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

/**
 * 1대1 문의 게시판 VO
 * @author 김경하
 * @since 2023. 2. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 14.       PC-13       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Data
@EqualsAndHashCode(of="qnaNo")
@ToString
@NoArgsConstructor
public class QNAVO implements Serializable{
	
	private int rnum;
	private Integer qnaNo;
	private String memEmail;
	private String qnaTitle;
	private String qnaCont;
	private String qnaDate;
	private Integer qnaAttNo;
	private String qnaAns;
	private String isAns;
	private String ansDate;
	private Integer ansAttNo;
	
	//첨부파일
    private MultipartFile[] files;
    //첨부파일 경로
    private String qnaAttPath;
    private String ansAttPath;
    
    //파일 이름
    private String qnaAttFilename;
    private String ansAttFilename;

	public String getIsAns() { // 답변이 등록 되어있으면 완료, 아니면 처리중.
		if(this.qnaAns==null) {
			this.isAns = "처리중";
		}else {
			this.isAns = "완료";
		}
		return isAns;
	}
}
