package kh.spring.dao;

import java.util.List;

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
	
	//	상품 등록
	public int insert (ItemsDTO dto) {
		System.out.println("dao");
		int result = mybatis.insert("Items.insert",dto);		
		System.out.println(result);
		return dto.getIseq();
	}
	
	//	상품 
	public List<ItemsDTO> selectAll(){		
		return mybatis.selectList("Items.selectAll");
	}
	
	// 해당 아이디의 판매내역 불러오기
	public List<ItemsDTO> selectById(String id){
		return mybatis.selectList("Items.selectById",id);
	}
	
	// 해당 아이디의 판매상품 개수 불러오기
	public int ItemsCount(String id) {
		return mybatis.selectOne("Items.ItemsCount",id);
	}	
	
	// 채팅에서 상품아이디 통해서 판매자 아이디 가져오기
	public String selectByProductId(int productId) {
		return mybatis.selectOne("Items.selectByProductId",productId);
	}
	
//	 public int insert(ItemsDTO dto) { String loginId =
//	 (String)session.getAttribute("loginId"); dto.setSeller_id(loginId); return
//	 mybatis.insert("Item.insert", dto);}
//	 public ItemsDTO selectBySeq(int iseq) { return
//	 mybatis.selectOne("Item.selectBySeq",iseq);}	
	
	
}
