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
	
	
	
	
	

}
