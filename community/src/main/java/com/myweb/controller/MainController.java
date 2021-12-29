package com.myweb.controller;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.myweb.command.NoticeVO;
import com.myweb.service.NoticeService;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@RequestMapping("/")
	public String mainpage(Model mo, Criteria cri) {
		ArrayList<NoticeVO> list = noticeService.getList(cri);
		mo.addAttribute("list", list);
		
//		int total = noticeService.getTotal(cri);
		
		return "mainpage";
	}
}
