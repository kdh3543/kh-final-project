package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ItemsDTO;
import kh.spring.dto.ItemsQNADTO;

@Repository
public class ItemsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Autowired
	HttpSession session;

	// 상품 등록
	public int insert(ItemsDTO dto) {
		System.out.println("dao");
		int result = mybatis.insert("Items.insert", dto);

		System.out.println(result);
		return dto.getIseq();
	}

	// 상품
	public List<ItemsDTO> selectAll() {

		return mybatis.selectList("Items.selectAll");
	}

	public List<ItemsDTO> selectBySeq(int iseq) {

		return mybatis.selectList("Items.selectBySeq", iseq);
	}

	public List<ItemsDTO> selectByName(List<String> targetList, int iseq) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("targetList", targetList);
		map.put("iseq", iseq);

		return mybatis.selectList("Items.selectByName", map);

	}

	public List<ItemsDTO> selectNameToSeq(List<ItemsDTO> rilist) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("rilist", rilist);
		
		return mybatis.selectList("Items.selectNameToSeq", map);
	}

	// 내 상품
	public List<ItemsDTO> selectMineById(String id) {

		return mybatis.selectList("Items.selectMineById", id);
	}

	public int sellCount(String id) {
		return mybatis.selectOne("Items.sellCount", id);
	}

	public int updateProc(String deal, int iseq) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("iseq", iseq);
		map.put("deal", deal);
		return mybatis.update("Items.updateProc", map);
	}

	public int itemsModifyProc(ItemsDTO dto) {
		// TODO Auto-generated method stub
		return mybatis.update("Items.itemsModifyProc", dto);
	}

	// public int insert(ItemsDTO dto) { String loginId =
	// (String)session.getAttribute("loginId"); dto.setSeller_id(loginId); return
	// mybatis.insert("Item.insert", dto); }
	//
	// public ItemsDTO selectBySeq(int iseq) { return
	// mybatis.selectOne("Item.selectBySeq",iseq); }
	//

	// 해당 아이디의 판매내역 불러오기
	public List<ItemsDTO> selectById(String id) {
		return mybatis.selectList("Items.selectById", id);
	}


	// 해당 아이디의 판매상품 개수 불러오기
	public int ItemsCount(String id) {
		return mybatis.selectOne("Items.ItemsCount", id);
	}


	// 채팅에서 상품아이디 통해서 판매자 아이디 가져오기
	public String selectByProductId(int productId) {
		return mybatis.selectOne("Items.selectByProductId", productId);
	}

	public int addViewCount(int iseq) {
		return mybatis.update("Items.addViewCount", iseq);
	}

	public List<ItemsDTO> selectByCategory(String category) {
		return mybatis.selectList("Items.selectByCategory", category);

	}

	public List<ItemsDTO> selectByIName(String name) {
		return mybatis.selectList("Items.selectByIName", name);
	}

	// public int insert(ItemsDTO dto) { String loginId =
	// (String)session.getAttribute("loginId"); dto.setSeller_id(loginId); return
	// mybatis.insert("Item.insert", dto);}
	// public ItemsDTO selectBySeq(int iseq) { return
	// mybatis.selectOne("Item.selectBySeq",iseq);}

	// 신규 상품 문의 삽입
	public int insertQNA(ItemsQNADTO dto) {
		mybatis.insert("Items.insertQNA", dto);
		return dto.getItems_qna_seq();
	}

	// 시퀀스로 상품 문의 삭제
	public int deleteQNA(int seq) {
		return mybatis.delete("Items.deleteQNA", seq);
	}


	
//	detail 페이지 우측 하단 정보
	// 해당 아이디의 판매상품 개수 불러오기
		public int ItemsCount(int iseq) {
			return mybatis.selectOne("Items.ItemsCount",iseq);
		}



		public List<ItemsDTO> selectByIseq(int iseq) {
			return mybatis.selectList("Items.selectByIseq",iseq);
		}	




	// 시퀀스로 상품 문의 검색
	public List<ItemsQNADTO> selectQNABySeq(int seq) {
		return mybatis.selectList("Items.selectQNABySeq", seq);
	}


}
