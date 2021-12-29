package com.myweb.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class")
public class ClassController {
	
	// 클래스 뷰 페이지 이동
	@RequestMapping("/classView")
	public void classView() {
		
	}
}
