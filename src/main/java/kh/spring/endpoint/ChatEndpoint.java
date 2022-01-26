package kh.spring.endpoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

import kh.spring.configurator.ApplicationContextProvider;
import kh.spring.configurator.WSConfig;
import kh.spring.dao.ChatContentsDAO;
import kh.spring.dao.ChatRoomDAO;
import kh.spring.dto.ChatContentsDTO;
import kh.spring.dto.ChatRoomDTO;

@ServerEndpoint(value="/chatProgram",configurator=WSConfig.class)
public class ChatEndpoint{

	private HttpSession session;

	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private static Map<String,Session> rooms = Collections.synchronizedMap(new HashMap<String, Session>());
	
	private ChatContentsDAO ccdao = ApplicationContextProvider.getApplicationContext().getBean(ChatContentsDAO.class);
	private ChatRoomDAO crdao = ApplicationContextProvider.getApplicationContext().getBean(ChatRoomDAO.class);


	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		System.out.println("클라이언트 연결확인");
		clients.add(session);
		System.out.println(session.getId());
		
		this.session = (HttpSession)config.getUserProperties().get("hSession");

	}



	@OnMessage
	public void OnMessage(String message) {		
		String[] arr = message.split("<br>");
		String userID = (String)this.session.getAttribute("loginID");
		String chatMessage = arr[0];
		String sellerID = arr[1];

		String productName = arr[2];
		
		int productId = Integer.parseInt(arr[3]);
		
		String roomId = arr[4];
		if(roomId == null) {
			JsonObject obj = new JsonObject();
			ChatRoomDTO crdto = new ChatRoomDTO();
			crdto.setBuyerId(userID);
			crdto.setSellerId(sellerID);
			crdto.setProductName(productName);
			crdto.setProductId(productId);
			
			int result = crdao.insert(crdto);
			System.out.println(result);
			crdto.setRoomId(result);
			
			ChatContentsDTO ccdto = new ChatContentsDTO();
			ccdto.setBuyerId(userID);
			ccdto.setChatContents(chatMessage);
			ccdto.setSellerId(sellerID);
			ccdto.setProductId(productId);
			ccdto.setRoomId(result);
			ccdao.insert(ccdto);
			

		}else {
			
		}
		
//		clients.get(sellerID).getSession().getBasicRemote().sendText(obj.toString())

	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("클라이언트의 접속이 끊어졌습니다.");
	}
}
