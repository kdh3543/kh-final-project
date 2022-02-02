package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.FilesDAO;
import kh.spring.dto.FilesDTO;
import kh.spring.dto.ItemsDTO;

@Service
public class FilesService {
	
	@Autowired
	public FilesDAO fdao;
	
	
	
	public List<FilesDTO> selectBySeq(int seq) {
	
	return fdao.selectBySeq(seq); }
	
	public int insert(FilesDTO dto) {
		return fdao.insert(dto);
	}
	
	public List<FilesDTO> selectAll() {
		
		return fdao.selectAll();
	}
	

	public List<FilesDTO> selectBySeqR(List<ItemsDTO> NameToSeq) {
		
		return fdao.selectBySeqR(NameToSeq);
	}

	public List<FilesDTO> selectMineById(String id) {
		// 
		return fdao.selectMineById(id);
	}

	public int deleteBySeq(int iseq) {
		return fdao.deleteBySeq(iseq);
	}

	public int modifyProc(FilesDTO fdto) {
		return fdao.modifyProc(fdto);
		
	}

	public List<FilesDTO> selectByCategory(String category) {
		return fdao.selectByCategory(category);
		
	}

	public List<FilesDTO> selectByIName(String name) {
		return fdao.selectByIName(name);
	}

	public List<FilesDTO> selectLikeImg(String id) {
		return fdao.selectLikeImg(id);

	}

	public FilesDTO selectBySeqOrder(int iseq) {
		return fdao.selectBySeqOrder(iseq);
	}
	
	/*
	 * public List<FilesDTO> selectBySeq(int parentSeq) {
	 * 
	 * return fdao.selectBySeq(parentSeq); }
	 */


}
