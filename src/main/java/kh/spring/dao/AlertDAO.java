package kh.spring.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AlertDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;	
	
	@Autowired
	HttpSession session;

	public int selectCount(String id) {
		return mybatis.selectOne("Alert.selectCount",id);
	}
}
