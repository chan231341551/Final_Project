package kr.or.ddit.project.news.vo;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 
 * 뉴스 VO 
 * @author 전혜수
 * @since 2023. 2. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 7.      PC-21       최초작
 * 
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Data
@NoArgsConstructor
public class NewsVO {
	
	private int rownum;
	private int newsNo;
	
    private String memEmail;
    private String proCode;
    @NotBlank
    private String newsTitle;
    @NotBlank
    private String newsCont;
    
    private String newsDate;
    private int newsHit;
    private Integer newsAttNo;
    private int newsPass;
    //첨부파일
    private MultipartFile[] files;
    //첨부파일 경로
    private String newsAttPath;
    
    //파일 이름
    private String attFilename;
    
    private String newsNotice;
    
    //NewsVO : NewsCommVO = 1 : N
	private List<NewsCommVO> newsCommVOList;
}




