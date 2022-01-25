package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.CommentDTO;
import kh.spring.service.BoardService;
import kh.spring.service.CommentService;

@Controller
@RequestMapping("/comment/")
public class CommentController {
	
	@Autowired
	public CommentService cservice;
	
	@Autowired
	public BoardService bservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("writeProc")
	public String writeProc(CommentDTO dto) throws Exception {
		System.out.println("writeProc 로 들어온 요청은 이 메서드를 실행합니다.");
		
		dto.setWriter((String) session.getAttribute("loginID"));
		int result = cservice.insert(dto);

		bservice.addCommentCount(dto.getBoard_seq());
		
		return "redirect:/board/toDetail?seq=" + dto.getBoard_seq();
	}
	
	@RequestMapping("deleteProc")
	public String deleteProc(int cseq, int bseq) {
		System.out.println("deleteProc 로 들어온 요청은 이 메서드를 실행합니다.");

		int result = cservice.delete(cseq);
		
		bservice.subtractCommentCount(bseq);
		
		return "redirect:/board/toDetail?seq=" + bseq;
	}
	
	@ResponseBody
	@RequestMapping(value = "likeProc", produces = "text/html; charset=utf8")
	public String likeProc(int seq) {
		System.out.println("likeProc 로 들어온 요청은 이 메서드를 실행합니다.");

		int result = cservice.like(seq);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "dislikeProc", produces = "text/html; charset=utf8")
	public String dislikeProc(int seq) {
		System.out.println("dislikeProc 로 들어온 요청은 이 메서드를 실행합니다.");

		int result = cservice.dislike(seq);
		return String.valueOf(result);
	}

}
