package com.myweb.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {

	// 리뷰 페이지 이동
	@RequestMapping("/reviewView")
	public void reviewView() {
		
	}
}
