package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.CommentDTO;
import kh.spring.service.CommentService;

@Controller
@RequestMapping("/comment/")
public class CommentController {
	
	@Autowired
	public CommentService service;
	
	@Autowired
	private HttpSession session;

// 댓글 Ajax 코드	
//	@ResponseBody
//	@RequestMapping(value = "writeProc", produces = "test/html; charset=utf8")
//	public String writeProc(CommentDTO dto) throws Exception {
//		System.out.println("writeProc 로 들어온 요청은 이 메서드를 실행합니다.");
//
////		dto.setWriter((String) session.getAttribute("loginID"));
//		dto.setWriter("테스트 계정");
//		CommentDTO resultDto = service.insert(dto);
//
//		return String.valueOf(resultDto);
//	}
	
	@RequestMapping("writeProc")
	public String writeProc(CommentDTO dto, int seq) throws Exception {
		System.out.println("writeProc 로 들어온 요청은 이 메서드를 실행합니다.");

//		dto.setWriter((String) session.getAttribute("loginID"));
		dto.setBoard_seq(seq);
		dto.setWriter("테스트 계정");
		int result = service.insert(dto);

		return "redirect:/board/toDetail?seq=" + dto.getBoard_seq();
	}

}
