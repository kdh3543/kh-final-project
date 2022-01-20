package kh.spring.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ItemsDTO;



@Repository
public class ItemsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Autowired
	HttpSession session;
	
	
	public int insert (ItemsDTO dto) {
		System.out.println("dao");
		int result = mybatis.insert("Items.insert",dto);
		
		System.out.println(result);
		return dto.getIseq();
	}
	
	
	
//	 public int insert(ItemsDTO dto) { String loginId =
//	 (String)session.getAttribute("loginId"); dto.setSeller_id(loginId); return
//	 mybatis.insert("Item.insert", dto); }
//	 
//	 public ItemsDTO selectBySeq(int iseq) { return
//	 mybatis.selectOne("Item.selectBySeq",iseq); }
//	
	
}
