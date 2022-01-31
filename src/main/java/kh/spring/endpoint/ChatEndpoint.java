package kh.spring.endpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kh.spring.configurator.ApplicationContextProvider;
import kh.spring.configurator.WSConfig;
import kh.spring.dao.ChatContentsDAO;
import kh.spring.dao.ChatRoomDAO;
import kh.spring.dto.ChatContentsDTO;
import kh.spring.dto.ChatRoomDTO;

@ServerEndpoint(value="/chatProgram",configurator=WSConfig.class)
public class ChatEndpoint{

	private HttpSession hSession;

	//	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private static Map<String,Session> users = Collections.synchronizedMap(new HashMap<String, Session>());
	private static Logger logger = LoggerFactory.getLogger(ChatEndpoint.class);

	private ChatContentsDAO ccdao = ApplicationContextProvider.getApplicationContext().getBean(ChatContentsDAO.class);
	private ChatRoomDAO crdao = ApplicationContextProvider.getApplicationContext().getBean(ChatRoomDAO.class);

	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		this.hSession = (HttpSession)config.getUserProperties().get("hSession");
		//		System.out.println("user 전의 사이즈는 : "+clients.size()); 
		System.out.println("클라이언트 연결확인했습니다.");
		System.out.println("user 전의 사이즈는 : "+users.size());
		//		clients.add(session);
		//		System.out.println("user 후의 사이즈는 : "+clients.size());
		String userId = (String)hSession.getAttribute("loginID");
		System.out.println(hSession.getAttribute("loginID")+" 입장했습니다.");
		users.put(userId, session);
		System.out.println("user 후의 사이즈는 : "+users.size()); 
		//		logger.info("{} 연결됨", session.getId());
	}

	@OnMessage
	public void OnMessage(String message) {		
		String[] arr = message.split("<br>");
		String userId = (String)this.hSession.getAttribute("loginID");
		String chatMessage = arr[0];
		String sellerId = arr[1];
		String productName = arr[2];
		int productId = Integer.parseInt(arr[3]);
		
		System.out.println(chatMessage+":"+sellerId+":"+productName+":"+productId);
		JsonObject obj = new JsonObject();
		
		// 채팅방 roomId를 가지고 와서 채팅 내용 db에 세팅
		ChatRoomDTO crdto = new ChatRoomDTO();
		crdto.setBuyerId(userId);
		crdto.setSellerId(userId);
		crdto.setProductId(productId);
		int roomId = crdao.selectRoomId(crdto);
		
		ChatContentsDTO ccdto = new ChatContentsDTO();
		ccdto.setBuyerId(userId);
		ccdto.setChatContents(chatMessage);
		ccdto.setSellerId(sellerId);
		ccdto.setProductId(productId);

		ccdto.setRoomId(roomId);
		ccdao.insertRoomId(ccdto);
		obj.addProperty("id", userId);
		obj.addProperty("message", chatMessage);
		obj.addProperty("sellerId", sellerId);
		obj.addProperty("productName", productName);
		obj.addProperty("productId", productId);
		obj.addProperty("roomId", roomId);

		//		clients.get(sellerID).getSession().getBasicRemote().sendText(obj.toString())

		logger.info("{}로 부터 {}받음",hSession.getId(),message);

		synchronized(users){
			Iterator<String> sessionIds = users.keySet().iterator();
			String key = "";
			System.out.println("users의 keyset 사이즈는 : "+users.keySet().size());
			System.out.println("유저아이디는: "+userId);
			while(sessionIds.hasNext()) {

				key = sessionIds.next();
				
				System.out.println("키 값은 : "+key);


				try {
					users.get(key).getBasicRemote().sendText(obj.toString());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}


		//			synchronized(clients){
		//				for(Session client : clients) {
		//					try {
		//						client.getBasicRemote().sendText(obj.toString());
		//						//					messageUser.get(sellerID).getBasicRemote().sendText(obj.toString());
		//					}catch(IOException e) {
		//						e.printStackTrace();
		//					}
		//				}
		//
		//
		//			}
	}


	@OnClose
	public void onClose(Session session) throws IOException {

		//		String userId = (String)this.session.getAttribute("loginID");
		//		
		//		int roomId = crdao.bringRoomIdByBuyerId(userId);
		//		System.out.println(roomId);
		//		List<ChatContentsDTO> list = ccdao.selectByRoomID(roomId);
		//		System.out.println("list의 사이즈는 : " +list.size());
		//		if(list.size()==0) {
		//			crdao.deleteByRoomId(roomId);
		//		}
		System.out.println("user 전의 사이즈는 : "+users.size());
		//		clients.remove(session);
		
		users.remove(session.getId());

		
	}
}
