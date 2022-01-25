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

	public boolean selectByCheckRoomExist(ChatRoomDTO dto) {
		return dao.selectByCheckRoomExist(dto);
	}
	
	public int selectRoomId(ChatRoomDTO dto) {
		return dao.selectRoomId(dto);
	}
}
