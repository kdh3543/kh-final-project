package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kh.spring.dao.SearchKeywordDAO;
import kh.spring.dto.SearchKeywordDTO;

@Service
public class SearchService {
	
	@Autowired
	public SearchKeywordDAO sdao;
	
	
public List<SearchKeywordDTO> selectAll(String id){
		
		return sdao.selectAll(id);
	}

public int insert (SearchKeywordDTO dto) {
	
	return sdao.insert(dto);
	
	 
}

public int deleteAll () {
	
	return sdao.deleteAll();
}

public int deleteByKeyword(String keyword) {
	
	
	return sdao.deleteByKeyword(keyword);
}

public List<SearchKeywordDTO>selectByHot(){
	
	return sdao.selectByHot();
}

// 최근검색어 중복되는지 확인

public int searchExistCount(String keyword) {
	
	return sdao.searchExistCount(keyword);

}

}
