package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ChatContentsDTO;
import kh.spring.dto.ChatRoomDTO;
import kh.spring.service.ChatContentsService;
import kh.spring.service.ChatRoomService;
import kh.spring.service.ItemsService;
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
	@Autowired
	private ItemsService iService;

	@RequestMapping("moveChatRoom")
	public String moveChatRoom(String sellerId, int productId, String productName, String roomId, Model model) {
//		System.out.println(sellerId + " : " + productId + " : " + productName + " : " + roomId);
		String id = (String)session.getAttribute("loginID");
		ChatRoomDTO dto = new ChatRoomDTO();
		dto.setBuyerId(id);
		dto.setSellerId(id);
		List<ChatRoomDTO> list = crService.selectByBothId(dto);
		List<ChatContentsDTO> cList = cService.selectByProductId(productId);
		// list로부터 producId를 가져와 그 productId에 해당하는 마지막 메세지를 list에 세팅
		for(int i =0; i<list.size();i++) {
			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getProductId()));
		}
		System.out.println(list.size() + ":"+cList.size());
		
		model.addAttribute("list",list);
		model.addAttribute("cList",cList);
		model.addAttribute("sellerId",sellerId);
		model.addAttribute("productId",productId);
		model.addAttribute("productName",productName);
		model.addAttribute("id",id);

		return "talk/talk";
	}
	
	@RequestMapping("talk")
	public String talk(String productName, int productId,Model model) {
		String id = (String)session.getAttribute("loginID");
		
		System.out.println(iService.selectByProductId(productId));
		
		boolean existRoomId = crService.selectByProductId(productId);
		System.out.println(existRoomId);
		if(existRoomId) {
			
		}
		
		
		
		
		
		
		
		
		List<ChatRoomDTO> list =  crService.selectByBuyerId(id);
		List<ChatContentsDTO> cList = cService.selectByProductId(productId);
	
		
		for(int i =0; i<list.size();i++) {
			
			System.out.println(cService.selectLastTalk(list.get(i).getProductId()));
			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getProductId()));
		}
		
		model.addAttribute("productName",productName);
		model.addAttribute("productId",productId);
		model.addAttribute("list",list);
		model.addAttribute("cList",cList);
		model.addAttribute("id",id);
		return "talk/talk";
	}
	
	@RequestMapping("addChatList")
	public String addChatList(String sellerId, String productName, int productId) {
		System.out.println(sellerId + " : " + productName + " : " + productId);
		return "talk/talk";
	}
	
	@RequestMapping("directTalk")
	public String directTalk(Model model) {
		String id = (String)session.getAttribute("loginID");
		ChatRoomDTO dto = new ChatRoomDTO();
		dto.setBuyerId(id);
		dto.setSellerId(id);
		List<ChatRoomDTO> list = crService.selectByBothId(dto);
		for(int i =0; i<list.size();i++) {	
			System.out.println(cService.selectLastTalk(list.get(i).getProductId()));
			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getProductId()));
		}
		 
		model.addAttribute("list",list);
		
//		List<ChatContentsDTO> lastTalkList = cService.selectLastTalk(productId);
//		
//		model.addAttribute("lastTalk",lastTalkList);
//		
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

	
	
}
