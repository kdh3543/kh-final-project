package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ChatRoomDTO;

@Repository
public class ChatRoomDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(ChatRoomDTO dto) {
		int result =  mybatis.insert("ChatRoom.insert",dto);
		return dto.getRoomId();
	}
	
	public List<ChatRoomDTO> selectByBuyerId(String id){
		return mybatis.selectList("ChatRoom.selectByBuyerId",id);
	}
	
	public boolean selectByCheckRoomExist(ChatRoomDTO dto) {
		return mybatis.selectOne("ChatRoom.selectByCheckRoomExist", dto);
	}
	
	public int selectRoomId(ChatRoomDTO dto) {
		return mybatis.selectOne("ChatRoom.selectRoomId",dto);
	}
}
