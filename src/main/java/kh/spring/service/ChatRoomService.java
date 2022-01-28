package kh.spring.service;

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
		return dao.insert(dto);
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
	
	public boolean selectByProductId(int productId) {
		return dao.selectByProductId(productId);
	}
}
