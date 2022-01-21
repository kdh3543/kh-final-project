package kh.spring.endpoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
public class ChatEndpoint {

	private HttpSession session;
	
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private ChatContentsDAO ccdao = ApplicationContextProvider.getApplicationContext().getBean(ChatContentsDAO.class);
	private ChatRoomDAO crdao = ApplicationContextProvider.getApplicationContext().getBean(ChatRoomDAO.class);

	
	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		System.out.println("클라이언트 연결확인");
		clients.add(session);
		this.session = (HttpSession)config.getUserProperties().get("hSession");

	}



	@OnMessage
	public void OnMessage(String message) {		
		String userID = (String)this.session.getAttribute("loginID");
		String[] arr = message.split("<br>");

		String chatMessage = arr[0];
		String sellerID = arr[1];

		String productName = arr[2];
		int productId = Integer.parseInt(arr[3]);
//		System.out.println(chatMessage + " : " + sellerID + " : " + productName +":"+productId);
		ChatRoomDTO crdto = new ChatRoomDTO();		
		
		crdto.setBuyerId(userID);
		crdto.setSellerId(sellerID);
		crdto.setProductName(productName);
		crdto.setProductId(productId);
		JsonObject obj = new JsonObject();

		if(!crdao.selectByCheckRoomExist(crdto)) {
			int result = crdao.insert(crdto);
			crdto.setRoomId(result);
			obj.addProperty("roomId", crdto.getRoomId());
		}
		
		obj.addProperty("id", userID);
		obj.addProperty("message", chatMessage);
		obj.addProperty("sellerID", sellerID);
		obj.addProperty("productName", productName);
		obj.addProperty("productId", productId);
		
		ChatContentsDTO ccdto = new ChatContentsDTO();
		ccdto.setBuyerId(userID);
		ccdto.setChatContents(chatMessage);
		ccdto.setSellerId(sellerID);
		ccdao.insert(ccdto);

//		clients.get(sellerID).getSession().getBasicRemote().sendText(obj.toString())
		synchronized(clients){
			for(Session client : clients) {
				try {
					client.getBasicRemote().sendText(obj.toString());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}

		//		System.out.println("JsonObject: "+ obj + "\n");
		//		
		//		System.out.println("1. get value from JsonObject");
		//		
		//		System.out.println("message: "+ obj.get("message").getAsString() + "\n");
		//		
		//		System.out.println("2. get value from HashMap");
		//		HashMap<String, String> map = new HashMap<String, String>();
		//		Gson gson = new Gson();
		//		map = gson.fromJson(obj.toString(), map.getClass());
		//		System.out.println("id: "+ map.get("id"));
		//		System.out.println("message: "+ map.get("message") + "\n");
		//		
		//		System.out.println("3. get value from HashMap2");
		//		HashMap<String, String> map2 = gson.fromJson(obj.toString(), new HashMap<String, String>().getClass());
		//		System.out.println("id: "+ map2.get("id"));
		//		System.out.println("message: "+ map2.get("message") + "\n");



	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("클라이언트의 접속이 끊어졌습니다.");
	}
}
