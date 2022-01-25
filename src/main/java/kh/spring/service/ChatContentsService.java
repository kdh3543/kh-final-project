package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChatContentsDAO;
import kh.spring.dto.ChatContentsDTO;

@Service
public class ChatContentsService {

	@Autowired
	private ChatContentsDAO dao;
	
	public int ccInsert(ChatContentsDTO dto) {
		return dao.insert(dto);
	}
	
	public int insertRoomId(ChatContentsDTO dto) {
		return dao.insert(dto);
	}
	
	public List<ChatContentsDTO> selectByRoomID(int roomID){
		return dao.selectByRoomID(roomID);
	}
	
	public List<ChatContentsDTO> selectByProductId(int productId){
		return dao.selectByProductId(productId);
	}
}
