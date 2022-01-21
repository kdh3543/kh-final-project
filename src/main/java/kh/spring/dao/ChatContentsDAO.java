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
	
	public List<ChatContentsDTO> selectByRoomID(int roomID){
		return mybatis.selectList("ChatContents.selectByroomID",roomID);
	}
}
