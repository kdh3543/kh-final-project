package kh.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ReportDTO;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertReport(ReportDTO dto) {
		// 
		return mybatis.insert("Report.insertReport",dto);
	}

	public List<ReportDTO> selectAll() {
		
		return mybatis.selectList("Report.selectAll");

	}

	public ReportDTO selectById(String id,int iseq) {
		//수정
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("iseq", iseq);
		
		return mybatis.selectOne("Report.selectById",map);

	}	

	
	
	
}
