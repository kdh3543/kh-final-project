package kh.spring.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChatRoomDAO;
import kh.spring.dto.ChatRoomDTO;

@Service
public class ChatRoomService {

	@Autowired
	private ChatRoomDAO dao;

	public int insert(ChatRoomDTO dto) {
		int result = dao.insert(dto);
		return dto.getRoomId();
	}

	public List<ChatRoomDTO> selectByBuyerId(String id){
		return dao.selectByBuyerId(id);
	}

	public boolean selectByCheckRoomExist(int roomId) {
		return dao.selectByCheckRoomExist(roomId);
	}
	
	public int selectRoomId(ChatRoomDTO dto) {
		return dao.selectRoomId(dto);
	}
	
	public List<ChatRoomDTO> selectByBothId(ChatRoomDTO dto){
		return dao.selectByBothId(dto);
	}
	
	public boolean selectByProductId(ChatRoomDTO dto) {
		return dao.selectByProductId(dto);
	}
	
	public List<ChatRoomDTO> selectByRoomId(int chatBotRoomId){
		return dao.selectByRoomId(chatBotRoomId);
	}
	
	public int deleteByRoomId(int roomId) {
		return dao.deleteByRoomId(roomId);
	}
	
	public String selectBuyerId(int roomId) {
		return dao.selectBuyerId(roomId);
	}
	
	public String selectSellerId(int roomId) {
		return dao.selectSellerId(roomId);
	}
	
}
