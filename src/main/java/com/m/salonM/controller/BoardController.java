package com.m.salonM.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.m.salonM.service.BoardService;
import com.m.salonM.service.UserService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;

	@GetMapping({"","/"})
	public String index(Model model, @PageableDefault(size=3,sort="id",direction=Sort.Direction.DESC) Pageable pageable) {		
		model.addAttribute("boards",boardService.writingList(pageable));
		model.addAttribute("users",userService.userList());
		return "index";
	}
	
	@GetMapping("board/saveForm")
	public String saveForm(Model model) {
		model.addAttribute("users",userService.userList());
		return "board/saveForm";
	}
	
//	@GetMapping("board/shelf/{id}")
//	public String shelf(Model model, @PageableDefault(size=4,sort="id",direction=Sort.Direction.DESC) Pageable pageable, @PathVariable int id) {
//		model.addAttribute("boards",boardService.writingList(pageable));
//		model.addAttribute("users",userService.userList());
//		model.addAttribute("userId", id);
//		return "board/shelf";
//	}
	
	@GetMapping("board/shelf/{id}")
	public String shelf(Model model, @PathVariable int id) {
		model.addAttribute("boards",boardService.writingList());
		model.addAttribute("users",userService.userList());
		model.addAttribute("userId", id);
		return "board/shelf";
	}
	
	@GetMapping("board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board",boardService.continueReading(id));
		return "board/detail";
	}
	
	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.continueReading(id));
		return "board/updateForm";
	}
	
}
