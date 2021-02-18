package com.m.salonM.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.m.salonM.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@GetMapping({"","/"})
	public String index() {		
		return "index";
	}
	
	@GetMapping("board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}
	
	@GetMapping("board/shelf")
	public String shelf(Model model, @PageableDefault(size=4,sort="id",direction=Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards",boardService.writingList(pageable));
		return "board/shelf";
	}
}
