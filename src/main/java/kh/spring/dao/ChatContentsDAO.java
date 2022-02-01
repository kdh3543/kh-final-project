package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<ChatContentsDTO> selectByProductId(ChatContentsDTO dto){
		
		return mybatis.selectList("ChatContents.selectByProductId",dto);
	}
	
	public String selectLastTalk(int roomId) {
		return mybatis.selectOne("ChatContents.selectLastTalk",roomId);
	}
	
	public int deleteByRoomId(int roomId) {
		return mybatis.delete("ChatContents.deleteByRoomId",roomId);
	}
}
