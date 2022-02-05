package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.SafeDealDAO;
import kh.spring.dto.SafeDealDTO;

@Service
public class SafeDealService {

	
	@Autowired
	
	public SafeDealDAO sddao;

	public int insert(SafeDealDTO dto) {
		return sddao.insert(dto);
	}

	public int dealOk(SafeDealDTO sddto) {
		
		return sddao.dealOk(sddto);

	}

	public SafeDealDTO selectAllDealOkBySeq(int iseq) {
		System.out.println("safedealservice iseq : " + iseq);
		return sddao.selectAllDealOkBySeq(iseq);

	}

	public int dealCancel(SafeDealDTO sddto) {
		return sddao.dealCancel(sddto);

	}

	

	
	
	
	
	
}
