package kh.spring.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.ChatContentsDTO;
import kh.spring.dto.ChatRoomDTO;
import kh.spring.service.ChatContentsService;
import kh.spring.service.ChatRoomService;
import kh.spring.service.FilesService;
import kh.spring.service.ItemsService;
import kh.spring.service.MemberService;
import kh.spring.utils.DateParseUtils;

@Controller
@RequestMapping("/chat/")
public class ChatController {

	@Autowired
	private MemberService mService;
	@Autowired
	private ChatContentsService cService;
	@Autowired
	private ChatRoomService crService;
	@Autowired
	private HttpSession session;
	@Autowired
	private ItemsService iService;
	@Autowired
	private FilesService fService;

	private Date time = new Date();

	//톡 방에서 다른 톡방으로 넘어갈 때
	@RequestMapping("moveChatRoom")
	public String moveChatRoom(String sellerId, int productId, String productName, int roomId, String sysName, Model model) {
		System.out.println("넘어온 이미지 이름은: "+sysName);
		
		//챗봇에 대한 룸 정보 불러오기
		int chatBotRoomId = 0;
		List<ChatRoomDTO> chatBot = crService.selectByRoomId(chatBotRoomId);
		model.addAttribute("chatBot",chatBot);

		String id = (String)session.getAttribute("loginID");
		System.out.println("들어온 id는 :" + id);
		ChatRoomDTO dto = new ChatRoomDTO();
		dto.setBuyerId(id);
		dto.setSellerId(id);
		List<ChatRoomDTO> list = crService.selectByBothId(dto);
		List<ChatContentsDTO> cList = cService.selectByRoomID(roomId);
		// list로부터 producId를 가져와 그 productId에 해당하는 마지막 메세지를 list에 세팅
		System.out.println("list사이즈는: "+list.size());
		System.out.println("cList사이즈는 : "+ cList.size());
		for(int i =0; i<list.size();i++) {
			if(cService.selectLastDate(list.get(i).getRoomId())==null) {
				list.get(i).setLatestDate(DateParseUtils.nowDate(time));				
			}else {		
				list.get(i).setLatestDate(DateParseUtils.nowDate(cService.selectLastDate(list.get(i).getRoomId())));
			}
			list.get(i).setChatImg(fService.selectBySeqOrder(list.get(i).getProductId()).getSysName());
			
			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getRoomId()));
			
			list.get(i).setOtherProfile(mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
			System.out.println("프로필 이미지 이름은: "+mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
		}

		model.addAttribute("list",list);
		model.addAttribute("cList",cList);
		model.addAttribute("sellerId",sellerId);
		model.addAttribute("productId",productId);
		model.addAttribute("productName",productName);
		model.addAttribute("id",id);
		model.addAttribute("sysName",sysName);

		return "talk/talk";
	}

	//상품 상세페이지에서 연락하기 눌렀을 때
	@RequestMapping("talk")
	public  String talk(String productName, int productId, int roomId,Model model) {
		
		//채팅방에 대한 룸 정보 가져오기
		System.out.println(productId);
		String userId = (String)session.getAttribute("loginID");
		String sellerId = iService.selectByProductId(productId);
		ChatRoomDTO crdto = new ChatRoomDTO();
		crdto.setBuyerId(userId);
		crdto.setProductId(productId);
		boolean existRoomId = crService.selectByProductId(crdto);
		
		System.out.println("들어온 id는 :" + userId);
		
		//채팅방이 없을 때 채팅방 생성
		if(!existRoomId) {
			crdto.setSellerId(sellerId);
			crdto.setProductName(productName);			
			crService.insert(crdto);			
		}		
		
		crdto.setSellerId(userId);
		List<ChatRoomDTO> list = crService.selectByBothId(crdto);
		
		ChatContentsDTO cdto = new ChatContentsDTO();
		cdto.setBuyerId(userId);
		cdto.setProductId(productId);
		List<ChatContentsDTO> cList = cService.selectByProductId(cdto);

		for(int i =0; i<list.size();i++) {			
			if(cService.selectLastDate(list.get(i).getRoomId())==null) {
				list.get(i).setLatestDate(DateParseUtils.nowDate(time));			
			}else {			
				list.get(i).setLatestDate(DateParseUtils.nowDate(cService.selectLastDate(list.get(i).getRoomId())));
			}	
			list.get(i).setChatImg(fService.selectBySeqOrder(list.get(i).getProductId()).getSysName());
			
			// chat 마지막 채팅글 세팅
			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getRoomId()));
			
			list.get(i).setOtherProfile(mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
			System.out.println("프로필 이미지 이름은: "+mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
		}

		model.addAttribute("productName",productName);
		model.addAttribute("productId",productId);
		model.addAttribute("list",list);
		model.addAttribute("cList",cList);
		model.addAttribute("id",userId);
		model.addAttribute("roomId",roomId);
		return "talk/talk";
	}


