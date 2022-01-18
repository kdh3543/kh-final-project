package kh.spring.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.CommentDTO;
import kh.spring.service.BoardService;
import kh.spring.service.CommentService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	public BoardService service;
	
	@Autowired
	public CommentService cservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("boardList")
	public String boardList(Model model) {
		System.out.println("boardList 로 들어온 요청은 이 메서드를 실행합니다.");

		List<BoardDTO> list = service.selectAll();
		model.addAttribute("list", list);
		return "board/boardList";
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {
		System.out.println("writeForm 로 들어온 요청은 이 메서드를 실행합니다.");

		return "board/writeForm";
	}

	@RequestMapping("toDetail")
	public String toDetail(int seq, Model model) {
		System.out.println("toDetail 로 들어온 요청은 이 메서드를 실행합니다.");

		BoardDTO dto = service.selectBySeq(seq);
		model.addAttribute("dto", dto);
		
		List<CommentDTO> list = cservice.selectBySeq(dto.getBoard_seq());
		model.addAttribute("list", list);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(BoardDTO dto) throws Exception {
		System.out.println("writeProc 로 들어온 요청은 이 메서드를 실행합니다.");

//		dto.setWriter((String) session.getAttribute("loginID"));
		dto.setWriter("테스트 계정");
		int parentSeq = service.insert(dto);

		return "redirect:boardList";
	}
	
	@RequestMapping("deleteProc")
	public String deleteProc(int seq) {
		System.out.println("deleteProc 로 들어온 요청은 이 메서드를 실행합니다.");

		int result = service.delete(seq);
		return "redirect:boardList";
	}
	
	@RequestMapping("modify")
	public String modify(int seq, Model model) {
		System.out.println("modify 로 들어온 요청은 이 메서드를 실행합니다.");

		BoardDTO dto = service.selectBySeq(seq);
		model.addAttribute("dto", dto);
		return "board/modifyForm";
	}

	@RequestMapping("modifyProc")
	public String modifyProc(BoardDTO dto) {
		System.out.println("modifyProc 로 들어온 요청은 이 메서드를 실행합니다.");
		
//		dto.setWriter((String) session.getAttribute("loginID"));
		dto.setWriter("테스트 계정");

		int result = service.modify(dto);
		return "redirect:/board/toDetail?seq=" + dto.getBoard_seq();
	}

}
