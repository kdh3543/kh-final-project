package kh.spring.dao;

import java.util.HashMap;
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

	public List<ItemsDTO> selectBySeq(int iseq) {


		return mybatis.selectList("Items.selectBySeq",iseq); 
	}


	public List<ItemsDTO> selectByName(List<String> targetList,int iseq){


		HashMap<String, Object> map = new HashMap<>();
		map.put("targetList", targetList);
		map.put("iseq", iseq);


		return mybatis.selectList("Items.selectByName",map);

	}

	public List<ItemsDTO> selectNameToSeq(List<ItemsDTO> rilist){

		HashMap<String, Object> map = new HashMap<>();
		map.put("rilist",rilist);

		return mybatis.selectList("Items.selectNameToSeq",map);
	}

	// 내 상품
	public List<ItemsDTO> selectMineById(String id) {

		return mybatis.selectList("Items.selectMineById",id);
	}
	public int sellCount(String id) {
		return mybatis.selectOne("Items.sellCount",id);
	}
	public int updateProc(String deal, int iseq) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("iseq", iseq);
		map.put("deal", deal);
		return mybatis.update("Items.updateProc",map);
	}
	
	public int itemsModifyProc(ItemsDTO dto) {
		// TODO Auto-generated method stub
		return mybatis.update("Items.itemsModifyProc",dto);
	}




	//	 public int insert(ItemsDTO dto) { String loginId =
	//	 (String)session.getAttribute("loginId"); dto.setSeller_id(loginId); return
	//	 mybatis.insert("Item.insert", dto); }
	//	 
	//	 public ItemsDTO selectBySeq(int iseq) { return
	//	 mybatis.selectOne("Item.selectBySeq",iseq); }
	//	

}