	//메인페이지에서 바로 톡방으로 들어갔을 때
	@RequestMapping("directTalk")
	public String directTalk(Model model) {
		String id = (String)session.getAttribute("loginID");
		
		System.out.println("들어온 id는 :" + id);
		//채팅방에 대한 룸 정보 가져오기
		ChatRoomDTO dto = new ChatRoomDTO();
		dto.setBuyerId(id);
		dto.setSellerId(id);
		List<ChatRoomDTO> list = crService.selectByBothId(dto);

		ChatContentsDTO cdto = new ChatContentsDTO();
		cdto.setBuyerId(id);
		for(int i = 0; i<list.size();i++) {
			cdto.setProductId(list.get(i).getProductId());
		}
//		List<ChatContentsDTO> cList = cService.selectByProductId(cdto);

		for(int i =0; i<list.size();i++) {
			if(cService.selectLastDate(list.get(i).getRoomId())==null) {
				list.get(i).setLatestDate(DateParseUtils.nowDate(time));
			}else {
				list.get(i).setLatestDate(DateParseUtils.nowDate(cService.selectLastDate(list.get(i).getRoomId())));
				
			}
			
			list.get(i).setChatImg(fService.selectBySeqOrder(list.get(i).getProductId()).getSysName());
			
			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getRoomId()));
			
			list.get(i).setMyProfile(mService.selectProfile(crService.selectBuyerId(list.get(i).getRoomId())));
			
			list.get(i).setOtherProfile(mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
			System.out.println("프로필 이미지 이름은: "+mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
		}
		
		
		
		int roomId = 0;
		model.addAttribute("roomId",roomId);
		model.addAttribute("list",list);
		model.addAttribute("id",id);

		return "talk/talk";
	}

	@RequestMapping("toChatBot")
	public String toChatBot(int roomId,Model model) {
		String id = (String)session.getAttribute("loginID");
		
		//채팅방에 대한 룸 정보 가져오기
		ChatRoomDTO dto = new ChatRoomDTO();
		dto.setBuyerId(id);
		dto.setSellerId(id);
		List<ChatRoomDTO> list = crService.selectByBothId(dto);

		ChatContentsDTO cdto = new ChatContentsDTO();
		cdto.setBuyerId(id);
		for(int i = 0; i<list.size();i++) {
			cdto.setProductId(list.get(i).getProductId());
		}
//		List<ChatContentsDTO> cList = cService.selectByProductId(cdto);

		for(int i =0; i<list.size();i++) {
			if(cService.selectLastDate(list.get(i).getRoomId())==null) {
				list.get(i).setLatestDate(DateParseUtils.nowDate(time));
			}else {
				list.get(i).setLatestDate(DateParseUtils.nowDate(cService.selectLastDate(list.get(i).getRoomId())));
			}
			System.out.println("현재시간은: "+list.get(i).getUpdateTime());
			list.get(i).setChatImg(fService.selectBySeqOrder(list.get(i).getProductId()).getSysName());

			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getRoomId()));
			
			list.get(i).setOtherProfile(mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
			System.out.println("프로필 이미지 이름은: "+mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
		}

		model.addAttribute("roomId",roomId);
		model.addAttribute("list",list);
		model.addAttribute("id",id);
		return "talk/talk";
	}

	@ResponseBody
	@RequestMapping(value = "delChatRoom", produces = "text/html; charset=utf8")
	public String delChatRoom(String roomId) {
		System.out.println("삭제 컨트롤러입니다.");
		System.out.println("들어온 roomId의 값은s: "+roomId);
		int result = crService.deleteByRoomId(Integer.parseInt(roomId));
		cService.deleteByRoomId(Integer.parseInt(roomId));
		return String.valueOf(result);
	}

	@RequestMapping("delSuccess")
	public String delSuccess(int roomId,Model model){
		String id = (String)session.getAttribute("loginID");

		//채팅방에 대한 룸 정보 가져오기
		ChatRoomDTO dto = new ChatRoomDTO();
		dto.setBuyerId(id);
		dto.setSellerId(id);
		List<ChatRoomDTO> list = crService.selectByBothId(dto);
		for(int i =0; i<list.size();i++) {
			if(cService.selectLastDate(list.get(i).getRoomId())==null) {
				list.get(i).setLatestDate(DateParseUtils.nowDate(time));
			}else {
				list.get(i).setLatestDate(DateParseUtils.nowDate(cService.selectLastDate(list.get(i).getRoomId())));
			}
			System.out.println("현재시간은: "+list.get(i).getUpdateTime());
			list.get(i).setChatImg(fService.selectBySeqOrder(list.get(i).getProductId()).getSysName());

			list.get(i).setLastMessage(cService.selectLastTalk(list.get(i).getRoomId()));
			
			list.get(i).setOtherProfile(mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
			System.out.println("프로필 이미지 이름은: "+mService.selectProfile(crService.selectSellerId(list.get(i).getRoomId())));
		}

		model.addAttribute("roomId",roomId);
		model.addAttribute("list",list);
		model.addAttribute("id",id);
		return  "talk/talk";
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

	//	@RequestMapping("addChatList")
	//	public String addChatList(String sellerId, String productName, int productId) {
	//		System.out.println(sellerId + " : " + productName + " : " + productId);
	//		return "talk/talk";
	//	}

}
