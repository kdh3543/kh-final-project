package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.FilesDAO;
import kh.spring.dao.ItemsDAO;
import kh.spring.dto.CommentDTO;
import kh.spring.dto.ItemsDTO;
import kh.spring.dto.ItemsQNADTO;

@Service
public class ItemsService {

	@Autowired
	public ItemsDAO idao;

	@Autowired
	public FilesDAO fdao;

	public int insert(ItemsDTO dto) {

		return idao.insert(dto);

	}

	public List<ItemsDTO> selectAll() {

		return idao.selectAll();
	}

	public List<ItemsDTO> selectBySeq(int iseq) {
		return idao.selectBySeq(iseq);

	}

	public List<ItemsDTO> selectByName(List<String> targetList, int iseq) {

		return idao.selectByName(targetList, iseq);
	}

	public List<ItemsDTO> selectNameToSeq(List<ItemsDTO> rilist) {

		return idao.selectNameToSeq(rilist);
	}

	public List<ItemsDTO> selectMineById(String id) {

		return idao.selectMineById(id);
	}

	public int sellCount(String id) {

		return idao.sellCount(id);
	}

	public int updateProc(String deal, int iseq) {

		return idao.updateProc(deal, iseq);
	}

	public int itemsModifyProc(ItemsDTO dto) {
		// TODO Auto-generated method stub
		return idao.itemsModifyProc(dto);
	}

	public List<ItemsDTO> selectById(String id) {
		return idao.selectById(id);
	}

	public int ItemsCount(String id) {
		return idao.ItemsCount(id);
	}

	// 채팅에서 상품아이디 통해서 판매자 아이디 가져오기
	public String selectByProductId(int productId) {
		return idao.selectByProductId(productId);
	}

	// 신규 상품 문의 삽입
	public int insertQNA(ItemsQNADTO dto) {
		return idao.insertQNA(dto);
	}

	// 시퀀스로 상품 문의 삭제
	public int deleteQNA(int seq) {
		return idao.deleteQNA(seq);
	}

}
