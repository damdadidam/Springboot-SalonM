package com.m.salonM.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.m.salonM.config.auth.PrincipalDetail;

@Controller
public class BoardController {

	@GetMapping({"","/"})
	public String index() {		
		return "index";
	}
	
	@GetMapping("board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}
	
	@GetMapping("board/shelf")
	public String shelf() {
		return "board/shelf";
	}
}
