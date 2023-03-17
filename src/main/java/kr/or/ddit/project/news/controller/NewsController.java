package kr.or.ddit.project.news.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.project.home.service.ProjectService;
import kr.or.ddit.project.home.vo.ProjectVO;
import kr.or.ddit.project.news.service.NewsService;
import kr.or.ddit.project.news.vo.NewsCommVO;
import kr.or.ddit.project.news.vo.NewsVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/project")
public class NewsController {

	@Inject
	private NewsService service;

	@Inject
	private ProjectService proservice;
	
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	//내 뉴스 화면 
	@GetMapping("/project/news/{proCode}")
	public String newsList(
			Model model
			,@PathVariable String proCode
	) {
		ProjectVO project = proservice.retrieveProject(proCode);
		model.addAttribute("project", project);
		return "project/news/news";
	}
	
	// 페이징 처리해야 할것 ! 
	@GetMapping(value= "/project/news/{proCode}", produces="application/json;charset=utf-8")
	public String NewsList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
			,@ModelAttribute("simpleCondition") SearchVO searchVO 
			,Model model
			,@PathVariable String proCode
	) {
		//프로젝트 
		 ProjectVO project = proservice.retrieveProject(proCode);
		 model.addAttribute("project", project);
		 
		PagingVO<NewsVO> pagingVO = new PagingVO<>(6,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);

		NewsVO news = new NewsVO();
		news.setProCode(proCode);
		List<NewsVO> newsList = new ArrayList<>();
		newsList.add(0, news);
		pagingVO.setDataList(newsList);

		service.retrieveNewsList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		if(!pagingVO.getDataList().isEmpty()) {
			model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
		}
		return "jsonView";
	}
	
	
	// 글 작성
	@GetMapping("/project/newsInsert/{proCode}")
	public String newsForm(
			NewsVO news
			,Model model) {
		return "/project/news/news";
	}
	
	
	//뉴스 등록
	@PostMapping("/project/newsInsert/{proCode}")
	@ResponseBody
	public String newsInsert(
			@ModelAttribute("news") NewsVO news,
			@PathVariable String proCode
		) {
		log.info("news123123{}",news);
		//프로젝트
		ProjectVO project = proservice.retrieveProject(proCode);
		String resultStr = "0";
		ServiceResult result = service.createNews(news);

		switch (result) {
		case OK:
			log.info("Ok");
			resultStr = "1";
			break;
		case FAIL:
			log.info("FAIL");
			resultStr = "0";
			break;
		}
		return resultStr;
	}

	// 상세보기
	@ResponseBody
	@GetMapping("/project/newsDetail/{newsNo}")
	public NewsVO newsDetail(
			@PathVariable int newsNo
			) {
		log.info("newsNo : " + newsNo);
		
		service.incrementHit(newsNo);
		NewsVO news = service.retrieveNews(newsNo);
		return news;
	}	
	
	// 수정모드
	// 요청URI : /project/project/newsDetailModal
	// 요청파라미터 : let data = {"newsNo":newsNo}
	@ResponseBody
	@PostMapping("/project/newsDetailModal")
	public NewsVO newsDetailModal(
			@RequestBody NewsVO newsVO
			) {
		log.info("newsVO~~~~~~~~~~~~~~~~~{} : " + newsVO);
		
		//select * from news where news_no = 91
		NewsVO news = service.retrieveNews(newsVO.getNewsNo());
		return news;
	}	
	
	//글 삭제
	@ResponseBody
	@PostMapping(value="/project/deleteNews", produces="application/json;charset=utf-8")
	public String deleteNews(
			@RequestBody NewsVO news) {
		String resultStr = "";
		
		ServiceResult result = service.removeNews(news);

		switch(result) {
		case OK:
			resultStr = "성공";
			break;
		case FAIL:
			resultStr = "실패"; 
			break;
		case INVALIDPASSWORD:
			resultStr = "비번오류"; 
			break;
		}
		return resultStr;
	}
	
	
	//글 수정
	//요청파라미터 : vo
	@ResponseBody
	@PostMapping(value="/project/updateNews",produces="application/json;charset=utf-8")
	public NewsVO updatNews(
			@RequestBody NewsVO newsVO) {
		
		service.modifyNews(newsVO);
		
		return newsVO ;
	}
	
	
	
	//댓글 작성 
	//ResponseBody : 응답 데이터 타입이 json
	@ResponseBody
	@PostMapping(value="/project/insertNewsComm")
	public NewsCommVO insertreply(
			@RequestBody NewsCommVO newscommVo
		) {
		//{newsNo: '92', memEmail: 'd@d.d', proCode: 'P202302160080', newsCommCont: '댓글'}
		log.info("newscommVooooooo {}",newscommVo);
//		Integer newsNo = newscommVo.getNewsNo();
//		System.out.println("이값을 뭘까!!!!!!!!!!!?"+newsNo);
		service.createNewsComm(newscommVo);
		//<selectKey resultType="int" order="BEFORE" keyProperty="newsCommNo">
		int newsNo = newscommVo.getNewsNo();
		
		log.info("댓글~~~~~~~newscommVo~{}", newscommVo);
		//등록된 댓글의 기본키 데이터
		return newscommVo;
		
	}
	
	//RequestBody : jsp에서 json 데이터로 올 때
	//ModelAttribute : jsp에서 <form으로 올 때 vo로 정보를 받을 때
	//ResponseBody : Controller에서 jsp로 json을 보낼 때
	//요청파라미터 : let data = {"newsNo":data}
	//댓글 목록 출력
	@ResponseBody
	@PostMapping("/project/newsCommList")
	public List<NewsCommVO> newsCommList(
			@RequestBody NewsCommVO newscommVo
			){
		log.info("newscommVo : " + newscommVo);
		
		List<NewsCommVO> newscommList = service.retriveNewsCommList(newscommVo);
		
		log.info("newscommList : " + newscommList);
		
		return newscommList;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
