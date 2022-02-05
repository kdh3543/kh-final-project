package kh.spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ReportDAO;
import kh.spring.dto.ReportDTO;

@Service
public class ReportService {
	
	@Autowired
   public ReportDAO rdao;
    
    @Autowired
    private HttpSession session;

	public int insertReport(ReportDTO dto) {
		return rdao.insertReport(dto);
	}

	public List<ReportDTO> selectAll() {
		return rdao.selectAll();
	}

	public ReportDTO selectById(String id,int iseq) {
		return rdao.selectById(id,iseq);

	}
	
	

}
