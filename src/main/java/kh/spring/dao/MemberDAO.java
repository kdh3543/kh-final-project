package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//member테이블에 회원가입시 입력한 값 저장
	public int insert(MemberDTO dto) {
		return mybatis.insert("Member.insert",dto);
	}
	//id 중복 체크 기능
	
	public int idCheck(String id) {
		return mybatis.selectOne("Member.idCheck",id);
	}
	
public int login(String logid, String logpw) {
		
		Map<String,String> map = new HashMap<>();
		map.put("id", logid);
		map.put("pw", logpw);	
		
		return mybatis.selectOne("Member.login",map);
	}
	
	public MemberDTO select(String id) {
		return mybatis.selectOne("Member.mypage",id);
	}	

	public int modify(MemberDTO dto) {
		return mybatis.update("Member.modify",dto);
	}
	
	public int delete(String id) {
		return mybatis.delete("Member.delete",id);
	}
	
}
