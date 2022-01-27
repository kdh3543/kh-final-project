package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.FilesDAO;
import kh.spring.dao.ItemsDAO;
import kh.spring.dto.ItemsDTO;


@Service
public class ItemsService {
	
	
	@Autowired
	public ItemsDAO idao;
	
	@Autowired	
	public FilesDAO fdao;
	
	public int insert(ItemsDTO dto) {
		
		return idao.insert(dto);
		
	}
	
	public List<ItemsDTO> selectAll(){
		
		return idao.selectAll();
	}
	
	public List<ItemsDTO> selectById(String id){
		return idao.selectById(id);
	}
	
	public int ItemsCount(String id) {
		return idao.ItemsCount(id);
	}
	
	// 채팅에서 상품아이디 통해서 판매자 아이디 가져오기
	public String selectByProductId(int productId) {
		return idao.selectByProductId(productId);
	}
	
	
	
	

}
