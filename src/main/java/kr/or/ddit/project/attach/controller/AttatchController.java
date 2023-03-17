package kr.or.ddit.project.attach.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.project.attach.service.AttatchService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/project")
public class AttatchController {
	@Inject
	private AttatchService service;
	
	
}

