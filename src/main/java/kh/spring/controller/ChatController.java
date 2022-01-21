package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.ChatContentsDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChatContentsService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/chat/")
public class ChatController {

	@Autowired
	private MemberService service;
	@Autowired
	private ChatContentsService cService;

	@Autowired
	private HttpSession session;

	@RequestMapping("talk")
	public String talk(String id, Model model) {
		System.out.println(id);
		model.addAttribute("id",id);
		return "talk/talk";
	}

	@ResponseBody
	@RequestMapping(value ="chatContents", produces="text/html; charset=utf8")
	public String chatContents(String sellerID) {
		System.out.println(sellerID);
		List<ChatContentsDTO> list = cService.selectBySellerID(sellerID);

		Gson gson = new Gson();

		String listJson = gson.toJson(list, List.class).toString();

		return listJson;
	}

}
