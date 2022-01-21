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
import kh.spring.dto.ChatRoomDTO;
import kh.spring.service.ChatContentsService;
import kh.spring.service.ChatRoomService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/chat/")
public class ChatController {

	@Autowired
	private MemberService service;
	@Autowired
	private ChatContentsService cService;
	@Autowired
	private ChatRoomService crService;
	@Autowired
	private HttpSession session;

	@RequestMapping("talk")
	public String talk(String productName, Model model) {
		String id = (String)session.getAttribute("loginID");
		List<ChatRoomDTO> list =  crService.selectByBuyerId(id);
		model.addAttribute("productName",productName);
		model.addAttribute("productId",1);
		model.addAttribute("list",list);
		return "talk/talk";
	}
	
	@RequestMapping("addChatList")
	public String addChatList(String sellerId, String productName, int productId) {
		System.out.println(sellerId + " : " + productName + " : " + productId);
		return "talk/talk";
	}

//	@ResponseBody
//	@RequestMapping(value ="chatContents", produces="text/html; charset=utf8")
//	public String chatContents(int roomId) {
//		
//		System.out.println(roomId);
//		List<ChatContentsDTO> list = cService.selectByRoomID(roomId);
//
//		Gson gson = new Gson();
//
//		String listJson = gson.toJson(list, List.class).toString();
//
//		return listJson;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value ="chatContents2", produces="text/html; charset=utf8")
//	public String chatContents2(String message) {
//		
//		System.out.println(message);
//		
//
//		Gson gson = new Gson();
//
//		String listJson = gson.toJson(message).toString();
////
//		return message;
//	}

	@RequestMapping("moveChatRoom")
	public String moveChatRoom(String sellerId, String productId, String productName, String roomId, Model model) {
		System.out.println(sellerId + " : " + productId + " : " + productName + " : " + roomId);
		String id = (String)session.getAttribute("loginID");
		List<ChatRoomDTO> list =  crService.selectByBuyerId(id);
		List<ChatContentsDTO> contentsList = cService.selectByRoomID(Integer.parseInt(roomId));
		model.addAttribute("list",list);
		model.addAttribute("contentsList",contentsList);
		model.addAttribute("sellerId",sellerId);
		model.addAttribute("productId",productId);
		model.addAttribute("productName",productName);
		return "talk/talk";
	}
	
}
