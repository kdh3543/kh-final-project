package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.FilesDAO;
import kh.spring.dto.FilesDTO;

@Service
public class FilesService {
	
	@Autowired
	public FilesDAO fdao;
	
	
	public List<FilesDTO> selectBySeq(int seq) {
		
		return fdao.selectBySeq(seq);
	}
	public int insert(FilesDTO dto) {
		return fdao.insert(dto);
	}
	
	public List<FilesDTO> selectAll() {
		
		return fdao.selectAll();
	}

}
