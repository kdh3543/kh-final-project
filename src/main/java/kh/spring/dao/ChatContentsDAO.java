package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ChatContentsDTO;

@Repository
public class ChatContentsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(ChatContentsDTO dto) {
		return mybatis.insert("ChatContents.insert",dto);
	}
	
	public int insertRoomId(ChatContentsDTO dto) {
		return mybatis.insert("ChatContents.insertRoomId",dto);
	}
	
	public List<ChatContentsDTO> selectByRoomID(int roomID){
		return mybatis.selectList("ChatContents.selectByroomID",roomID);
	}
	
	public List<ChatContentsDTO> selectByProductId(int productId){
		return mybatis.selectList("ChatContents.selectByProductId",productId);
	}
	
	public String selectLastTalk(int productId) {
		return mybatis.selectOne("ChatContents.selectLastTalk",productId);
	}
	
	public int deleteByRoomId(int roomId) {
		return mybatis.delete("ChatContents.deleteByRoomId",roomId);
	}
}
