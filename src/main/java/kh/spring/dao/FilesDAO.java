package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.FilesDTO;
import kh.spring.dto.ItemsDTO;

@Repository
public class FilesDAO {

		@Autowired
		private SqlSessionTemplate mybatis;
		
		
		public int insert(FilesDTO dto) {
			
			return mybatis.insert("Files.insert",dto);
		}
		
		
		public List<FilesDTO> selectBySeq( int seq) {
		
		return mybatis.selectList("Files.selectBySeq",seq); }
		
		
	public  List<FilesDTO> selectAll() {
			
			return mybatis.selectList("Files.selectAll");
		}
	

	public List<FilesDTO> selectBySeqR(List<ItemsDTO> NameToSeq) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("NameToSeq",NameToSeq);
		
		return mybatis.selectList("Files.NameToSeq",map);
	}
		/*
		 * public List<FilesDTO> selectBySeq(int parentSeq) {
		 * 
		 * return mybatis.selectList("Files.selectBySeq",parentSeq); }
		 */


	public List<FilesDTO> selectMineById(String id) {
		
		return mybatis.selectList("Files.selectMineById",id);
	}

	public List<FilesDTO> selectById(String id){
		System.out.println(id);
		return mybatis.selectList("Files.selectById",id);		
	}


	public int deleteBySeq(int iseq) {
		return mybatis.delete("Files.deleteBySeq",iseq);
	}


	public int modifyProc(FilesDTO fdto) {
		
		
		return mybatis.insert("Files.modifyProc",fdto);

	}


	public List<FilesDTO> selectByCategory(String category) {
		return mybatis.selectList("Files.selectByCategory",category);
	}


	public List<FilesDTO> selectByIName(String name) {
		
		
		return mybatis.selectList("Files.selectByIName",name);

	}
	

		
	
}
