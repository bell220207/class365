package com.myweb.controller;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.myweb.command.NoticeVO;
import com.myweb.service.NoticeService;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;

	// 등록화면
	@RequestMapping("noticeRegist")
	public void noticeRegist() {
		
	}

	// 등록기능
	@RequestMapping("registForm")
	public String registForm(NoticeVO vo,RedirectAttributes RA) {
		
		System.out.println(vo.toString());
		boolean result = noticeService.regist(vo);
		System.out.println(result);
		
		if(result) {
			RA.addFlashAttribute("msg","정상처리되었습니다.");
			return "redirect:/notice/noticeList";
		}else {
			RA.addFlashAttribute("msg","등록에 실패하였습니다.");
			return "redirect:/notice/noticeRegist";
		}		 
	}

	// 공지사항 목록 페이지 이동
	@RequestMapping("/noticeList")
		public void noticeView2(Model mo ,Criteria cri) {
			
			ArrayList<NoticeVO> list= noticeService.getList(cri);		
			mo.addAttribute("list", list); // list를 jsp에서 찾을 수 있다
			
			//페이지네이션
			int total = noticeService.getTotal(cri);
			PageVO pageVO = new PageVO(cri, total);
			mo.addAttribute("pageVO", pageVO); // pageVO를 jsp에서 찾을 수 있다
			System.out.println(pageVO.toString());
	}
	
	// 상세보기 화면(변경화면,상세화면은 동일한 내용을 가지고 있어서 묶어서 사용)
	@RequestMapping({"noticeDetail","noticeModify"})
    public void noticeDetail(@RequestParam("bno") int bno, Model model) {
		
		// 상세보기 메서드랑 연경
		NoticeVO vo =noticeService.getContent(bno); // vo에 글정보가 들어 있다
		model.addAttribute("vo", vo);				// vo를 jsp에서 사용할 수 있다
	}	
	
	
	// 수정기능
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO vo,RedirectAttributes RA) {
		
		boolean result = noticeService.Update(vo);
		if(result) {
			RA.addFlashAttribute("msg","정상 수정되었습니다.");
		}else {
			RA.addFlashAttribute("msg", "수정에 실패하였습니다.");
		}
		return "redirect:/notice/noticeDetail?bno=" + vo.getBno();
	}
	
	// 삭제 기능
	@RequestMapping("noticeDelete")
	public String noticeDelete(@RequestParam("bno") int bno,RedirectAttributes RA) {
		
		noticeService.noticeDelete(bno);
		return "redirect:/notice/noticeList";
	}
	
}
