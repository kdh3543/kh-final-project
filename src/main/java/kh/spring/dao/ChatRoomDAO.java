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
	
	public boolean selectByCheckRoomExist(int roomId) {
		return mybatis.selectOne("ChatRoom.selectByCheckRoomExist", roomId);
	}
	
	public int selectRoomId(ChatRoomDTO dto) {
		return mybatis.selectOne("ChatRoom.selectRoomId",dto);
	}
	
	public List<ChatRoomDTO> selectByBothId(ChatRoomDTO dto){
		return mybatis.selectList("ChatRoom.selectByBothId",dto);
	}
	
	public boolean selectByProductId(int productId) {
		return mybatis.selectOne("ChatRoom.selectByProductId",productId);
	}
}
