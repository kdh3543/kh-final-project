package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kh.spring.dto.SearchKeywordDTO;

@Repository
public class SearchKeywordDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	public List<SearchKeywordDTO> selectAll(String id){
		
		return mybatis.selectList("Search.selectAll",id);
	}
	

	
	public int insert (SearchKeywordDTO dto) {
		
		return mybatis.insert("Search.insert",dto);
		
		 
	}

	public int deleteAll () {
		
		return mybatis.delete("Search.deleteAll");
	}
	
	public int deleteByKeyword(String keyword) {
		
		
		return mybatis.delete("Search.deleteByKeyword",keyword);
	}



	public List<SearchKeywordDTO> selectByHot() {
		return mybatis.selectList("Search.selectByHot");

	}



	public int searchExistCount(String keyword) {
		return mybatis.selectOne("Search.searchExistCount",keyword);
		
	}

	

}
