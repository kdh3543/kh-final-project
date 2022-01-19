package kh.spring.dao;

import java.sql.Timestamp;
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
	//로그인 기능
	public int login(String logid, String logpw) {

		Map<String,String> map = new HashMap<>();
		map.put("id", logid);
		map.put("pw", logpw);	

		return mybatis.selectOne("Member.login",map);
	}
	//id로 마이페이지 들어가기
	public MemberDTO select(String id) {
		return mybatis.selectOne("Member.mypage",id);
	}	
	//회원정보 변경
	public int modify(MemberDTO dto) {
		return mybatis.update("Member.modify",dto);
	}
	//회원 탈퇴
	public int delete(String id) {
		return mybatis.delete("Member.delete",id);
	}
	//가입 후 날짜
	public int signDate(String id) {
		return mybatis.selectOne("Member.signDate",id);
	}

}
